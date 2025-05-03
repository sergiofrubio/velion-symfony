--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-05-03 08:23:13 UTC

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
-- TOC entry 215 (class 1259 OID 16385)
-- Name: appointment; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.appointment (
    id integer NOT NULL,
    date date NOT NULL,
    "time" time(0) without time zone NOT NULL,
    duration integer NOT NULL,
    patient_id character varying(9) NOT NULL,
    therapist_id character varying(9) NOT NULL,
    specialization_id integer NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.appointment OWNER TO app;

--
-- TOC entry 216 (class 1259 OID 16388)
-- Name: appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointment_id_seq OWNER TO app;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: category; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.category OWNER TO app;

--
-- TOC entry 218 (class 1259 OID 16394)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO app;

--
-- TOC entry 219 (class 1259 OID 16395)
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO app;

--
-- TOC entry 220 (class 1259 OID 16399)
-- Name: invoice; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.invoice (
    id integer NOT NULL,
    issue_date date NOT NULL,
    status character varying(255) NOT NULL,
    customer_id character varying(9) NOT NULL
);


ALTER TABLE public.invoice OWNER TO app;

--
-- TOC entry 221 (class 1259 OID 16402)
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoice_id_seq OWNER TO app;

--
-- TOC entry 222 (class 1259 OID 16403)
-- Name: invoice_product; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.invoice_product (
    invoice_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.invoice_product OWNER TO app;

--
-- TOC entry 223 (class 1259 OID 16406)
-- Name: medical_report; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.medical_report (
    id integer NOT NULL,
    diagnosis character varying(255) NOT NULL,
    treatment character varying(255) NOT NULL,
    notes character varying(255) NOT NULL,
    patient_id character varying(9) NOT NULL,
    therapist_id character varying(9) NOT NULL
);


ALTER TABLE public.medical_report OWNER TO app;

--
-- TOC entry 224 (class 1259 OID 16411)
-- Name: medical_report_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.medical_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medical_report_id_seq OWNER TO app;

--
-- TOC entry 225 (class 1259 OID 16412)
-- Name: product; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price integer NOT NULL,
    category_id integer
);


ALTER TABLE public.product OWNER TO app;

--
-- TOC entry 226 (class 1259 OID 16417)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO app;

--
-- TOC entry 227 (class 1259 OID 16418)
-- Name: reset_password_request; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.reset_password_request (
    id integer NOT NULL,
    user_id character varying(9) NOT NULL,
    selector character varying(20) NOT NULL,
    hashed_token character varying(100) NOT NULL,
    requested_at timestamp(0) without time zone NOT NULL,
    expires_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.reset_password_request OWNER TO app;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN reset_password_request.requested_at; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.reset_password_request.requested_at IS '(DC2Type:datetime_immutable)';


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN reset_password_request.expires_at; Type: COMMENT; Schema: public; Owner: app
--

COMMENT ON COLUMN public.reset_password_request.expires_at IS '(DC2Type:datetime_immutable)';


--
-- TOC entry 228 (class 1259 OID 16421)
-- Name: reset_password_request_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.reset_password_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reset_password_request_id_seq OWNER TO app;

--
-- TOC entry 229 (class 1259 OID 16422)
-- Name: specialization; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.specialization (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.specialization OWNER TO app;

--
-- TOC entry 230 (class 1259 OID 16425)
-- Name: specialization_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.specialization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specialization_id_seq OWNER TO app;

--
-- TOC entry 231 (class 1259 OID 16426)
-- Name: user; Type: TABLE; Schema: public; Owner: app
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


ALTER TABLE public."user" OWNER TO app;

--
-- TOC entry 232 (class 1259 OID 16436)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO app;

--
-- TOC entry 233 (class 1259 OID 16437)
-- Name: user_specialization; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.user_specialization (
    user_id character varying(9) NOT NULL,
    specialization_id integer NOT NULL
);


ALTER TABLE public.user_specialization OWNER TO app;

--
-- TOC entry 3489 (class 0 OID 16385)
-- Dependencies: 215
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.appointment (id, date, "time", duration, patient_id, therapist_id, specialization_id, status) FROM stdin;
\.


--
-- TOC entry 3491 (class 0 OID 16389)
-- Dependencies: 217
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.category (id, name, description) FROM stdin;
1	Equipos de Rehabilitación	Equipos y dispositivos utilizados en la rehabilitación de pacientes.
2	Productos de Terapia Manual	Productos utilizados para la terapia manual, como aceites y cremas.
3	Instrumentos de Evaluación	Instrumentos y herramientas utilizadas para evaluar el progreso del paciente.
4	Ortesis y Prótesis	Dispositivos de soporte y prótesis para diferentes partes del cuerpo.
5	Productos de Cuidado Personal	Productos de higiene y cuidado personal para pacientes.
6	Materiales Educativos	Libros, folletos y otros materiales educativos para pacientes.
7	Bonos de Fisioterapia	Paquetes de sesiones de fisioterapia con descuento.
\.


--
-- TOC entry 3493 (class 0 OID 16395)
-- Dependencies: 219
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20240706065049	2024-08-06 14:46:41	7
DoctrineMigrations\\Version20240706073915	2024-08-06 14:46:41	0
DoctrineMigrations\\Version20240706081257	2024-08-06 14:46:41	0
DoctrineMigrations\\Version20240706110839	2024-08-06 14:46:41	14
DoctrineMigrations\\Version20240707101752	2024-08-06 14:46:41	1
DoctrineMigrations\\Version20240707112008	2024-08-06 14:46:41	8
DoctrineMigrations\\Version20240707113437	2024-08-06 14:46:41	0
DoctrineMigrations\\Version20240720111420	2024-08-06 14:46:41	11
DoctrineMigrations\\Version20240807063839	2024-08-07 06:39:01	34
DoctrineMigrations\\Version20240818204835	2024-08-18 20:48:53	9
DoctrineMigrations\\Version20240819124857	2024-08-19 12:49:19	27
DoctrineMigrations\\Version20240819170558	2024-08-19 17:06:07	2
DoctrineMigrations\\Version20240819174415	2024-08-19 17:44:20	15
DoctrineMigrations\\Version20240820113459	2024-08-20 11:35:06	3
DoctrineMigrations\\Version20240820115531	2024-08-20 11:55:36	2
\.


--
-- TOC entry 3494 (class 0 OID 16399)
-- Dependencies: 220
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.invoice (id, issue_date, status, customer_id) FROM stdin;
\.


--
-- TOC entry 3496 (class 0 OID 16403)
-- Dependencies: 222
-- Data for Name: invoice_product; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.invoice_product (invoice_id, product_id) FROM stdin;
\.


--
-- TOC entry 3497 (class 0 OID 16406)
-- Dependencies: 223
-- Data for Name: medical_report; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.medical_report (id, diagnosis, treatment, notes, patient_id, therapist_id) FROM stdin;
\.


--
-- TOC entry 3499 (class 0 OID 16412)
-- Dependencies: 225
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.product (id, name, description, price, category_id) FROM stdin;
1	Banda Elástica	Banda de resistencia para ejercicios de rehabilitación.	16	1
2	Cinta Kinesiológica	Cinta adhesiva elástica utilizada para soporte muscular.	13	1
3	Aceite de Masaje	Aceite de alta calidad para terapias de masaje.	9	2
4	Crema Analgésica	Crema tópica para aliviar el dolor muscular.	11	2
5	Dinamómetro	Instrumento para medir la fuerza muscular.	120	3
6	Goniómetro	Dispositivo para medir el rango de movimiento articular.	35	3
7	Rodillera Ortopédica	Soporte de rodilla para pacientes con lesiones.	45	4
8	Férula de Muñeca	Dispositivo de soporte para la muñeca.	25	4
9	Jabón Antibacterial	Jabón para la higiene de manos en el entorno clínico.	4	5
10	Gel Desinfectante	Gel hidroalcohólico para la desinfección de manos.	6	5
11	Guía de Ejercicios	Libro con ejercicios para pacientes en rehabilitación.	20	6
12	Folleto Informativo	Folleto con información sobre cuidados post-tratamiento.	2	6
13	Bono de 5 Sesiones de Fisioterapia	Paquete de 5 sesiones de fisioterapia a precio reducido.	200	7
14	Bono de 10 Sesiones de Fisioterapia	Paquete de 10 sesiones de fisioterapia con descuento especial.	380	7
15	Bono de 15 Sesiones de Fisioterapia	Paquete de 15 sesiones de fisioterapia con gran descuento.	540	7
\.


--
-- TOC entry 3501 (class 0 OID 16418)
-- Dependencies: 227
-- Data for Name: reset_password_request; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.reset_password_request (id, user_id, selector, hashed_token, requested_at, expires_at) FROM stdin;
\.


--
-- TOC entry 3503 (class 0 OID 16422)
-- Dependencies: 229
-- Data for Name: specialization; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.specialization (id, description) FROM stdin;
1	Rehabilitación deportiva
2	Fisioterapia neurológica
3	Fisioterapia pediátrica
4	Fisioterapia respiratoria
5	Fisioterapia ortopédica
6	Terapia manual
7	Fisioterapia geriátrica
8	Fisioterapia en salud de la mujer
9	Fisioterapia cardiovascular
10	Fisioterapia oncológica
11	Fisioterapia traumatológica
12	Fisioterapia en cuidados intensivos
\.


--
-- TOC entry 3505 (class 0 OID 16426)
-- Dependencies: 231
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public."user" (id, name, surname, birth_date, address, city, province, zip, email, password, roles, genre, phone, is_verified) FROM stdin;
2	admin	admin	2003-07-04	admin st	admin	admin	10000	admin@example.com	$2y$13$Jm2xhK9y0B4OdZ1Tgpw4/OCtkbWfmVkRrvADEthKyRTvI6Zt99arK	["ROLE_ADMIN"]	Male	123456789	t
\.


--
-- TOC entry 3507 (class 0 OID 16437)
-- Dependencies: 233
-- Data for Name: user_specialization; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.user_specialization (user_id, specialization_id) FROM stdin;
\.


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 216
-- Name: appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.appointment_id_seq', 1, false);


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 218
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 221
-- Name: invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.invoice_id_seq', 1, false);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 224
-- Name: medical_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.medical_report_id_seq', 1, false);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 226
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 228
-- Name: reset_password_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.reset_password_request_id_seq', 1, false);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 230
-- Name: specialization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.specialization_id_seq', 1, false);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- TOC entry 3300 (class 2606 OID 16441)
-- Name: appointment appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 16443)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 16445)
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- TOC entry 3310 (class 2606 OID 16447)
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 16449)
-- Name: invoice_product invoice_product_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.invoice_product
    ADD CONSTRAINT invoice_product_pkey PRIMARY KEY (invoice_id, product_id);


--
-- TOC entry 3318 (class 2606 OID 16451)
-- Name: medical_report medical_report_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.medical_report
    ADD CONSTRAINT medical_report_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 16453)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 16455)
-- Name: reset_password_request reset_password_request_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.reset_password_request
    ADD CONSTRAINT reset_password_request_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 16457)
-- Name: specialization specialization_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.specialization
    ADD CONSTRAINT specialization_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 16459)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 16461)
-- Name: user_specialization user_specialization_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.user_specialization
    ADD CONSTRAINT user_specialization_pkey PRIMARY KEY (user_id, specialization_id);


--
-- TOC entry 3311 (class 1259 OID 16462)
-- Name: idx_2193327e2989f1fd; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_2193327e2989f1fd ON public.invoice_product USING btree (invoice_id);


--
-- TOC entry 3312 (class 1259 OID 16463)
-- Name: idx_2193327e4584665a; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_2193327e4584665a ON public.invoice_product USING btree (product_id);


--
-- TOC entry 3322 (class 1259 OID 16464)
-- Name: idx_7ce748aa76ed395; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_7ce748aa76ed395 ON public.reset_password_request USING btree (user_id);


--
-- TOC entry 3308 (class 1259 OID 16465)
-- Name: idx_906517449395c3f3; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_906517449395c3f3 ON public.invoice USING btree (customer_id);


--
-- TOC entry 3315 (class 1259 OID 16466)
-- Name: idx_af71c02b43e8b094; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_af71c02b43e8b094 ON public.medical_report USING btree (therapist_id);


--
-- TOC entry 3316 (class 1259 OID 16467)
-- Name: idx_af71c02b6b899279; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_af71c02b6b899279 ON public.medical_report USING btree (patient_id);


--
-- TOC entry 3319 (class 1259 OID 16468)
-- Name: idx_d34a04ad12469de2; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_d34a04ad12469de2 ON public.product USING btree (category_id);


--
-- TOC entry 3330 (class 1259 OID 16469)
-- Name: idx_f55c2d33a76ed395; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_f55c2d33a76ed395 ON public.user_specialization USING btree (user_id);


--
-- TOC entry 3331 (class 1259 OID 16470)
-- Name: idx_f55c2d33fa846217; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_f55c2d33fa846217 ON public.user_specialization USING btree (specialization_id);


--
-- TOC entry 3301 (class 1259 OID 16471)
-- Name: idx_fe38f84443e8b094; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_fe38f84443e8b094 ON public.appointment USING btree (therapist_id);


--
-- TOC entry 3302 (class 1259 OID 16472)
-- Name: idx_fe38f8446b899279; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_fe38f8446b899279 ON public.appointment USING btree (patient_id);


--
-- TOC entry 3303 (class 1259 OID 16473)
-- Name: idx_fe38f844fa846217; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_fe38f844fa846217 ON public.appointment USING btree (specialization_id);


--
-- TOC entry 3327 (class 1259 OID 16474)
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: app
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- TOC entry 3338 (class 2606 OID 16475)
-- Name: invoice_product fk_2193327e2989f1fd; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.invoice_product
    ADD CONSTRAINT fk_2193327e2989f1fd FOREIGN KEY (invoice_id) REFERENCES public.invoice(id) ON DELETE CASCADE;


--
-- TOC entry 3339 (class 2606 OID 16480)
-- Name: invoice_product fk_2193327e4584665a; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.invoice_product
    ADD CONSTRAINT fk_2193327e4584665a FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- TOC entry 3343 (class 2606 OID 16485)
-- Name: reset_password_request fk_7ce748aa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.reset_password_request
    ADD CONSTRAINT fk_7ce748aa76ed395 FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3337 (class 2606 OID 16490)
-- Name: invoice fk_906517449395c3f3; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fk_906517449395c3f3 FOREIGN KEY (customer_id) REFERENCES public."user"(id);


--
-- TOC entry 3340 (class 2606 OID 16495)
-- Name: medical_report fk_af71c02b43e8b094; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.medical_report
    ADD CONSTRAINT fk_af71c02b43e8b094 FOREIGN KEY (therapist_id) REFERENCES public."user"(id);


--
-- TOC entry 3341 (class 2606 OID 16500)
-- Name: medical_report fk_af71c02b6b899279; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.medical_report
    ADD CONSTRAINT fk_af71c02b6b899279 FOREIGN KEY (patient_id) REFERENCES public."user"(id);


--
-- TOC entry 3342 (class 2606 OID 16505)
-- Name: product fk_d34a04ad12469de2; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_d34a04ad12469de2 FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3344 (class 2606 OID 16510)
-- Name: user_specialization fk_f55c2d33a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.user_specialization
    ADD CONSTRAINT fk_f55c2d33a76ed395 FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 3345 (class 2606 OID 16515)
-- Name: user_specialization fk_f55c2d33fa846217; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.user_specialization
    ADD CONSTRAINT fk_f55c2d33fa846217 FOREIGN KEY (specialization_id) REFERENCES public.specialization(id) ON DELETE CASCADE;


--
-- TOC entry 3334 (class 2606 OID 16520)
-- Name: appointment fk_fe38f84443e8b094; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_fe38f84443e8b094 FOREIGN KEY (therapist_id) REFERENCES public."user"(id);


--
-- TOC entry 3335 (class 2606 OID 16525)
-- Name: appointment fk_fe38f8446b899279; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_fe38f8446b899279 FOREIGN KEY (patient_id) REFERENCES public."user"(id);


--
-- TOC entry 3336 (class 2606 OID 16530)
-- Name: appointment fk_fe38f844fa846217; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_fe38f844fa846217 FOREIGN KEY (specialization_id) REFERENCES public.specialization(id);


-- Completed on 2025-05-03 08:23:13 UTC

--
-- PostgreSQL database dump complete
--

