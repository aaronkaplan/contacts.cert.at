#!/bin/sh

url=https://geolite.maxmind.com/download/geoip/database/GeoLite2-ASN-CSV.zip
DATE=$(date  "+%Y-%m-%d")

output="${DATE}-geoliteasn-csv.zip"
wget --quiet -O $output $url 

# unzip and sort files
cd tmp
unzip ../$output
cd GeoLite2-ASN-CSV*
mv GeoLite2-ASN-Blocks-IPv4.csv ../../asn-blocks-v4.csv
mv GeoLite2-ASN-Blocks-IPv6.csv ../../asn-blocks-v6.csv

# clean up
cd ../..
rm -rf tmp/*


