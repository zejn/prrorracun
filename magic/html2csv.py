# -*- coding: utf-8 -*-
import re, csv, sys

f = open('foobar.txt')

fn = sys.argv[1] + '.csv'
c = csv.writer(open(fn,'w'))

for line in f:
    if not line.strip():
        continue
    m = re.match('^\s*(\d+)?\s*(.*?)\s*(-?[\d\.]*)\s*$', line)
    rec = list(m.groups())
    if rec[0] == None:
        rec[0] = ''
    c.writerow(rec)
