#!/bin/bash

. ./common.sh

for cc in $countries; do
    output_asns=${DATE}-${cc}-ripe-asn.txt
    output_ipv4=${DATE}-${cc}-ripe-ipv4.txt
    output_ipv6=${DATE}-${cc}-ripe-ipv6.txt

    mv ${output_asns} ${output_ipv4} ${output_ipv6} $WEBROOT
done

# might want to symlink a current.txt file to each list...
# ...later...
