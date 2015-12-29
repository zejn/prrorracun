#!/usr/bin/python

import csv
import sys

name = "si_proracun_2009_2011_03_17_ZR.csv"
name = 'si_proracun_2006_2007_12_27_ZR.csv'
name = sys.argv[1]

rdr = csv.reader(open(name))
w = csv.writer(open(name + "2", "w"))

for r in rdr:
	if not r:
		# empty line, happens at the end
		continue
	rec = [r[0], r[1]] +  r[2].split(' ')
	print rec
	w.writerow(rec)
