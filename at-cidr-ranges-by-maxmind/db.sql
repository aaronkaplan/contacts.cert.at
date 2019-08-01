
\c template1

CREATE DATABASE geolite;

\c geolite

CREATE EXTENSION ip4r;

-- =================================================
-- first the locations CSV file
--
-- format:
--   geoname_id,locale_code,continent_code,continent_name,country_iso_code,country_name,is_in_european_union
--   49518,en,AF,Africa,RW,Rwanda,0
--   51537,en,AF,Africa,SO,Somalia,0
-- ...

CREATE TABLE locations(id integer primary key, locale_code varchar(2), continent_code varchar(4), continent_name varchar(100), country_iso_code varchar(2), country_name varchar(500), is_in_european_union boolean);

CREATE INDEX idx_locations_country_iso_code on locations(country_iso_code);

copy locations from '/tmp/locations.csv' with  CSV HEADER;



-- =================================================
-- next the the GeoLite2-Country-Blocks-IPv4.csv file

-- format:
-- network,geoname_id,registered_country_geoname_id,represented_country_geoname_id,is_anonymous_proxy,is_satellite_provider
-- 1.0.0.0/24,2077456,2077456,,0,0
-- 1.0.1.0/24,1814991,1814991,,0,0
-- 1.0.2.0/23,1814991,1814991,,0,0
-- 1.0.4.0/22,2077456,2077456,,0,0  
--   
CREATE TABLE networks (
        network cidr PRIMARY KEY, 
        geoname_id integer, 
        registered_country_geoname_id integer, 
        represented_country_geoname_id integer, 
        is_anonymous_proxy boolean, 
        is_satellite_provider boolean,
    FOREIGN KEY (geoname_id) REFERENCES locations(id),
    FOREIGN KEY (registered_country_geoname_id) REFERENCES locations(id),
    FOREIGN KEY (represented_country_geoname_id) REFERENCES locations(id)
);

CREATE INDEX idx_networks_geoname_id on networks(geoname_id);
CREATE INDEX idx_networks_registered_country_geoname_id on networks(registered_country_geoname_id);
CREATE INDEX idx_networks_represented_country_geoname_id on networks(represented_country_geoname_id);
CREATE INDEX idx_networks_is_anonymous_proxy on networks(is_anonymous_proxy);
CREATE INDEX idx_networks_is_satellite_provider on networks(is_satellite_provider);


