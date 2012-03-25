# *-* coding: utf-8 *-*

from django.db import models

TIPI_PRORACUNOV = (
	('SP', u'Sprejeti proračun'),
	('SSP', u'Spremembe proračuna'),
	('RB', u'Rebalans proračuna'),
	('ZR', u'Zaključni račun'),
)

DELI_PRORACUNA = (
	(1, u'Splošni del'),
)

class Proracun(models.Model):
	proracunsko_leto = models.CharField(max_length=4)
	datum_sprejetja = models.DateField()
	tip_proracuna = models.CharField(max_length=4, choices=TIPI_PRORACUNOV)
	del_proracuna = models.IntegerField(choices=DELI_PRORACUNA)
	epa = models.CharField(max_length=10)
	pdf = models.FileField(upload_to='proracun/pdf/')
	csv = models.FileField(upload_to='proracun/csv/')
	
	class Meta:
		ordering = ('-proracunsko_leto', '-datum_sprejetja')

class Postavka(models.Model):
	proracun = models.ForeignKey(Proracun)
	sifra = models.IntegerField(max_length=5, db_index=True)
	naziv = models.CharField(max_length=1000)
	naziv_en = models.CharField(max_length=1000)
	znesek = models.DecimalField(max_digits=20, decimal_places=2)





