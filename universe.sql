--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    area_in_square_degrees numeric(6,1),
    is_zodiac boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_million_year integer,
    is_spiral boolean,
    is_blackhole boolean,
    distance_from_earth numeric(10,2),
    "position" integer
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
    name character varying(50) NOT NULL,
    planet_id integer,
    distance_from_planet numeric(10,2),
    radius_in_km integer,
    is_active boolean,
    description text,
    number_of_planet integer
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
    name character varying(50) NOT NULL,
    star_id integer,
    distance_from_earth numeric(10,2),
    has_life boolean,
    is_spherical boolean,
    description text,
    number_of_moon integer
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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    mass numeric(10,2),
    age_in_million_year integer,
    is_active boolean,
    description text,
    number_of_planet integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Ursa Major', 1280.0, false);
INSERT INTO public.constellation VALUES (2, 'Orion', 594.0, false);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 598.0, false);
INSERT INTO public.constellation VALUES (4, 'Scorpius', 496.0, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Notre galaxie', 13600, true, true, 0.00, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Galaxie voisine la plus proche', 10000, true, true, 2.54, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Petite galaxie spirale voisine', 10000, true, false, 2.73, 3);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Galaxie à bulbe très lumineux', 13000, true, true, 31.10, 4);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Galaxie spirale en interaction', 13000, true, false, 23.00, 5);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'Galaxie en forme de cigare', 13000, false, true, 12.00, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384.40, 1737, NULL, 'Lune de la Terre', NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9.38, 11, NULL, 'Lune de Mars', NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23.46, 6, NULL, 'Lune de Mars', NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, 421.70, 1822, NULL, 'Lune de Jupiter', NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 671.00, 1561, NULL, 'Lune de Jupiter', NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1070.00, 2634, NULL, 'Lune de Jupiter', NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1883.00, 2410, NULL, 'Lune de Jupiter', NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1222.00, 2575, NULL, 'Lune de Saturne', NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 238.00, 252, NULL, 'Lune de Saturne', NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 527.00, 764, NULL, 'Lune de Saturne', NULL);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 3561.00, 734, NULL, 'Lune de Saturne', NULL);
INSERT INTO public.moon VALUES (12, 'Miranda', 7, 129.90, 236, NULL, 'Lune d''Uranus', NULL);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 191.20, 579, NULL, 'Lune d''Uranus', NULL);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, 266.00, 585, NULL, 'Lune d''Uranus', NULL);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 436.30, 788, NULL, 'Lune d''Uranus', NULL);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 583.50, 761, NULL, 'Lune d''Uranus', NULL);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 354.80, 1353, NULL, 'Lune de Neptune', NULL);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 5513.00, 170, NULL, 'Lune de Neptune', NULL);
INSERT INTO public.moon VALUES (19, 'Alcyone b I', 12, 450.00, 1200, NULL, 'Lune fictive d''Alcyone b', NULL);
INSERT INTO public.moon VALUES (20, 'Alcyone b II', 12, 250.00, 800, NULL, 'Lune fictive d''Alcyone b', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, NULL, false, true, NULL, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, NULL, false, true, NULL, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, NULL, true, true, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, NULL, false, true, NULL, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, NULL, false, true, NULL, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, NULL, false, true, NULL, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, NULL, false, true, NULL, 5);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, NULL, false, true, NULL, 2);
INSERT INTO public.planet VALUES (9, 'Mirach b', 4, NULL, false, true, NULL, 0);
INSERT INTO public.planet VALUES (10, 'Mirach c', 4, NULL, false, true, NULL, 0);
INSERT INTO public.planet VALUES (11, 'Alpha Trianguli b', 5, NULL, false, true, NULL, 0);
INSERT INTO public.planet VALUES (12, 'Alcyone b', 6, NULL, false, true, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, 4600, true, 'Notre étoile', 8);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.02, 240, true, 'Étoile la plus brillante du ciel nocturne', 0);
INSERT INTO public.star VALUES (3, 'Vega', 1, 2.14, 455, true, 'Étoile brillante de la Lyre', 0);
INSERT INTO public.star VALUES (4, 'Mirach', 2, 2.10, 1000, true, 'Étoile géante d''Andromède', 2);
INSERT INTO public.star VALUES (5, 'Alpha Trianguli', 3, 1.50, 1200, true, 'Étoile du Triangle', 1);
INSERT INTO public.star VALUES (6, 'Alcyone', 1, 5.00, 100, true, 'Étoile des Pléiades', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

