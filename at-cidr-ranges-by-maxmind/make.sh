#!/bin/sh

./fetch.sh
./load.sh
./extract_country_netblocks.sh
./move_netblocks_to_web.sh
