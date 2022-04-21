--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application (
    id bigint NOT NULL,
    date_of_registration timestamp without time zone NOT NULL,
    problem_description character varying NOT NULL,
    category_relation_id bigint NOT NULL,
    person_id bigint NOT NULL
);


ALTER TABLE public.application OWNER TO postgres;

--
-- Name: application_delivery_Info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."application_delivery_Info" (
    id bigint NOT NULL,
    delivery_approval_by_worker boolean,
    delivery_approval_by_user boolean,
    application_schedule_id bigint NOT NULL
);


ALTER TABLE public."application_delivery_Info" OWNER TO postgres;

--
-- Name: application_delivery_Info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."application_delivery_Info_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."application_delivery_Info_id_seq" OWNER TO postgres;

--
-- Name: application_delivery_Info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."application_delivery_Info_id_seq" OWNED BY public."application_delivery_Info".id;


--
-- Name: application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_id_seq OWNER TO postgres;

--
-- Name: application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.application_id_seq OWNED BY public.application.id;


--
-- Name: application_pickup_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_pickup_info (
    id bigint NOT NULL,
    pickup_approval_by_worker boolean,
    pickup_approval_by_user boolean,
    application_schedule_id bigint NOT NULL
);


ALTER TABLE public.application_pickup_info OWNER TO postgres;

--
-- Name: application_pickup_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_pickup_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_pickup_info_id_seq OWNER TO postgres;

--
-- Name: application_pickup_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.application_pickup_info_id_seq OWNED BY public.application_pickup_info.id;


--
-- Name: application_reparation_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_reparation_price (
    id bigint NOT NULL,
    suggested_price_by_worker double precision,
    approval_by_user boolean,
    application_id bigint NOT NULL,
    payment_approval_by_worker boolean,
    worker_id bigint
);


ALTER TABLE public.application_reparation_price OWNER TO postgres;

--
-- Name: application_reparation_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_reparation_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_reparation_price_id_seq OWNER TO postgres;

--
-- Name: application_reparation_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.application_reparation_price_id_seq OWNED BY public.application_reparation_price.id;


--
-- Name: application_reparation_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_reparation_status (
    id bigint NOT NULL,
    reparation_status_id smallint NOT NULL,
    application_id bigint NOT NULL,
    worker_id bigint NOT NULL
);


ALTER TABLE public.application_reparation_status OWNER TO postgres;

--
-- Name: application_reparation_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_reparation_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_reparation_status_id_seq OWNER TO postgres;

--
-- Name: application_reparation_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.application_reparation_status_id_seq OWNED BY public.application_reparation_status.id;


--
-- Name: application_schedule_dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_schedule_dates (
    id bigint NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    user_approval boolean,
    application_id bigint NOT NULL,
    worker_id bigint NOT NULL
);


ALTER TABLE public.application_schedule_dates OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    description character varying(500) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: category_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_relation (
    id bigint NOT NULL,
    category_id integer NOT NULL,
    parent_category_id integer
);


ALTER TABLE public.category_relation OWNER TO postgres;

--
-- Name: category_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_relation_id_seq OWNER TO postgres;

--
-- Name: category_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_relation_id_seq OWNED BY public.category_relation.id;


--
-- Name: contact_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_info (
    id bigint NOT NULL,
    email character varying(500) NOT NULL,
    mobile_number character varying(10),
    person_id bigint NOT NULL
);


ALTER TABLE public.contact_info OWNER TO postgres;

--
-- Name: contact_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_info_id_seq OWNER TO postgres;

--
-- Name: contact_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_info_id_seq OWNED BY public.contact_info.id;


--
-- Name: login_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_info (
    id bigint NOT NULL,
    username character varying(200) NOT NULL,
    password character varying(4096) NOT NULL,
    person_id bigint NOT NULL
);


ALTER TABLE public.login_info OWNER TO postgres;

--
-- Name: login_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_info_id_seq OWNER TO postgres;

--
-- Name: login_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_info_id_seq OWNED BY public.login_info.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id bigint NOT NULL,
    first_name character varying(500) NOT NULL,
    last_name character varying(500) NOT NULL,
    personal_number character varying(13) NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: reparation_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reparation_status (
    id smallint NOT NULL,
    status_description character varying(100) NOT NULL
);


ALTER TABLE public.reparation_status OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id smallint NOT NULL,
    role_description character varying(100) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: schedule_date_ranges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schedule_date_ranges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedule_date_ranges_id_seq OWNER TO postgres;

--
-- Name: schedule_date_ranges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schedule_date_ranges_id_seq OWNED BY public.application_schedule_dates.id;


--
-- Name: application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application ALTER COLUMN id SET DEFAULT nextval('public.application_id_seq'::regclass);


--
-- Name: application_delivery_Info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."application_delivery_Info" ALTER COLUMN id SET DEFAULT nextval('public."application_delivery_Info_id_seq"'::regclass);


--
-- Name: application_pickup_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_pickup_info ALTER COLUMN id SET DEFAULT nextval('public.application_pickup_info_id_seq'::regclass);


--
-- Name: application_reparation_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_reparation_price ALTER COLUMN id SET DEFAULT nextval('public.application_reparation_price_id_seq'::regclass);


--
-- Name: application_reparation_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_reparation_status ALTER COLUMN id SET DEFAULT nextval('public.application_reparation_status_id_seq'::regclass);


--
-- Name: application_schedule_dates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_schedule_dates ALTER COLUMN id SET DEFAULT nextval('public.schedule_date_ranges_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: category_relation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_relation ALTER COLUMN id SET DEFAULT nextval('public.category_relation_id_seq'::regclass);


--
-- Name: contact_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_info ALTER COLUMN id SET DEFAULT nextval('public.contact_info_id_seq'::regclass);


--
-- Name: login_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_info ALTER COLUMN id SET DEFAULT nextval('public.login_info_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application (id, date_of_registration, problem_description, category_relation_id, person_id) FROM stdin;
1	2022-04-19 15:23:39.656627	Problem Description	1	2
4	2022-04-19 15:35:03.794308	Problem Description	2	2
2	2022-04-19 15:34:31.033987	Problem Description	3	2
\.


--
-- Data for Name: application_delivery_Info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."application_delivery_Info" (id, delivery_approval_by_worker, delivery_approval_by_user, application_schedule_id) FROM stdin;
\.


--
-- Data for Name: application_pickup_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_pickup_info (id, pickup_approval_by_worker, pickup_approval_by_user, application_schedule_id) FROM stdin;
\.


--
-- Data for Name: application_reparation_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_reparation_price (id, suggested_price_by_worker, approval_by_user, application_id, payment_approval_by_worker, worker_id) FROM stdin;
1	1500	t	1	\N	2
\.


--
-- Data for Name: application_reparation_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_reparation_status (id, reparation_status_id, application_id, worker_id) FROM stdin;
2	2	2	2
1	3	1	1
\.


--
-- Data for Name: application_schedule_dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_schedule_dates (id, start_date, end_date, user_approval, application_id, worker_id) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, description) FROM stdin;
1	Electronics
2	furniture
3	laptop
4	others
5	trees
\.


--
-- Data for Name: category_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_relation (id, category_id, parent_category_id) FROM stdin;
3	3	1
1	1	0
2	2	0
\.


--
-- Data for Name: contact_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_info (id, email, mobile_number, person_id) FROM stdin;
1	test2.testerino2@test.test	0728121212	1
2	test3.testerino2@test.test	0728153212	2
\.


--
-- Data for Name: login_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_info (id, username, password, person_id) FROM stdin;
2	Testo22	Testoo122	2
1	Testo33	Testoo122	1
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, first_name, last_name, personal_number, role_id) FROM stdin;
1	garo	Last	19150102-1222	2
2	Test4	Last	19940202-2202	3
\.


--
-- Data for Name: reparation_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reparation_status (id, status_description) FROM stdin;
1	reviewed
2	accepted
3	picked up
4	being fixed
5	finished
6	delivered
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, role_description) FROM stdin;
1	administrator
2	worker
3	user
4	test
\.


--
-- Name: application_delivery_Info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."application_delivery_Info_id_seq"', 1, false);


--
-- Name: application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_id_seq', 5, true);


--
-- Name: application_pickup_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_pickup_info_id_seq', 1, false);


--
-- Name: application_reparation_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_reparation_price_id_seq', 1, true);


--
-- Name: application_reparation_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_reparation_status_id_seq', 1, false);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 5, true);


--
-- Name: category_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_relation_id_seq', 3, true);


--
-- Name: contact_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_info_id_seq', 2, true);


--
-- Name: login_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_info_id_seq', 2, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 2, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 4, true);


--
-- Name: schedule_date_ranges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedule_date_ranges_id_seq', 1, false);


--
-- Name: application_delivery_Info application_delivery_Info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."application_delivery_Info"
    ADD CONSTRAINT "application_delivery_Info_pkey" PRIMARY KEY (id);


--
-- Name: application_pickup_info application_pickup_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_pickup_info
    ADD CONSTRAINT application_pickup_info_pkey PRIMARY KEY (id);


--
-- Name: application application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_pkey PRIMARY KEY (id);


--
-- Name: application_reparation_price application_reparation_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_reparation_price
    ADD CONSTRAINT application_reparation_price_pkey PRIMARY KEY (id);


--
-- Name: application_reparation_status application_reparation_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_reparation_status
    ADD CONSTRAINT application_reparation_status_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: category_relation category_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_relation
    ADD CONSTRAINT category_relation_pkey PRIMARY KEY (id);


--
-- Name: contact_info contact_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_info
    ADD CONSTRAINT contact_info_pkey PRIMARY KEY (id);


--
-- Name: login_info login_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_info
    ADD CONSTRAINT login_info_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: reparation_status reperation_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reparation_status
    ADD CONSTRAINT reperation_status_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: application_schedule_dates schedule_date_ranges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_schedule_dates
    ADD CONSTRAINT schedule_date_ranges_pkey PRIMARY KEY (id);


--
-- Name: application_reparation_status application_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_reparation_status
    ADD CONSTRAINT application_id FOREIGN KEY (application_id) REFERENCES public.application(id);


--
-- Name: application_reparation_price application_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_reparation_price
    ADD CONSTRAINT application_id FOREIGN KEY (application_id) REFERENCES public.application(id);


--
-- Name: application_schedule_dates application_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_schedule_dates
    ADD CONSTRAINT application_id FOREIGN KEY (application_id) REFERENCES public.application(id);


--
-- Name: application_pickup_info application_schedule_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_pickup_info
    ADD CONSTRAINT application_schedule_id FOREIGN KEY (application_schedule_id) REFERENCES public.application_schedule_dates(id);


--
-- Name: application_delivery_Info application_schedule_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."application_delivery_Info"
    ADD CONSTRAINT application_schedule_id FOREIGN KEY (application_schedule_id) REFERENCES public.application_schedule_dates(id);


--
-- Name: category_relation category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_relation
    ADD CONSTRAINT category_id FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: application category_relation_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT category_relation_id FOREIGN KEY (category_relation_id) REFERENCES public.category_relation(id);


--
-- Name: login_info person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_info
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: contact_info person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_info
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES public.person(id) NOT VALID;


--
-- Name: application person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: application_reparation_status reparation_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_reparation_status
    ADD CONSTRAINT reparation_status_id FOREIGN KEY (reparation_status_id) REFERENCES public.reparation_status(id);


--
-- Name: person role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: application_reparation_status worker_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_reparation_status
    ADD CONSTRAINT worker_id FOREIGN KEY (worker_id) REFERENCES public.person(id);


--
-- Name: application_schedule_dates worker_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_schedule_dates
    ADD CONSTRAINT worker_id FOREIGN KEY (worker_id) REFERENCES public.person(id) NOT VALID;


--
-- Name: application_reparation_price worker_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_reparation_price
    ADD CONSTRAINT worker_id FOREIGN KEY (worker_id) REFERENCES public.person(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

