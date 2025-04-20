--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1 (Debian 17.1-1.pgdg120+1)
-- Dumped by pg_dump version 17.1 (Debian 17.1-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Delivery; Type: TABLE; Schema: public; Owner: order_user
--

CREATE TABLE public."Delivery" (
    id integer NOT NULL,
    order_id integer NOT NULL,
    address text NOT NULL,
    status text NOT NULL,
    delivery_date timestamp(3) without time zone
);


ALTER TABLE public."Delivery" OWNER TO order_user;

--
-- Name: Delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: order_user
--

CREATE SEQUENCE public."Delivery_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Delivery_id_seq" OWNER TO order_user;

--
-- Name: Delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: order_user
--

ALTER SEQUENCE public."Delivery_id_seq" OWNED BY public."Delivery".id;


--
-- Name: Order; Type: TABLE; Schema: public; Owner: order_user
--

CREATE TABLE public."Order" (
    id integer NOT NULL,
    user_id text NOT NULL,
    status text NOT NULL,
    payment_id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    total_amount double precision NOT NULL
);


ALTER TABLE public."Order" OWNER TO order_user;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: order_user
--

CREATE TABLE public."OrderItem" (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public."OrderItem" OWNER TO order_user;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE; Schema: public; Owner: order_user
--

CREATE SEQUENCE public."OrderItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrderItem_id_seq" OWNER TO order_user;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: order_user
--

ALTER SEQUENCE public."OrderItem_id_seq" OWNED BY public."OrderItem".id;


--
-- Name: Order_id_seq; Type: SEQUENCE; Schema: public; Owner: order_user
--

CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Order_id_seq" OWNER TO order_user;

--
-- Name: Order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: order_user
--

ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: order_user
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


ALTER TABLE public._prisma_migrations OWNER TO order_user;

--
-- Name: Delivery id; Type: DEFAULT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public."Delivery" ALTER COLUMN id SET DEFAULT nextval('public."Delivery_id_seq"'::regclass);


--
-- Name: Order id; Type: DEFAULT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);


--
-- Name: OrderItem id; Type: DEFAULT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public."OrderItem" ALTER COLUMN id SET DEFAULT nextval('public."OrderItem_id_seq"'::regclass);


--
-- Data for Name: Delivery; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public."Delivery" (id, order_id, address, status, delivery_date) FROM stdin;
1	1	123 Main St	Pending	2024-12-15 00:00:00
2	2	123 Main St	Pending	2024-12-15 00:00:00
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public."Order" (id, user_id, status, payment_id, created_at, updated_at, total_amount) FROM stdin;
1	db0703a0-0850-456c-9422-25d0f5ec9556	Pending	PAY123	2024-12-12 06:02:41.755	2024-12-12 06:02:41.755	150.75
2	ff3f3245-9c6a-4a2c-96e9-9b4accac529f	Pending	PAY125	2024-12-12 06:07:19.248	2024-12-12 06:07:19.248	120.75
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public."OrderItem" (id, order_id, product_id, quantity, price) FROM stdin;
1	1	1	2	50.25
2	1	2	1	100.5
3	2	4	2	50.25
4	2	2	1	100.5
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
b4dc22a5-b39f-4e1b-99fa-e2c64c57346d	5b7e1f19c97e631110e89a9d3b73c127ceee2b502ec27e8395936a71a68154b8	2024-12-10 12:21:03.935778+00	20241210122103_initial	\N	\N	2024-12-10 12:21:03.92215+00	1
3c7dd9f2-e7f4-4738-9580-e045548a4b69	3941f4cb4704503e2684aa26623b56fdbc1651fd89dba5d826424a62a08df26f	2024-12-12 06:02:09.296579+00	20241211094227_rename_totalamount	\N	\N	2024-12-12 06:02:09.287753+00	1
\.


--
-- Name: Delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: order_user
--

SELECT pg_catalog.setval('public."Delivery_id_seq"', 2, true);


--
-- Name: OrderItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: order_user
--

SELECT pg_catalog.setval('public."OrderItem_id_seq"', 4, true);


--
-- Name: Order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: order_user
--

SELECT pg_catalog.setval('public."Order_id_seq"', 2, true);


--
-- Name: Delivery Delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public."Delivery"
    ADD CONSTRAINT "Delivery_pkey" PRIMARY KEY (id);


--
-- Name: OrderItem OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Delivery_order_id_key; Type: INDEX; Schema: public; Owner: order_user
--

CREATE UNIQUE INDEX "Delivery_order_id_key" ON public."Delivery" USING btree (order_id);


--
-- Name: Delivery Delivery_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public."Delivery"
    ADD CONSTRAINT "Delivery_order_id_fkey" FOREIGN KEY (order_id) REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrderItem OrderItem_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_order_id_fkey" FOREIGN KEY (order_id) REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT CREATE ON SCHEMA public TO order_user;


--
-- PostgreSQL database dump complete
--

