# Overview

This is the source code for the [https://contacts.cert.at](https://contacts.cert.at) service.
It offers the following services:

  * IP range extraction (MaxMind):
    * MaxMind's GeoLiteCountry DB fetching, parsing and loading into a PostgreSQL DB
    * Extracting the IP ranges (v4, v6) of a specific country from MaxMind and serving these IP ranges (netblocks) via a simple text file for web servers for further use-cases.
  * ASN range extraction (MaxMind):
    * same as IP ranges above, just for ASNs
  * IP range extraction (RIPE DB):
    * fetching, parsing and processing of the RIPE stat API for IP ranges. 
    * again, served as simple text files
  * ASN range extraction (RIPE DB):
    * same as IP ranges above, just for ASNs

  * geolocate the national CERT abuse service:
    * here you may copy & paste or upload an arbitrary text file. As long as it contains IP addresses, these will be parsed (matched) and geolocated to a country. Then the contact email address of the national CSIRT for the respective country is shown.

## Example:
*via Browser:*

In your browser, enter https://contacts.cert.at/cgi-bin/abuse-nationalcert.pl?ip=8.8.8.8&bShowNationalCERT=on&sep=TAB

*Answer:*
```
8.8.8.8	US	US-CERT	soc@us-cert.gov
```

*Command line*
To pipe your logfile "mylogfile" through our abuse geolocate the national CERT service, you can use the Unix tool "curl":
```bash
curl --insecure -F bShowHeader=on -F "ip=<mylogfile" -F bShowNationalCERT=on -F sep=TAB https://contacts.cert.at/cgi-bin/abuse-nationalcert.pl
```

*Answer:*

```
80.123.32.250	AT	CERT.at	cert@cert.at
88.116.2.106	AT	CERT.at	cert@cert.at
81.189.89.2	AT	CERT.at	cert@cert.at
62.47.229.224	AT	CERT.at	cert@cert.at
91.114.233.134	AT	CERT.at	cert@cert.at
80.120.103.170	AT	CERT.at	cert@cert.at
```

  * geofilter for a specific country:
    * here you may again submit an arbitrary text file (as above) and all lines which contain IP addresses which would get located (MaxMind) to a specific country would be shown, the rest will be filtered out.

# Why publish this code?

Since the service is up & running at [https://contacts.cert.at](https://contacts.cert.at), you may use the service there for occassional lookups.
However, if you plan to use this service in your (heavy load) log file crunching processing, you might consider installing the source code & adapting it (we are happy to receive pull requests!) and run it locally. Also, this way, you won't send list of IP addresses over the internet.

# Folder structure

  *  [at-cidr-ranges-by-maxmind/](at-cidr-ranges-by-maxmind) ..... netblocks / cidr ranges extraction from the MaxMind DB.
  *  asns-by-maxmind ..... netblocks / cidr ranges extraction from the MaxMind DB.

# How to adapt to your location/country

Please note that the files contain some variables which you may replace to filter / extract data for your country. Simply ``grep -r "AT"`` for places to adapt.

# Author & Comments

The first version of this service was written by me, Aaron Kaplan <aaron@lo-res.org> in my spare time on a train ride on the way to my holidays, 2012. 
All rights reserved. Please send any questions regarding this code to my email address above.

The second version was re-written via the CEF-2016-3 grant. See acknowledgements below.

# License

The standard 3-clause BSD license applies, see the [LICENSE.txt](LICENSE.txt) file for details.

# Acknowledgements

Thanks go to Robert Waldner for very helpful feedback.

![logo](logo.png)

This product includes GeoLite2 data created by MaxMind, available from [https://www.maxmind.com](https://www.maxmind.com).


