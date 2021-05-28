DROP SCHEMA public CASCADE;
CREATE SCHEMA public;


CREATE TABLE "public"."candidates" (
    "id" integer NOT NULL,
    "first_name" character varying(25) NOT NULL,
    "last_name" character varying(25) NOT NULL,
    "identification_number" character varying(11) NOT NULL,
    "birth_date" "date" NOT NULL
);


ALTER TABLE "public"."candidates" OWNER TO "postgres";

--
-- TOC entry 203 (class 1259 OID 49508)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."cities" (
    "id" integer NOT NULL,
    "city_name" character varying(50) NOT NULL
);


ALTER TABLE "public"."cities" OWNER TO "postgres";

--
-- TOC entry 202 (class 1259 OID 49506)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."cities" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."cities_id_seq"
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

CREATE TABLE "public"."employees" (
    "id" integer NOT NULL,
    "first_name" character varying(25) NOT NULL,
    "last_name" character varying(25) NOT NULL
);


ALTER TABLE "public"."employees" OWNER TO "postgres";

--
-- TOC entry 205 (class 1259 OID 49518)
-- Name: employer_activation_by_employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."employer_activation_by_employees" (
    "id" integer NOT NULL,
    "employer_id" integer NOT NULL,
    "confirmed_employee_id" integer,
    "is_confirmed" boolean NOT NULL,
    "confirmed_date" "date"
);


ALTER TABLE "public"."employer_activation_by_employees" OWNER TO "postgres";

--
-- TOC entry 206 (class 1259 OID 49523)
-- Name: employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."employers" (
    "id" integer NOT NULL,
    "company_name" character varying(255) NOT NULL,
    "web_address" character varying(50) NOT NULL,
    "phone_number" character varying(12) NOT NULL
);


ALTER TABLE "public"."employers" OWNER TO "postgres";

--
-- TOC entry 208 (class 1259 OID 49530)
-- Name: job_advertisements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."job_advertisements" (
    "id" integer NOT NULL,
    "employer_id" integer NOT NULL,
    "job_title_id" integer NOT NULL,
    "description" "text" NOT NULL,
    "city_id" integer NOT NULL,
    "quota" integer NOT NULL,
    "appeal_expiration_date" timestamp without time zone NOT NULL,
    "is_active" boolean NOT NULL,
    "created_date" timestamp without time zone,
    "min_salary" double precision NOT NULL,
    "max_salary" double precision NOT NULL
);


ALTER TABLE "public"."job_advertisements" OWNER TO "postgres";

--
-- TOC entry 207 (class 1259 OID 49528)
-- Name: job_advertisements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."job_advertisements" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."job_advertisements_id_seq"
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

CREATE TABLE "public"."job_titles" (
    "id" integer NOT NULL,
    "title" character varying(50)
);


ALTER TABLE "public"."job_titles" OWNER TO "postgres";

--
-- TOC entry 211 (class 1259 OID 49621)
-- Name: job_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."job_titles" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."job_titles_id_seq"
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

CREATE TABLE "public"."users" (
    "id" integer NOT NULL,
    "email_address" character varying(50) NOT NULL,
    "password" character varying(25) NOT NULL
);


ALTER TABLE "public"."users" OWNER TO "postgres";

--
-- TOC entry 212 (class 1259 OID 49630)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."users" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."users_id_seq"
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

CREATE TABLE "public"."verification_codes" (
    "id" integer NOT NULL,
    "code" character varying(38) NOT NULL,
    "is_verified" boolean NOT NULL,
    "user_id" integer NOT NULL
);


ALTER TABLE "public"."verification_codes" OWNER TO "postgres";

--
-- TOC entry 213 (class 1259 OID 49632)
-- Name: verification_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."verification_codes" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."verification_codes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3048 (class 0 OID 49501)
-- Dependencies: 201
-- Data for Name: candidates; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."candidates" ("id", "first_name", "last_name", "identification_number", "birth_date") VALUES (4, 'Mehmet', 'Basrioğlu', '12345678910', '2000-08-17');


--
-- TOC entry 3050 (class 0 OID 49508)
-- Dependencies: 203
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (1, 'ADANA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (2, 'ADIYAMAN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (3, 'AFYONKARAHİSAR');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (4, 'AĞRI');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (5, 'AMASYA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (6, 'ANKARA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (7, 'ANTALYA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (8, 'ARTVİN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (9, 'AYDIN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (10, 'BALIKESİR');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (11, 'BİLECİK');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (12, 'BİNGÖL');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (13, 'BİTLİS');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (14, 'BOLU');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (15, 'BURDUR');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (16, 'BURSA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (17, 'ÇANAKKALE');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (18, 'ÇANKIRI');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (19, 'ÇORUM');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (20, 'DENİZLİ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (21, 'DİYARBAKIR');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (22, 'EDİRNE');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (23, 'ELAZIĞ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (24, 'ERZİNCAN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (25, 'ERZURUM');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (26, 'ESKİŞEHİR');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (27, 'GAZİANTEP');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (28, 'GİRESUN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (29, 'GÜMÜŞHANE');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (30, 'HAKKARİ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (31, 'HATAY');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (32, 'ISPARTA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (33, 'MERSİN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (34, 'İSTANBUL');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (35, 'İZMİR');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (36, 'KARS');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (37, 'KASTAMONU');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (38, 'KAYSERİ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (39, 'KIRKLARELİ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (40, 'KIRŞEHİR');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (41, 'KOCAELİ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (42, 'KONYA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (43, 'KÜTAHYA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (44, 'MALATYA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (45, 'MANİSA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (46, 'KAHRAMANMARAŞ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (47, 'MARDİN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (48, 'MUĞLA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (49, 'MUŞ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (50, 'NEVŞEHİR');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (51, 'NİĞDE');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (52, 'ORDU');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (53, 'RİZE');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (54, 'SAKARYA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (55, 'SAMSUN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (56, 'SİİRT');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (57, 'SİNOP');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (58, 'SİVAS');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (59, 'TEKİRDAĞ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (60, 'TOKAT');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (61, 'TRABZON');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (62, 'TUNCELİ');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (63, 'ŞANLIURFA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (64, 'UŞAK');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (65, 'VAN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (66, 'YOZGAT');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (67, 'ZONGULDAK');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (68, 'AKSARAY');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (69, 'BAYBURT');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (70, 'KARAMAN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (71, 'KIRIKKALE');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (72, 'BATMAN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (73, 'ŞIRNAK');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (74, 'BARTIN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (75, 'ARDAHAN');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (76, 'IĞDIR');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (77, 'YALOVA');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (78, 'KARABÜK');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (79, 'KİLİS');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (80, 'OSMANİYE');
INSERT INTO "public"."cities" ("id", "city_name") OVERRIDING SYSTEM VALUE VALUES (81, 'DÜZCE');


--
-- TOC entry 3051 (class 0 OID 49513)
-- Dependencies: 204
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3052 (class 0 OID 49518)
-- Dependencies: 205
-- Data for Name: employer_activation_by_employees; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3053 (class 0 OID 49523)
-- Dependencies: 206
-- Data for Name: employers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."employers" ("id", "company_name", "web_address", "phone_number") VALUES (1, 'Facebook', 'facebook.com', '2126552333');
INSERT INTO "public"."employers" ("id", "company_name", "web_address", "phone_number") VALUES (2, 'Facebook', 'facebook.com', '2126552333');
INSERT INTO "public"."employers" ("id", "company_name", "web_address", "phone_number") VALUES (3, 'Facebook', 'facebook.com', '2126552333');


--
-- TOC entry 3055 (class 0 OID 49530)
-- Dependencies: 208
-- Data for Name: job_advertisements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."job_advertisements" ("id", "employer_id", "job_title_id", "description", "city_id", "quota", "appeal_expiration_date", "is_active", "created_date", "min_salary", "max_salary") OVERRIDING SYSTEM VALUE VALUES (3, 3, 1, 'Yazılım Geliştirici Arıyoruz !', 34, 1, '2021-05-28 22:31:13.491', true, '2021-05-28 22:31:13.491', 5000, 8000);


--
-- TOC entry 3056 (class 0 OID 49538)
-- Dependencies: 209
-- Data for Name: job_titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."job_titles" ("id", "title") OVERRIDING SYSTEM VALUE VALUES (1, 'Software Developer');


--
-- TOC entry 3057 (class 0 OID 49543)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users" ("id", "email_address", "password") OVERRIDING SYSTEM VALUE VALUES (1, 'markzuckerberg@facebook.com', '123456');
INSERT INTO "public"."users" ("id", "email_address", "password") OVERRIDING SYSTEM VALUE VALUES (2, 'markzuckerberg2@facebook.com', '123456');
INSERT INTO "public"."users" ("id", "email_address", "password") OVERRIDING SYSTEM VALUE VALUES (3, 'markzuckerberg3@facebook.com', '123456');
INSERT INTO "public"."users" ("id", "email_address", "password") OVERRIDING SYSTEM VALUE VALUES (4, 'mhmt2@gmail.com', '00000');


--
-- TOC entry 3047 (class 0 OID 49496)
-- Dependencies: 200
-- Data for Name: verification_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."verification_codes" ("id", "code", "is_verified", "user_id") OVERRIDING SYSTEM VALUE VALUES (2, 'xvpiiirtupcoglivafntdbpkodysgk', true, 3);
INSERT INTO "public"."verification_codes" ("id", "code", "is_verified", "user_id") OVERRIDING SYSTEM VALUE VALUES (3, 'crmigpncxxxhopowatfwjgisdlcsbi', false, 4);


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 202
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."cities_id_seq"', 81, true);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 207
-- Name: job_advertisements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."job_advertisements_id_seq"', 3, true);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 211
-- Name: job_titles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."job_titles_id_seq"', 1, true);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 4, true);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 213
-- Name: verification_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."verification_codes_id_seq"', 3, true);


-- Completed on 2021-05-29 02:19:02

--
-- PostgreSQL database dump complete
--
