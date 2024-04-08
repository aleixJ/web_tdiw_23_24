--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13 (Debian 13.13-0+deb11u1)
-- Dumped by pg_dump version 13.13 (Debian 13.13-0+deb11u1)

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
-- Name: categories; Type: TABLE; Schema: public; Owner: tdiw-g2
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    categoria character varying(1000) NOT NULL,
    foto character varying(1000) NOT NULL
);


ALTER TABLE public.categories OWNER TO "tdiw-g2";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: tdiw-g2
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO "tdiw-g2";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdiw-g2
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: comandes; Type: TABLE; Schema: public; Owner: tdiw-g2
--

CREATE TABLE public.comandes (
    id integer NOT NULL,
    id_u character varying(1000) NOT NULL,
    data_comanda timestamp with time zone DEFAULT now()
);


ALTER TABLE public.comandes OWNER TO "tdiw-g2";

--
-- Name: comandes_id_seq; Type: SEQUENCE; Schema: public; Owner: tdiw-g2
--

CREATE SEQUENCE public.comandes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comandes_id_seq OWNER TO "tdiw-g2";

--
-- Name: comandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdiw-g2
--

ALTER SEQUENCE public.comandes_id_seq OWNED BY public.comandes.id;


--
-- Name: fotos_model; Type: TABLE; Schema: public; Owner: tdiw-g2
--

CREATE TABLE public.fotos_model (
    id_m integer NOT NULL,
    url character varying(1000) NOT NULL
);


ALTER TABLE public.fotos_model OWNER TO "tdiw-g2";

--
-- Name: fotos_model_id_model_seq; Type: SEQUENCE; Schema: public; Owner: tdiw-g2
--

CREATE SEQUENCE public.fotos_model_id_model_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fotos_model_id_model_seq OWNER TO "tdiw-g2";

--
-- Name: fotos_model_id_model_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdiw-g2
--

ALTER SEQUENCE public.fotos_model_id_model_seq OWNED BY public.fotos_model.id_m;


--
-- Name: producte_model; Type: TABLE; Schema: public; Owner: tdiw-g2
--

CREATE TABLE public.producte_model (
    id integer NOT NULL,
    id_p integer NOT NULL,
    color character varying(1000) NOT NULL
);


ALTER TABLE public.producte_model OWNER TO "tdiw-g2";

--
-- Name: producte_model_id_p_seq; Type: SEQUENCE; Schema: public; Owner: tdiw-g2
--

CREATE SEQUENCE public.producte_model_id_p_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producte_model_id_p_seq OWNER TO "tdiw-g2";

--
-- Name: producte_model_id_p_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdiw-g2
--

ALTER SEQUENCE public.producte_model_id_p_seq OWNED BY public.producte_model.id_p;


--
-- Name: producte_model_id_seq; Type: SEQUENCE; Schema: public; Owner: tdiw-g2
--

CREATE SEQUENCE public.producte_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producte_model_id_seq OWNER TO "tdiw-g2";

--
-- Name: producte_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdiw-g2
--

ALTER SEQUENCE public.producte_model_id_seq OWNED BY public.producte_model.id;


--
-- Name: productes; Type: TABLE; Schema: public; Owner: tdiw-g2
--

CREATE TABLE public.productes (
    id integer NOT NULL,
    nom character varying(1000) NOT NULL,
    marca character varying(1000) NOT NULL,
    categoria character varying(10) NOT NULL,
    preu numeric NOT NULL,
    descripcio character varying(1000),
    tipo character varying(1000),
    foto character varying(1000) NOT NULL
);


ALTER TABLE public.productes OWNER TO "tdiw-g2";

--
-- Name: productes_comandes; Type: TABLE; Schema: public; Owner: tdiw-g2
--

CREATE TABLE public.productes_comandes (
    id integer NOT NULL,
    id_t integer NOT NULL,
    id_c integer NOT NULL,
    unitats integer NOT NULL
);


ALTER TABLE public.productes_comandes OWNER TO "tdiw-g2";

--
-- Name: productes_comandes_id_seq; Type: SEQUENCE; Schema: public; Owner: tdiw-g2
--

CREATE SEQUENCE public.productes_comandes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productes_comandes_id_seq OWNER TO "tdiw-g2";

--
-- Name: productes_comandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdiw-g2
--

ALTER SEQUENCE public.productes_comandes_id_seq OWNED BY public.productes_comandes.id;


--
-- Name: productes_id_seq; Type: SEQUENCE; Schema: public; Owner: tdiw-g2
--

CREATE SEQUENCE public.productes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productes_id_seq OWNER TO "tdiw-g2";

--
-- Name: productes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdiw-g2
--

ALTER SEQUENCE public.productes_id_seq OWNED BY public.productes.id;


--
-- Name: talles_model; Type: TABLE; Schema: public; Owner: tdiw-g2
--

CREATE TABLE public.talles_model (
    id integer NOT NULL,
    id_m integer NOT NULL,
    talla numeric NOT NULL,
    existencies integer NOT NULL
);


ALTER TABLE public.talles_model OWNER TO "tdiw-g2";

--
-- Name: talles_model_id_m_seq; Type: SEQUENCE; Schema: public; Owner: tdiw-g2
--

CREATE SEQUENCE public.talles_model_id_m_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.talles_model_id_m_seq OWNER TO "tdiw-g2";

--
-- Name: talles_model_id_m_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdiw-g2
--

ALTER SEQUENCE public.talles_model_id_m_seq OWNED BY public.talles_model.id_m;


--
-- Name: talles_model_id_seq; Type: SEQUENCE; Schema: public; Owner: tdiw-g2
--

CREATE SEQUENCE public.talles_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.talles_model_id_seq OWNER TO "tdiw-g2";

--
-- Name: talles_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdiw-g2
--

ALTER SEQUENCE public.talles_model_id_seq OWNED BY public.talles_model.id;


--
-- Name: usuari; Type: TABLE; Schema: public; Owner: tdiw-g2
--

CREATE TABLE public.usuari (
    nom character varying(1000) NOT NULL,
    email character varying(1000) NOT NULL,
    contrasenya character varying(1000) NOT NULL,
    adreca character varying(1000),
    poblacio character varying(1000),
    cp character varying(5),
    temps_creacio timestamp with time zone DEFAULT now(),
    foto character varying(1000) DEFAULT '/img/usuario_default.png'::character varying,
    data_modificacio timestamp with time zone DEFAULT now()
);


ALTER TABLE public.usuari OWNER TO "tdiw-g2";

--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: comandes id; Type: DEFAULT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.comandes ALTER COLUMN id SET DEFAULT nextval('public.comandes_id_seq'::regclass);


--
-- Name: producte_model id; Type: DEFAULT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.producte_model ALTER COLUMN id SET DEFAULT nextval('public.producte_model_id_seq'::regclass);


--
-- Name: productes id; Type: DEFAULT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.productes ALTER COLUMN id SET DEFAULT nextval('public.productes_id_seq'::regclass);


--
-- Name: productes_comandes id; Type: DEFAULT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.productes_comandes ALTER COLUMN id SET DEFAULT nextval('public.productes_comandes_id_seq'::regclass);


--
-- Name: talles_model id; Type: DEFAULT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.talles_model ALTER COLUMN id SET DEFAULT nextval('public.talles_model_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: tdiw-g2
--

INSERT INTO public.categories VALUES (1, 'home', '/img/hombre.jpg');
INSERT INTO public.categories VALUES (2, 'dona', '/img/mujer.jpg');
INSERT INTO public.categories VALUES (3, 'nens', '/img/nens.jpg');


--
-- Data for Name: comandes; Type: TABLE DATA; Schema: public; Owner: tdiw-g2
--



--
-- Data for Name: fotos_model; Type: TABLE DATA; Schema: public; Owner: tdiw-g2
--

INSERT INTO public.fotos_model VALUES (1, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-WHITE-00.webp');
INSERT INTO public.fotos_model VALUES (1, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-WHITE-01.webp');
INSERT INTO public.fotos_model VALUES (1, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-WHITE-02.webp');
INSERT INTO public.fotos_model VALUES (1, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-WHITE-03.webp');
INSERT INTO public.fotos_model VALUES (2, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-BLACK-00.webp');
INSERT INTO public.fotos_model VALUES (2, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-BLACK-01.webp');
INSERT INTO public.fotos_model VALUES (2, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-BLACK-02.webp');
INSERT INTO public.fotos_model VALUES (2, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-BLACK-03.webp');
INSERT INTO public.fotos_model VALUES (3, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-BLUE-00.webp');
INSERT INTO public.fotos_model VALUES (3, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-BLUE-01.webp');
INSERT INTO public.fotos_model VALUES (3, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-BLUE-02.webp');
INSERT INTO public.fotos_model VALUES (3, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-BLUE-03.webp');
INSERT INTO public.fotos_model VALUES (4, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-RED-00.webp');
INSERT INTO public.fotos_model VALUES (4, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-RED-01.webp');
INSERT INTO public.fotos_model VALUES (4, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-RED-02.webp');
INSERT INTO public.fotos_model VALUES (4, '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-RED-03.webp');
INSERT INTO public.fotos_model VALUES (5, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-WHITE-00.webp');
INSERT INTO public.fotos_model VALUES (5, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-WHITE-01.webp');
INSERT INTO public.fotos_model VALUES (5, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-WHITE-02.webp');
INSERT INTO public.fotos_model VALUES (5, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-WHITE-03.webp');
INSERT INTO public.fotos_model VALUES (6, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-BLACK-00.webp');
INSERT INTO public.fotos_model VALUES (6, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-BLACK-01.webp');
INSERT INTO public.fotos_model VALUES (6, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-BLACK-02.webp');
INSERT INTO public.fotos_model VALUES (6, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-BLACK-03.webp');
INSERT INTO public.fotos_model VALUES (7, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-RED-00.webp');
INSERT INTO public.fotos_model VALUES (7, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-RED-01.webp');
INSERT INTO public.fotos_model VALUES (7, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-RED-02.webp');
INSERT INTO public.fotos_model VALUES (7, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-RED-03.webp');
INSERT INTO public.fotos_model VALUES (8, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-GREEN-00.webp');
INSERT INTO public.fotos_model VALUES (8, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-GREEN-01.webp');
INSERT INTO public.fotos_model VALUES (8, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-GREEN-02.webp');
INSERT INTO public.fotos_model VALUES (8, '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-GREEN-03.webp');
INSERT INTO public.fotos_model VALUES (9, '/img/productes/home/EVA_RUNNER_LACEUP/EVA-RUNNER-LACEUP-WHITE-00.webp');
INSERT INTO public.fotos_model VALUES (9, '/img/productes/home/EVA_RUNNER_LACEUP/EVA-RUNNER-LACEUP-WHITE-01.webp');
INSERT INTO public.fotos_model VALUES (9, '/img/productes/home/EVA_RUNNER_LACEUP/EVA-RUNNER-LACEUP-WHITE-02.webp');
INSERT INTO public.fotos_model VALUES (9, '/img/productes/home/EVA_RUNNER_LACEUP/EVA-RUNNER-LACEUP-WHITE-03.webp');
INSERT INTO public.fotos_model VALUES (10, '/img/productes/home/EVA_RUNNER_LACEUP/EVA-RUNNER-LACEUP-BLACK-00.webp');
INSERT INTO public.fotos_model VALUES (10, '/img/productes/home/EVA_RUNNER_LACEUP/EVA-RUNNER-LACEUP-BLACK-01.webp');
INSERT INTO public.fotos_model VALUES (10, '/img/productes/home/EVA_RUNNER_LACEUP/EVA-RUNNER-LACEUP-BLACK-02.webp');
INSERT INTO public.fotos_model VALUES (10, '/img/productes/home/EVA_RUNNER_LACEUP/EVA-RUNNER-LACEUP-BLACK-03.webp');
INSERT INTO public.fotos_model VALUES (11, '/img/productes/dona/CAVEN_2.0/CAVEN-2.0-WHITE-00.webp');
INSERT INTO public.fotos_model VALUES (11, '/img/productes/dona/CAVEN_2.0/CAVEN-2.0-WHITE-01.webp');
INSERT INTO public.fotos_model VALUES (11, '/img/productes/dona/CAVEN_2.0/CAVEN-2.0-WHITE-02.webp');
INSERT INTO public.fotos_model VALUES (11, '/img/productes/dona/CAVEN_2.0/CAVEN-2.0-WHITE-03.webp');
INSERT INTO public.fotos_model VALUES (12, '/img/productes/dona/CAVEN_2.0/CAVEN-2.0-BLACK-00.webp');
INSERT INTO public.fotos_model VALUES (12, '/img/productes/dona/CAVEN_2.0/CAVEN-2.0-BLACK-01.webp');
INSERT INTO public.fotos_model VALUES (12, '/img/productes/dona/CAVEN_2.0/CAVEN-2.0-BLACK-02.webp');
INSERT INTO public.fotos_model VALUES (12, '/img/productes/dona/CAVEN_2.0/CAVEN-2.0-BLACK-03.webp');
INSERT INTO public.fotos_model VALUES (13, '/img/productes/dona/FORUM_BOLD/FORUM-BOLD-WHITE-00.webp');
INSERT INTO public.fotos_model VALUES (13, '/img/productes/dona/FORUM_BOLD/FORUM-BOLD-WHITE-01.webp');
INSERT INTO public.fotos_model VALUES (13, '/img/productes/dona/FORUM_BOLD/FORUM-BOLD-WHITE-02.webp');
INSERT INTO public.fotos_model VALUES (13, '/img/productes/dona/FORUM_BOLD/FORUM-BOLD-WHITE-03.webp');
INSERT INTO public.fotos_model VALUES (14, '/img/productes/dona/FORUM_BOLD/FORUM-BOLD-BLACK-00.webp');
INSERT INTO public.fotos_model VALUES (14, '/img/productes/dona/FORUM_BOLD/FORUM-BOLD-BLACK-01.webp');
INSERT INTO public.fotos_model VALUES (14, '/img/productes/dona/FORUM_BOLD/FORUM-BOLD-BLACK-02.webp');
INSERT INTO public.fotos_model VALUES (14, '/img/productes/dona/FORUM_BOLD/FORUM-BOLD-BLACK-03.webp');
INSERT INTO public.fotos_model VALUES (15, '/img/productes/dona/ZIANE_PLATFORM/ZIANE-PLATFORM-WHITE-00.webp');
INSERT INTO public.fotos_model VALUES (15, '/img/productes/dona/ZIANE_PLATFORM/ZIANE-PLATFORM-WHITE-01.webp');
INSERT INTO public.fotos_model VALUES (15, '/img/productes/dona/ZIANE_PLATFORM/ZIANE-PLATFORM-WHITE-02.webp');
INSERT INTO public.fotos_model VALUES (15, '/img/productes/dona/ZIANE_PLATFORM/ZIANE-PLATFORM-WHITE-03.webp');
INSERT INTO public.fotos_model VALUES (16, '/img/productes/dona/ZIANE_PLATFORM/ZIANE-PLATFORM-BLACK-00.webp');
INSERT INTO public.fotos_model VALUES (16, '/img/productes/dona/ZIANE_PLATFORM/ZIANE-PLATFORM-BLACK-01.webp');
INSERT INTO public.fotos_model VALUES (16, '/img/productes/dona/ZIANE_PLATFORM/ZIANE-PLATFORM-BLACK-02.webp');
INSERT INTO public.fotos_model VALUES (16, '/img/productes/dona/ZIANE_PLATFORM/ZIANE-PLATFORM-BLACK-03.webp');
INSERT INTO public.fotos_model VALUES (17, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-WHITE-00.webp');
INSERT INTO public.fotos_model VALUES (17, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-WHITE-01.webp');
INSERT INTO public.fotos_model VALUES (17, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-WHITE-02.webp');
INSERT INTO public.fotos_model VALUES (17, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-WHITE-03.webp');
INSERT INTO public.fotos_model VALUES (18, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-BLACK-00.webp');
INSERT INTO public.fotos_model VALUES (18, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-BLACK-01.webp');
INSERT INTO public.fotos_model VALUES (18, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-BLACK-02.webp');
INSERT INTO public.fotos_model VALUES (18, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-BLACK-03.webp');
INSERT INTO public.fotos_model VALUES (19, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-BLUE-00.webp');
INSERT INTO public.fotos_model VALUES (19, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-BLUE-01.webp');
INSERT INTO public.fotos_model VALUES (19, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-BLUE-02.webp');
INSERT INTO public.fotos_model VALUES (19, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-BLUE-03.webp');
INSERT INTO public.fotos_model VALUES (20, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-PINK-00.webp');
INSERT INTO public.fotos_model VALUES (20, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-PINK-01.webp');
INSERT INTO public.fotos_model VALUES (20, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-PINK-02.webp');
INSERT INTO public.fotos_model VALUES (20, '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-PINK-03.webp');
INSERT INTO public.fotos_model VALUES (21, '/img/productes/nens/FORUM/FORUM-WHITE-00.webp');
INSERT INTO public.fotos_model VALUES (21, '/img/productes/nens/FORUM/FORUM-WHITE-01.webp');
INSERT INTO public.fotos_model VALUES (21, '/img/productes/nens/FORUM/FORUM-WHITE-02.webp');
INSERT INTO public.fotos_model VALUES (21, '/img/productes/nens/FORUM/FORUM-WHITE-03.webp');
INSERT INTO public.fotos_model VALUES (22, '/img/productes/nens/FORUM/FORUM-BLUE-00.webp');
INSERT INTO public.fotos_model VALUES (22, '/img/productes/nens/FORUM/FORUM-BLUE-01.webp');
INSERT INTO public.fotos_model VALUES (22, '/img/productes/nens/FORUM/FORUM-BLUE-02.webp');
INSERT INTO public.fotos_model VALUES (22, '/img/productes/nens/FORUM/FORUM-BLUE-03.webp');
INSERT INTO public.fotos_model VALUES (23, '/img/productes/nens/FORUM/FORUM-PINK-00.webp');
INSERT INTO public.fotos_model VALUES (23, '/img/productes/nens/FORUM/FORUM-PINK-01.webp');
INSERT INTO public.fotos_model VALUES (23, '/img/productes/nens/FORUM/FORUM-PINK-02.webp');
INSERT INTO public.fotos_model VALUES (23, '/img/productes/nens/FORUM/FORUM-PINK-03.webp');
INSERT INTO public.fotos_model VALUES (24, '/img/productes/nens/NEW_UNION_K/NEW-UNION-K-WHITE-00.webp');
INSERT INTO public.fotos_model VALUES (24, '/img/productes/nens/NEW_UNION_K/NEW-UNION-K-WHITE-01.webp');
INSERT INTO public.fotos_model VALUES (24, '/img/productes/nens/NEW_UNION_K/NEW-UNION-K-WHITE-02.webp');
INSERT INTO public.fotos_model VALUES (24, '/img/productes/nens/NEW_UNION_K/NEW-UNION-K-WHITE-03.webp');
INSERT INTO public.fotos_model VALUES (25, '/img/productes/nens/NEW_UNION_K/NEW-UNION-K-BLACK-00.webp');
INSERT INTO public.fotos_model VALUES (25, '/img/productes/nens/NEW_UNION_K/NEW-UNION-K-BLACK-01.webp');
INSERT INTO public.fotos_model VALUES (25, '/img/productes/nens/NEW_UNION_K/NEW-UNION-K-BLACK-02.webp');
INSERT INTO public.fotos_model VALUES (25, '/img/productes/nens/NEW_UNION_K/NEW-UNION-K-BLACK-03.webp');


--
-- Data for Name: producte_model; Type: TABLE DATA; Schema: public; Owner: tdiw-g2
--

INSERT INTO public.producte_model VALUES (1, 1, 'BLANC');
INSERT INTO public.producte_model VALUES (2, 1, 'NEGRE');
INSERT INTO public.producte_model VALUES (3, 1, 'BLAU');
INSERT INTO public.producte_model VALUES (4, 1, 'VERMELL');
INSERT INTO public.producte_model VALUES (5, 2, 'BLANC');
INSERT INTO public.producte_model VALUES (6, 2, 'NEGRE');
INSERT INTO public.producte_model VALUES (7, 2, 'VERMELL');
INSERT INTO public.producte_model VALUES (8, 2, 'VERD');
INSERT INTO public.producte_model VALUES (9, 3, 'BLANC');
INSERT INTO public.producte_model VALUES (10, 3, 'NEGRE');
INSERT INTO public.producte_model VALUES (11, 4, 'BLANC');
INSERT INTO public.producte_model VALUES (12, 4, 'NEGRE');
INSERT INTO public.producte_model VALUES (13, 5, 'BLANC');
INSERT INTO public.producte_model VALUES (14, 5, 'NEGRE');
INSERT INTO public.producte_model VALUES (15, 6, 'BLANC');
INSERT INTO public.producte_model VALUES (16, 6, 'NEGRE');
INSERT INTO public.producte_model VALUES (17, 7, 'BLANC');
INSERT INTO public.producte_model VALUES (18, 7, 'NEGRE');
INSERT INTO public.producte_model VALUES (19, 7, 'BLAU');
INSERT INTO public.producte_model VALUES (20, 7, 'ROSA');
INSERT INTO public.producte_model VALUES (21, 8, 'BLANC');
INSERT INTO public.producte_model VALUES (22, 8, 'BLAU');
INSERT INTO public.producte_model VALUES (23, 8, 'ROSA');
INSERT INTO public.producte_model VALUES (24, 9, 'BLANC');
INSERT INTO public.producte_model VALUES (25, 9, 'NEGRE');


--
-- Data for Name: productes; Type: TABLE DATA; Schema: public; Owner: tdiw-g2
--

INSERT INTO public.productes VALUES (8, 'FORUM', 'ADIDAS', 'nens', 84.95, 'La sneaker FORUM de adidas es perfecte per els més petits de la casa.', 'sneaker', '/img/productes/nens/FORUM/FORUM-WHITE-00.webp');
INSERT INTO public.productes VALUES (1, 'AIR FORCE 1 ''07', 'NIKE', 'home', 120.99, 'Les Nike Air Force 1''07, un model original de bàsquet que introdueix un nou gir als seus ja característics revestiments amb costures duradores, els seus acabats impecables i la quantitat perfecta de reflector.', 'sneaker', '/img/productes/home/AIR_FORCE_1_07/AIR-FORCE-1-07-WHITE-00.webp');
INSERT INTO public.productes VALUES (3, 'EVA RUNNER LACEUP', 'CALVIN KLEIN', 'home', 89.95, 'Sabatilles esportives de la marca Calvin Klein amb un acabat amb tela.', 'sneaker', '/img/productes/home/EVA_RUNNER_LACEUP/EVA-RUNNER-LACEUP-WHITE-00.webp');
INSERT INTO public.productes VALUES (5, 'FORUM BOLD', 'ADIDAS', 'dona', 109.99, 'Dóna curs al teu estil amb aquesta sabatilla adidas Forum Bold Stripes. Aquesta versió de la Forum de 1984 conserva tots els detalls i materials del model original. Els trèvols de grans dimensions li aporten un toc divertit, mentre que l''aire exagerat de la sola de goma amb plataforma et permet destacar entre la multitud.', 'sneaker', 'img/productes/dona/FORUM_BOLD/FORUM-BOLD-WHITE-00.webp');
INSERT INTO public.productes VALUES (4, 'CAVEN 2.0', 'PUMA', 'dona', 70, 'Les Caven 2.0 són una versió subtil d''un model de bàsquet dels anys 80 que crea un clàssic fidel a l''original tant dins com fora de la pista. Aquestes sabatilles, que combinen l''escuma SoftFoam increïblement còmoda amb una moderna estètica retro, són l''essència de l''estil esportiu.', 'sneaker', '/img/productes/dona/CAVEN_2.0/CAVEN-2.0-WHITE-00.webp');
INSERT INTO public.productes VALUES (2, 'AIR JORDAN 1', 'JORDAN', 'home', 129.99, 'Gaudeix d''un look amb estil i sempre a la moda. Les Air Jordan 1 Low us ofereixen una part de la història i el llegat Jordan amb una comoditat que dura tot el dia. Trieu els colors i surt al carrer amb l''icònic perfil dissenyat amb una combinació de materials d''alta qualitat i una unitat Air encapsulada al taló.', 'sneaker', '/img/productes/home/AIR_JORDAN_1/AIR-JORDAN-1-WHITE-00.webp');
INSERT INTO public.productes VALUES (7, 'COURT BOROUGH RECRAFT', 'NIKE', 'nens', 59.99, 'Feta per durar, aquesta llegenda redissenyada utilitza una combinació de materials reciclats a la part superior i la sola exterior per aconseguir un look clàssic renovat. La puntera i el migpeu redissenyats ofereixen espai addicional als peus per córrer, saltar i jugar més temps.', 'sneaker', '/img/productes/nens/COURT_BOROUGH_RECRAFT/COURT-BOROUGH-RECRAFT-WHITE-00.webp');
INSERT INTO public.productes VALUES (6, 'ZIANE PLATFORM', 'LACOSTE', 'dona', 109.99, 'Esportiu de la marca Lacoste en color blanc. Tall de pell i sintètic. Folre tèxtil. Tancament de cordons gruixuts. Sola vulcanitzada amb goma amb plataforma de 3 cm', 'sneaker', '/img/productes/dona/ZIANE_PLATFORM/ZIANE-PLATFORM-WHITE-00.webp');
INSERT INTO public.productes VALUES (9, 'NEW UNION K', 'LEVI''S', 'nens', 50, 'Les NEW UNION K de LEVIS són unes sneakers fetes de pòliester i tela.', 'sneaker', '/img/productes/nens/NEW_UNION_K/NEW-UNION-K-WHITE-00.webp');


--
-- Data for Name: productes_comandes; Type: TABLE DATA; Schema: public; Owner: tdiw-g2
--



--
-- Data for Name: talles_model; Type: TABLE DATA; Schema: public; Owner: tdiw-g2
--

INSERT INTO public.talles_model VALUES (1, 1, 39, 12);
INSERT INTO public.talles_model VALUES (2, 1, 42, 0);
INSERT INTO public.talles_model VALUES (3, 1, 44, 10);
INSERT INTO public.talles_model VALUES (4, 1, 46, 6);
INSERT INTO public.talles_model VALUES (5, 2, 39, 20);
INSERT INTO public.talles_model VALUES (6, 2, 41, 0);
INSERT INTO public.talles_model VALUES (7, 2, 44, 10);
INSERT INTO public.talles_model VALUES (9, 3, 44, 6);
INSERT INTO public.talles_model VALUES (11, 4, 42, 10);
INSERT INTO public.talles_model VALUES (14, 5, 44, 12);
INSERT INTO public.talles_model VALUES (16, 6, 41, 26);
INSERT INTO public.talles_model VALUES (17, 6, 45, 16);
INSERT INTO public.talles_model VALUES (18, 7, 39, 6);
INSERT INTO public.talles_model VALUES (19, 7, 43, 17);
INSERT INTO public.talles_model VALUES (20, 7, 45, 14);
INSERT INTO public.talles_model VALUES (23, 8, 42, 12);
INSERT INTO public.talles_model VALUES (24, 8, 45, 22);
INSERT INTO public.talles_model VALUES (27, 9, 38, 10);
INSERT INTO public.talles_model VALUES (28, 9, 42, 12);
INSERT INTO public.talles_model VALUES (29, 9, 44, 21);
INSERT INTO public.talles_model VALUES (30, 10, 42, 12);
INSERT INTO public.talles_model VALUES (31, 10, 46, 9);
INSERT INTO public.talles_model VALUES (35, 12, 37, 10);
INSERT INTO public.talles_model VALUES (36, 12, 38, 17);
INSERT INTO public.talles_model VALUES (37, 13, 34, 8);
INSERT INTO public.talles_model VALUES (38, 13, 39, 21);
INSERT INTO public.talles_model VALUES (39, 14, 37, 15);
INSERT INTO public.talles_model VALUES (40, 14, 38, 18);
INSERT INTO public.talles_model VALUES (42, 15, 38, 18);
INSERT INTO public.talles_model VALUES (43, 15, 39, 12);
INSERT INTO public.talles_model VALUES (45, 16, 39, 21);
INSERT INTO public.talles_model VALUES (47, 17, 28, 20);
INSERT INTO public.talles_model VALUES (48, 17, 30, 12);
INSERT INTO public.talles_model VALUES (49, 17, 32, 18);
INSERT INTO public.talles_model VALUES (51, 18, 29, 31);
INSERT INTO public.talles_model VALUES (52, 19, 27, 16);
INSERT INTO public.talles_model VALUES (55, 19, 30, 7);
INSERT INTO public.talles_model VALUES (56, 20, 29, 10);
INSERT INTO public.talles_model VALUES (57, 20, 34, 13);
INSERT INTO public.talles_model VALUES (58, 21, 27, 21);
INSERT INTO public.talles_model VALUES (59, 21, 30, 16);
INSERT INTO public.talles_model VALUES (60, 21, 33, 20);
INSERT INTO public.talles_model VALUES (61, 22, 29, 12);
INSERT INTO public.talles_model VALUES (62, 22, 32, 24);
INSERT INTO public.talles_model VALUES (63, 23, 26, 9);
INSERT INTO public.talles_model VALUES (64, 23, 30, 0);
INSERT INTO public.talles_model VALUES (65, 23, 31, 12);
INSERT INTO public.talles_model VALUES (66, 24, 28, 16);
INSERT INTO public.talles_model VALUES (67, 24, 31, 21);
INSERT INTO public.talles_model VALUES (68, 25, 27, 23);
INSERT INTO public.talles_model VALUES (69, 25, 29, 15);
INSERT INTO public.talles_model VALUES (70, 25, 31, 18);
INSERT INTO public.talles_model VALUES (71, 25, 33, 0);
INSERT INTO public.talles_model VALUES (8, 3, 41, 15);
INSERT INTO public.talles_model VALUES (10, 4, 41, 11);
INSERT INTO public.talles_model VALUES (15, 5, 45, 8);
INSERT INTO public.talles_model VALUES (26, 8, 46, 11);
INSERT INTO public.talles_model VALUES (32, 11, 36, 24);
INSERT INTO public.talles_model VALUES (33, 11, 37, 12);
INSERT INTO public.talles_model VALUES (34, 11, 38, 9);
INSERT INTO public.talles_model VALUES (44, 16, 38, 8);
INSERT INTO public.talles_model VALUES (46, 16, 40, 21);
INSERT INTO public.talles_model VALUES (50, 18, 28, 19);
INSERT INTO public.talles_model VALUES (53, 19, 29, 29);
INSERT INTO public.talles_model VALUES (22, 7, 26, 0);


--
-- Data for Name: usuari; Type: TABLE DATA; Schema: public; Owner: tdiw-g2
--

INSERT INTO public.usuari VALUES ('pol', 'gerard@gmail.com', '$2y$10$/fhTeLdkbnSkpyA3o9k5HezJh1MmQHfKiyjjJ.OCXcQJZ4agRrruy', 'fdfd', 'gfdvf', '11111', '2023-11-15 17:28:22.161385+01', '/img/usuario_default.png', '2023-12-05 13:31:46.212018+01');
INSERT INTO public.usuari VALUES ('Leo Messi', 'leo.messi@gmail.com', '$2y$10$qbI4xSqMRzOdoL3Jn4S.9Oksfpz9lv2txvR0sf0RDiyCz4/nGqxxi', 'Argentina', 'Buenos Aires', '12345', '2023-11-15 17:28:22.161385+01', '/img/usuario_default.png', '2023-12-05 13:31:46.212018+01');
INSERT INTO public.usuari VALUES ('Hola que tal', 'lolo@gmail.com', '$2y$10$n9qRU4ZO9bNZpmB6HehxTuuc1bLwktGNmCQ1TTjhW/fA.WX7T1VK.', 'carrer', 'si', '12345', '2023-11-15 17:28:22.161385+01', '/img/usuario_default.png', '2023-12-05 13:31:46.212018+01');
INSERT INTO public.usuari VALUES ('gerard', 'asjgd@gmail.com', '$2y$10$9vJWHsRBWvksNDifZ5w9ceiMDC1RZJGqMsLE1la95.eA58cDvwuPu', 'ahsdas', 'uab', '11111', '2023-11-15 17:28:22.161385+01', '/img/usuario_default.png', '2023-12-05 13:31:46.212018+01');
INSERT INTO public.usuari VALUES ('jan', 'pepe@gmail.com', '$2y$10$4LJddVAr8O1j8uPRrKYRsOxcBuxq7GMe/rM50alBloryUb6SYA7Ra', 'ahsdas', 'uab', '11111', '2023-11-15 17:29:11.868198+01', '/img/usuario_default.png', '2023-12-05 13:31:46.212018+01');
INSERT INTO public.usuari VALUES ('hola', 'goladf@gmail.com', '$2y$10$CxTu/9t8AAcsluTdFcNBUulGsktq./7diDHMVgypPM8OCvFP4GtOq', 'fadsf', 'fdgsfd', '09876', '2023-12-04 18:34:09.684635+01', '/img/usuario_default.png', '2023-12-05 13:31:46.212018+01');
INSERT INTO public.usuari VALUES ('polkk', 'holaaa@gmail.com', '$2y$10$HHDSg6ZHXFkB2ubhdz1VwOy8Uc3JE.X9DGB4MWY27fE2L8QV.DFjC', 'jlkjlkj', 'jlkjkl', '01111', '2023-12-05 12:10:13.71196+01', '/img/usuario_default.png', '2023-12-05 13:31:46.212018+01');
INSERT INTO public.usuari VALUES ('ôdssàd', 'jkjljkl@gmail.com', '$2y$10$2Bh4zX8Rugq5.E5ponNl..xYkTMzzi3REL8QLcHu/0kJ8EkTkGCzG', 'jkljkl', 'jkljlk', '12111', '2023-12-05 12:16:23.845342+01', '/img/usuario_default.png', '2023-12-05 13:31:46.212018+01');
INSERT INTO public.usuari VALUES ('ja Morant', 'jaMorant@gmail.com', '$2y$10$ksxYsFUEeyhb7GJ4iYUvDOVmG8fqFP/QvZ2lZSkVUuLXHIISqlL.y', 'jkljlkj', 'jlkjlkj', '12345', '2023-12-05 12:47:09.597068+01', '/img/usuario_default.png', '2023-12-05 13:31:46.212018+01');
INSERT INTO public.usuari VALUES ('prova', 'prova@gmail.com', '$2y$10$ZqEtvNFmaxC9FjpB.BRHdOPlRwyEZWCBaZ0NJktywcuFHwOk0Uyfa', 'prova', 'prova', '12349', '2023-11-25 13:19:39.132256+01', '/img/usuario_default.png', '2023-12-05 13:38:14.011126+01');
INSERT INTO public.usuari VALUES ('hola', 'hola@gmail.com', '$2y$10$hthn1XlChAH8s7On4DVnaOWXJ8Z1DOIRx/uy6ofUBokGYUPbEMY/i', 'hola', 'hola', '12345', '2023-12-20 17:37:02.635696+01', '/img/usuario_default.png', '2023-12-20 17:37:02.635696+01');
INSERT INTO public.usuari VALUES ('Jan', 'paco@gmail.com', '$2y$10$1UPNRGkFSQdNv01cSCTY.uxen.AB7CwG3zsUDpP0cigZoAktlVGIy', 'barcelona', 'santvi encara no', '08620', '2023-11-27 11:09:57.106553+01', '/img/usuario_default.png', '2023-12-23 19:13:30.039384+01');


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdiw-g2
--

SELECT pg_catalog.setval('public.categories_id_seq', 6, true);


--
-- Name: comandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdiw-g2
--

SELECT pg_catalog.setval('public.comandes_id_seq', 1, false);


--
-- Name: fotos_model_id_model_seq; Type: SEQUENCE SET; Schema: public; Owner: tdiw-g2
--

SELECT pg_catalog.setval('public.fotos_model_id_model_seq', 1, false);


--
-- Name: producte_model_id_p_seq; Type: SEQUENCE SET; Schema: public; Owner: tdiw-g2
--

SELECT pg_catalog.setval('public.producte_model_id_p_seq', 1, false);


--
-- Name: producte_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdiw-g2
--

SELECT pg_catalog.setval('public.producte_model_id_seq', 26, true);


--
-- Name: productes_comandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdiw-g2
--

SELECT pg_catalog.setval('public.productes_comandes_id_seq', 1, false);


--
-- Name: productes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdiw-g2
--

SELECT pg_catalog.setval('public.productes_id_seq', 9, true);


--
-- Name: talles_model_id_m_seq; Type: SEQUENCE SET; Schema: public; Owner: tdiw-g2
--

SELECT pg_catalog.setval('public.talles_model_id_m_seq', 1, false);


--
-- Name: talles_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdiw-g2
--

SELECT pg_catalog.setval('public.talles_model_id_seq', 71, true);


--
-- Name: categories categories_categoria_key; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_categoria_key UNIQUE (categoria);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: producte_model color_unic_producte; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.producte_model
    ADD CONSTRAINT color_unic_producte UNIQUE (id_p, color);


--
-- Name: comandes comandes_pkey; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.comandes
    ADD CONSTRAINT comandes_pkey PRIMARY KEY (id);


--
-- Name: producte_model producte_model_pkey; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.producte_model
    ADD CONSTRAINT producte_model_pkey PRIMARY KEY (id);


--
-- Name: productes_comandes producte_unic_comanda; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.productes_comandes
    ADD CONSTRAINT producte_unic_comanda UNIQUE (id_t, id_c);


--
-- Name: productes_comandes productes_comandes_pkey; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.productes_comandes
    ADD CONSTRAINT productes_comandes_pkey PRIMARY KEY (id);


--
-- Name: productes productes_pkey; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.productes
    ADD CONSTRAINT productes_pkey PRIMARY KEY (id);


--
-- Name: talles_model talla_unica_model; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.talles_model
    ADD CONSTRAINT talla_unica_model UNIQUE (id_m, talla);


--
-- Name: talles_model talles_model_pkey; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.talles_model
    ADD CONSTRAINT talles_model_pkey PRIMARY KEY (id);


--
-- Name: usuari usuari_pkey; Type: CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.usuari
    ADD CONSTRAINT usuari_pkey PRIMARY KEY (email);


--
-- Name: productes categoria; Type: FK CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.productes
    ADD CONSTRAINT categoria FOREIGN KEY (categoria) REFERENCES public.categories(categoria);


--
-- Name: comandes id_c_u; Type: FK CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.comandes
    ADD CONSTRAINT id_c_u FOREIGN KEY (id_u) REFERENCES public.usuari(email);


--
-- Name: fotos_model id_f_m; Type: FK CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.fotos_model
    ADD CONSTRAINT id_f_m FOREIGN KEY (id_m) REFERENCES public.producte_model(id);


--
-- Name: producte_model id_m_p; Type: FK CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.producte_model
    ADD CONSTRAINT id_m_p FOREIGN KEY (id_p) REFERENCES public.productes(id);


--
-- Name: productes_comandes id_pc_c; Type: FK CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.productes_comandes
    ADD CONSTRAINT id_pc_c FOREIGN KEY (id_c) REFERENCES public.comandes(id);


--
-- Name: productes_comandes id_pc_t; Type: FK CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.productes_comandes
    ADD CONSTRAINT id_pc_t FOREIGN KEY (id_t) REFERENCES public.talles_model(id);


--
-- Name: talles_model id_t_m; Type: FK CONSTRAINT; Schema: public; Owner: tdiw-g2
--

ALTER TABLE ONLY public.talles_model
    ADD CONSTRAINT id_t_m FOREIGN KEY (id_m) REFERENCES public.producte_model(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: tdiw-professor
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO "tdiw-professor";
GRANT ALL ON SCHEMA public TO "tdiw-g2";


--
-- PostgreSQL database dump complete
--

