CREATE FUNCTION public.validate_email_by_domain(user_id integer, web_address character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	DECLARE user_email_address varchar(320);
    DECLARE result boolean;
BEGIN
	SELECT email_address INTO user_email_address FROM users where id = user_id;
    SELECT web_address like '%' || SUBSTRING(user_email_address,POSITION('@' in user_email_address) + 1) INTO result;
	IF result = false THEN
		raise 'E-mail(%) and web address(%) must have the same domain name.',user_email_address,web_address;
	END IF;
	RETURN result;
END; $$;


ALTER FUNCTION public.validate_email_by_domain(user_id integer, web_address character varying) OWNER TO postgres;



CREATE TABLE public.candidates (
    id integer NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(35) NOT NULL,
    identification_number character varying(11) NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE public.candidates OWNER TO postgres;
CREATE TABLE public.cities (
    id integer NOT NULL,
    city_name character varying NOT NULL
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




CREATE TABLE public.employee_confirms (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    is_confirmed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.employee_confirms OWNER TO postgres;


CREATE TABLE public.employee_confirms_employers (
    id integer NOT NULL,
    employer_id integer NOT NULL
);


ALTER TABLE public.employee_confirms_employers OWNER TO postgres;



ALTER TABLE public.employee_confirms ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.employee_confirms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);




CREATE TABLE public.employees (
    id integer NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(35) NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;



CREATE TABLE public.employers (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    web_address character varying(255) NOT NULL,
    phone_number character varying
);


ALTER TABLE public.employers OWNER TO postgres;


CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;


CREATE TABLE public.job_advertisement (
    "Id" integer NOT NULL,
    employer_id integer NOT NULL,
    jobtitle_id integer NOT NULL,
    description text NOT NULL,
    quota integer NOT NULL,
    appeal_expiration_date timestamp without time zone NOT NULL,
    created_date timestamp without time zone NOT NULL,
    "minSalary" double precision NOT NULL,
    "maxSalary" double precision NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.job_advertisement OWNER TO postgres;


CREATE TABLE public.job_titles (
    id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.job_titles OWNER TO postgres;



ALTER TABLE public.job_titles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.job_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE public.users (
    id integer NOT NULL,
    email_address character varying(320) NOT NULL,
    password character varying(25) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;


ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
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
    is_verified boolean DEFAULT false NOT NULL,
    user_id integer
);


ALTER TABLE public.verification_codes OWNER TO postgres;


ALTER TABLE public.verification_codes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.verification_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (1, 'dwassadads', 'dsasdadas', '12345678910', '2000-08-17');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (2, 'dwassadads', 'dsasdadas', '12345678912', '2000-08-17');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (3, 'dwassadads', 'dsasdadas', '12345678913', '2000-08-17');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (4, 'ewqweqeqw', 'ewqewqeqw', '12345678999', '2000-08-17');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (5, 'ewqweqeqw', 'ewqewqeqw', '12345678995', '2000-08-17');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (6, 'candidatetest', 'candidate', '12345678918', '2000-08-17');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (7, 'candidatetest2', 'candidate', '12345678975', '2000-08-17');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (13, 'Unknown', 'Brain', '12345678922', '1999-08-17');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (16, ' Barbara', ' Palvin', '12345678998', '1993-10-08');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (17, 'Martin', 'Garritjsen', '12345678954', '1993-10-08');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (18, 'Martin', 'Garritjsen', '-2345678954', '1993-10-08');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (19, 'Barbara', ' Palvin', '12345678977', '1993-10-08');
INSERT INTO public.candidates (id, first_name, last_name, identification_number, birth_date) VALUES (20, 'barbara', 'malvin', '12345123450', '2000-08-10');



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


INSERT INTO public.employers (id, company_name, web_address, phone_number) VALUES (10, 'Kodlama Io', 'kodlama.io', '202 555 0125');
INSERT INTO public.employers (id, company_name, web_address, phone_number) VALUES (14, 'YouTube', 'youtube.com', '212 689 5555');
INSERT INTO public.employers (id, company_name, web_address, phone_number) VALUES (15, 'Facebook', 'facebook.com', '212 655 2333');


INSERT INTO public.job_titles (id, title) VALUES (1, 'Software Developer');
INSERT INTO public.job_titles (id, title) VALUES (2, 'Software Architect');
INSERT INTO public.job_titles (id, title) VALUES (4, 'Software Lead');
INSERT INTO public.job_titles (id, title) VALUES (5, 'Front End');
INSERT INTO public.job_titles (id, title) VALUES (6, 'Back End');
INSERT INTO public.job_titles (id, title) VALUES (7, 'Full Stack');
INSERT INTO public.job_titles (id, title) VALUES (8, 'Full Stack 2');
INSERT INTO public.job_titles (id, title) VALUES (9, 'Lead Programmer');

INSERT INTO public.users (id, email_address, password) VALUES (1, 'dsadasqdsaasd@gmail.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (2, 'dsadasqdsaasd2@gmail.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (3, 'dsadasqds@gmail.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (4, 'assaddasasd@gmail.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (5, 'assaddasa@gmail.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (6, 'candidate@gmail.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (7, 'candidate2@gmail.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (10, 'engindemirog@kodlama.io', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (13, 'dsadsa@gm.com', '123465');
INSERT INTO public.users (id, email_address, password) VALUES (14, 'balbalbal@youtube.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (15, 'markzuckerberg@facebook.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (16, ' barbaramalvin@gmail.com', ' 123456');
INSERT INTO public.users (id, email_address, password) VALUES (17, 'martin@gmail.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (18, 'martin2@gmail.com', '123456');
INSERT INTO public.users (id, email_address, password) VALUES (19, 'barbaramalvin8@gmail.com', ' 123456');
INSERT INTO public.users (id, email_address, password) VALUES (20, 'ewqewqewqq@bbaba.com', '123456');


INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (5, 'woduzzqrtxytntqdzwduzcrhqbbhri', false, NULL);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (6, 'wjbcnaseydeiwxtkceyfxclvyequvn', false, NULL);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (10, 'jlqpqfjgyzejrszmzlqdqankyobpdj', false, 6);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (11, 'aybnhlksxkaxganpglgivlmkfonjrd', true, 7);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (12, 'kzjlyytsxqyazopotgvcvgerzdeboo', true, 10);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (9, 'adjcujzaumxpmfaecrykedbhalcgqa', true, 5);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (13, 'feolartdzeqslnkgbsymvoopjhieiq', true, 13);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (15, 'qfpgghjkoadzxbjesihtyxtsejqsdj', true, 15);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (16, 'hneiqyymxdstksfwjloujmekijcxvf', false, 16);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (17, 'fiigojbcgmryyvcqzofclmgqxqjygu', false, 17);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (18, 'lhjulctxuqhucgvgesxqoyxffoloub', false, 18);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (19, 'dszjoekvxfhkcyaqpfhfqtgoodxyjw', false, 19);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (14, 'jpqtjhuimqcnwzhsqxvaqkfqxybrsd', true, 14);
INSERT INTO public.verification_codes (id, code, is_verified, user_id) VALUES (20, 'obayghjsfbfqdehxrxtxvkknjprlbn', false, 20);



SELECT pg_catalog.setval('public.cities_id_seq', 81, true);



SELECT pg_catalog.setval('public.employee_confirms_id_seq', 1, false);



SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


SELECT pg_catalog.setval('public.job_titles_id_seq', 9, true);


SELECT pg_catalog.setval('public.users_id_seq', 21, true);



SELECT pg_catalog.setval('public.verification_codes_id_seq', 20, true);


ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_city_name_key UNIQUE (city_name);


ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT pk_candidates PRIMARY KEY (id);



ALTER TABLE ONLY public.employee_confirms
    ADD CONSTRAINT pk_employee_confirms PRIMARY KEY (id);



ALTER TABLE ONLY public.employee_confirms_employers
    ADD CONSTRAINT pk_employee_confirms_employers PRIMARY KEY (id);



ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (id);



ALTER TABLE ONLY public.employers
    ADD CONSTRAINT pk_employers PRIMARY KEY (id);



ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT pk_job_titles PRIMARY KEY (id);



ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);



ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT pk_verification_codes PRIMARY KEY (id);



ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT uc_candidates_identification_number UNIQUE (identification_number);




ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT uc_job_titles_title UNIQUE (title);




ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_users_email_address UNIQUE (email_address);



ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT uc_verification_codes_code UNIQUE (code);



ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT fk_candidates_users FOREIGN KEY (id) REFERENCES public.users(id) ON DELETE CASCADE;




ALTER TABLE ONLY public.employee_confirms
    ADD CONSTRAINT fk_employee_confirms_employees FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE CASCADE;



ALTER TABLE ONLY public.employee_confirms_employers
    ADD CONSTRAINT fk_employee_confirms_employers_employee_confirms FOREIGN KEY (id) REFERENCES public.employee_confirms(id) ON DELETE CASCADE;


ALTER TABLE ONLY public.employee_confirms_employers
    ADD CONSTRAINT fk_employee_confirms_employers_employers FOREIGN KEY (employer_id) REFERENCES public.employers(id) ON DELETE CASCADE;



ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_users FOREIGN KEY (id) REFERENCES public.users(id) ON DELETE CASCADE;


ALTER TABLE ONLY public.employers
    ADD CONSTRAINT fk_employers_users FOREIGN KEY (id) REFERENCES public.users(id) ON DELETE CASCADE;


ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT fk_vc FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;



ALTER TABLE ONLY public.job_advertisement
    ADD CONSTRAINT job_advertisement_employer_id_fkey FOREIGN KEY (employer_id) REFERENCES public.employers(id);



ALTER TABLE ONLY public.job_advertisement
    ADD CONSTRAINT job_advertisement_jobtitle_id_fkey FOREIGN KEY (jobtitle_id) REFERENCES public.job_titles(id);



GRANT SELECT,INSERT ON TABLE public.job_advertisement TO PUBLIC;

