--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    discovered_year integer NOT NULL,
    period numeric NOT NULL,
    is_periodic boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    num_stars integer NOT NULL,
    is_spiral boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    crater_count integer NOT NULL,
    is_geologically_active boolean NOT NULL,
    notes text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    diameter integer NOT NULL,
    mass numeric NOT NULL,
    has_rings boolean NOT NULL,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    brightness numeric NOT NULL,
    is_variable boolean NOT NULL,
    temperature integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1758, 75.3, true, 'Famous periodic comet');
INSERT INTO public.comet VALUES (2, 'Encke', 1786, 3.3, true, 'Short period comet');
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 1995, 2533, false, 'One of the brightest comets');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 200000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 50000, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Spiral', 75000, true);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 120000, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 90000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 15, false, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 30, false, 'Close to Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 20, false, 'Smaller moon');
INSERT INTO public.moon VALUES (4, 'Io', 3, 100, true, 'Volcanically active');
INSERT INTO public.moon VALUES (5, 'Europa', 3, 50, false, 'Icy surface');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 70, false, 'Largest moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 60, false, 'Heavily cratered');
INSERT INTO public.moon VALUES (8, 'Titan', 4, 40, false, 'Thick atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 25, true, 'Cryovolcanism present');
INSERT INTO public.moon VALUES (10, 'Rhea', 4, 35, false, 'Icy surface');
INSERT INTO public.moon VALUES (11, 'Iapetus', 4, 30, false, 'Two-tone coloration');
INSERT INTO public.moon VALUES (12, 'Aphrodite', 6, 10, false, 'Fictional moon for Venus');
INSERT INTO public.moon VALUES (13, 'Kepler Moon 1', 7, 5, false, 'First moon of Kepler-22b');
INSERT INTO public.moon VALUES (14, 'Kepler Moon 2', 7, 7, false, 'Second moon of Kepler-22b');
INSERT INTO public.moon VALUES (15, 'Gliese Moon 1', 8, 8, false, 'Moon orbiting Gliese 581g');
INSERT INTO public.moon VALUES (16, 'Gliese Moon 2', 8, 9, false, 'Second moon orbiting Gliese 581g');
INSERT INTO public.moon VALUES (17, 'HD Moon 1', 9, 12, false, 'Moon of HD 209458 b');
INSERT INTO public.moon VALUES (18, 'HD Moon 2', 9, 15, false, 'Second moon of HD 209458 b');
INSERT INTO public.moon VALUES (19, 'Proxima Moon 1', 10, 4, false, 'Moon of Proxima b');
INSERT INTO public.moon VALUES (20, 'Proxima Moon 2', 10, 6, false, 'Second moon of Proxima b');
INSERT INTO public.moon VALUES (21, 'TRAPPIST Moon 1', 11, 3, false, 'Moon of TRAPPIST-1e');
INSERT INTO public.moon VALUES (22, 'TRAPPIST Moon 2', 11, 4, false, 'Second moon of TRAPPIST-1e');
INSERT INTO public.moon VALUES (23, 'TRAPPIST Moon 3', 11, 5, false, 'Third moon of TRAPPIST-1e');
INSERT INTO public.moon VALUES (24, 'TRAPPIST F Moon 1', 12, 3, false, 'Moon of TRAPPIST-1f');
INSERT INTO public.moon VALUES (25, 'TRAPPIST F Moon 2', 12, 4, false, 'Second moon of TRAPPIST-1f');
INSERT INTO public.moon VALUES (26, 'TRAPPIST F Moon 3', 12, 5, false, 'Third moon of TRAPPIST-1f');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, 5.97, false, 'Home planet with water and life');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6779, 0.642, false, 'Red planet, potential for colonization');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 139820, 1898, true, 'Gas giant with many moons');
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 116460, 568, true, 'Known for its rings');
INSERT INTO public.planet VALUES (5, 'Mercury', 1, 4879, 0.330, false, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (6, 'Venus', 1, 12104, 4.87, false, 'Hottest planet in the solar system');
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2, 24000, 36, false, 'Exoplanet in habitable zone');
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 2, 16000, 3.1, false, 'Potentially habitable exoplanet');
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 3, 143000, 220, false, 'Hot Jupiter with an evaporating atmosphere');
INSERT INTO public.planet VALUES (10, 'Proxima b', 4, 11400, 1.27, false, 'Closest exoplanet to Earth');
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 5, 11600, 0.62, false, 'Exoplanet in a multi-planet system');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', 6, 11800, 0.68, false, 'Another exoplanet in a multi-planet system');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, false, 5778);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 1.519, false, 5790);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 25.4, true, 9940);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 126000, true, 3500);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 120000, false, 11000);
INSERT INTO public.star VALUES (6, 'Vega', 3, 40.12, false, 9600);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

