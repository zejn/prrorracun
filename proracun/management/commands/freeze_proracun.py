# *-* coding: utf-8 *-*

from django.core.management.base import BaseCommand, CommandError

class Command(BaseCommand):
	args = '<dir>'
	
	def handle(self, *args, **options):
		
		dest_path = args[0]
		base_prefix = '/stuff/20letSlovenije/'
		
		from proracun.models import Postavka
		from django.core.urlresolvers import reverse
		from django.test.client import Client
		from django.utils._os import safe_join
		import os, sys
		
		pri_od_hodki = {
			'odhodki': dict(((i,1) for i in ('0', '40', '41', '42', '43', '45', '44', '55', '57'))),
			'prihodki': dict(((i,1) for i in ('0', '70', '71', '72', '73', '74', '75', '78', '50'))),
		}
		
		sifre = set([p.sifra for p in Postavka.objects.all()])
		sifre.add(0)
		adj = ['nic', 'inf', 'bdp']
		
		media_prefix = base_prefix + 'media/'
		
		urls = [media_prefix + i for i in [
			'proracun2010.css',
			'jquery-1.4.2.js',
			'jit-2.0.1.js',
			'vir/Drzavni_proracun_1992-2011.xls',
			'excanvas.js',
			'en.png',
			'sl.png']]
		
		for p_o, p_o_keys in pri_od_hodki.items():
			for a in adj:
				for s in sifre:
					if str(s)[:2] in p_o_keys:
						u = reverse('proracun_areachart_js', args=(p_o, s, a))
						urls.append(u)
						u = reverse('proracun_areachart_js', args=(p_o, 'en', s, a))
						urls.append(u)
				u = reverse('proracun_areachart', args=(p_o, a))
				urls.append(u)
				u = reverse('proracun_areachart', args=('en', p_o, a))
				urls.append(u)
		
		c = Client()
		nall = len(urls)
		for n, u in enumerate(urls):
			response = c.get(u)
			
			u = u.lstrip('/')
			if u.endswith('/'):
				u = u + 'index.html'
			
			dest_filename = safe_join(dest_path, u)
			dest_dir = os.path.dirname(dest_filename)
			if not os.path.isdir(dest_dir):
				os.makedirs(dest_dir)
			
			f = open(dest_filename, 'w')
			f.write(response.content)
			f.close()
			
			sys.stderr.write('\rProgress: %d/%d' % (n+1, nall))
			sys.stderr.flush()
		print ''
		
		meta_redirect = '''<html><head><meta http-equiv="refresh" content="0;url=%s/"></head><body></body></html>'''
		
		for i in ['', 'prihodki/', 'odhodki/', 'en/', 'en/prihodki/', 'en/odhodki/']:
			u = safe_join(base_prefix, i, 'index.html')
			where = 'odhodki' in i and 'odhodki' or 'prihodki'
			dest_filename = safe_join(dest_path, u.lstrip('/'))
			url = safe_join(base_prefix, where, 'inf')
			f = open(dest_filename, 'w')
			f.write(meta_redirect % url)
			f.close()
		
		return


