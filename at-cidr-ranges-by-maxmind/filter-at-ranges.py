#!/usr/bin/env python3
# -*- coding: utf-8 -*-

""" NOTE!!!!
  This script only works with the legacy GeoIPLite version 1.x databases! 
  DO NOT USE IT ANYMORE.
  It's here for reference only.
"""


import sys
import math
import csv
import re
import subprocess

# format of CSV version of Maxmind (http://dev.maxmind.com/geoip/geolite):
#"1.0.0.0","1.0.0.255","16777216","16777471","AU","Australia"
#"1.0.1.0","1.0.3.255","16777472","16778239","CN","China"
#"1.0.4.0","1.0.7.255","16778240","16779263","AU","Australia"
#"1.0.8.0","1.0.15.255","16779264","16781311","CN","China"
#"1.0.16.0","1.0.31.255","16781312","16785407","JP","Japan"

filename="/usr/share/GeoIP/GeoIPCountryWhois.csv"
if (len(sys.argv) > 1):
    filename = sys.argv[1]

with open(filename, 'r') as csvfile:

    reader = csv.reader(csvfile, dialect='excel', delimiter=',',
                        quotechar='"', quoting=csv.QUOTE_ALL)
    for row in reader:
        try:
            #print row
            ip_from=row[0]
            ip_till=row[1]
            ip_from_n=int(row[2])
            ip_till_n=int(row[3])
            # XXX FIXME: this is not enough, we might have to deaggregate
            # prefixlen = 32-math.log(ip_till_n-ip_from_n+1, 2)
            country=row[4]

            if (country == "AT"):
                num_ips=ip_till_n - ip_from_n +1
                bitlen = math.log(num_ips, 2)
                if (math.floor(bitlen) < bitlen):
                    # gotta deaggregate
                    print("# have to deaggregate: %s - %s: %s IPs, ld(bitlen): %f" %(ip_from, ip_till, num_ips, bitlen), 
				file=sys.stderr)
                # XXX FIXME: this is highly inefficient!
                ranges=subprocess.check_output(["ipcalc", ip_from, "-", ip_till ], shell=False, universal_newlines=True)
                #print ranges
                for r in ranges.split('\n'):
                    if (re.match('(^deaggregate.*$)|^$', r)):
                        continue        # skip informational output
                    print(r)

                # XXX FIXME: you might want to compare that against team cyrmu
                # ip2asn serverice

                #prefixes = sys.popen("ipcalc %s - %s" %(ip_from, ip_till))
                #print "from: %s, till: %s, num_ips: %s, prefixlen: %s" %(ip_from, ip_till, num_ips, prefixlen)
                #print ">>> match: %s" %row
                #print "%s/%s" %(ip_from, prefixlen)

        except csv.Error as e:
            sys.exit('file %s, line %d: %s' % (filename, reader.line_num, e))

