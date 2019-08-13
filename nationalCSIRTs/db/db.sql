--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4 (Debian 11.4-1)
-- Dumped by pg_dump version 11.4 (Debian 11.4-1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: contactdb; Type: DATABASE; Schema: -; Owner: contactdb
--

CREATE DATABASE contactdb WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE contactdb OWNER TO contactdb;

\connect contactdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: certs; Type: TABLE; Schema: public; Owner: contactdb
--

CREATE TABLE public.certs (
    iso2 character(2) NOT NULL,
    team_name character varying,
    full_team_name character varying,
    email character varying(256) NOT NULL,
    confirmed boolean,
    source character varying,
    active boolean,
    editor_email character varying,
    created timestamp with time zone DEFAULT now(),
    changed timestamp with time zone DEFAULT now(),
    type_of_cert character varying,
    weight double precision DEFAULT 0.5,
    ti_url character varying(500)
);


ALTER TABLE public.certs OWNER TO contactdb;

--
-- PostgreSQL database dump complete
--

