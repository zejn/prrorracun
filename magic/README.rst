
Kako uporabljati magične skripte
================================

Tu se nahajajo napol magične skripte, ki iz PDF datotek izluščijo tekst. So zelo neuporabne za splošno rabo, nadvse slabo dokumentirane in imajo kar nekaj predvidevanj, je pa res, da v večini primerov delujejo.

convert pretvori PDF v tekst::

  python 01_convert.py II_posebni.pdf > en_proracun.csv

razcepi združene cifre v tretjem polju::

  python zr.py en_proracun.csv

Ven pade en_proracun.csv2

Sledi ročno čiščenje in pregledovanje.


Drugo
-----

postavke.py
  so popravek, da se namesto okrajšav proračunskih postavk (imena niso vedno konsistentna) prikaže polno ime.

scraperwiki.py
  python modul za pretvorbo PDF v XML.

