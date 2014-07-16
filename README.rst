
Proracun
========

Uporablja Django 1.3

Nalozi podatke
--------------

./manage.py load_bilten Drzavni_proracun_1992-2011.csv

Pozeni server
-------------
./manage.py runserver

Poglej
------

 - Brez revalorizacije: http://localhost:8000/a/p/prihodki/0/
 - Revalorizirano glede na inflacijo: http://localhost:8000/a/p/prihodki/1/
 - Revalorizirano glede na rast BDP: http://localhost:8000/a/p/prihodki/2/



Posodabljanje
-------------


1. Za posodabljanje je najprej potrebno posodobit podatke o inflaciji in indeksu BDP.

 rm inflacija.txt
 python inflacija.py

 rm bdpindex.txt
 python bdpindex.py

2. Pridobi nove podatke o državnem proračunu v XLS obliki.

3. 

