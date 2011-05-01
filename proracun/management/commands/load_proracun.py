
from django.core.management.base import BaseCommand, CommandError

class Command(BaseCommand):
	args = '<pdf> <csv>'
	
	def handle(self, *args, **options):
		import re, os
		import csv
		import datetime
		from django.core.files import File
		from django.utils._os import safe_join
		from proracun.models import Proracun, Postavka, TIPI_PRORACUNOV
		
		try:
			rdr = csv.reader(open(args[0]))
		except IndexError:
			raise CommandError("please pass seznam.csv")
		
		datadir = os.path.dirname(args[0])
		
		tipi = dict([(i[1], i[0]) for i in TIPI_PRORACUNOV])
		#re.match('^si_proracun_(\d{4})_(\d{4})_(\d\d)_(\d\d)_([^\.]+).csv$')
		for line in rdr:
			if line[0].startswith('Prora'):
				# new year
				year = line[0].split(' ')[1].strip()
				continue
			else:
				
				tip = tipi[line[1].decode('utf-8')]
				
				data = {
					'datum_sprejetja': datetime.datetime.strptime(line[0], '%d.%m.%Y'),
					'proracunsko_leto': year,
					'tip_proracuna': tip,
					'del_proracuna': 1,
					'epa': re.sub('^\s*EPA\s*', '', line[2]),
				}
				pr = Proracun(**data)
				pr.pdf.save(line[3], File(open(safe_join(datadir, line[3]))))
				pr.csv.save(line[4], File(open(safe_join(datadir, line[4]))))
				pr.save()
				
				postavke_csv = csv.reader(open(safe_join(datadir, line[4])))
				for pline in postavke_csv:
					try: int(pline[0])
					except: continue
					p = Postavka(proracun=pr, sifra=pline[0], naziv=pline[1], znesek=pline[2])
					p.save()
				
				print 'Loaded:', line[4]
		
		print 'Postprocessing...'
		from django.db import connection
		cur = connection.cursor()
		
		cur.execute('''UPDATE proracun_postavka SET znesek = proracun_postavka.znesek - N.sum FROM (
			SELECT a.sum, a.proracun_id, b.znesek FROM proracun_postavka AS b, (
				SELECT proracun_id, sum(znesek) FROM proracun_postavka WHERE sifra IN (403,404) GROUP BY proracun_id
			) AS a WHERE a.proracun_id = b.proracun_id AND b.sifra = 40
		) AS N WHERE proracun_postavka.proracun_id = N.proracun_id AND proracun_postavka.sifra = 40;''')
		
		cur.execute('''UPDATE proracun_postavka SET znesek = proracun_postavka.znesek + N.sum FROM (
			SELECT a.sum, a.proracun_id, b.znesek FORM proracun_postavka AS b, (
				SELECT proracun_id, sum(znesek) FROM proracun_postavka WHERE sifra in (403,404) GROUP BY proracun_id
			) AS a WHERE a.proracun_id = b.proracun_id AND b.sifra = 55
		) AS N WHERE proracun_postavka.proracun_id = N.proracun_id AND proracun_postavka.sifra = 55;''')
		
		cur.execute('''UPDATE proracun_postavka SET naziv = naziv || ' (' || sifra || ')', sifra = regexp_replace(sifra::text, '^40([34])', E'55\\1')::integer WHERE sifra::text ~ E'^40[34]';''')
		
		connection.commit()
