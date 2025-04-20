--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

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
-- Name: MovementType; Type: TYPE; Schema: public; Owner: inventory_user
--

CREATE TYPE public."MovementType" AS ENUM (
    'RESTOCK',
    'SALE',
    'RETURN',
    'ADJUSTMENT'
);


ALTER TYPE public."MovementType" OWNER TO inventory_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: InventoryItem; Type: TABLE; Schema: public; Owner: inventory_user
--

CREATE TABLE public."InventoryItem" (
    id integer NOT NULL,
    product_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    unit_price double precision DEFAULT 0.0 NOT NULL,
    reorder_level integer DEFAULT 10 NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sku character varying(50) NOT NULL
);


ALTER TABLE public."InventoryItem" OWNER TO inventory_user;

--
-- Name: InventoryItem_id_seq; Type: SEQUENCE; Schema: public; Owner: inventory_user
--

CREATE SEQUENCE public."InventoryItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."InventoryItem_id_seq" OWNER TO inventory_user;

--
-- Name: InventoryItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inventory_user
--

ALTER SEQUENCE public."InventoryItem_id_seq" OWNED BY public."InventoryItem".id;


--
-- Name: PurchaseOrder; Type: TABLE; Schema: public; Owner: inventory_user
--

CREATE TABLE public."PurchaseOrder" (
    id integer NOT NULL,
    supplier_id integer NOT NULL,
    total_price double precision DEFAULT 0.0 NOT NULL,
    status character varying(50) NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PurchaseOrder" OWNER TO inventory_user;

--
-- Name: PurchaseOrder_id_seq; Type: SEQUENCE; Schema: public; Owner: inventory_user
--

CREATE SEQUENCE public."PurchaseOrder_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PurchaseOrder_id_seq" OWNER TO inventory_user;

--
-- Name: PurchaseOrder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inventory_user
--

ALTER SEQUENCE public."PurchaseOrder_id_seq" OWNED BY public."PurchaseOrder".id;


--
-- Name: StockMovement; Type: TABLE; Schema: public; Owner: inventory_user
--

CREATE TABLE public."StockMovement" (
    movement_id text NOT NULL,
    product_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    inventory_id integer NOT NULL,
    movement_type public."MovementType" NOT NULL,
    quantity integer NOT NULL,
    movement_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    reason text
);


ALTER TABLE public."StockMovement" OWNER TO inventory_user;

--
-- Name: Supplier; Type: TABLE; Schema: public; Owner: inventory_user
--

CREATE TABLE public."Supplier" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    contact text,
    email text,
    address text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Supplier" OWNER TO inventory_user;

--
-- Name: Supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: inventory_user
--

CREATE SEQUENCE public."Supplier_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Supplier_id_seq" OWNER TO inventory_user;

--
-- Name: Supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inventory_user
--

ALTER SEQUENCE public."Supplier_id_seq" OWNED BY public."Supplier".id;


--
-- Name: Warehouse; Type: TABLE; Schema: public; Owner: inventory_user
--

CREATE TABLE public."Warehouse" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    location text,
    manager_name character varying(255) NOT NULL,
    manager_phone character varying(20),
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Warehouse" OWNER TO inventory_user;

--
-- Name: Warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: inventory_user
--

CREATE SEQUENCE public."Warehouse_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Warehouse_id_seq" OWNER TO inventory_user;

--
-- Name: Warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inventory_user
--

ALTER SEQUENCE public."Warehouse_id_seq" OWNED BY public."Warehouse".id;


--
-- Name: InventoryItem id; Type: DEFAULT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."InventoryItem" ALTER COLUMN id SET DEFAULT nextval('public."InventoryItem_id_seq"'::regclass);


--
-- Name: PurchaseOrder id; Type: DEFAULT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."PurchaseOrder" ALTER COLUMN id SET DEFAULT nextval('public."PurchaseOrder_id_seq"'::regclass);


--
-- Name: Supplier id; Type: DEFAULT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."Supplier" ALTER COLUMN id SET DEFAULT nextval('public."Supplier_id_seq"'::regclass);


--
-- Name: Warehouse id; Type: DEFAULT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."Warehouse" ALTER COLUMN id SET DEFAULT nextval('public."Warehouse_id_seq"'::regclass);


--
-- Data for Name: InventoryItem; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public."InventoryItem" (id, product_id, warehouse_id, quantity, unit_price, reorder_level, created_at, updated_at, sku) FROM stdin;
\.


--
-- Data for Name: PurchaseOrder; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public."PurchaseOrder" (id, supplier_id, total_price, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: StockMovement; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public."StockMovement" (movement_id, product_id, warehouse_id, inventory_id, movement_type, quantity, movement_date, reason) FROM stdin;
\.


--
-- Data for Name: Supplier; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public."Supplier" (id, name, contact, email, address, created_at, updated_at) FROM stdin;
1	ABC Supplies	+8801969791730	abc@supplies.com	123 Warehouse Street, NY	2025-02-06 08:02:18.231	2025-02-06 08:02:18.231
2	SMC	01863827212	smc@supplies.com	Mohakhali, dhaka, bangladesh	2025-02-06 11:35:45.047	2025-02-06 11:35:45.047
\.


--
-- Data for Name: Warehouse; Type: TABLE DATA; Schema: public; Owner: inventory_user
--

COPY public."Warehouse" (id, name, location, manager_name, manager_phone, created_at, updated_at) FROM stdin;
\.


--
-- Name: InventoryItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inventory_user
--

SELECT pg_catalog.setval('public."InventoryItem_id_seq"', 1, false);


--
-- Name: PurchaseOrder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inventory_user
--

SELECT pg_catalog.setval('public."PurchaseOrder_id_seq"', 1, false);


--
-- Name: Supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inventory_user
--

SELECT pg_catalog.setval('public."Supplier_id_seq"', 2, true);


--
-- Name: Warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inventory_user
--

SELECT pg_catalog.setval('public."Warehouse_id_seq"', 1, false);


--
-- Name: InventoryItem InventoryItem_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."InventoryItem"
    ADD CONSTRAINT "InventoryItem_pkey" PRIMARY KEY (id);


--
-- Name: PurchaseOrder PurchaseOrder_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."PurchaseOrder"
    ADD CONSTRAINT "PurchaseOrder_pkey" PRIMARY KEY (id);


--
-- Name: StockMovement StockMovement_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."StockMovement"
    ADD CONSTRAINT "StockMovement_pkey" PRIMARY KEY (movement_id);


--
-- Name: Supplier Supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."Supplier"
    ADD CONSTRAINT "Supplier_pkey" PRIMARY KEY (id);


--
-- Name: Warehouse Warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."Warehouse"
    ADD CONSTRAINT "Warehouse_pkey" PRIMARY KEY (id);


--
-- Name: InventoryItem_sku_key; Type: INDEX; Schema: public; Owner: inventory_user
--

CREATE UNIQUE INDEX "InventoryItem_sku_key" ON public."InventoryItem" USING btree (sku);


--
-- Name: Supplier_email_key; Type: INDEX; Schema: public; Owner: inventory_user
--

CREATE UNIQUE INDEX "Supplier_email_key" ON public."Supplier" USING btree (email);


--
-- Name: InventoryItem InventoryItem_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."InventoryItem"
    ADD CONSTRAINT "InventoryItem_warehouse_id_fkey" FOREIGN KEY (warehouse_id) REFERENCES public."Warehouse"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PurchaseOrder PurchaseOrder_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."PurchaseOrder"
    ADD CONSTRAINT "PurchaseOrder_supplier_id_fkey" FOREIGN KEY (supplier_id) REFERENCES public."Supplier"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: StockMovement StockMovement_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."StockMovement"
    ADD CONSTRAINT "StockMovement_inventory_id_fkey" FOREIGN KEY (inventory_id) REFERENCES public."InventoryItem"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: StockMovement StockMovement_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: inventory_user
--

ALTER TABLE ONLY public."StockMovement"
    ADD CONSTRAINT "StockMovement_warehouse_id_fkey" FOREIGN KEY (warehouse_id) REFERENCES public."Warehouse"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT CREATE ON SCHEMA public TO inventory_user;


--
-- PostgreSQL database dump complete
--

