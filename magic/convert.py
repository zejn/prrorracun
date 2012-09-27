#!/usr/bin/python
# *-* coding: utf-8 *-*
import csv
import re
import sys
import urllib

from StringIO import StringIO
import scraperwiki
import lxml.etree, lxml.html
from postavke import load_postavke

def splitrow(a):
    m = re.match('^(\d+)?(.*)$', a)
    if not m:
        raise ValueError(a)
    numcode, desc = m.groups()
    return numcode, desc.strip()

def clean_text(s):
    for i in [
        ('&#269;', u'č'.encode('utf-8')),
        ('&#353;', u'š'.encode('utf-8')),
        ('&#382;', u'ž'.encode('utf-8')),
        ('&#268;', u'Č'.encode('utf-8')),
        ('&#352;', u'Š'.encode('utf-8')),
        ('&#381;', u'Ž'.encode('utf-8')),]:
        #('', u''.encode('utf-8')),
        #('', u''.encode('utf-8')),
        #('', u''.encode('utf-8')),
        s = s.replace(i[0], i[1])
    return s

pdfurl = "http://www.kiberpipa.org/~hruske/stuff/.p.pdf"
pdfurl = "http://www.kiberpipa.org/~hruske/stuff/SP2011_II_1.pdf"
#pdfurl = "http://www.mf.gov.si/fileadmin/mf.gov.si/pageuploads/Prora%C4%8Dun/Sprejeti_prora%C4%8Dun/2011/spremembe/SP2011_II_1.pdf"
# http://www.mf.gov.si/fileadmin/mf.gov.si/pageuploads/Prora%25C4%258Dun/Sprejeti_prora%25C4%258Dun/2011/11_01_splosni_del_2011.pdf"

# (harder example to work on: http://www.nihe.gov.uk/schemes_accepted_010109_to_310309.pdf )
#pdfdata = urllib.urlopen(pdfurl).read()

pdfdata = open(sys.argv[1]).read()
pdfxml = scraperwiki.pdftoxml(pdfdata)
root = lxml.etree.fromstring(pdfxml)

fontspecs = { }
rows = [ ]

for pagenum, page in enumerate(root):
    #if pagenum == 0:
    #    continue
    assert page.tag == 'page'
    pagelines = {}
    for v in page:
        if v.tag == 'text':
            text = re.match('(?s)<text.*?>(.*?)</text>', lxml.etree.tostring(v)).group(1)   # there has to be a better way here to get the contents
            left = int(v.attrib.get('left'))
            top  = int(v.attrib.get('top'))
            line = pagelines.setdefault(top, [])
            line.append((left, text))
    ordered = list(sorted([(k, sorted(v)) for k,v in pagelines.iteritems()]))
    rows.extend([i[1] for i in ordered])


pdata = load_postavke()
records = []
splitline = 300
# split into cols
for line in rows:
    firstcol = []
    secondcol = []
    for item in line:
        if item[0] < splitline:
            firstcol.append(item[1])
        else:
            secondcol.append(item[1])

    rec = [clean_text(' '.join(firstcol)), ' '.join(secondcol)]
    rec = [i.replace('<b>', '').replace('</b>', '') for i in rec]
    first, second = splitrow(rec[0])
    third = rec[1].replace('.', '')
    status = ''
    if not second:
        second = pdata.get(first, '')
        if second:
            status = 'X'
    records.append([first, second, third, status])
    #print records[-1]




# write CSV
csvdata = StringIO()
w = csv.writer(csvdata)
for r in records:
    w.writerow(r)


print csvdata.getvalue()

"""
#tsvdata = '\n'.join(['\t'.join(r) for r in records])
data = {'content': csvdata.getvalue()}
try:
    u = urllib.urlopen('http://dpaste.com/', urllib.urlencode(data))
    info = u.read()
except Exception, e:
    if e.args[1] != 302:
        raise
    info = e.args[3]
    print 'Cookie (for deleting) -->', info['Set-Cookie']
    print 'Pasted at -->', info['Location']
"""
