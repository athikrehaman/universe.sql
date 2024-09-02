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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    composition text NOT NULL,
    size integer NOT NULL,
    is_potentially_hazardous boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size numeric NOT NULL,
    description text,
    has_life boolean NOT NULL,
    discovered boolean NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer,
    diameter integer NOT NULL,
    orbital_period numeric NOT NULL,
    is_habitable boolean NOT NULL,
    has_craters boolean NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer,
    radius integer NOT NULL,
    distance_from_star numeric NOT NULL,
    has_water boolean NOT NULL,
    has_atmosphere boolean NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    temperature integer NOT NULL,
    mass numeric NOT NULL,
    is_visible boolean NOT NULL,
    is_active boolean NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Eros', 'Rocky', 34, false);
INSERT INTO public.asteroid VALUES (2, 'Itokawa', 'Rocky', 0, false);
INSERT INTO public.asteroid VALUES (3, 'Bennu', 'Carbonaceous', 0, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Our home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 'Nearest spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 'Third largest in Local Group', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 76000, 'Interacting grand-design spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 49000, 'Unbarred spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 170000, 'Face-on spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (8, 'Cartwheel', 150000, 'Lenticular galaxy and ring galaxy', false, true);
INSERT INTO public.galaxy VALUES (9, 'Black Eye', 51000, 'Unusual spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (10, 'Messier 87', 120000, 'Supergiant elliptical galaxy', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 27.3, false, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 0.3, false, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 1.3, false, true);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3121, 3.5, false, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 5268, 7.2, false, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 4820, 16.7, false, true);
INSERT INTO public.moon VALUES (7, 'Io', 3, 3643, 1.8, false, true);
INSERT INTO public.moon VALUES (8, 'Titan', 3, 5150, 15.9, false, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 3, 1528, 4.5, false, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 3, 1469, 79.3, false, true);
INSERT INTO public.moon VALUES (11, 'Dione', 3, 1123, 2.7, false, true);
INSERT INTO public.moon VALUES (12, 'Tethys', 3, 1062, 1.9, false, true);
INSERT INTO public.moon VALUES (13, 'Enceladus', 3, 504, 1.4, false, true);
INSERT INTO public.moon VALUES (14, 'Mimas', 3, 396, 0.9, false, true);
INSERT INTO public.moon VALUES (15, 'Oberon', 3, 1523, 13.5, false, true);
INSERT INTO public.moon VALUES (16, 'Titania', 3, 1578, 8.7, false, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 3, 1169, 4.1, false, true);
INSERT INTO public.moon VALUES (18, 'Ariel', 3, 1158, 2.5, false, true);
INSERT INTO public.moon VALUES (19, 'Miranda', 3, 471, 1.4, false, true);
INSERT INTO public.moon VALUES (20, 'Triton', 3, 2706, 5.9, false, true);
INSERT INTO public.moon VALUES (24, 'Hyperion', 1, 270, 21.3, false, true);
INSERT INTO public.moon VALUES (25, 'Phoebe', 1, 213, 18.5, false, true);
INSERT INTO public.moon VALUES (26, 'Janus', 1, 179, 16.7, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 1.0, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, 1.524, false, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 69911, 5.204, false, true);
INSERT INTO public.planet VALUES (4, 'Proxima b', 2, 7160, 0.0485, true, true);
INSERT INTO public.planet VALUES (5, 'Sirius b', 3, 11600, 20.0, false, false);
INSERT INTO public.planet VALUES (6, 'Betelgeuse b', 4, 50000, 100.0, false, false);
INSERT INTO public.planet VALUES (7, 'Rigel b', 5, 40000, 50.0, false, false);
INSERT INTO public.planet VALUES (8, 'Vega b', 6, 12000, 25.0, false, false);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 1, 12700, 0.85, true, true);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 1, 11000, 0.15, true, true);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 1, 14300, 0.047, false, true);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 1, 10400, 0.015, false, true);
INSERT INTO public.planet VALUES (13, 'Kepler-452b', 1, 12700, 1.05, true, true);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1d', 1, 6800, 0.022, true, true);
INSERT INTO public.planet VALUES (15, 'LHS 1140 b', 1, 9100, 0.087, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.0, true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 3042, 0.123, true, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940, 2.02, true, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, 20.0, true, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 12100, 21.0, true, true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 9602, 2.135, true, true);
INSERT INTO public.star VALUES (7, 'Alpha Centauri', 2, 5790, 1.1, true, true);
INSERT INTO public.star VALUES (8, 'Barnard''s Star', 2, 3134, 0.144, true, true);
INSERT INTO public.star VALUES (9, 'Wolf 359', 2, 2800, 0.09, true, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
