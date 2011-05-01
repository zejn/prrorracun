#!/usr/bin/python
# -*- coding: utf-8 -*-

import time
from pprint import pprint
import os
import re
import simplejson
from decimal import Decimal

def encode_decimal(obj):
    if isinstance(obj, Decimal):
        return str(obj)
    raise TypeError(repr(obj) + " is not JSON serializable")

def dumps(o, **kwargs):
    return simplejson.dumps(o, **kwargs)

def money(value, places=0, curr='', sep='.', dp=',',
             pos='', neg='-', trailneg=''):
    """Convert Decimal to a money formatted string.

    places:  required number of places after the decimal point
    curr:    optional currency symbol before the sign (may be blank)
    sep:     optional grouping separator (comma, period, space, or blank)
    dp:      decimal point indicator (comma or period)
             only specify as blank when places is zero
    pos:     optional sign for positive numbers: '+', space or blank
    neg:     optional sign for negative numbers: '-', '(', space or blank
    trailneg:optional trailing minus indicator:  '-', ')', space or blank

    >>> d = Decimal('-1234567.8901')
    >>> moneyfmt(d, curr='$')
    '-$1,234,567.89'
    >>> moneyfmt(d, places=0, sep='.', dp='', neg='', trailneg='-')
    '1.234.568-'
    >>> moneyfmt(d, curr='$', neg='(', trailneg=')')
    '($1,234,567.89)'
    >>> moneyfmt(Decimal(123456789), sep=' ')
    '123 456 789.00'
    >>> moneyfmt(Decimal('-0.02'), neg='<', trailneg='>')
    '<0.02>'

    """
    q = Decimal(10) ** -places      # 2 places --> '0.01'
    sign, digits, exp = value.quantize(q).as_tuple()
    result = []
    digits = map(str, digits)
    build, next = result.append, digits.pop
    if sign:
        build(trailneg)
    for i in range(places):
        build(next() if digits else '0')
    if result:
        build(dp)
    if not digits:
        build('0')
    i = 0
    while digits:
        build(next())
        i += 1
        if i == 3 and digits:
            i = 0
            build(sep)
    build(curr)
    build(neg if sign else pos)
    return ''.join(reversed(result))

def read_data(fn):
    import csv
    rdr = csv.reader(open(fn))
    records = []
    for r in rdr:
        try:
            code, name, value = int(r[0]), r[1], Decimal(r[2])
            records.append((code, name, value))
        except:
            pass
    return records

def find_node(top, code):
    curnode = top
    n = 2
    curcode = int(str(code)[:n])
    while code != curcode:
        #print (code, curcode)
        #time.sleep(0.02)
        curnode = curnode.setdefault(curcode, {})
        n += 1
        curcode = int(str(code)[:n])

    curnode = curnode.setdefault(curcode, {})
    return curnode

def build_tree(records):
    top = {}
    
    # build tree
    for code, name, val in records:
        curnode = find_node(top, code)
        curnode['val'] = val
        curnode['name'] = name

    def rewrite(top, code, node, depth=0):
        newcode = int('55' + str(code)[2:])
        newnode = find_node(top, newcode)
        newnode['val'] = node['val']
        newnode['name'] = '%s (%s)' % (node['name'], code)
        for k in node.keys():
            if k in ('name', 'val'):
                continue
            rewrite(top, k, node.get(k), depth=depth+1)
        if not depth:
            n_old = find_node(top, int(str(code)[:2]))
            n55 = find_node(top, 55)
            n_old['val'] = n_old['val'] - node['val']
            n55['val'] = n55['val'] + node['val']
            del n_old[code]
    
    # recategorize interests
    #rewrite(top, 403, find_node(top, 403))
    #rewrite(top, 404, find_node(top, 404))
    
    return top

def transform(top, codes, getColor):
    import copy
    struct = copy.deepcopy(top)

    for k, v in struct.items():
        if isinstance(k, int):
            if int(str(k)[:2]) not in codes:
                del struct[k]
    struct['val'] = sum([i['val'] for i in struct.values() if isinstance(i, dict)])
    
    def trans(top, codes, code, node, depth=0):
        for k, v in node.items():
            ch = node.setdefault('children', [])
            if k == 'name':
                if isinstance(code, int):
                    node['name'] = '%s %s' % (code, node['name'])
                    node['id'] = 'p%s' % code
                else:
                    node['id'] = code
            elif k == 'id':
                pass
            elif k == 'val':
                node['data'] = {
                    '$area': v,
                    'znesek': money(v),
                    '$color': getColor(code),
                }
                del node[k]
            else:
                del node[k]
                ch.append(v)
                trans(top, codes, k, v, depth=depth+1)
    trans(struct, codes, struct['id'], struct)
    return struct

class Renderer:
    #def __init__(self, fn):
    #    self.fn = fn
    def __call__(self, records):
        #records = read_data(self.fn)
        struct = build_tree(records)
        struct['name'] = self.name
        struct['id'] = 'nodeTop'
        struct = transform(struct, self.codes, self.getColor)
        struct['id'] = 'nodeTop'
        #save_to(struct, '%s_%s.json' % (os.path.splitext(self.fn)[0], self.__class__.__name__.lower()))
        return struct

class Prihodki(Renderer):
    codes = (70, 71, 72, 73, 74, 78, 75, 50)
    name = 'SKUPAJ PRIHODKI (70+71+72+73+74+78)+(75+50)'
    def getColor(self, name):
        name = str(name)
        if name[:2] in ['50']:
            return '#e30000'    # zadolzevanje
        elif name[:2] in ['70']:
            return '#1E4F34'          # bright green
        elif name[:2] == '78':
            return '#0f3fa2'    # EU
        else:
            return '#537B99'    # dark green

class Odhodki(Renderer):
    codes = (40, 41, 42, 43, 45, 44, 55)
    name = 'SKUPAJ ODHODKI (40+41+42+43+45)+(44+55)'
    def getColor(self, name):
        name = str(name)
        if name[:2] in ['55']:
            return '#e30000'                #dolg
        elif name[:3] in ['400', '401']:
            return '#1E4F34'                #place
        elif name[:2] in ['41']:
            return '#537B99'                # tekoci transferi
        elif name[:2] in ['43']:
            return '#ea7400'                # investicijski transferi
        elif name[:2] == '42':
            return '#eac100'                # investicijski odhodki
        elif name[:2] in ['45']:            # EU
            return '#0f3fa2'
        else:
            return '#D6BE96'                #drugo


