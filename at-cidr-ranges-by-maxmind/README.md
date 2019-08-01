

# Networks in a country according to MaxMind

This small script extracts the  networks (IP ranges) of countries and filters
by the country you specify, it then converts it to CIDR notation and stores the file.

Can be run via cron script. It produces two output files:

  * $countryname-ranges.txt
  * $countryname-ranges-v6.txt
  
  Where $countryname is the country you specified.


# Who wrote it?
All blame should be sent towards me, Aaron Kaplan <aaron@lo-res.org> . 

# Updating the database
Go to [https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip](https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip) and fetch the newest version.
Please note that maxmind offers a download mechanism for updates. 
Also take a look at the [fetch.sh](fetch.sh) script which does that for you.


This product includes GeoLite2 data created by MaxMind, available from
[https://www.maxmind.com">https://www.maxmind.com](https://www.maxmind.com">https://www.maxmind.com).



