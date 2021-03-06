DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-29 15:43:34

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
-- TOC entry 201 (class 1259 OID 49501)
-- Name: candidates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidates (
    id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    identification_number character varying(11) NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE public.candidates OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 49508)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    city_name character varying(50) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 49506)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 204 (class 1259 OID 49513)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 49518)
-- Name: employer_activation_by_employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employer_activation_by_employees (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    confirmed_employee_id integer,
    is_confirmed boolean NOT NULL,
    confirmed_date date
);


ALTER TABLE public.employer_activation_by_employees OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 49523)
-- Name: employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employers (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(12) NOT NULL
);


ALTER TABLE public.employers OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 49530)
-- Name: job_advertisements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_advertisements (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    job_title_id integer NOT NULL,
    description text NOT NULL,
    city_id integer NOT NULL,
    quota integer NOT NULL,
    appeal_expiration_date timestamp without time zone NOT NULL,
    is_active boolean NOT NULL,
    created_date timestamp without time zone,
    min_salary double precision NOT NULL,
    max_salary double precision NOT NULL
);


ALTER TABLE public.job_advertisements OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 49528)
-- Name: job_advertisements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.job_advertisements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.job_advertisements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 49538)
-- Name: job_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_titles (
    id integer NOT NULL,
    title character varying(50)
);


ALTER TABLE public.job_titles OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 49621)
-- Name: job_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.job_titles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.job_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 49543)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email_address character varying(50) NOT NULL,
    password character varying(25) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 49630)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 200 (class 1259 OID 49496)
-- Name: verification_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification_codes (
    id integer NOT NULL,
    code character varying(38) NOT NULL,
    is_verified boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.verification_codes OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49632)
-- Name: verification_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.verification_codes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.verification_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3049 (class 0 OID 49501)
-- Dependencies: 201
-- Data for Name: candidates; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (4, 'Mehmet', 'Basrio??lu', '12345678910', '2000-08-17');


--
-- TOC entry 3051 (class 0 OID 49508)
-- Dependencies: 203
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (1, 'ADANA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (2, 'ADIYAMAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (3, 'AFYONKARAH??SAR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (4, 'A??RI');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (5, 'AMASYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (6, 'ANKARA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (7, 'ANTALYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (8, 'ARTV??N');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (9, 'AYDIN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (10, 'BALIKES??R');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (11, 'B??LEC??K');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (12, 'B??NG??L');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (13, 'B??TL??S');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (14, 'BOLU');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (15, 'BURDUR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (16, 'BURSA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (17, '??ANAKKALE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (18, '??ANKIRI');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (19, '??ORUM');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (20, 'DEN??ZL??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (21, 'D??YARBAKIR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (22, 'ED??RNE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (23, 'ELAZI??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (24, 'ERZ??NCAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (25, 'ERZURUM');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (26, 'ESK????EH??R');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (27, 'GAZ??ANTEP');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (28, 'G??RESUN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (29, 'G??M????HANE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (30, 'HAKKAR??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (31, 'HATAY');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (32, 'ISPARTA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (33, 'MERS??N');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (34, '??STANBUL');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (35, '??ZM??R');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (36, 'KARS');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (37, 'KASTAMONU');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (38, 'KAYSER??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (39, 'KIRKLAREL??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (40, 'KIR??EH??R');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (41, 'KOCAEL??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (42, 'KONYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (43, 'K??TAHYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (44, 'MALATYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (45, 'MAN??SA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (46, 'KAHRAMANMARA??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (47, 'MARD??N');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (48, 'MU??LA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (49, 'MU??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (50, 'NEV??EH??R');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (51, 'N????DE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (52, 'ORDU');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (53, 'R??ZE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (54, 'SAKARYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (55, 'SAMSUN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (56, 'S????RT');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (57, 'S??NOP');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (58, 'S??VAS');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (59, 'TEK??RDA??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (60, 'TOKAT');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (61, 'TRABZON');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (62, 'TUNCEL??');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (63, '??ANLIURFA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (64, 'U??AK');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (65, 'VAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (66, 'YOZGAT');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (67, 'ZONGULDAK');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (68, 'AKSARAY');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (69, 'BAYBURT');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (70, 'KARAMAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (71, 'KIRIKKALE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (72, 'BATMAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (73, '??IRNAK');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (74, 'BARTIN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (75, 'ARDAHAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (76, 'I??DIR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (77, 'YALOVA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (78, 'KARAB??K');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (79, 'K??L??S');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (80, 'OSMAN??YE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (81, 'D??ZCE');


--
-- TOC entry 3052 (class 0 OID 49513)
-- Dependencies: 204
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3053 (class 0 OID 49518)
-- Dependencies: 205
-- Data for Name: employer_activation_by_employees; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3054 (class 0 OID 49523)
-- Dependencies: 206
-- Data for Name: employers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employers (id, company_name, web_address, phone_number) VALUES (1, 'Facebook', 'facebook.com', '2126552333');
INSERT INTO public.employers (id, company_name, web_address, phone_number) VALUES (2, 'Facebook', 'facebook.com', '2126552333');
INSERT INTO public.employers (id, company_name, web_address, phone_number) VALUES (3, 'Facebook', 'facebook.com', '2126552333');
INSERT INTO public.employers (id, company_name, web_address, phone_number) VALUES (5, 'Facebook', 'facebook.com', '2126894555');


--
-- TOC entry 3056 (class 0 OID 49530)
-- Dependencies: 208
-- Data for Name: job_advertisements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.job_advertisements (id, employer_id, job_title_id, description, city_id, quota, appeal_expiration_date, is_active, created_date, min_salary, max_salary) OVERRIDING SYSTEM VALUE VALUES (8, 3, 1, 'Yaz??l??m Geli??tirici Ar??yoruz', 34, 1, '2021-05-28 23:38:18.804', true, '2021-05-28 23:38:18.804', 7000, 8000);
INSERT INTO public.job_advertisements (id, employer_id, job_title_id, description, city_id, quota, appeal_expiration_date, is_active, created_date, min_salary, max_salary) OVERRIDING SYSTEM VALUE VALUES (10, 1, 1, 'Web Developer ar??yoruz', 34, 0, '2021-05-28 23:48:11.492', true, '2021-05-28 23:48:11.492', 0, 0);


--
-- TOC entry 3057 (class 0 OID 49538)
-- Dependencies: 209
-- Data for Name: job_titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.job_titles (id, title) OVERRIDING SYSTEM VALUE VALUES (1, 'Software Developer');
INSERT INTO public.job_titles (id, title) OVERRIDING SYSTEM VALUE VALUES (2, 'Software Architect');


--
-- TOC entry 3058 (class 0 OID 49543)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, email_address, password) OVERRIDING SYSTEM VALUE VALUES (1, 'markzuckerberg@facebook.com', '123456');
INSERT INTO public.users (id, email_address, password) OVERRIDING SYSTEM VALUE VALUES (2, 'markzuckerberg2@facebook.com', '123456');
INSERT INTO public.users (id, email_address, password) OVERRIDING SYSTEM VALUE VALUES (3, 'markzuckerberg3@facebook.com', '123456');
INSERT INTO public.users (id, email_address, password) OVERRIDING SYSTEM VALUE VALUES (4, 'mhmt2@gmail.com', '00000');
INSERT INTO public.users (id, email_address, password) OVERRIDING SYSTEM VALUE VALUES (5, 'markzuckerbergyedek@facebook.com', '123456');


--
-- TOC entry 3048 (class 0 OID 49496)
-- Dependencies: 200
-- Data for Name: verification_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.verification_codes (id, code, is_verified, user_id) OVERRIDING SYSTEM VALUE VALUES (2, 'xvpiiirtupcoglivafntdbpkodysgk', true, 3);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) OVERRIDING SYSTEM VALUE VALUES (3, 'crmigpncxxxhopowatfwjgisdlcsbi', false, 4);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) OVERRIDING SYSTEM VALUE VALUES (4, 'zdgahkvobkkurcglnxaulrkyarfscv', false, 5);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 202
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 81, true);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 207
-- Name: job_advertisements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_advertisements_id_seq', 19, true);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 211
-- Name: job_titles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_titles_id_seq', 2, true);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 213
-- Name: verification_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.verification_codes_id_seq', 4, true);


--
-- TOC entry 2892 (class 2606 OID 49500)
-- Name: verification_codes activation_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT activation_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 49505)
-- Name: candidates candidates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 49512)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 49517)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 49522)
-- Name: employer_activation_by_employees employer_activation_by_employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_activation_by_employees
    ADD CONSTRAINT employer_activation_by_employees_pkey PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 49527)
-- Name: employers employers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 49537)
-- Name: job_advertisements job_advertisements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT job_advertisements_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 49542)
-- Name: job_titles job_titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_pkey PRIMARY KEY (id);


--
-- TOC entry 2908 (class 2606 OID 49547)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 49608)
-- Name: verification_codes activation_codes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT activation_codes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 2910 (class 2606 OID 49568)
-- Name: candidates candidates_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_id_fkey FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 2911 (class 2606 OID 49573)
-- Name: employees employees_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_id_fkey FOREIGN KEY (id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 2912 (class 2606 OID 49578)
-- Name: employer_activation_by_employees employer_activation_by_employees_confirmed_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_activation_by_employees
    ADD CONSTRAINT employer_activation_by_employees_confirmed_employee_id_fkey FOREIGN KEY (confirmed_employee_id) REFERENCES public.employees(id) NOT VALID;


--
-- TOC entry 2913 (class 2606 OID 49583)
-- Name: employer_activation_by_employees employer_activation_by_employees_employer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_activation_by_employees
    ADD CONSTRAINT employer_activation_by_employees_employer_id_fkey FOREIGN KEY (employer_id) REFERENCES public.employers(id) NOT VALID;


--
-- TOC entry 2914 (class 2606 OID 49625)
-- Name: employers employers_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_id_fkey FOREIGN KEY (id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 2915 (class 2606 OID 49593)
-- Name: job_advertisements job_advertisements_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT job_advertisements_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;


--
-- TOC entry 2917 (class 2606 OID 49639)
-- Name: job_advertisements job_advertisements_employer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT job_advertisements_employer_id_fkey FOREIGN KEY (employer_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 2916 (class 2606 OID 49603)
-- Name: job_advertisements job_advertisements_job_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_advertisements
    ADD CONSTRAINT job_advertisements_job_title_id_fkey FOREIGN KEY (job_title_id) REFERENCES public.job_titles(id) NOT VALID;


-- Completed on 2021-05-29 15:43:38

--
-- PostgreSQL database dump complete
--

