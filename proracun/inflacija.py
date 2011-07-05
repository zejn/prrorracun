#!/usr/bin/python

import os

DATA_URL = 'http://www.stat.si/indikatorji_xls.asp?id=1&zacobd='
DATA_FILE = os.path.abspath(os.path.join(os.path.dirname(__file__), 'inflacija.pck'))


import collections
import csv
import datetime
import pickle
import re
from StringIO import StringIO
import urllib
from decimal import Decimal

InflacijaBase = collections.namedtuple("Inflacija", "mesec_ime leto mesecni_index letni_index povp_letni_index")

class Inflacija(InflacijaBase):
	MESECI = {
		'januar': 1,
		'februar': 2,
		'marec': 3,
		'april': 4,
		'maj': 5,
		'junij': 6,
		'julij': 7,
		'avgust': 8,
		'september': 9,
		'oktober': 10,
		'november': 11,
		'december': 12,
	}
	
	def mesec():
		def fget(self):
			return self.MESECI[self.mesec_ime]
		return (fget,)
	mesec = property(*mesec())

class InflationCalc:
	def __init__(self, records):
		self.records = dict([((i.leto, i.mesec), i) for i in records])
		self.cache = {}
	
	def revalorization_factor(self, start_date, end_date):
		if not isinstance(start_date, (datetime.date, datetime.datetime)) or not isinstance(end_date, (datetime.date, datetime.datetime)):
			raise ValueError("datetime or date required")
		
		y, m = start_date.year, start_date.month
		
		try: # CACHING
			return self.cache[(start_date.year, start_date.month, end_date.year, end_date.month)]
		except KeyError:
			pass
		
		f = Decimal('1.000')
		
		while y != end_date.year or m != end_date.month:
			f = f * self.records[(y, m)].mesecni_index / Decimal('100.000')
			m += 1
			if m == 13:
				m = 1
				y += 1
		
		f = Decimal('%.3f' % f)
		# caching
		self.cache[(start_date.year, start_date.month, end_date.year, end_date.month)] = f
		
		return f

def fetch_data():
	u = urllib.urlopen(DATA_URL)
	d = u.read()
	
	reader = csv.reader(StringIO(d), delimiter='\t')
	
	num_re = re.compile('^[\d\,\.]+$')
	records = []
	
	for n, line in enumerate(reader):
		if n > 500:
			break
		if not any(line):
			continue
		if len(line) < 4:
			continue
		if num_re.match(line[1]) and num_re.match(line[2]) and num_re.match(line[3]):
			
			try:
				mesec, leto = line[0].split(' ')
			except:
				continue
			
			try:
				mesecni, letni, povp_letni = Decimal(line[1].replace(',','.')), Decimal(line[2].replace(',','.')), Decimal(line[3].replace(',','.'))
			except:
				raise
			try:
				i = Inflacija(mesec, int(leto), mesecni, letni, povp_letni)
			except:
				raise
			records.append(i)
		else:
			continue
	
	return records

def cached_fetch_data():
	try:
		records = pickle.load(open(DATA_FILE))
		print 'Loading cached data from `%s`' % DATA_FILE
		return records
	except (IOError, EOFError), e:
		records = fetch_data()
		pickle.dump(records, open(DATA_FILE, 'w'))
		return records


if __name__ == "__main__":
	records = cached_fetch_data()
	calc = InflationCalc(records)
	print calc.revalorization_factor(datetime.date(2005, 1, 1), datetime.date(2006, 1, 1))
	print calc.revalorization_factor(datetime.date(2005, 1, 1), datetime.date(2006, 1, 1))


