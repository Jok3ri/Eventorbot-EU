#!/usr/bin/python

import sys
import sqlite3
import csv
import re

numre = re.compile('^\d+$')
symre = re.compile('^(M\d+(\.\d+)?)x.*')
con = sqlite3.connect(':memory:')
cur = con.cursor()
con.execute('''
CREATE TABLE m (pref, symbol, d, p, m, s, wd1, wd2, wh, remarks)
''')

csvreader = csv.reader(sys.stdin, delimiter=',')
for row in csvreader:
	#print repr(row)
	if numre.match(row[0]) is None:
		continue
	con.execute('''
	INSERT INTO m VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
	''', row[1:])

# Symbols
print '''//
// Symbols
//'''
rowid = 0
cur = con.cursor()
cur.execute('''SELECT pref,symbol FROM m  WHERE pref != "-";''')
for (pref,symbol) in cur:
	if pref == '-':
		continue
	print "%s = %d;" % (symbol.replace(".", "_"), rowid)
	rowid += 1
	t = symre.match(symbol)
	if pref == '+' and t:
		print "%s = %s;" % (t.group(1).replace(".", "_"), symbol.replace(".", "_"))
print

# Value tables
def print_table(comment, name, columns):
	cur = con.cursor()
	print '''//
// %s
//
%s = [
	/* %s */''' % (comment, name, columns)
	cur.execute('''SELECT %s FROM m WHERE pref != "-";''' % columns)
	for row in cur:
		print "\t[%s]," % ", ".join(row)
	print '''];\n'''

print_table("Threads", "METRIC_THREADS", "d, p")
print_table("Hexagonal heads and nuts", "METRIC_HEXAGONAL_HEADS_AND_NUTS", "d, m, s")
print_table("Washers", "METRIC_WASHERS", "wd1, wd2, wh");
