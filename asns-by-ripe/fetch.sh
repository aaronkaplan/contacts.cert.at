#!/bin/bash

. ./common.sh

url="https://stat.ripe.net/data/country-resource-list/data.json?resource="

for cc in $countries; do
    output="${DATE}-${cc}-ripe-country-resource-list.json"
    wget --quiet -O $output ${url}${cc} 
done


# clean up
