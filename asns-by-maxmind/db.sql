
-- assumption: the geolite postgresql DB was created. 
-- same for: CREATE EXTENSION ip4r;

\c geolite


-- =================================================
-- create the ASN table

-- format:
-- network,autonomous_system_number,autonomous_system_organization
--   1.0.0.0/24,13335,"Cloudflare, Inc."
--   1.0.4.0/22,56203,Gtelecom-AUSTRALIA
--   1.0.16.0/24,2519,"ARTERIA Networks Corporation"

CREATE TABLE asns (
        network cidr PRIMARY KEY, 
        asn INTEGER NOT NULL,
        orgname VARCHAR(1000)   -- ,
--    FOREIGN KEY (network) REFERENCES networks(network)
);

CREATE INDEX idx_asns_asn on asns(asn);
CREATE INDEX idx_asns_orgname on asns(orgname);


