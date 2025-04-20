--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3 (Debian 17.3-3.pgdg120+1)
-- Dumped by pg_dump version 17.3 (Debian 17.3-3.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: LogLevel; Type: TYPE; Schema: public; Owner: admin_user
--

CREATE TYPE public."LogLevel" AS ENUM (
    'SUCCESS',
    'INFO',
    'WARN',
    'ERROR'
);


ALTER TYPE public."LogLevel" OWNER TO admin_user;

--
-- Name: ServiceStatus; Type: TYPE; Schema: public; Owner: admin_user
--

CREATE TYPE public."ServiceStatus" AS ENUM (
    'ACTIVE',
    'INACTIVE'
);


ALTER TYPE public."ServiceStatus" OWNER TO admin_user;

--
-- Name: UserRoles; Type: TYPE; Schema: public; Owner: admin_user
--

CREATE TYPE public."UserRoles" AS ENUM (
    'ADMIN',
    'CUSTOMER_CARE',
    'INVENTORY_MANAGER',
    'SHIPPING_MANAGER',
    'USER',
    'SUPERUSER'
);


ALTER TYPE public."UserRoles" OWNER TO admin_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Log; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public."Log" (
    id integer NOT NULL,
    "serviceId" integer NOT NULL,
    message text NOT NULL,
    level public."LogLevel" DEFAULT 'INFO'::public."LogLevel" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Log" OWNER TO admin_user;

--
-- Name: Log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public."Log_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Log_id_seq" OWNER TO admin_user;

--
-- Name: Log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public."Log_id_seq" OWNED BY public."Log".id;


--
-- Name: Notification; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public."Notification" (
    id integer NOT NULL,
    "userId" text NOT NULL,
    message text NOT NULL,
    read boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Notification" OWNER TO admin_user;

--
-- Name: Notification_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public."Notification_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Notification_id_seq" OWNER TO admin_user;

--
-- Name: Notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public."Notification_id_seq" OWNED BY public."Notification".id;


--
-- Name: Service; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public."Service" (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    status public."ServiceStatus" DEFAULT 'ACTIVE'::public."ServiceStatus" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Service" OWNER TO admin_user;

--
-- Name: ServiceUserRole; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public."ServiceUserRole" (
    id integer NOT NULL,
    "serviceId" integer NOT NULL,
    role public."UserRoles" NOT NULL
);


ALTER TABLE public."ServiceUserRole" OWNER TO admin_user;

--
-- Name: ServiceUserRole_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public."ServiceUserRole_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ServiceUserRole_id_seq" OWNER TO admin_user;

--
-- Name: ServiceUserRole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public."ServiceUserRole_id_seq" OWNED BY public."ServiceUserRole".id;


--
-- Name: Service_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_user
--

CREATE SEQUENCE public."Service_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Service_id_seq" OWNER TO admin_user;

--
-- Name: Service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_user
--

ALTER SEQUENCE public."Service_id_seq" OWNED BY public."Service".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    address text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    phone text NOT NULL,
    role public."UserRoles" DEFAULT 'USER'::public."UserRoles" NOT NULL
);


ALTER TABLE public."User" OWNER TO admin_user;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: admin_user
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO admin_user;

--
-- Name: Log id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."Log" ALTER COLUMN id SET DEFAULT nextval('public."Log_id_seq"'::regclass);


--
-- Name: Notification id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."Notification" ALTER COLUMN id SET DEFAULT nextval('public."Notification_id_seq"'::regclass);


--
-- Name: Service id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."Service" ALTER COLUMN id SET DEFAULT nextval('public."Service_id_seq"'::regclass);


--
-- Name: ServiceUserRole id; Type: DEFAULT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."ServiceUserRole" ALTER COLUMN id SET DEFAULT nextval('public."ServiceUserRole_id_seq"'::regclass);


--
-- Data for Name: Log; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public."Log" (id, "serviceId", message, level, "createdAt") FROM stdin;
1	1	A new user has been registered	SUCCESS	2025-02-26 11:53:25.732
2	1	user registration failed	ERROR	2025-02-26 11:55:33.605
3	1	User did not validate OTP	WARN	2025-02-26 11:56:06.406
4	1	34 users has been registered so far	INFO	2025-02-26 11:56:34.322
5	1	New user registration	SUCCESS	2025-02-26 11:57:30.353
6	2	New user update billing address	SUCCESS	2025-02-26 11:58:03.47
7	2	OTP has been sent	SUCCESS	2025-02-26 11:58:22.591
8	2	Updated personal Info	INFO	2025-02-26 11:59:22.707
9	2	Deleted shipping address	ERROR	2025-02-26 12:00:06.562
10	2	Deleting shipping address	WARN	2025-02-26 12:03:25.812
11	6	Added new SKU	SUCCESS	2025-02-26 13:41:05.509
\.


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public."Notification" (id, "userId", message, read, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Service; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public."Service" (id, name, description, status, "createdAt", "updatedAt") FROM stdin;
1	Authentication Service	Handles login, registration, and authentication for users.	ACTIVE	2025-02-26 11:24:38.735	2025-02-26 11:24:38.735
2	User Service	Stores personal info, shipping address, OTP handling, etc.	ACTIVE	2025-02-26 11:26:30.734	2025-02-26 11:26:30.734
3	Order Service	Allows users to purchase and order products.	ACTIVE	2025-02-26 11:26:48.5	2025-02-26 11:26:48.5
4	Pad Vending Service	Allows users to dispense sanitary pads from IoT devices.	ACTIVE	2025-02-26 11:27:06.123	2025-02-26 11:27:06.123
5	Payment Service	Handles payments.	ACTIVE	2025-02-26 11:27:16.3	2025-02-26 11:27:16.3
6	Inventory Service	Maintains products.	ACTIVE	2025-02-26 11:27:24.697	2025-02-26 11:27:24.697
7	Product Service	Provides product types and product catalog, brands, etc.	ACTIVE	2025-02-26 11:27:39.729	2025-02-26 11:27:39.729
\.


--
-- Data for Name: ServiceUserRole; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public."ServiceUserRole" (id, "serviceId", role) FROM stdin;
1	1	SUPERUSER
2	2	SUPERUSER
3	3	SUPERUSER
4	4	SUPERUSER
5	5	SUPERUSER
6	6	SUPERUSER
7	7	SUPERUSER
8	2	ADMIN
9	2	CUSTOMER_CARE
10	3	ADMIN
11	3	INVENTORY_MANAGER
12	3	SHIPPING_MANAGER
13	4	ADMIN
14	4	INVENTORY_MANAGER
15	4	USER
16	4	CUSTOMER_CARE
17	5	ADMIN
18	5	CUSTOMER_CARE
19	6	ADMIN
20	6	INVENTORY_MANAGER
21	7	ADMIN
22	7	SHIPPING_MANAGER
23	7	INVENTORY_MANAGER
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public."User" (id, email, password, "createdAt", "updatedAt", address, "firstName", "lastName", phone, role) FROM stdin;
220a0177-7a1c-448e-8c76-da8c8adddabf	hasan@vertical-innovations.com	$2b$08$2oV0kaVEfqpaA3m1xGXRLORMkX3Y0bCbm7GxmZ45JDf3QqlRuzds6	2025-02-25 07:48:58.45	2025-02-25 07:48:58.45	BijoyNagar, Dhaka.	Hasan	Habib	+8801969791730	SUPERUSER
748c69f3-4cf7-4133-99d3-3e046cf023d4	jony@vertical-innovations.com	$2b$08$Mfqi8daroZiIp2bFn8Qe/.3h.ZMEevp44uXKzVH2ED.ynasgyb3ui	2025-02-26 08:26:05.126	2025-02-26 08:26:05.126	BashTola, Dhaka.	Tohidul	Islam	+88063746634	INVENTORY_MANAGER
5ae67123-e53c-4866-8c25-9eaca10c93ec	pabel@vertical-innovations.com	$2b$08$PV7HxeqDS/imYvYn2QuJY.q1cJz3ZUeBQBlnN26fpBvNfolpaJ2A6	2025-02-26 13:00:10.906	2025-02-26 13:00:10.906	BashTola, Dhaka.	Md.	Pabel	+8801785958694	CUSTOMER_CARE
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: admin_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
60c72823-dbda-4edd-9045-17dd0a1338f2	14accd7ab4e7eb0c00257b56fce2e2f57b40897a470e21d50f7cb7f45a2743ed	2025-02-24 11:45:53.505638+00	20250224105407_init	\N	\N	2025-02-24 11:45:53.482493+00	1
5a57c6a7-2875-4846-9f69-ef9767276b89	0950b5170f425d0f79de28dc60fc65556b4c493871d62fffbece393b1e5b572e	2025-02-24 11:45:53.510501+00	20250224111847_added_superuser	\N	\N	2025-02-24 11:45:53.506831+00	1
32c59659-710a-44ac-b23b-6008b0f1f2c7	ee3da5ff3965b6dda87ada18b198ecf80da8bd9cf4aac833be3f71e42f3fba4f	2025-02-24 11:45:53.53299+00	20250224112556_added_uuid	\N	\N	2025-02-24 11:45:53.511638+00	1
9e767efc-6026-43f2-92b4-71425db2e6ad	241e0e19618a145552e7591b7c4039b45b16e4e776293b2e8eb5362b360f554b	2025-02-25 05:29:31.417298+00	20250225052931_add_personal_info_optional	\N	\N	2025-02-25 05:29:31.410573+00	1
5b4dfa48-e5ea-4050-82fb-cbc60444737b	04dbe52568488b2e761f73d1fd5551e8ba367e6170eb38be887a727e5e8eb5a1	2025-02-26 07:01:19.607616+00	20250226070119_removed_role	\N	\N	2025-02-26 07:01:19.538757+00	1
fd50fd7a-499a-4fd6-b307-b3ba3479f544	aeba8e82bda5f093b59b514ba6ce9269db3d13004b9e9e60e69d58134e4ac70c	2025-02-26 12:55:37.714625+00	20250226125537_added	\N	\N	2025-02-26 12:55:37.636999+00	1
dc58ae57-2396-4c42-a8ef-7644b11245e9	60a6bf23da6b35e6a5af7aec17dd6a86058df802e2c433018148c38ed5e490cc	2025-02-26 13:06:01.383227+00	20250226130601_added	\N	\N	2025-02-26 13:06:01.371509+00	1
\.


--
-- Name: Log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public."Log_id_seq"', 11, true);


--
-- Name: Notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public."Notification_id_seq"', 1, false);


--
-- Name: ServiceUserRole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public."ServiceUserRole_id_seq"', 23, true);


--
-- Name: Service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_user
--

SELECT pg_catalog.setval('public."Service_id_seq"', 7, true);


--
-- Name: Log Log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."Log"
    ADD CONSTRAINT "Log_pkey" PRIMARY KEY (id);


--
-- Name: Notification Notification_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);


--
-- Name: ServiceUserRole ServiceUserRole_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."ServiceUserRole"
    ADD CONSTRAINT "ServiceUserRole_pkey" PRIMARY KEY (id);


--
-- Name: Service Service_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."Service"
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: admin_user
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Log Log_serviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."Log"
    ADD CONSTRAINT "Log_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES public."Service"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Notification Notification_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ServiceUserRole ServiceUserRole_serviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin_user
--

ALTER TABLE ONLY public."ServiceUserRole"
    ADD CONSTRAINT "ServiceUserRole_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES public."Service"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT CREATE ON SCHEMA public TO admin_user;


--
-- PostgreSQL database dump complete
--

