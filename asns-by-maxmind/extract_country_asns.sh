#!/bin/sh

countries=AT
DB=geolite


for cc in $countries; do
    output="${countries}-asns.txt"
    psql -tA $DB -c "select asn from asns,networks,locations where asns.network = networks.network and networks.geoname_id = locations.id and locations.country_iso_code = '${cc}';" > $output
done
