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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_number_of_stars integer,
    distance_from_earth numeric,
    type character varying(20)
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
    name character varying(30) NOT NULL,
    has_life boolean,
    planet_id integer,
    distance_from_earth numeric
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
    name character varying(30) NOT NULL,
    has_number_of_moons integer,
    has_life boolean,
    galaxy_id integer,
    size_ratio_to_biggest_moon numeric,
    story text,
    star_id integer
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
-- Name: space_ship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_ship (
    space_ship_id integer NOT NULL,
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.space_ship OWNER TO freecodecamp;

--
-- Name: space_ship_space_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_ship_space_ship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_ship_space_ship_id_seq OWNER TO freecodecamp;

--
-- Name: space_ship_space_ship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_ship_space_ship_id_seq OWNED BY public.space_ship.space_ship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_number_of_planets integer,
    galaxy_id integer,
    distance_from_earth numeric,
    type character varying(20)
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
-- Name: space_ship space_ship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship ALTER COLUMN space_ship_id SET DEFAULT nextval('public.space_ship_space_ship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 200, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 150, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 100, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 200, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 180, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 170, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (73, 'Luna', false, 15, NULL);
INSERT INTO public.moon VALUES (74, 'Phobos', false, 2, NULL);
INSERT INTO public.moon VALUES (75, 'Deimos', false, 2, NULL);
INSERT INTO public.moon VALUES (76, 'Ganymede', false, 3, NULL);
INSERT INTO public.moon VALUES (77, 'Europa', false, 3, NULL);
INSERT INTO public.moon VALUES (78, 'Callisto', false, 3, NULL);
INSERT INTO public.moon VALUES (79, 'Io', false, 3, NULL);
INSERT INTO public.moon VALUES (80, 'Titan', false, 4, NULL);
INSERT INTO public.moon VALUES (81, 'Enceladus', false, 4, NULL);
INSERT INTO public.moon VALUES (82, 'Triton', false, 5, NULL);
INSERT INTO public.moon VALUES (83, 'Charon', false, 6, NULL);
INSERT INTO public.moon VALUES (84, 'Phobos II', false, 7, NULL);
INSERT INTO public.moon VALUES (85, 'Endor', true, 8, NULL);
INSERT INTO public.moon VALUES (86, 'Luna II', false, 19, NULL);
INSERT INTO public.moon VALUES (87, 'Tethys', false, 4, NULL);
INSERT INTO public.moon VALUES (88, 'Dione', false, 4, NULL);
INSERT INTO public.moon VALUES (89, 'Rhea', false, 4, NULL);
INSERT INTO public.moon VALUES (90, 'Iapetus', false, 4, NULL);
INSERT INTO public.moon VALUES (91, 'Titania', false, 18, NULL);
INSERT INTO public.moon VALUES (92, 'Mondas', true, 16, NULL);
INSERT INTO public.moon VALUES (93, 'Telos', true, 15, NULL);
INSERT INTO public.moon VALUES (94, 'Skaro II', true, 29, NULL);
INSERT INTO public.moon VALUES (95, 'Gallifrey II', true, 19, NULL);
INSERT INTO public.moon VALUES (96, 'Clom', true, 15, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 1, true, 1, 0.5, 'Home to humans', 1);
INSERT INTO public.planet VALUES (3, 'Mars', 2, false, 1, 0.3, 'Potential colonization target', 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 79, false, 1, 92.2, 'Gas giant with many moons', 1);
INSERT INTO public.planet VALUES (5, 'Venus', 0, false, 1, 0.1, 'A hot and inhospitable planet with a thick atmosphere', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 82, false, 1, 2.5, 'Known for its iconic rings and numerous moons', 1);
INSERT INTO public.planet VALUES (7, 'Kepler-186f', 0, true, 2, 0.6, 'The first Earth-size planet discovered in the potentially habitable zone of another star', 5);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, false, 1, 1.8, 'The eighth and farthest known planet from the Sun in the Solar System', 1);
INSERT INTO public.planet VALUES (15, 'Mercury', 0, false, 1, 0.05, 'The closest planet to the Sun in the Solar System', 1);
INSERT INTO public.planet VALUES (16, 'Uranus', 27, false, 1, 1.6, 'The seventh planet from the Sun, known for its unique rotation', 1);
INSERT INTO public.planet VALUES (17, 'Pluto', 5, false, 1, 0.4, 'A dwarf planet in the Kuiper belt, formerly considered the ninth planet', 1);
INSERT INTO public.planet VALUES (18, 'Krypton', 2, false, 4, 1.1, 'Homeworld of Superman, located in a distant galaxy', 6);
INSERT INTO public.planet VALUES (19, 'Alderaan', 1, false, 3, 0.8, 'Destroyed by the Death Star in Star Wars Episode IV: A New Hope', 6);
INSERT INTO public.planet VALUES (28, 'Gallifrey', 0, true, 5, 0.4, 'Home planet of the Time Lords in Doctor Who', 5);
INSERT INTO public.planet VALUES (29, 'Skaro', 2, true, 5, 0.8, 'Homeworld of the Daleks, known for its devastated landscape', 5);
INSERT INTO public.planet VALUES (30, 'Karn', 1, true, 5, 0.6, 'Home of the Sisterhood of Karn, known for its elixir of life', 5);
INSERT INTO public.planet VALUES (31, 'Mondas', 1, true, 5, 0.7, 'Homeworld of the Cybermen in Doctor Who', 5);
INSERT INTO public.planet VALUES (32, 'Trenzalore', 0, true, 5, 0.5, 'The planet where the Eleventh Doctor fought the Silence and met his end', 5);
INSERT INTO public.planet VALUES (33, 'Gallifrey II', 0, false, 5, 0.4, 'A reconstructed version of Gallifrey after the Time War', 5);
INSERT INTO public.planet VALUES (34, 'Telos', 2, true, 5, 0.8, 'Home of the Cybermen, known for its frozen tombs', 5);
INSERT INTO public.planet VALUES (35, 'Meteos', 1, false, 5, 0.6, 'A planet devastated by the Time War, featured in the episode "The Day of the Doctor"', 5);


--
-- Data for Name: space_ship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_ship VALUES (9, 2, 2, 'Explorer I');
INSERT INTO public.space_ship VALUES (10, 2, 3, 'Pathfinder');
INSERT INTO public.space_ship VALUES (11, 3, 5, 'Voyager');
INSERT INTO public.space_ship VALUES (12, 4, 4, 'Pioneer');
INSERT INTO public.space_ship VALUES (13, 5, 4, 'Odyssey');
INSERT INTO public.space_ship VALUES (14, 6, 6, 'Discovery');
INSERT INTO public.space_ship VALUES (15, 7, 1, 'Enterprise');
INSERT INTO public.space_ship VALUES (16, 8, 2, 'Endeavour');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'AlphaCentauri', 3, 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 0, 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 2, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Andromeda Alpha', 5, 2, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Andromeda Beta', 4, 2, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 96, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 35, true);


--
-- Name: space_ship_space_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_ship_space_ship_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_ship space_ship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_name_key UNIQUE (name);


--
-- Name: space_ship space_ship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_pkey PRIMARY KEY (space_ship_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


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
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


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
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_ship space_ship_current_location_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_current_location_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: space_ship space_ship_origin_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_origin_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

