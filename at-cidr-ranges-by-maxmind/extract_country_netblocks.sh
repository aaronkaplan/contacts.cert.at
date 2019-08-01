#!/bin/sh

countries=AT
DB=geolite

output="at-ranges.txt"
outputv6="at-ranges-v6.txt"

for cc in $countries; do
    psql -tA $DB -c "select network from networks,locations where locations.country_iso_code='${cc}' and locations.id = networks.geoname_id and family(network) = 4" > $output;
    psql -tA $DB -c "select network from networks,locations where locations.country_iso_code='${cc}' and locations.id = networks.geoname_id and family(network) = 6" > $outputv6;
done
