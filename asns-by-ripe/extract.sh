#!/bin/bash

. ./common.sh


for cc in $countries; do
    input="${DATE}-${cc}-ripe-country-resource-list.json"
    output_asns=${DATE}-${cc}-ripe-asn.txt
    output_ipv4=${DATE}-${cc}-ripe-ipv4.txt
    output_ipv6=${DATE}-${cc}-ripe-ipv6.txt
    # extract ASN list:
    jq ".data.resources.asn[]" < $input | tr -d '"' > ${output_asns}
    # extract IPvx list:
    jq ".data.resources.ipv4[]" < $input | tr -d '"' > ${output_ipv4}
    jq ".data.resources.ipv6[]" < $input | tr -d '"' > ${output_ipv6}
done


# clean up
