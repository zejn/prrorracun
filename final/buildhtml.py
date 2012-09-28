# *-* coding: utf-8 *-*

header = '''<html>
<head><title>Proračuni Republike Slovenije</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<h1>Proračuni Republike Slovenije</h1>

<p><a href="proracuni_slovenije.zip">Prenesi celoten arhiv (ZIP)</a>
</p>

<table>
'''

footer = '''
</table>
</body>
'''


import os
import csv

html = open("index.html", "w")
rdr = csv.reader(open("seznam.csv"))

html.write(header)
for rec in rdr:
	#r = [i.decode('utf-8') for i in rec]
	r = rec
	if r[0].startswith(u"Proračun".encode('utf-8')):
		html.write('<tr><td colspan="5">&nbsp;</td></tr>')
		html.write('<tr><td colspan="5"><h2>%s</h2></td></tr>' % (r[0],))
		html.write('<tr><th>Datum</th><th>Tip</th><th>EPA</th><th>PDF</th><th>CSV</th></tr>')
	else:
		html.write('<tr><td>%s</td><td>%s</td><td>%s</td><td><a href="%s">%s</a></td><td><a href="%s">%s</a></td></tr>' % (r[0], r[1], r[2], r[3], r[3], r[4], r[4]))
html.write(footer)

os.system('zip -r9 proracuni_slovenije.zip * --exclude proracuni_slovenije.zip --exclude seznam.ods')
