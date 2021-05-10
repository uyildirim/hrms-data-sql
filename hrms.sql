--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-10 04:04:02

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


--
-- TOC entry 3067 (class 1262 OID 16563)
-- Name: hrms; Type: DATABASE; Schema: -; Owner: postgres
--



ALTER DATABASE hrms OWNER TO postgres;



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
-- TOC entry 201 (class 1259 OID 16886)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    username character varying(25),
    password character varying(25)
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16889)
-- Name: candidates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidates (
    user_id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    identity_number character varying(11) NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE public.candidates OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16892)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    user_id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16895)
-- Name: employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employers (
    user_id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(12) NOT NULL,
    is_activated boolean DEFAULT false NOT NULL
);


ALTER TABLE public.employers OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16898)
-- Name: employers_activation_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employers_activation_codes (
    id integer NOT NULL,
    employer_user_id integer NOT NULL,
    activation_code character varying(38) NOT NULL,
    is_confirmed boolean NOT NULL,
    confirmed_date date
);


ALTER TABLE public.employers_activation_codes OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16910)
-- Name: employers_activation_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employers_activation_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employers_activation_codes_id_seq OWNER TO postgres;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 209
-- Name: employers_activation_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employers_activation_codes_id_seq OWNED BY public.employers_activation_codes.id;


--
-- TOC entry 206 (class 1259 OID 16901)
-- Name: employers_activation_employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employers_activation_employees (
    id integer NOT NULL,
    employer_user_id integer NOT NULL,
    confirmed_employee_user_id integer,
    confirmed_date date
);


ALTER TABLE public.employers_activation_employees OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16912)
-- Name: employers_activation_employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employers_activation_employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employers_activation_employees_id_seq OWNER TO postgres;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 210
-- Name: employers_activation_employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employers_activation_employees_id_seq OWNED BY public.employers_activation_employees.id;


--
-- TOC entry 200 (class 1259 OID 16778)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16904)
-- Name: job_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_titles (
    id integer NOT NULL,
    title character varying(50) NOT NULL
);


ALTER TABLE public.job_titles OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16914)
-- Name: job_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_titles_id_seq OWNER TO postgres;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 211
-- Name: job_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_titles_id_seq OWNED BY public.job_titles.id;


--
-- TOC entry 208 (class 1259 OID 16907)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(25) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16916)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2887 (class 2604 OID 16971)
-- Name: employers_activation_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers_activation_codes ALTER COLUMN id SET DEFAULT nextval('public.employers_activation_codes_id_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 16972)
-- Name: employers_activation_employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers_activation_employees ALTER COLUMN id SET DEFAULT nextval('public.employers_activation_employees_id_seq'::regclass);


--
-- TOC entry 2889 (class 2604 OID 16973)
-- Name: job_titles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles ALTER COLUMN id SET DEFAULT nextval('public.job_titles_id_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 16974)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3050 (class 0 OID 16886)
-- Dependencies: 201
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3051 (class 0 OID 16889)
-- Dependencies: 202
-- Data for Name: candidates; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3052 (class 0 OID 16892)
-- Dependencies: 203
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3053 (class 0 OID 16895)
-- Dependencies: 204
-- Data for Name: employers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3054 (class 0 OID 16898)
-- Dependencies: 205
-- Data for Name: employers_activation_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3055 (class 0 OID 16901)
-- Dependencies: 206
-- Data for Name: employers_activation_employees; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3056 (class 0 OID 16904)
-- Dependencies: 207
-- Data for Name: job_titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.job_titles (id, title) VALUES (1, 'Software Developer');
INSERT INTO public.job_titles (id, title) VALUES (2, 'Software Architect');


--
-- TOC entry 3057 (class 0 OID 16907)
-- Dependencies: 208
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 209
-- Name: employers_activation_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employers_activation_codes_id_seq', 1, false);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 210
-- Name: employers_activation_employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employers_activation_employees_id_seq', 1, false);


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 200
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 211
-- Name: job_titles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_titles_id_seq', 2, true);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 2892 (class 2606 OID 16919)
-- Name: admins pk_admin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT pk_admin PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 16921)
-- Name: candidates pk_candidate; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT pk_candidate PRIMARY KEY (user_id);


--
-- TOC entry 2900 (class 2606 OID 16925)
-- Name: employers pk_company; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT pk_company PRIMARY KEY (user_id);


--
-- TOC entry 2902 (class 2606 OID 16927)
-- Name: employers_activation_codes pk_companyactivationcode; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers_activation_codes
    ADD CONSTRAINT pk_companyactivationcode PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 16929)
-- Name: employers_activation_employees pk_companyactivationemployee; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers_activation_employees
    ADD CONSTRAINT pk_companyactivationemployee PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 16923)
-- Name: employees pk_employee; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employee PRIMARY KEY (user_id);


--
-- TOC entry 2906 (class 2606 OID 16931)
-- Name: job_titles pk_job_titles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT pk_job_titles PRIMARY KEY (id);


--
-- TOC entry 2910 (class 2606 OID 16933)
-- Name: users pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 16935)
-- Name: candidates uc_candidates_identity_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT uc_candidates_identity_number UNIQUE (identity_number);


--
-- TOC entry 2908 (class 2606 OID 16937)
-- Name: job_titles uc_job_titles_title; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT uc_job_titles_title UNIQUE (title);


--
-- TOC entry 2912 (class 2606 OID 16939)
-- Name: users uc_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_users_email UNIQUE (email);


--
-- TOC entry 2913 (class 2606 OID 16940)
-- Name: candidates fk_candidates_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT fk_candidates_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2915 (class 2606 OID 16950)
-- Name: employers fk_companies_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT fk_companies_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2916 (class 2606 OID 16955)
-- Name: employers_activation_codes fk_company_activation_codes_companies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers_activation_codes
    ADD CONSTRAINT fk_company_activation_codes_companies FOREIGN KEY (employer_user_id) REFERENCES public.employers(user_id);


--
-- TOC entry 2917 (class 2606 OID 16960)
-- Name: employers_activation_employees fk_company_activation_employees_companies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers_activation_employees
    ADD CONSTRAINT fk_company_activation_employees_companies FOREIGN KEY (employer_user_id) REFERENCES public.employers(user_id);


--
-- TOC entry 2918 (class 2606 OID 16965)
-- Name: employers_activation_employees fk_company_activation_employees_employees1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers_activation_employees
    ADD CONSTRAINT fk_company_activation_employees_employees1 FOREIGN KEY (confirmed_employee_user_id) REFERENCES public.employees(user_id);


--
-- TOC entry 2914 (class 2606 OID 16945)
-- Name: employees fk_employees_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_users FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2021-05-10 04:04:03

--
-- PostgreSQL database dump complete
--

