# *-* coding: utf-8 *-*

from django.core.management.base import BaseCommand, CommandError

class Command(BaseCommand):
	args = '<pdf> <csv>'
	
	def handle(self, *args, **options):
		from django.db import transaction
		
		@transaction.commit_on_success
		def go():
			import re, os
			import csv
			import xlrd
			import messytables
			import xypath
			import datetime
			from django.core.files import File
			from django.utils._os import safe_join
			from proracun.models import Proracun, Postavka, TIPI_PRORACUNOV
			import tempfile
			
			filename = args[0]
			
			print 'Opening XLS table ...'
			try:
				table = xypath.Table.from_filename(filename, 'MESPROR')
			except IndexError:
				raise CommandError("please pass xls converted to csv")
			
			datadir = os.path.dirname(filename)
			
			print 'Find offset of lines...'
			a = table.filter('v EUR').assert_one()
			
			leta = a.shift(1).fill(xypath.RIGHT)
			len1 = len(leta)
			
			leta = [isinstance(i.value, basestring) and int(i.value.replace(' ', '')) or i.value for i in leta]
			leta = [(isinstance(i, float) and i % 1 == 0) and int(i) or i for i in leta]
			len2 = len([i for i in leta if i >= 1992])
			
			assert len1 == len2
			
			print 'OK, %s lines.' % (a.y - 1,)
			
			# OK, now skip a.y - 1 lines and save as CSV
			print 'Save to CSV ...'
			tf = tempfile.NamedTemporaryFile(prefix='proracun', suffix='.csv')
			
			wb = xlrd.open_workbook(filename)
			sh = wb.sheet_by_index(0)
			
			wrr = csv.writer(tf)
			
			for n in range(sh.nrows):
				if n < a.y - 1:
					continue
				else:
					row = sh.row_values(n)
					row2 = [isinstance(i, basestring) and i.encode('utf-8') or i for i in row]
					wrr.writerow(row2)
			
			tf.flush()
			tf.seek(0)
			
			print 'Saved CSV to %s ...' % (tf.name,)
			
			rdr = csv.reader(open(tf.name))
			
			meseci = rdr.next()
			leta = rdr.next()
			
			leta2 = []
			for mesec, leto in zip(meseci, leta):
				cleanleto = leto.replace(' ', '').replace('*', '')
				if re.match('^\d{4}\.0+$', cleanleto):
					cleanleto = str(int(float(cleanleto)))
				
				if not mesec.strip() and re.match('^\d{4}$', cleanleto):
					leta2.append(int(cleanleto))
				else:
					leta2.append(None)
			
			proracuni = {}
			
			for pl in [i for i in leta2 if i != None]:
				p, created = Proracun.objects.get_or_create(proracunsko_leto=pl,
					datum_sprejetja=datetime.datetime(pl, 1, 1),
					tip_proracuna='ZR',
					del_proracuna=1,
					epa = '',
					pdf=None,
					csv=None,
					)
				p.save()
				proracuni[pl] = p
			
			rdr.next()
			rdr.next()
			rdr.next()
			
			rdr.next()
			rdr.next()
			rdr.next()
			
			def clean_znesek(z):
				if z.strip() in ('', '\xe2\x80\xa6', '...'):
					return 0
				return int(float(z))
			
			for rec in rdr:
				if not any(rec):
					continue
				try:
					sifra = int(float(rec[0]))
				except:
					#print 'eeesifra', rec
					sifra = 0
				naziv = rec[2].decode('utf-8')
				naziv_en = rec[3].decode('utf-8')
				print 'Loading:', sifra, naziv
				pst_tmpl = {
					'sifra': sifra,
					'naziv': naziv,
					'naziv_en': naziv_en,
				}
				zneski = [i for i in zip(leta2, rec) if i[0] != None]
				for leto, znesek in zneski:
					zn = clean_znesek(znesek)
					pdata = pst_tmpl.copy()
					#pdata['leto'] = leto
					pdata['znesek'] = zn
					pdata['proracun'] = proracuni[leto]
					postavka, created = Postavka.objects.get_or_create(**pdata)
					if created:
						postavka.save()
					#print pdata
				
				
			
			"""
					data = {
						'datum_sprejetja': datum_sprejetja
						'proracunsko_leto': year,
						'tip_proracuna': tip,
						'del_proracuna': 1,
						'epa': epa,
					}
					pr = Proracun(**data)
					pr.save()
			"""
			
			
			for pr in proracuni.itervalues():
				Postavka(proracun=pr, sifra=57, naziv=u'Plačila obresti', naziv_en=u'Interest payments', znesek=0).save()
			print 'Postprocessing...'
			from django.db import connection
			cur = connection.cursor()
			
			# odsteje odplacila dolga iz tekocih transferov
			cur.execute('''UPDATE proracun_postavka SET znesek = proracun_postavka.znesek - N.sum FROM (
				SELECT a.sum, a.proracun_id, b.znesek FROM proracun_postavka AS b, (
					SELECT proracun_id, sum(znesek) FROM proracun_postavka WHERE sifra IN (403,404) GROUP BY proracun_id
				) AS a WHERE a.proracun_id = b.proracun_id AND b.sifra = 40
			) AS N WHERE proracun_postavka.proracun_id = N.proracun_id AND proracun_postavka.sifra = 40;''')
			
			# pristeje odplacila dolga k zadolzevanju
			cur.execute('''UPDATE proracun_postavka SET znesek = proracun_postavka.znesek + N.sum FROM (
				SELECT a.sum, a.proracun_id, b.znesek FROM proracun_postavka AS b, (
					SELECT proracun_id, sum(znesek) FROM proracun_postavka WHERE sifra in (403,404) GROUP BY proracun_id
				) AS a WHERE a.proracun_id = b.proracun_id AND b.sifra = 57
			) AS N WHERE proracun_postavka.proracun_id = N.proracun_id AND proracun_postavka.sifra = 57;''')
			
			# Zamenja sifro presifriranih postavk
			cur.execute('''UPDATE proracun_postavka SET naziv = naziv || ' (' || sifra || ')', naziv_en = naziv_en || ' (' || sifra || ')', sifra = regexp_replace(sifra::text, '^40([34])', E'57\\\\1')::integer WHERE sifra::text ~ E'^40[34]';''')
			
			# Zakomentiral, ker ocitno dela probleme pri importu xls/csv biltena
			#cur.execute('''UPDATE proracun_postavka SET znesek = 0.0 WHERE id IN (SELECT a.id FROM proracun_postavka a, proracun_proracun b WHERE a.proracun_id = b.id AND sifra::text ~ E'^50.$');''')
			
		# end function body
		return go()
