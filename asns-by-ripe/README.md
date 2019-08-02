# Fetching the Country ASNs from the RIPE stat API

Super simple! Take a look at the [great documentation](https://stat.ripe.net/docs/data_api) of RIPE's stats API.
In particular [this section](https://stat.ripe.net/docs/data_api#country-resource-list).

NOTE: this directory will export both the CIDR ranges (netblocks) as well as ASN lists of a country and copy the files to a web server's directory.

# Requirements

You need to have ["jq"](https://stedolan.github.io/jq/) installed. Also availabe as packages for your favorite flavor of OS.



