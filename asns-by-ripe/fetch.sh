#!/bin/bash

url="https://stat.ripe.net/data/country-resource-list/data.json?resource="
DATE=$(date  "+%Y-%m-%d")

countries=AT

for cc in $countries; do
    output="${DATE}-${cc}-ripe-asn.json"
    wget --quiet -O $output ${url}${cc} 
done


# clean up
