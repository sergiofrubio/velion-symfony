--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-0ubuntu0.24.04.1)

-- Started on 2024-07-28 11:57:59 CEST

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
-- TOC entry 228 (class 1259 OID 16647)
-- Name: appointment; Type: TABLE; Schema: public; Owner: symfony_user
--

CREATE TABLE public.appointment (
    id integer NOT NULL,
    date date NOT NULL,
    "time" time(0) without time zone NOT NULL,
    diagnosis character varying(255) DEFAULT NULL::character varying,
    treatment character varying(255) DEFAULT NULL::character varying,
    notes character varying(255) DEFAULT NULL::character varying,
    duration integer NOT NULL
);


ALTER TABLE public.appointment OWNER TO symfony_user;

--
-- TOC entry 226 (class 1259 OID 16645)
-- Name: appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony_user
--

CREATE SEQUENCE public.appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointment_id_seq OWNER TO symfony_user;

--
-- TOC entry 222 (class 1259 OID 16611)
-- Name: category; Type: TABLE; Schema: public; Owner: symfony_user
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.category OWNER TO symfony_user;

--
-- TOC entry 218 (class 1259 OID 16607)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony_user
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO symfony_user;

--
-- TOC entry 215 (class 1259 OID 16588)
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: symfony_user
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO symfony_user;

--
-- TOC entry 223 (class 1259 OID 16618)
-- Name: invoice; Type: TABLE; Schema: public; Owner: symfony_user
--

CREATE TABLE public.invoice (
    id integer NOT NULL,
    issue_date date NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.invoice OWNER TO symfony_user;

--
-- TOC entry 219 (class 1259 OID 16608)
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony_user
--

CREATE SEQUENCE public.invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoice_id_seq OWNER TO symfony_user;

--
-- TOC entry 224 (class 1259 OID 16623)
-- Name: product; Type: TABLE; Schema: public; Owner: symfony_user
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.product OWNER TO symfony_user;

--
-- TOC entry 220 (class 1259 OID 16609)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony_user
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO symfony_user;

--
-- TOC entry 229 (class 1259 OID 16657)
-- Name: reset_password_request; Type: TABLE; Schema: public; Owner: symfony_user
--

CREATE TABLE public.reset_password_request (
    id integer NOT NULL,
    user_id character varying(9) NOT NULL,
    selector character varying(20) NOT NULL,
    hashed_token character varying(100) NOT NULL,
    requested_at timestamp(0) without time zone NOT NULL,
    expires_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.reset_password_request OWNER TO symfony_user;

--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN reset_password_request.requested_at; Type: COMMENT; Schema: public; Owner: symfony_user
--

COMMENT ON COLUMN public.reset_password_request.requested_at IS '(DC2Type:datetime_immutable)';


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN reset_password_request.expires_at; Type: COMMENT; Schema: public; Owner: symfony_user
--

COMMENT ON COLUMN public.reset_password_request.expires_at IS '(DC2Type:datetime_immutable)';


--
-- TOC entry 227 (class 1259 OID 16646)
-- Name: reset_password_request_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony_user
--

CREATE SEQUENCE public.reset_password_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reset_password_request_id_seq OWNER TO symfony_user;

--
-- TOC entry 225 (class 1259 OID 16630)
-- Name: specialization; Type: TABLE; Schema: public; Owner: symfony_user
--

CREATE TABLE public.specialization (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.specialization OWNER TO symfony_user;

--
-- TOC entry 221 (class 1259 OID 16610)
-- Name: specialization_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony_user
--

CREATE SEQUENCE public.specialization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specialization_id_seq OWNER TO symfony_user;

--
-- TOC entry 217 (class 1259 OID 16595)
-- Name: user; Type: TABLE; Schema: public; Owner: symfony_user
--

CREATE TABLE public."user" (
    id character varying(9) NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    surname character varying(255) DEFAULT NULL::character varying,
    birth_date date,
    address character varying(255) DEFAULT NULL::character varying,
    city character varying(255) DEFAULT NULL::character varying,
    province character varying(255) DEFAULT NULL::character varying,
    zip integer,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    roles json NOT NULL,
    genre character varying(255) NOT NULL,
    phone integer,
    is_verified boolean NOT NULL
);


ALTER TABLE public."user" OWNER TO symfony_user;

--
-- TOC entry 216 (class 1259 OID 16594)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony_user
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO symfony_user;

--
-- TOC entry 3421 (class 0 OID 16647)
-- Dependencies: 228
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: symfony_user
--

COPY public.appointment (id, date, "time", diagnosis, treatment, notes, duration) FROM stdin;
\.


--
-- TOC entry 3415 (class 0 OID 16611)
-- Dependencies: 222
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: symfony_user
--

COPY public.category (id, name, description) FROM stdin;
1	Terapia Física	Sesiones de terapia física individualizadas
2	Bonos de Sesiones	Paquetes de sesiones de terapia física con descuento
3	Tratamientos Especiales	Tratamientos específicos para ciertas condiciones o necesidades
4	Rehabilitación	Programas de rehabilitación post-operatoria o lesiones
5	Terapias Complementarias	Terapias complementarias como acupuntura o electroterapia
\.


--
-- TOC entry 3408 (class 0 OID 16588)
-- Dependencies: 215
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: symfony_user
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20240706065049	2024-07-06 06:52:36	5
DoctrineMigrations\\Version20240706073915	2024-07-06 07:39:20	3
DoctrineMigrations\\Version20240706081257	2024-07-06 08:13:02	2
DoctrineMigrations\\Version20240706110839	2024-07-06 11:08:51	16
DoctrineMigrations\\Version20240707101752	2024-07-07 10:17:56	2
DoctrineMigrations\\Version20240707112008	2024-07-07 11:20:13	10
DoctrineMigrations\\Version20240707113437	2024-07-07 11:34:41	1
DoctrineMigrations\\Version20240720111420	2024-07-20 11:15:19	13
\.


--
-- TOC entry 3416 (class 0 OID 16618)
-- Dependencies: 223
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: symfony_user
--

COPY public.invoice (id, issue_date, status) FROM stdin;
\.


--
-- TOC entry 3417 (class 0 OID 16623)
-- Dependencies: 224
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: symfony_user
--

COPY public.product (id, name, description, price) FROM stdin;
2	Bono de 10 sesiones	(30€/sesión)	300
3	Bono de 15 sesiones	(26€/sesión)	390
4	Bono de 20 sesiones	(24€/sesión)	480
5	Bono de 30 sesiones	(20,5€/sesión)	615
6	Bono especial de 10 sesiones	(37€/sesión)	370
1	Sesión individua	1	35
\.


--
-- TOC entry 3422 (class 0 OID 16657)
-- Dependencies: 229
-- Data for Name: reset_password_request; Type: TABLE DATA; Schema: public; Owner: symfony_user
--

COPY public.reset_password_request (id, user_id, selector, hashed_token, requested_at, expires_at) FROM stdin;
\.


--
-- TOC entry 3418 (class 0 OID 16630)
-- Dependencies: 225
-- Data for Name: specialization; Type: TABLE DATA; Schema: public; Owner: symfony_user
--

COPY public.specialization (id, description) FROM stdin;
1	Fisioterapia Deportiva
2	Fisioterapia Neurológica
3	Fisioterapia Respiratoria
4	Fisioterapia Pediátrica
5	Fisioterapia Geriátrica
6	Fisioterapia Ortopédica
7	Fisioterapia Cardiovascular
8	Fisioterapia Oncológica
9	Fisioterapia del Suelo Pélvico
10	Fisioterapia Musculoesquelética
11	Fisioterapia Acuática (Hidroterapia)
12	Fisioterapia Manual
13	Fisioterapia Deportiva Adaptada
14	Fisioterapia del Dolor
15	Fisioterapia Vestibular
16	Fisioterapia en Salud Mental
17	Fisioterapia Dermatofuncional
18	Fisioterapia en Disfunciones Temporomandibulares
19	Fisioterapia en Traumatología y Cirugía Ortopédica
20	Fisioterapia en Salud de la Mujer (Maternidad y Postparto)
\.


--
-- TOC entry 3410 (class 0 OID 16595)
-- Dependencies: 217
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: symfony_user
--

COPY public."user" (id, name, surname, birth_date, address, city, province, zip, email, password, roles, genre, phone, is_verified) FROM stdin;
5	Mariangeles	Rubio	1971-04-25	Calle, 2	Córdoba	Córdoba	14001	angeles@gmail.com	$2y$13$1ItlvsglBS85XjY6qYm71OzSUdizHPPWL9Vkql4y8cIsl/F8EFYwa	[]	mujer	634454052	t
2	Sergio	Física Rubio	2003-07-04	Calle, 1	Córdoba	Córdoba	14001	sergiofrubio@gmail.com	$2y$13$jgZONrqBho.PyLH28WnhjOa7mvCxb0RVUvkmiG400SHUm5ozhScXu	["ROLE_ADMIN"]	hombre	643159006	t
\.


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 226
-- Name: appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony_user
--

SELECT pg_catalog.setval('public.appointment_id_seq', 1, false);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 218
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony_user
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 219
-- Name: invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony_user
--

SELECT pg_catalog.setval('public.invoice_id_seq', 1, false);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony_user
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 227
-- Name: reset_password_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony_user
--

SELECT pg_catalog.setval('public.reset_password_request_id_seq', 1, false);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 221
-- Name: specialization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony_user
--

SELECT pg_catalog.setval('public.specialization_id_seq', 1, false);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony_user
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- TOC entry 3260 (class 2606 OID 16656)
-- Name: appointment appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony_user
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 16617)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony_user
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 16593)
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony_user
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- TOC entry 3254 (class 2606 OID 16622)
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony_user
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 16629)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony_user
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 16661)
-- Name: reset_password_request reset_password_request_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony_user
--

ALTER TABLE ONLY public.reset_password_request
    ADD CONSTRAINT reset_password_request_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 16634)
-- Name: specialization specialization_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony_user
--

ALTER TABLE ONLY public.specialization
    ADD CONSTRAINT specialization_pkey PRIMARY KEY (id);


--
-- TOC entry 3250 (class 2606 OID 16637)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony_user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 1259 OID 16662)
-- Name: idx_7ce748aa76ed395; Type: INDEX; Schema: public; Owner: symfony_user
--

CREATE INDEX idx_7ce748aa76ed395 ON public.reset_password_request USING btree (user_id);


--
-- TOC entry 3248 (class 1259 OID 16635)
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: symfony_user
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- TOC entry 3264 (class 2606 OID 16663)
-- Name: reset_password_request fk_7ce748aa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: symfony_user
--

ALTER TABLE ONLY public.reset_password_request
    ADD CONSTRAINT fk_7ce748aa76ed395 FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2024-07-28 11:57:59 CEST

--
-- PostgreSQL database dump complete
--

