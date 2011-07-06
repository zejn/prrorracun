#!/usr/bin/python

import os

DATA_URL = 'http://www.stat.si/indikatorji_xls.asp?id=20&zacobd='
DATA_FILE = os.path.abspath(os.path.join(os.path.dirname(__file__), 'bdpindex.txt'))


import collections
import csv
import datetime
import pickle
import re
from StringIO import StringIO
import urllib
from decimal import Decimal

BDPIndex = collections.namedtuple("BDPIndex", "leto letno_usd letno_eur letna_rast")

class BDPCalc:
	def __init__(self, records):
		self.records = dict([(i.leto, i) for i in records])
		self.cache = {}
	
	def revalorization_factor(self, start_date, end_date):
		if not isinstance(start_date, (datetime.date, datetime.datetime)) or not isinstance(end_date, (datetime.date, datetime.datetime)):
			raise ValueError("datetime or date required")
		
		y, m = start_date.year, start_date.month
		
		try: # CACHING
			return self.cache[(start_date.year, end_date.year)]
		except KeyError:
			pass
		
		f = Decimal('1.000')
		
		while y != end_date.year:
			f = f * (Decimal('100.0') + self.records[y].letna_rast) / Decimal('100.000')
			y += 1
		
		f = Decimal('%.3f' % f)
		# caching
		self.cache[(start_date.year, end_date.year)] = f
		
		return f
	
	def revalorize(self, start_date, end_date, value):
		f = self.revalorization_factor(start_date, end_date)
		return value * f

def fetch_raw_data():
	u = urllib.urlopen(DATA_URL)
	d = u.read()
	f = open(DATA_FILE, 'w')
	f.write(d)
	f.close()

def load_data():
	try:
		fd = open(DATA_FILE, 'rb')
		print 'Using cached data: %s' % DATA_FILE
	except (IOError,), e:
		fetch_raw_data()
		fd = open(DATA_FILE, 'rb')
	except:
		raise
	reader = csv.reader(fd, delimiter='\t')
	
	num_re = re.compile('^-?[\d\,\.]+$')
	records = []
	
	for n, line in enumerate(reader):
		if not any(line):
			continue
		if len(line) < 5:
			continue
		if num_re.match(line[0]) and num_re.match(line[1]) and num_re.match(line[2]) and num_re.match(line[3]) and num_re.match(line[4]):
			
			try:
				leto, letno_usd, letno_eur, letna_rast = int(line[0]), Decimal(line[2].replace('.','')), Decimal(line[3].replace('.','')), Decimal(line[4].replace(',','.'))
			except:
				raise
			try:
				i = BDPIndex(leto, letno_usd, letno_eur, letna_rast)
			except:
				raise
			records.append(i)
		else:
			continue
	
	return records

bdp_calc = BDPCalc(load_data())

if __name__ == "__main__":
	today = datetime.date.today()
	f = bdp_calc.revalorization_factor(datetime.date(2005, 1, 1), datetime.date(2006, 1, 1))
	assert list(sorted(bdp_calc.records.keys())) == range(1991, today.year)
	assert f == Decimal('1.040')


