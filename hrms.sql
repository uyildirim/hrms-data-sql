
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;


CREATE TABLE public.candidates (
    id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    identification_number character varying(11) NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE public.candidates OWNER TO postgres;


CREATE TABLE public.cities (
    id integer NOT NULL,
    city_name character varying(50) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE public.employees (
    id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

CREATE TABLE public.employer_activation_by_employees (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    confirmed_employee_id integer,
    is_confirmed boolean NOT NULL,
    confirmed_date date
);


ALTER TABLE public.employer_activation_by_employees OWNER TO postgres;


CREATE TABLE public.employers (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(12) NOT NULL
);


ALTER TABLE public.employers OWNER TO postgres;

CREATE TABLE public.job_advertisements (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    job_title_id integer NOT NULL,
    description text NOT NULL,
    city_id integer NOT NULL,
    min_salary money NOT NULL,
    max_salary money NOT NULL,
    quota integer NOT NULL,
    appeal_expiration_date timestamp without time zone NOT NULL,
    is_active boolean NOT NULL,
    created_date timestamp without time zone
);


ALTER TABLE public.job_advertisements OWNER TO postgres;


ALTER TABLE public.job_advertisements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.job_advertisements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


CREATE TABLE public.job_titles (
    id integer NOT NULL,
    title character varying(50)
);


ALTER TABLE public.job_titles OWNER TO postgres;


ALTER TABLE public.job_titles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.job_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


CREATE TABLE public.users (
    id integer NOT NULL,
    email_address character varying(50) NOT NULL,
    password character varying(25) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;


ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


CREATE TABLE public.verification_codes (
    id integer NOT NULL,
    code character varying(38) NOT NULL,
    is_verified boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.verification_codes OWNER TO postgres;


ALTER TABLE public.verification_codes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.verification_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (1, 'ADANA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (2, 'ADIYAMAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (3, 'AFYONKARAHİSAR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (4, 'AĞRI');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (5, 'AMASYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (6, 'ANKARA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (7, 'ANTALYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (8, 'ARTVİN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (9, 'AYDIN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (10, 'BALIKESİR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (11, 'BİLECİK');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (12, 'BİNGÖL');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (13, 'BİTLİS');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (14, 'BOLU');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (15, 'BURDUR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (16, 'BURSA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (17, 'ÇANAKKALE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (18, 'ÇANKIRI');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (19, 'ÇORUM');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (20, 'DENİZLİ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (21, 'DİYARBAKIR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (22, 'EDİRNE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (23, 'ELAZIĞ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (24, 'ERZİNCAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (25, 'ERZURUM');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (26, 'ESKİŞEHİR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (27, 'GAZİANTEP');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (28, 'GİRESUN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (29, 'GÜMÜŞHANE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (30, 'HAKKARİ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (31, 'HATAY');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (32, 'ISPARTA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (33, 'MERSİN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (34, 'İSTANBUL');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (35, 'İZMİR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (36, 'KARS');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (37, 'KASTAMONU');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (38, 'KAYSERİ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (39, 'KIRKLARELİ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (40, 'KIRŞEHİR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (41, 'KOCAELİ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (42, 'KONYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (43, 'KÜTAHYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (44, 'MALATYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (45, 'MANİSA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (46, 'KAHRAMANMARAŞ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (47, 'MARDİN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (48, 'MUĞLA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (49, 'MUŞ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (50, 'NEVŞEHİR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (51, 'NİĞDE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (52, 'ORDU');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (53, 'RİZE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (54, 'SAKARYA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (55, 'SAMSUN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (56, 'SİİRT');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (57, 'SİNOP');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (58, 'SİVAS');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (59, 'TEKİRDAĞ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (60, 'TOKAT');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (61, 'TRABZON');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (62, 'TUNCELİ');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (63, 'ŞANLIURFA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (64, 'UŞAK');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (65, 'VAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (66, 'YOZGAT');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (67, 'ZONGULDAK');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (68, 'AKSARAY');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (69, 'BAYBURT');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (70, 'KARAMAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (71, 'KIRIKKALE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (72, 'BATMAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (73, 'ŞIRNAK');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (74, 'BARTIN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (75, 'ARDAHAN');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (76, 'IĞDIR');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (77, 'YALOVA');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (78, 'KARABÜK');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (79, 'KİLİS');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (80, 'OSMANİYE');
INSERT INTO public.cities (id, city_name) OVERRIDING SYSTEM VALUE VALUES (81, 'DÜZCE');
INSERT INTO public.job_titles (id, title) OVERRIDING SYSTEM VALUE VALUES (1, 'Software Developer');
INSERT INTO public.job_titles (id, title) OVERRIDING SYSTEM VALUE VALUES (2, 'Software Architect');



SELECT pg_catalog.setval('public.cities_id_seq', 81, true);



SELECT pg_catalog.setval('public.job_advertisements_id_seq', 1, false);


SELECT pg_catalog.setval('public.job_titles_id_seq', 1, true);

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


SELECT pg_catalog.setval('public.verification_codes_id_seq', 3, true);





ALTER TABLE ONLY "public"."verification_codes"
    ADD CONSTRAINT "activation_codes_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."candidates"
    ADD CONSTRAINT "candidates_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."cities"
    ADD CONSTRAINT "cities_pkey" PRIMARY KEY ("id");


ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_pkey" PRIMARY KEY ("id");


ALTER TABLE ONLY "public"."employer_activation_by_employees"
    ADD CONSTRAINT "employer_activation_by_employees_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."employers"
    ADD CONSTRAINT "employers_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."job_advertisements"
    ADD CONSTRAINT "job_advertisements_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."job_titles"
    ADD CONSTRAINT "job_titles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."verification_codes"
    ADD CONSTRAINT "activation_codes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") NOT VALID;



ALTER TABLE ONLY "public"."candidates"
    ADD CONSTRAINT "candidates_id_fkey" FOREIGN KEY ("id") REFERENCES "public"."users"("id");



ALTER TABLE ONLY "public"."employees"
    ADD CONSTRAINT "employees_id_fkey" FOREIGN KEY ("id") REFERENCES "public"."users"("id") NOT VALID;



ALTER TABLE ONLY "public"."employer_activation_by_employees"
    ADD CONSTRAINT "employer_activation_by_employees_confirmed_employee_id_fkey" FOREIGN KEY ("confirmed_employee_id") REFERENCES "public"."employees"("id") NOT VALID;

ALTER TABLE ONLY "public"."employer_activation_by_employees"
    ADD CONSTRAINT "employer_activation_by_employees_employer_id_fkey" FOREIGN KEY ("employer_id") REFERENCES "public"."employers"("id") NOT VALID;



ALTER TABLE ONLY "public"."employers"
    ADD CONSTRAINT "employers_id_fkey" FOREIGN KEY ("id") REFERENCES "public"."users"("id") NOT VALID;


ALTER TABLE ONLY "public"."job_advertisements"
    ADD CONSTRAINT "job_advertisements_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "public"."cities"("id") NOT VALID;


ALTER TABLE ONLY "public"."job_advertisements"
    ADD CONSTRAINT "job_advertisements_job_title_id_fkey" FOREIGN KEY ("job_title_id") REFERENCES "public"."job_titles"("id") NOT VALID;


