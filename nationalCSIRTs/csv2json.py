#!/usr/bin/env python

import csv
import sys
import json

print('[')

delim=';'
quotechar='"'

with sys.stdin as csvfile:
    r = csv.DictReader(csvfile, delimiter=delim, quotechar=quotechar)
    for row in r:
        json.dump(row, sys.stdout)
        sys.stdout.write(',\n')
print('{ "_meta": { "comment": "export of national CSIRTs from contacts.cert.at. Please report errors to kaplan@cert.at" } } ]')
