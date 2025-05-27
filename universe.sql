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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: astroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astroid (
    name character varying(50) NOT NULL,
    diameter_in_km numeric(12,5) NOT NULL,
    contains_valuable_minerals boolean,
    astroid_id integer NOT NULL
);


ALTER TABLE public.astroid OWNER TO freecodecamp;

--
-- Name: astroids_astroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astroids_astroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astroids_astroid_id_seq OWNER TO freecodecamp;

--
-- Name: astroids_astroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astroids_astroid_id_seq OWNED BY public.astroid.astroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    celestial_bodies integer NOT NULL,
    diameter_in_lightyears numeric(9,5) NOT NULL
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
    earth_mass numeric(5,5) NOT NULL,
    distance_to_planet_in_km numeric(12,5) NOT NULL,
    orbital_period_in_days numeric(9,5) NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    contains_hydrogen boolean
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
    moons_in_orbit integer,
    age bigint NOT NULL,
    earth_mass numeric(9,5) NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    habitable boolean
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
    planets_in_system integer,
    age bigint NOT NULL,
    solar_mass numeric(5,5) NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL
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
-- Name: astroid astroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid ALTER COLUMN astroid_id SET DEFAULT nextval('public.astroids_astroid_id_seq'::regclass);


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
-- Data for Name: astroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.astroid (name, diameter_in_km, contains_valuable_minerals, astroid_id) FROM stdin;
Ceres	939.40000	t	1
Vesta	525.40000	t	2
Pallas	512.00000	f	3
Hygiea	434.00000	f	4
Eros	16.80000	t	5
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, description, celestial_bodies, diameter_in_lightyears) FROM stdin;
1	Milky Way	Our home galaxy	1000000	1050.00000
2	Andromeda	Nearest large galaxy to the Milky Way	2000000	2200.00000
3	Triangulum	A member of the Local Group	500000	6000.00000
4	Sombrero	Unusual spiral galaxy	800000	5000.00000
5	Whirlpool	Known for its distinctive spiral arms	600000	6000.00000
6	Pinwheel	Face-on spiral galaxy with bright star-forming regions	700000	6100.00000
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, earth_mass, distance_to_planet_in_km, orbital_period_in_days, planet_id, name, contains_hydrogen) FROM stdin;
1	0.01230	384.40000	27.32166	1	Moon	t
2	0.00001	182.50000	0.31900	2	Phobos	f
3	0.00001	9377.00000	1.26300	2	Deimos	f
4	0.00048	421700.00000	16.68900	3	Io	t
5	0.00044	671034.00000	7.15400	3	Europa	t
6	0.00019	1070412.00000	16.68900	3	Ganymede	t
7	0.00015	1882700.00000	7.15400	3	Callisto	t
8	0.00007	382600.00000	3.55100	4	Titan	t
9	0.00003	356400.00000	1.76900	4	Rhea	f
10	0.00002	238000.00000	0.94200	4	Iapetus	f
11	0.00001	420000.00000	2.73700	5	Oberon	f
12	0.00003	583500.00000	8.70600	5	Titania	f
13	0.00001	590000.00000	13.46300	6	Triton	f
14	0.00001	120000.00000	0.69400	6	Nereid	f
15	0.00002	300000.00000	1.80000	7	Charon	f
16	0.00003	250000.00000	1.15000	7	Styx	f
17	0.00002	100000.00000	0.60000	8	Naiad	f
18	0.00001	150000.00000	0.80000	8	Thalassa	f
19	0.00002	200000.00000	1.00000	9	Proteus	f
20	0.00003	175000.00000	1.20000	9	Larissa	f
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, moons_in_orbit, age, earth_mass, star_id, name, habitable) FROM stdin;
1	1	4500000000	1.00000	1	Earth	t
2	0	4600000000	0.81500	1	Venus	f
3	2	4300000000	0.10700	1	Mars	f
4	79	4600000000	317.80000	1	Jupiter	f
5	62	4600000000	95.16000	1	Saturn	f
6	27	4600000000	14.54000	1	Uranus	f
7	14	4600000000	17.15000	1	Neptune	f
8	0	5000000000	2.50000	2	Andromeda I	f
9	3	4500000000	0.90000	2	Andromeda II	t
10	0	4200000000	1.20000	3	Triangulum Alpha	f
11	5	4000000000	0.70000	4	Sombrero Prime	t
12	8	4800000000	1.10000	5	Whirlpool A	f
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, planets_in_system, age, solar_mass, galaxy_id, name) FROM stdin;
1	8	4600000000	0.99999	1	Sol
2	5	1000000000	0.65432	2	Alpha Centauri
3	12	3000000000	0.82345	3	Betelgeuse
4	1	2000000000	0.54321	4	Sirius
5	3	1500000000	0.87654	5	Vega
6	9	500000000	0.76543	6	Rigel
\.


--
-- Name: astroids_astroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astroids_astroid_id_seq', 5, true);


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
-- Name: astroid astroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroids_name_key UNIQUE (name);


--
-- Name: astroid astroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroids_pkey PRIMARY KEY (astroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

