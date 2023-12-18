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

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer DEFAULT nextval('public.galaxy_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    distance_from_earth_ly numeric(9,6),
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer DEFAULT nextval('public.galaxy_type_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer DEFAULT nextval('public.moon_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    size_in_mi integer,
    is_spherical boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer DEFAULT nextval('public.planet_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    has_life boolean DEFAULT false,
    star_id integer,
    size_in_mi integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer DEFAULT nextval('public.star_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    galaxy_id integer,
    size_in_mi integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 0.026500, 2);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', NULL, 0.025000, 3);
INSERT INTO public.galaxy VALUES (3, 'NGC 2976', NULL, 11.610000, 2);
INSERT INTO public.galaxy VALUES (4, 'UGCA 86', NULL, 9.720000, 2);
INSERT INTO public.galaxy VALUES (5, 'Leo P', NULL, 5.280000, 3);
INSERT INTO public.galaxy VALUES (6, 'M1110', NULL, 2.670000, 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Spiral', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3, NULL, false);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 4, NULL, false);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 4, NULL, false);
INSERT INTO public.moon VALUES (4, 'IO', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (9, 'Himalia', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (10, 'Elara', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (11, 'Pasiphae', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (12, 'Sinope', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (13, 'Lysithea', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (14, 'Carme', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (15, 'Ananke', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (16, 'Leda', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (17, 'Thebe', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (18, 'Adrastea', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (19, 'Metis', NULL, 5, NULL, false);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', NULL, 5, NULL, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, false, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, false, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, false, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, false, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, false, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, false, 1, NULL);
INSERT INTO public.planet VALUES (8, 'KELT-9b', NULL, false, 5, NULL);
INSERT INTO public.planet VALUES (9, 'Neptune', NULL, false, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Rigel', NULL, false, 6, NULL);
INSERT INTO public.planet VALUES (11, 'Rigel 2', NULL, false, 6, NULL);
INSERT INTO public.planet VALUES (12, 'Rigel 3', NULL, false, 6, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'Canopus', NULL, 1, NULL);
INSERT INTO public.star VALUES (4, 'Arcturus', NULL, 1, NULL);
INSERT INTO public.star VALUES (5, 'Vega', NULL, 1, NULL);
INSERT INTO public.star VALUES (6, 'Rigel', NULL, 1, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

