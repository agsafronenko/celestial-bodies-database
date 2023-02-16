--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64),
    origin_name text,
    constellation text NOT NULL,
    distance_in_light_years integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_more_info (
    galaxy_more_info_id integer NOT NULL,
    name character varying(64),
    galaxy_id integer NOT NULL,
    diameter_in_light_years integer NOT NULL
);


ALTER TABLE public.galaxy_more_info OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_galaxy_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_more_info_galaxy_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_more_info_galaxy_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_galaxy_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_more_info_galaxy_more_info_id_seq OWNED BY public.galaxy_more_info.galaxy_more_info_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(64),
    planet_id integer NOT NULL,
    diameter_in_km numeric(30,1) NOT NULL,
    larger_than_earth_in_diameter boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(64),
    star_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    larger_than_earth boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64),
    galaxy_id integer NOT NULL,
    temperature_in_k integer NOT NULL,
    larger_than_the_sun boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_more_info galaxy_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info ALTER COLUMN galaxy_more_info_id SET DEFAULT nextval('public.galaxy_more_info_galaxy_more_info_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'The appearance from Earth of the galaxy - a band of light', 'Sagittarius', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Gets its name from the area of the sky in which it appears - constellation Andromeda', 'Andromeda', 2500000);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 'Appears similar in shape to a cigar', 'Ursa Major', 11500000);
INSERT INTO public.galaxy VALUES (4, 'LMC', 'LMC stands for Large Magellanic Cloud and named after Ferdinad Magellan', 'Dorado/Mensa', 158000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Similar in appearance to a pinwheel (toy)', 'Ursa Major', 20870000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Similar in appearance to a sombrero', 'Virgo', 29350000);


--
-- Data for Name: galaxy_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_more_info VALUES (1, 'Milky way', 1, 100000);
INSERT INTO public.galaxy_more_info VALUES (2, 'Andromeda', 2, 220000);
INSERT INTO public.galaxy_more_info VALUES (3, 'Cigar', 3, 37000);
INSERT INTO public.galaxy_more_info VALUES (4, 'LMC', 4, 14000);
INSERT INTO public.galaxy_more_info VALUES (5, 'Pinwheel', 5, 170000);
INSERT INTO public.galaxy_more_info VALUES (6, 'Sombrero', 6, 50000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3475.0, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.2, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.6, false);
INSERT INTO public.moon VALUES (4, 'Titan', 8, 5149.0, false);
INSERT INTO public.moon VALUES (5, 'Mimas', 8, 396.0, false);
INSERT INTO public.moon VALUES (6, 'Dione', 8, 1123.0, false);
INSERT INTO public.moon VALUES (7, 'Rhea', 8, 1527.0, false);
INSERT INTO public.moon VALUES (8, 'Tethys', 8, 1062.0, false);
INSERT INTO public.moon VALUES (9, 'Ariel', 6, 1157.8, false);
INSERT INTO public.moon VALUES (10, 'Titania', 6, 1576.8, false);
INSERT INTO public.moon VALUES (11, 'Triton', 7, 2705.0, false);
INSERT INTO public.moon VALUES (12, 'Proteus', 7, 420.0, false);
INSERT INTO public.moon VALUES (13, 'Europa', 5, 3121.6, false);
INSERT INTO public.moon VALUES (14, 'Callisto', 5, 4820.6, false);
INSERT INTO public.moon VALUES (15, 'lo', 5, 3643.2, false);
INSERT INTO public.moon VALUES (16, 'Ganymede', 5, 5268.2, false);
INSERT INTO public.moon VALUES (17, 'Metis', 5, 43.0, false);
INSERT INTO public.moon VALUES (18, 'Adrastea', 5, 16.4, false);
INSERT INTO public.moon VALUES (19, 'Amalthea', 5, 167.0, false);
INSERT INTO public.moon VALUES (20, 'Thebe', 5, 98.6, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 2, 12742, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 2, 4880, false);
INSERT INTO public.planet VALUES (3, 'Venus', 2, 12103, false);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 6779, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 143000, true);
INSERT INTO public.planet VALUES (6, 'Uranus', 2, 50724, true);
INSERT INTO public.planet VALUES (7, 'Neptune', 2, 49244, true);
INSERT INTO public.planet VALUES (8, 'Saturn', 2, 116460, true);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1 b', 7, 14220, true);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1 c', 7, 13978, true);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1 d', 7, 9913, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1 e', 7, 11723, false);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1 f', 7, 13315, true);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1 g', 7, 14386, true);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1 h', 7, 9875, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 2, 8500, true);
INSERT INTO public.star VALUES (2, 'Sun', 1, 5778, NULL);
INSERT INTO public.star VALUES (3, 'R136a1', 4, 46000, true);
INSERT INTO public.star VALUES (4, 'Gliese 623', 1, 3438, false);
INSERT INTO public.star VALUES (5, 'VY Canis Majoris', 2, 3490, true);
INSERT INTO public.star VALUES (6, 'Pistol', 1, 11800, true);
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', 1, 2550, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: galaxy_more_info_galaxy_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_more_info_galaxy_more_info_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy_more_info galaxy_more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info
    ADD CONSTRAINT galaxy_more_info_name_key UNIQUE (name);


--
-- Name: galaxy_more_info galaxy_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info
    ADD CONSTRAINT galaxy_more_info_pkey PRIMARY KEY (galaxy_more_info_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy idunique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT idunique UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon nameunique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT nameunique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star starunique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT starunique UNIQUE (star_id);


--
-- Name: planet uniqueplanet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniqueplanet UNIQUE (planet_id);


--
-- Name: galaxy_more_info galaxy_more_info_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info
    ADD CONSTRAINT galaxy_more_info_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star galaxyfk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxyfk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planetfk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planetfk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet starfk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT starfk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

