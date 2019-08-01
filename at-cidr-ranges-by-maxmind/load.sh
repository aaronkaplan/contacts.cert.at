#!/bin/sh

path="/tmp"
DB="geolite"

delete_data=1

if [ ${delete_data} == 1 ]; then
  psql $DB -c "delete from networks;"
else
  echo "warning: might have duplicate data (depending on PK uniqueness) since we are not deleting the previous import." 
fi

# quirks needed for postgresql. Needs to be readable for postgresql user
mv ./networksv4.csv $path
mv ./networksv6.csv $path

psql $DB -c "COPY networks FROM '${path}/networksv4.csv' WITH CSV HEADER;"
psql $DB -c "COPY networks FROM '${path}/networksv6.csv' WITH CSV HEADER;"


rm $path/networksv4.csv
rm $path/networksv6.csv
