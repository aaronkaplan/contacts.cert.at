#!/bin/bash

DB=geolite
country=AT

# do a quick verification
cntv4=$(psql -tA $DB -c "select count(*) from networks where family(network) = 4")
cntv6=$(psql -tA $DB -c "select count(*) from networks where family(network) = 6")

atcntv4=$(psql -tA $DB -c "select count(*) from networks,locations where locations.country_iso_code='${country}' and locations.id = networks.geoname_id and family(network) = 4")
atcntv6=$(psql -tA $DB -c "select count(*) from networks,locations where locations.country_iso_code='${country}' and locations.id = networks.geoname_id and family(network) = 6")

echo "found $cntv4 IPv4 networks (${atcntv4} in $country)"
echo "found $cntv6 IPv6 networks (${atcntv6} in $country)"

# quick test that we are in a certain range for AT. Make sure you change this to sane defaults for your country
if [[ $atcntv4 -gt 3000 ]]; then 
    echo "alert. Found more than 3000 v4 ranges in AT. Please check if this number acutally makes sense and if so, adapt this script"
elif [[ $atcntv4 -lt 2000 ]]; then 
    echo "alert. Found less than 2000 v4 ranges in AT. Please check if this number acutally makes sense and if so, adapt this script"
fi


