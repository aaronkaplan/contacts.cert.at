#!/bin/sh

path="/tmp"
DB="geolite"

delete_data=1

if [ ${delete_data} == 1 ]; then
  psql $DB -c "delete from asns;"
else
  echo "warning: might have duplicate data (depending on PK uniqueness) since we are not deleting the previous import." 
fi

# quirks needed for postgresql. Needs to be readable for postgresql user
mv ./asn-blocks-v4.csv $path
mv ./asn-blocks-v6.csv $path

psql $DB -c "COPY asns FROM '${path}/asn-blocks-v4.csv' WITH CSV HEADER;"
psql $DB -c "COPY asns FROM '${path}/asn-blocks-v6.csv' WITH CSV HEADER;"


rm $path/asn-blocks-v4.csv
rm $path/asn-blocks-v6.csv
