# *-* coding: utf-8 *-*
import datetime
from decimal import Decimal
from pprint import pprint

from django.db.models import Sum
from django.core.urlresolvers import reverse
from django.utils import simplejson
from django.utils.safestring import mark_safe
from django.template import RequestContext
from django.shortcuts import render_to_response
from django.http import HttpResponse

from proracun.models import Proracun, Postavka
from proracun.utils import Prihodki, Odhodki

def treemap_js(request, po, leto, date):
	handler = {
		'prihodki': Prihodki(),
		'odhodki': Odhodki(),
		}[po]
	
	date = datetime.datetime.strptime(date, '%Y-%m-%d')
	
	records = [(p.sifra, p.naziv, p.znesek) for p in Postavka.objects.filter(proracun__proracunsko_leto=leto, proracun__datum_sprejetja=date)]
	struct = handler(records)
	json = simplejson.dumps(struct, ensure_ascii=True, use_decimal=True, indent=4)
	
	context = {'json': mark_safe(json)}
	return render_to_response("treemap.js", RequestContext(request, context), mimetype='text/javascript')

def treemap(request, po, leto, date):
	context = {
		'po': po,
		'leto': leto,
		'date': date,
		'js_vizualizacija_url': reverse('proracun_treemap_js', args=(po, leto, date)),
		}
	return render_to_response("treemap.html", RequestContext(request, context))

def areachart_js(request, po, sifra='0'):
	sifra = int(sifra)
	init = bool(sifra == 0)
	
	# find last yearly budget
	y = None
	curpro = None
	proracuni = []
	for p in Proracun.objects.exclude(tip_proracuna='ZR').order_by('proracunsko_leto', 'datum_sprejetja'):
		if y != p.proracunsko_leto:
			if curpro is not None:
				proracuni.append(curpro)
		curpro = p
		y = p.proracunsko_leto
	proracuni.append(curpro)
	
	if po == 'prihodki':
		handler = Prihodki()
	else:
		handler = Odhodki()
	sifre = handler.codes
	
	if not init and int(str(sifra)[:2]) not in sifre:
		return HttpResponse("", mimetype="text/javascript")
	
	if init:
		postavke_names = dict([(i.sifra, i.naziv) for i in Postavka.objects.filter(proracun=Proracun.objects.all().order_by('-datum_sprejetja')[0], sifra__in=sifre)])
		colors = [handler.getColor(i) for i in sifre]
		ordering = [(i, postavke_names[i]) for i in sifre]
		title = u'Proračun Republike Slovenije skozi čas'
	else:
		
		if Postavka.objects.filter(sifra__gte=sifra*10, sifra__lt=(sifra+1)*10, proracun__in=proracuni).aggregate(Sum('znesek'))['znesek__sum'] == Decimal('0.0'):
			return HttpResponse("", mimetype='text/javascript')
		try:
			pst = Postavka.objects.get(sifra=sifra, proracun=Proracun.objects.exclude(tip_proracuna='ZR').order_by('-datum_sprejetja')[0])
			title = u'%s %s' % (pst.sifra, pst.naziv)
		except Postavka.DoesNotExist:
			title = ''
		
		postavke_names = dict([(i.sifra, i.naziv) for i in Postavka.objects.filter(sifra__gte=sifra*10, sifra__lt=(sifra+1)*10).exclude(proracun__tip_proracuna='ZR')])
		colors = None
		ordering = postavke_names.items()
		ordering.sort()
	labels = ['%s %s' % i for i in ordering]
	
	all_values = []
	for p in proracuni:
		if init:
			zneski = dict([(i.sifra, i.znesek) for i in Postavka.objects.filter(sifra__in=sifre, proracun=p)])
			values = [zneski[i] for i in sifre]
		else:
			zneski = dict([(i.sifra, i.znesek) for i in Postavka.objects.filter(sifra__gte=sifra*10, sifra__lt=(sifra+1)*10, proracun=p)])
			values = [zneski.get(i[0], 0) for i in ordering]
		all_values.append({
			'label': '%s za leto %s, %s' % (p.tip_proracuna, p.proracunsko_leto, p.datum_sprejetja),
			'values': values,
		})
	struct = {
		'label': labels,
		'values': all_values,
		'title': title,
	}
	if colors:
		struct['color'] = colors
	
	json = simplejson.dumps(struct, ensure_ascii=True, use_decimal=True, indent=4)
	context = {
		'json': mark_safe(json),
		'init': init,
		'po': po,
		}
	return render_to_response("areachart.js", RequestContext(request, context), mimetype='text/javascript')

def areachart(request, po):
	context = {
		'po': po,
		'js_vizualizacija_url': reverse('proracun_areachart_js', args=(po,'0')),
		}
	return render_to_response("areachart.html", RequestContext(request, context))

def proracun_list(request):
	context = {'object_list': Proracun.objects.all()}
	return render_to_response("proracun_list.html", RequestContext(request, context))

