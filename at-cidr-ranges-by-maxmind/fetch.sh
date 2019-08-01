#!/bin/sh

url=https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip
DATE=$(date  "+%Y-%m-%d")

output="${DATE}-geolitecountry-csv.zip"
wget --quiet -O $output $url 

# unzip and sort files
cd tmp
unzip ../$output
cd GeoLite2-Country-CSV*
mv GeoLite2-Country-Locations-en.csv ../../locations.csv
mv GeoLite2-Country-Blocks-IPv4.csv ../../networksv4.csv
mv GeoLite2-Country-Blocks-IPv6.csv ../../networksv6.csv

# clean up
cd ../..
rm -rf tmp/*


