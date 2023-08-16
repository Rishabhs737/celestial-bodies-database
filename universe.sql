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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    volume_in_no_of_suns integer,
    distance_in_light_years integer,
    is_spinning boolean,
    has_accretion_disk boolean,
    description text NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    black_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    size integer,
    black_hole_name character varying(255) NOT NULL,
    is_spherical boolean,
    luminosity integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_spherical boolean,
    has_life boolean,
    revolution_period_in_earth_years numeric(7,2),
    luminosity integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(255) NOT NULL,
    has_life boolean,
    primary_composition character varying(255),
    is_rocky boolean,
    gravity integer,
    revolution_period_in_earth_years numeric(7,2),
    luminosity integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(255) NOT NULL,
    type character varying(255),
    primary_composition character varying(255),
    age_in_millions numeric(7,2),
    total_life numeric(7,2),
    color character varying(255),
    distance_in_light_years integer,
    luminosity integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'M87', 6500000, 53000000, true, true, 'Supermassive black hole at the center of the Virgo A galaxy');
INSERT INTO public.black_hole VALUES (2, 'CygnusX1', 5000, 6000, true, true, 'A famous stellar mass black hole in the Cygnus constellation');
INSERT INTO public.black_hole VALUES (3, 'SagitA*', 4100000, 26000, false, true, 'Black hole at the center of the Milky Way');
INSERT INTO public.black_hole VALUES (4, 'V404Cyg', 15, 7800, true, false, 'A black hole in our Milky Way located in the Cygnus constellation');
INSERT INTO public.black_hole VALUES (5, 'XTEJ1650-500', 1000, 11000, true, true, 'Black hole discovered in 2001 in the Ara constellation');
INSERT INTO public.black_hole VALUES (6, 'GROJ1655-40', 7000, 11000, true, true, 'Black hole discovered in the Scorpius constellation');
INSERT INTO public.black_hole VALUES (7, 'GX339-4', 2500, 20000, true, false, 'Black hole in the Vela constellation');
INSERT INTO public.black_hole VALUES (8, 'H1743-322', 500, 28000, true, true, 'Black hole in the Scorpius constellation');
INSERT INTO public.black_hole VALUES (9, '4U1543-47', 850, 24000, false, true, 'Black hole located in the Ara constellation');
INSERT INTO public.black_hole VALUES (10, 'XTEJ1118+480', 600, 6200, true, false, 'Black hole in the Ursa Major constellation');
INSERT INTO public.black_hole VALUES (11, '4U1630-47', 1000, 15000, true, true, 'Black hole in the Ara constellation');
INSERT INTO public.black_hole VALUES (12, 'MAXIJ1820+070', 1000, 10000, true, true, 'Newly discovered black hole');
INSERT INTO public.black_hole VALUES (13, 'SwiftJ1753.5-0127', 1500, 13000, false, true, 'Black hole in the Ophiuchus constellation');
INSERT INTO public.black_hole VALUES (14, 'A0620-00', 600, 3300, true, false, 'Black hole in the Monoceros constellation');
INSERT INTO public.black_hole VALUES (15, 'GS2000+25', 700, 17000, true, true, 'Black hole in the Vulpecula constellation');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 3, 'MilkyWay Spiral', 'Barred Spiral', 100000, 'SagitA*', true, 1000, 'Our own galaxy containing the black hole SagitA*');
INSERT INTO public.galaxy VALUES (2, 1, 'VirgoA Realm', 'Elliptical', 200000, 'M87', false, 2000, 'Galaxy containing the supermassive black hole M87');
INSERT INTO public.galaxy VALUES (3, 2, 'Cygnus Constellation', 'Spiral', 90000, 'CygnusX1', false, 1100, 'A galaxy in the Cygnus constellation housing CygnusX1');
INSERT INTO public.galaxy VALUES (4, 4, 'Ara Abyss', 'Barred Spiral', 85000, 'V404Cyg', true, 1200, 'Galaxy in the Ara constellation containing V404Cyg');
INSERT INTO public.galaxy VALUES (5, 6, 'Scorpius Starburst', 'Irregular', 75000, 'GROJ1655-40', false, 900, 'Irregular galaxy in the Scorpius constellation');
INSERT INTO public.galaxy VALUES (6, 7, 'Vela Velocity', 'Spiral', 70000, 'GX339-4', true, 800, 'Spiral galaxy in the Vela constellation');
INSERT INTO public.galaxy VALUES (7, 10, 'Ursa Major Marvel', 'Elliptical', 95000, 'XTEJ1118+480', false, 1300, 'Elliptical galaxy in the Ursa Major constellation');
INSERT INTO public.galaxy VALUES (8, 13, 'Ophiuchus Orb', 'Barred Spiral', 88000, 'SwiftJ1753.5-0127', true, 1050, 'Galaxy in the Ophiuchus constellation');
INSERT INTO public.galaxy VALUES (9, 14, 'Monoceros Mystery', 'Spiral', 91000, 'A0620-00', false, 1150, 'Galaxy in the Monoceros constellation');
INSERT INTO public.galaxy VALUES (10, 15, 'Vulpecula Voyage', 'Irregular', 68000, 'GS2000+25', true, 750, 'Galaxy in the Vulpecula constellation containing GS2000+25');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', true, false, 0.07, 0, 'Our own Moon, orbiting Earth');
INSERT INTO public.moon VALUES (2, 1, 'NeoLuna', false, false, 0.12, 0, 'A fictional second moon for Earth');
INSERT INTO public.moon VALUES (3, 2, 'Phobos', true, false, 0.00, 0, 'A moon of Mars');
INSERT INTO public.moon VALUES (4, 2, 'Deimos', true, false, 0.00, 0, 'Another moon of Mars');
INSERT INTO public.moon VALUES (5, 3, 'VirgoA Moon1', false, false, 0.50, 0, 'A moon of VirgoPrime');
INSERT INTO public.moon VALUES (6, 3, 'VirgoA Moon2', true, false, 0.40, 0, 'Another moon of VirgoPrime');
INSERT INTO public.moon VALUES (7, 4, 'VirgoSec Alpha', true, false, 0.30, 0, 'A moon of VirgoSec');
INSERT INTO public.moon VALUES (8, 4, 'VirgoSec Beta', false, false, 0.25, 0, 'Another moon of VirgoSec');
INSERT INTO public.moon VALUES (9, 5, 'CygnusTerra Moon1', true, false, 0.40, 0, 'A moon of Cygnus Terra');
INSERT INTO public.moon VALUES (10, 5, 'CygnusTerra Moon2', true, false, 0.38, 0, 'Another moon of Cygnus Terra');
INSERT INTO public.moon VALUES (11, 6, 'AraDesert Moon', false, false, 0.15, 0, 'A moon of AraDesert');
INSERT INTO public.moon VALUES (12, 6, 'AraDune', true, false, 0.20, 0, 'Another moon of AraDesert');
INSERT INTO public.moon VALUES (13, 7, 'ScorpioAqua', true, true, 0.50, 0, 'A moon with vast oceans orbiting ScorpioWater');
INSERT INTO public.moon VALUES (14, 7, 'ScorpioIce Moon', false, false, 0.35, 0, 'An icy moon of ScorpioWater');
INSERT INTO public.moon VALUES (15, 8, 'FrozenScorpio', false, false, 0.22, 0, 'A frozen moon of ScorpioIce');
INSERT INTO public.moon VALUES (16, 8, 'ScorpioCrystal', true, false, 0.28, 0, 'A crystal-like moon of ScorpioIce');
INSERT INTO public.moon VALUES (17, 9, 'LavaMoon', true, false, 0.10, 0, 'Molten moon of VelaFire');
INSERT INTO public.moon VALUES (18, 9, 'Vela Stone', false, false, 0.15, 0, 'Rocky moon of VelaFire');
INSERT INTO public.moon VALUES (19, 10, 'Ursa Minor', true, false, 0.60, 0, 'Large moon of UrsaMega');
INSERT INTO public.moon VALUES (20, 10, 'Ursa Tiny', false, false, 0.20, 0, 'Smaller moon of UrsaMega');
INSERT INTO public.moon VALUES (21, 11, 'Green Moon', true, true, 0.40, 0, 'Moon with plant life orbiting OphiuchusGreen');
INSERT INTO public.moon VALUES (22, 11, 'Barren Ophiuchus', false, false, 0.30, 0, 'Lifeless moon of OphiuchusGreen');
INSERT INTO public.moon VALUES (23, 12, 'NitroMoon', true, false, 0.50, 0, 'Moon with nitrogen ice, orbiting MonocerosVoid');
INSERT INTO public.moon VALUES (24, 12, 'Mono Dark', false, false, 0.35, 0, 'Dark moon of MonocerosVoid');
INSERT INTO public.moon VALUES (25, 13, 'Rocky Vulpe', true, false, 0.30, 0, 'A rocky moon of VulpeculaStone');
INSERT INTO public.moon VALUES (26, 13, 'Vulpe Dust', false, false, 0.25, 0, 'Dusty moon of VulpeculaStone');
INSERT INTO public.moon VALUES (27, 14, 'Virgo IronMoon', false, false, 0.20, 0, 'Moon rich in iron, orbiting VirgoTiny');
INSERT INTO public.moon VALUES (28, 14, 'Virgo Silica', true, false, 0.22, 0, 'Silicate moon of VirgoTiny');
INSERT INTO public.moon VALUES (29, 15, 'GasMoon', false, false, 0.45, 0, 'Moon with gaseous atmosphere, orbiting CygnusCloud');
INSERT INTO public.moon VALUES (30, 15, 'Cygnus Small', true, false, 0.28, 0, 'Smaller moon of CygnusCloud');
INSERT INTO public.moon VALUES (31, 16, 'Ara Lagoon', true, true, 0.35, 0, 'Moon with lakes, orbiting AraOcean');
INSERT INTO public.moon VALUES (32, 16, 'Ara Rock', false, false, 0.30, 0, 'Rocky moon of AraOcean');
INSERT INTO public.moon VALUES (33, 17, 'ScorpioHill', true, false, 0.25, 0, 'Mountainous moon of ScorpioRock');
INSERT INTO public.moon VALUES (34, 17, 'Scorpio Valley', false, false, 0.20, 0, 'Moon with deep valleys, orbiting ScorpioRock');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', true, 'Silicate and Metal', true, 10, 1.00, 1, 'Our home planet orbiting Sol');
INSERT INTO public.planet VALUES (2, 1, 'Mars', false, 'Silicate and Iron', true, 4, 1.88, 0, 'The red planet');
INSERT INTO public.planet VALUES (3, 2, 'VirgoPrime', false, 'Gas', false, 25, 0.70, 5, 'Gas giant orbiting VirgoStar A');
INSERT INTO public.planet VALUES (4, 2, 'VirgoSec', false, 'Ice and Rock', true, 8, 4.30, 0, 'Icy world in VirgoA Realm');
INSERT INTO public.planet VALUES (5, 3, 'Cygnus Terra', false, 'Silicate', true, 11, 0.90, 2, 'Rocky planet near CygnusAlpha');
INSERT INTO public.planet VALUES (6, 4, 'AraDesert', false, 'Silicate', true, 6, 2.00, 0, 'A dry world in Ara Abyss');
INSERT INTO public.planet VALUES (7, 5, 'ScorpioWater', true, 'Water', false, 9, 1.50, 1, 'A water world in Scorpius Starburst');
INSERT INTO public.planet VALUES (8, 5, 'ScorpioIce', false, 'Ice', true, 3, 100.00, 0, 'Frozen world far from ScorpiusBeta');
INSERT INTO public.planet VALUES (9, 6, 'VelaFire', false, 'Magma', true, 12, 0.30, 3, 'Lava world orbiting close to VelaDelta');
INSERT INTO public.planet VALUES (10, 7, 'UrsaMega', false, 'Gas and Helium', false, 30, 0.60, 6, 'Gas giant in Ursa Major Marvel');
INSERT INTO public.planet VALUES (11, 8, 'OphiuchusGreen', true, 'Silicate and Organic', true, 10, 1.10, 1, 'Lush planet in Ophiuchus Orb');
INSERT INTO public.planet VALUES (12, 9, 'MonocerosVoid', false, 'Gas and Nitrogen', false, 20, 0.50, 4, 'Gas planet with thick nitrogen clouds');
INSERT INTO public.planet VALUES (13, 10, 'VulpeculaStone', false, 'Silicate', true, 7, 1.80, 0, 'Rocky planet in Vulpecula Voyage');
INSERT INTO public.planet VALUES (14, 11, 'VirgoTiny', false, 'Iron', true, 5, 2.50, 0, 'Small iron-rich planet in VirgoA Realm');
INSERT INTO public.planet VALUES (15, 12, 'CygnusCloud', false, 'Gas', false, 28, 0.40, 6, 'A gas giant with colorful bands');
INSERT INTO public.planet VALUES (16, 13, 'AraOcean', true, 'Water', false, 8, 1.70, 1, 'Oceanic world in Ara Abyss');
INSERT INTO public.planet VALUES (17, 14, 'ScorpioRock', false, 'Silicate and Metal', true, 9, 2.20, 0, 'A rocky world with towering mountains');
INSERT INTO public.planet VALUES (18, 15, 'VelaWind', false, 'Gas and Helium', false, 22, 0.45, 5, 'A stormy gas giant in Vela Velocity');
INSERT INTO public.planet VALUES (19, 2, 'VirgoDust', false, 'Silicate', true, 7, 3.00, 0, 'Dusty desert planet in VirgoA Realm');
INSERT INTO public.planet VALUES (20, 1, 'Venus', false, 'Silicate and Carbon dioxide', true, 9, 0.62, 1, 'Second planet from Sol, thick CO2 atmosphere');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'G-type', 'Hydrogen', 4600.00, 10000.00, 'Yellow', 0, 1, 'Our sun located in the MilkyWay Spiral');
INSERT INTO public.star VALUES (2, 2, 'VirgoStar A', 'B-type', 'Helium', 320.00, 6800.00, 'Blue', 53, 50, 'Brightest star in the VirgoA Realm');
INSERT INTO public.star VALUES (3, 3, 'CygnusAlpha', 'O-type', 'Hydrogen', 15.00, 2000.00, 'Blue', 1400, 150, 'Hottest star in the Cygnus Constellation');
INSERT INTO public.star VALUES (4, 4, 'AraOmega', 'K-type', 'Hydrogen', 5000.00, 9000.00, 'Orange', 72, 8, 'A cooler star in the Ara Abyss');
INSERT INTO public.star VALUES (5, 5, 'ScorpiusBeta', 'M-type', 'Helium', 11000.00, 13000.00, 'Red', 100, 1, 'Red giant in the Scorpius Starburst');
INSERT INTO public.star VALUES (6, 6, 'VelaDelta', 'A-type', 'Hydrogen', 600.00, 5000.00, 'White', 250, 20, 'Bright star in the Vela Velocity');
INSERT INTO public.star VALUES (7, 7, 'UrsaPrime', 'F-type', 'Hydrogen', 4000.00, 7500.00, 'Yellow-White', 40, 10, 'A star in the Ursa Major Marvel');
INSERT INTO public.star VALUES (8, 8, 'OphiuchusSigma', 'G-type', 'Helium', 5500.00, 9800.00, 'Yellow', 85, 5, 'Main sequence star in the Ophiuchus Orb');
INSERT INTO public.star VALUES (9, 9, 'MonocerosTheta', 'B-type', 'Hydrogen', 320.00, 6400.00, 'Blue', 105, 45, 'Bright blue star in the Monoceros Mystery');
INSERT INTO public.star VALUES (10, 10, 'VulpeculaEpsilon', 'M-type', 'Helium', 12000.00, 14000.00, 'Red', 130, 0, 'Red dwarf star in the Vulpecula Voyage');
INSERT INTO public.star VALUES (11, 2, 'VirgoStar B', 'G-type', 'Hydrogen', 4800.00, 9800.00, 'Yellow', 52, 1, 'Second brightest star in the VirgoA Realm');
INSERT INTO public.star VALUES (12, 3, 'CygnusBeta', 'K-type', 'Helium', 5300.00, 8900.00, 'Orange', 1450, 8, 'Star located close to CygnusAlpha');
INSERT INTO public.star VALUES (13, 4, 'AraBeta', 'F-type', 'Hydrogen', 4300.00, 7800.00, 'Yellow-White', 70, 10, 'Another star in the Ara Abyss');
INSERT INTO public.star VALUES (14, 5, 'ScorpiusGamma', 'A-type', 'Helium', 420.00, 5300.00, 'White', 110, 21, 'White star in Scorpius Starburst');
INSERT INTO public.star VALUES (15, 6, 'VelaGamma', 'O-type', 'Hydrogen', 20.00, 1900.00, 'Blue', 2600, 160, 'A massive star in the Vela Velocity');


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_black_hole_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_black_hole_id_key UNIQUE (black_hole_id);


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
-- Name: galaxy galaxy_black_hole_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_black_hole_id_fkey FOREIGN KEY (black_hole_id) REFERENCES public.black_hole(black_hole_id);


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

