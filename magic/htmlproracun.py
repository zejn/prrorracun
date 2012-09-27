# -*- coding: utf-8 -*-

import lxml.html
import sys
import re, csv

def itermerger(elem):
    if elem.tag.upper() == 'BR':
        yield '\n'
    if elem.text is not None:
        yield elem.text
    for c in elem.getchildren():
        for i in itermerger(c):
            yield i
    if elem.tail is not None:
        yield elem.tail


f = sys.argv[1]


h = lxml.html.parse(open(f))

acts = h.xpath('//div[@id="acts_modul"]')[0]

data = [i for i in itermerger(acts)]

foo = open('foobar.txt','w')
foo.write(u''.join(data).encode('utf-8'))
foo.close()

# part 2

f2 = open('foobar.txt')

fn = f + '.csv'
c = csv.writer(open(fn,'w'))

for line in f2:
    if not line.strip():
        continue
    m = re.match('^\s*(\d+)?\s*(.*?)\s*(-?[\d\.]*)\s*$', line)
    rec = list(m.groups())
    if rec[0] == None:
        rec[0] = ''
    c.writerow(rec)
