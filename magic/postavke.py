#!/usr/bin/python

import sys
import csv
import pickle

PICKLE_FILE = 'postavke.pck'

def load_postavke():
	data = pickle.load(open('postavke.pck'))
	return data

def dump_postavke(data):
	pickle.dump(data, open('postavke.pck','w'))

def build_postavke(filename):
	data = load_postavke()
	rdr = csv.reader(open(filename))
	
	for r in rdr:
		if not r[0] in data:
			data[r[0]] = r[1]
	
	dump_postavke(data)

if __name__ == "__main__":
	build_postavke(sys.argv[1])
