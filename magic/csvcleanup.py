#!/usr/bin/python

import csv
import sys
import re
import StringIO

reader = csv.reader(open(sys.argv[1]))
isnum = lambda x: re.match('^\d+$', x.strip())

out = StringIO.StringIO()
writer = csv.writer(out, quoting=csv.QUOTE_ALL)


wrow = writer.writerow
#wrow = lambda x: sys.stdout.write(repr(x) + '\n')

prevprev = None
prev = None
step = 0

skipping = False

for line in reader:
    if not line:
        continue
    
    if line[2].startswith('Stran '):
        skipping = True
    if line[2].startswith('prora') or line[2].startswith('Znesek'):
        # 'prora' velja za ZR
        # 'Znesek' velja za SP
        skipping = False
        continue
    
    if skipping:
        continue
    
    if line[0] == line[2] == '':
        if prev is not None:
            #wrow(['MERGING'])
            prev[1] = prev[1] + ' ' + line[1]
            
            if step == 4:
                wrow(prev)
                prev = None
                step = 0
            else:
                step += 1
        else:
            #print 'fIXME', line
            prev = line
            #raise ValueError()
    else:
        if prev is not None:
            wrow(prev)
            prev = line
            step = 0
        else:
            prev = line

    

if prev:
    wrow(prev)

print out.getvalue()