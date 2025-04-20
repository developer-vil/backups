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
-- Name: ProductServiceBrand; Type: TABLE; Schema: public; Owner: product_user
--

CREATE TABLE public."ProductServiceBrand" (
    id integer NOT NULL,
    brand character varying(255) NOT NULL,
    created_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    image_url character varying(255),
    manufacturer_id integer NOT NULL,
    updated_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ProductServiceBrand" OWNER TO product_user;

--
-- Name: ProductServiceBrand_id_seq; Type: SEQUENCE; Schema: public; Owner: product_user
--

CREATE SEQUENCE public."ProductServiceBrand_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ProductServiceBrand_id_seq" OWNER TO product_user;

--
-- Name: ProductServiceBrand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: product_user
--

ALTER SEQUENCE public."ProductServiceBrand_id_seq" OWNED BY public."ProductServiceBrand".id;


--
-- Name: ProductServiceCategory; Type: TABLE; Schema: public; Owner: product_user
--

CREATE TABLE public."ProductServiceCategory" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    image text
);


ALTER TABLE public."ProductServiceCategory" OWNER TO product_user;

--
-- Name: ProductServiceCategory_id_seq; Type: SEQUENCE; Schema: public; Owner: product_user
--

CREATE SEQUENCE public."ProductServiceCategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ProductServiceCategory_id_seq" OWNER TO product_user;

--
-- Name: ProductServiceCategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: product_user
--

ALTER SEQUENCE public."ProductServiceCategory_id_seq" OWNED BY public."ProductServiceCategory".id;


--
-- Name: ProductServiceProductManufacturer; Type: TABLE; Schema: public; Owner: product_user
--

CREATE TABLE public."ProductServiceProductManufacturer" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image text,
    created_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ProductServiceProductManufacturer" OWNER TO product_user;

--
-- Name: ProductServiceProductManufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: product_user
--

CREATE SEQUENCE public."ProductServiceProductManufacturer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ProductServiceProductManufacturer_id_seq" OWNER TO product_user;

--
-- Name: ProductServiceProductManufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: product_user
--

ALTER SEQUENCE public."ProductServiceProductManufacturer_id_seq" OWNED BY public."ProductServiceProductManufacturer".id;


--
-- Name: ProductServiceProductType; Type: TABLE; Schema: public; Owner: product_user
--

CREATE TABLE public."ProductServiceProductType" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    image text[],
    discount double precision DEFAULT 0.0 NOT NULL,
    features text[],
    aux_size character varying(50),
    brand_id integer NOT NULL,
    created_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    how_to_use text[],
    pack_size integer DEFAULT 0 NOT NULL,
    product_class character varying(100) NOT NULL,
    product_system character varying(20),
    subcategory_id integer NOT NULL,
    unit_price double precision DEFAULT 0.0 NOT NULL,
    updated_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tags text[]
);


ALTER TABLE public."ProductServiceProductType" OWNER TO product_user;

--
-- Name: ProductServiceProductType_id_seq; Type: SEQUENCE; Schema: public; Owner: product_user
--

CREATE SEQUENCE public."ProductServiceProductType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ProductServiceProductType_id_seq" OWNER TO product_user;

--
-- Name: ProductServiceProductType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: product_user
--

ALTER SEQUENCE public."ProductServiceProductType_id_seq" OWNED BY public."ProductServiceProductType".id;


--
-- Name: ProductServiceSubcategory; Type: TABLE; Schema: public; Owner: product_user
--

CREATE TABLE public."ProductServiceSubcategory" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    image text,
    category_id integer NOT NULL
);


ALTER TABLE public."ProductServiceSubcategory" OWNER TO product_user;

--
-- Name: ProductServiceSubcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: product_user
--

CREATE SEQUENCE public."ProductServiceSubcategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ProductServiceSubcategory_id_seq" OWNER TO product_user;

--
-- Name: ProductServiceSubcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: product_user
--

ALTER SEQUENCE public."ProductServiceSubcategory_id_seq" OWNED BY public."ProductServiceSubcategory".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: product_user
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


ALTER TABLE public._prisma_migrations OWNER TO product_user;

--
-- Name: ProductServiceBrand id; Type: DEFAULT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceBrand" ALTER COLUMN id SET DEFAULT nextval('public."ProductServiceBrand_id_seq"'::regclass);


--
-- Name: ProductServiceCategory id; Type: DEFAULT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceCategory" ALTER COLUMN id SET DEFAULT nextval('public."ProductServiceCategory_id_seq"'::regclass);


--
-- Name: ProductServiceProductManufacturer id; Type: DEFAULT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceProductManufacturer" ALTER COLUMN id SET DEFAULT nextval('public."ProductServiceProductManufacturer_id_seq"'::regclass);


--
-- Name: ProductServiceProductType id; Type: DEFAULT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceProductType" ALTER COLUMN id SET DEFAULT nextval('public."ProductServiceProductType_id_seq"'::regclass);


--
-- Name: ProductServiceSubcategory id; Type: DEFAULT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceSubcategory" ALTER COLUMN id SET DEFAULT nextval('public."ProductServiceSubcategory_id_seq"'::regclass);


--
-- Data for Name: ProductServiceBrand; Type: TABLE DATA; Schema: public; Owner: product_user
--

COPY public."ProductServiceBrand" (id, brand, created_date, image_url, manufacturer_id, updated_date) FROM stdin;
3	Pantene	2024-01-03 00:00:00	pantene-logo.png	3	2024-01-12 00:00:00
4	Neutrogena	2024-01-04 00:00:00	neutrogena-logo.png	4	2024-01-13 00:00:00
5	Clinique	2024-01-05 00:00:00	clinique-logo.png	5	2024-01-14 00:00:00
7	Loreal Paris	2024-01-07 00:00:00	loreal-paris-logo.png	1	2024-01-16 00:00:00
8	Olay	2024-01-08 00:00:00	olay-logo.png	3	2024-01-17 00:00:00
9	Johnsons Baby	2024-01-09 00:00:00	johnsons-baby-logo.png	4	2024-01-18 00:00:00
10	The Ordinary	2024-01-10 00:00:00	the-ordinary-logo.png	5	2024-01-19 00:00:00
6	Nivea	2024-01-06 00:00:00	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW1ndiqcK1UjU9d7JTOjLrJCmEt9Dm5QSQHQ&s	2	2025-01-27 11:46:48.572
2	Dove	2024-01-02 00:00:00	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk_ba3XPWJ6hayDOEZoI1gaAj4HjVJjbS9VA&s	2	2025-01-27 11:47:28.792
1	Maybelline	2024-01-01 00:00:00	https://i.pinimg.com/736x/80/e5/c8/80e5c8b6f1e670d88fe4acd291c5b616.jpg	1	2025-01-27 11:49:44.582
\.


--
-- Data for Name: ProductServiceCategory; Type: TABLE DATA; Schema: public; Owner: product_user
--

COPY public."ProductServiceCategory" (id, name, description, image) FROM stdin;
7	Beauty Tools	Tools and accessories for beauty routines	beauty-tools.jpg
8	Nail Care	Nail polishes and manicure tools	nail-care.jpg
9	Body Care	Lotions, scrubs, and body treatments	body-care.jpg
10	Mother & Baby Care	Products for mothers and newborns	mother-baby-care.jpg
11	Beauty	Beauty products and cosmetics	beauty.jpg
12	Health	Health products and cosmetics	health.jpg
6	Health Supplements	Vitamins and supplements for womens health care	health-supplements.jpg
3	Makeup	Cosmetics for enhancing beauty	https://image.shutterstock.com/image-photo/loose-powder-light-tone-jar-260nw-2537257193.jpg
4	Personal Hygiene	Feminine hygiene and daily essentials	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ig1qe3rylNEf3CGTJrlBnYOA96sikzjigg&s
1	Skin Care	Products for skin health	https://st5.depositphotos.com/62628780/64822/i/1600/depositphotos_648226088-stock-photo-face-beauty-skincare-profile-woman.jpg
2	Hair Care	Shampoos, conditioners, and hair treatment	https://thumbs.dreamstime.com/b/beauty-hair-care-beautiful-woman-combing-long-natural-hair-beauty-hair-care-beautiful-woman-combing-long-natural-hair-wooden-129738060.jpg
5	Fragrances	Perfumes and body sprays	https://www.lancome.in/dw/image/v2/BJSQ_PRD/on/demandware.static/-/Sites-lancome-in-ng-Library/en_IN/dw1db7196d/images/beauty-magazine/skincare-blogs/Best%20Rose%20Fragrance%20Perfume.jpg?sw=400&sh=225&sm=cut&q=70
\.


--
-- Data for Name: ProductServiceProductManufacturer; Type: TABLE DATA; Schema: public; Owner: product_user
--

COPY public."ProductServiceProductManufacturer" (id, name, image, created_date, updated_date) FROM stdin;
3	Procter & Gamble	pg-logo.png	2024-01-03 00:00:00	2024-01-12 00:00:00
4	Johnson & Johnson	johnson-logo.png	2024-01-04 00:00:00	2024-01-13 00:00:00
1	LOréal	https://cdn.prod.website-files.com/5ee732bebd9839b494ff27cd/5eef9d9379b53063c43c7615_loreal-logo-font.webp	2024-01-01 00:00:00	2025-01-27 10:36:01.676
2	Unilever	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGYLDytGde47XzaHVeM13Ioho74XwzwMBEaA&s	2024-01-02 00:00:00	2025-01-27 10:37:45.186
5	Estee Laude	estee-lauder-logo.png	2024-01-05 00:00:00	2025-01-27 11:07:40.703
\.


--
-- Data for Name: ProductServiceProductType; Type: TABLE DATA; Schema: public; Owner: product_user
--

COPY public."ProductServiceProductType" (id, name, description, image, discount, features, aux_size, brand_id, created_date, how_to_use, pack_size, product_class, product_system, subcategory_id, unit_price, updated_date, tags) FROM stdin;
2	Dove Nourishing Secrets Body Lotion	Deeply nourishes and hydrates skin for 48 hours	{dove-body-lotion.jpg}	10	{Hydrating,"Skin smoothing",Non-greasy}	250ml	2	2024-01-15 00:00:00	{"Apply on damp skin","Massage gently","Use daily for best results"}	1	Mid-range	Cream	9	8.99	2024-01-16 00:00:00	{"tag 1","tag 2","tag 3"}
3	Pantene Pro-V Hair Fall Control Shampoo	Strengthens hair and reduces hair fall due to breakage	{pantene-shampoo.jpg}	20	{"Strengthening formula","Prevents hair breakage","Rich lather"}	400ml	3	2024-01-10 00:00:00	{"Apply on wet hair","Massage and rinse thoroughly","For best results, follow with Pantene conditioner"}	1	Affordable	Shampoo	3	5.99	2024-01-12 00:00:00	{"tag 1","tag 2","tag 3"}
4	Neutrogena Hydro Boost Water Gel	Hydrating gel that locks in moisture for smooth, radiant skin	{neutrogena-water-gel.jpg}	25	{Oil-free,Non-comedogenic,"Boosts hydration for 24 hours"}	50g	4	2024-01-14 00:00:00	{"Apply to face and neck","Use in the morning and evening","Avoid direct contact with eyes"}	1	Premium	Gel	1	16.99	2024-01-15 00:00:00	{"tag 1","tag 2","tag 3"}
5	Clinique All About Eyes	Reduces puffiness and dark circles around the eyes	{clinique-all-about-eyes.jpg}	30	{"Reduces dark circles","Minimizes puffiness","Lightweight formula"}	15ml	5	2024-01-20 00:00:00	{"Gently pat around the eye area","Use twice daily","Avoid direct contact with eyes"}	1	Luxury	Cream	2	29.99	2024-01-21 00:00:00	{"tag 1","tag 2","tag 3"}
1	Maybelline Fit Me Foundation	Matte and Poreless foundation for a natural look	{https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDsxmAwqCzi2vhv5MAnPRuYulz9HF5G-mSYw&s}	15	{"Matte finish",Non-comedogenic,"24-hour wear"}	30ml	1	2024-01-01 00:00:00	{"Apply on clean skin","Blend with sponge","Set with powder"}	1	Affordable	Liquid	1	12.99	2024-01-10 00:00:00	{"tag 1","tag 2","tag 3"}
6	Nivea Soft Moisturizing Cream	Moisturizes and refreshes skin with a light formula	{nivea-soft-cream.jpg}	5	{Refreshing,Non-greasy,"Fast absorbing"}	200ml	6	2024-01-12 00:00:00	{"Apply generously on clean skin","Use as needed","For daily hydration"}	1	Affordable	Cream	9	4.99	2024-01-13 00:00:00	{"tag 1","tag 2","tag 3"}
7	LOreal Paris Revitalift Bright Reveal Brightening Peel Pads	Exfoliating pads that brighten and refresh skin	{loreal-revitalift-peel.jpg}	15	{Brightening,Exfoliating,"Smoothens skin texture"}	30 Pads	5	2024-01-05 00:00:00	{"Gently swipe over clean face","Use once or twice a week","Follow with moisturizer"}	1	Premium	Peel Pads	1	18.99	2024-01-08 00:00:00	{"tag 1","tag 2","tag 3"}
8	Olay Regenerist Micro-Sculpting Cream	Anti-aging cream that firms and smoothens skin	{olay-regenerist-cream.jpg}	20	{Anti-aging,Firming,"Hydrates skin"}	50g	6	2024-01-06 00:00:00	{"Apply to face and neck","Use daily, morning and night","Massage gently in upward strokes"}	1	Premium	Cream	1	23.99	2024-01-07 00:00:00	{"tag 1","tag 2","tag 3"}
11	Neutrogena Rapid Clear Stubborn Acne Spot Gel	Fights stubborn acne and reduces blemishes quickly	{neutrogena-acne-spot.jpg}	18	{"Acne treatment","Fast action","Reduces blemishes"}	30g	9	2024-01-02 00:00:00	{"Apply directly to acne spots","Use once or twice daily","Avoid eye contact"}	1	Premium	Gel	1	14.99	2024-01-03 00:00:00	{"tag 1","tag 2","tag 3"}
14	premium Lotion 2	this is premium lotion	{"https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg"}	15	\N		1	2025-01-30 05:16:32.904	\N	1	rgv	rgvr	1	200	2025-01-30 05:16:32.904	\N
12	New Product	This is a description of the new product.	{http://example.com/image.jpg,http://example.com/image2.jpg}	10	{"feature 1","feature 2","feature 3"}	Small	1	2025-01-28 09:12:06.074	\N	1	Electronics	System 1	2	100	2025-01-28 09:12:06.074	{"tag a","tag b","tag c"}
13	premium Lotion	this is premium lotion	{"https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg"}	15	\N		1	2025-01-28 12:44:34.614	\N	1	rgv	rgvr	1	200	2025-01-28 12:44:34.614	\N
15	Premium Lotion 3	This is premium lotion	{"https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg"}	10	\N	200ml	1	2025-01-30 06:04:38.258	\N	1	Luxury	Tube	1	100	2025-01-30 06:04:38.258	\N
10	Aveeno Daily Moisturizing Lotion	Soothes and moisturizes dry skin for 24 hours	{aveeno-moisturizing-lotion.jpg}	0	{Moisturizing,Soothing,Non-greasy}	300ml	8	2024-01-02 00:00:00	{"Apply to damp skin after shower","Massage in circular motions","Use daily for soft skin"}	1	Mid-range	Lotion	9	9.99	2024-01-03 00:00:00	{"tag 1","tag 2","tag 3"}
16	Premium Lotion 3	this is lotion	{"https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg"}	7	\N	200ml	1	2025-01-30 06:40:38.638	\N	1	Luxury	Tube	1	80	2025-01-30 06:40:38.638	\N
17	Premium Lotion 3	This is updated premium lotion	{"https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg"}	10	\N	200ml	1	2025-01-30 06:47:22.922	\N	1	Luxury	Tube	1	100	2025-01-30 06:47:22.922	\N
18	Premium Lotion 5	aergblaerjnglaejtngaetkl	{"https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg"}	5	{1,2,3}	200ml	1	2025-01-30 06:50:36.29	{1,2,3}	1	Luxury	Tube	1	100	2025-01-30 06:50:36.29	{1,2,3}
19	Premium Lotion 6	This is premium lotion	{"https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg","https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg"}	10	{"feature 1","feature 2","feature 3"}	200ml	1	2025-01-30 07:54:35.862	{"use 1","use 2","use 3"}	1	Luxury	Tube	17	200	2025-01-30 07:54:35.862	{"tag 1","tag 2","tag 3"}
9	LOréal Paris Elvive Total Repair 5 Shampoo	Restores damaged hair and strengthens from root to tip	{https://bk.shajgoj.com/storage/2020/06/loreal-paris-elvive-full-resist-shampoo.jpg}	10	{"Repairs hair damage","Strengthens hair","Adds shine"}	500ml	7	2024-01-12 00:00:00	{"Apply on wet hair","Massage into scalp and lather","Rinse thoroughly"}	1	Mid-range	Shampoo	3	7.99	2024-01-13 00:00:00	{"tag 1","tag 2","tag 3"}
\.


--
-- Data for Name: ProductServiceSubcategory; Type: TABLE DATA; Schema: public; Owner: product_user
--

COPY public."ProductServiceSubcategory" (id, name, description, image, category_id) FROM stdin;
4	Conditioners	Hair softening products	conditioners.jpg	2
5	Lipsticks	Lip color cosmetics	lipsticks.jpg	3
8	Intimate Wash	Cleansing products for intimate areas	intimate-wash.jpg	4
11	Vitamins	Essential vitamins for women	vitamins.jpg	6
12	Weight Management	Supplements for weight control	weight-management.jpg	6
14	Hair Styling Tools	Curling irons, straighteners, etc.	hair-styling-tools.jpg	7
15	Nail Polishes	Colorful nail paints	nail-polishes.jpg	8
16	Manicure Kits	Complete nail care sets	manicure-kits.jpg	8
17	Body Lotions	Moisturizing creams for body	body-lotions.jpg	9
18	Body Scrubs	Exfoliating treatments	body-scrubs.jpg	9
1	Moisturizers	Hydrating creams and lotions	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN6ePLpp_w3k5P95YsVZIYU1XGp2DaANJvlw&s	1
2	Cleansers	Face washes and cleansers	https://img.freepik.com/free-photo/positive-young-female-has-toothy-smile-has-perfect-teeth-pats-skin-with-liquid-sanitary-soap-washes-with-foaming-gel-wakes-up-morning-having-beauty-routine_273609-30920.jpg	1
19	Baby Oils	Gentle oils for baby care	https://www.kodomo.com.bd/wp-content/uploads/2019/09/acc27612-e7c0-471c-aa89-abf374c32c10-300x300.jpg	10
7	Sanitary Pads	Feminine hygiene essentials	https://t4.ftcdn.net/jpg/00/50/10/09/360_F_50100968_lDqAChBUmx4ZZgyvbN8Sqf7C1yXlxnIY.jpg	4
13	Makeup Brushes for women	Tools for makeup application	https://cdn.thewirecutter.com/wp-content/media/2024/10/makeupbrushes-2048px-01010-3x2-1.jpg?auto=webp&quality=75&crop=3:2&width=1024	7
3	Shampoos	Hair cleansing products	https://media.istockphoto.com/id/1356587396/photo/shampoo-and-hair-conditioner-bottle-with-soapy-bubbles-beauty-hair-care-cosmetic-packaging.jpg?s=612x612&w=0&k=20&c=jM2woyBay4kGCbVsLVqvx1ZXWDU6KLAGGan3DMoTFgU=	2
6	Foundations	Base makeup for even skin tone	https://medias.jeanpaulgaultier.com/cdn-cgi/image/width=412,quality=90,format=avif/medias/sys_master/images/h3e/ha0/9861213388830/Classique-Image-illustration-Ancillarie.png/Classique-Image-illustration-Ancillarie.png.jpg	3
20	Diapers	Baby hygiene essentials for baby care	https://images.othoba.com/images/thumbs/0626486_baby-washable-cloth-diaper-nappies-with-wet-free-inserts-washable-reusable-pocket-cloth-diapers-for-.webp	10
9	Perfumes	Luxury and casual scents	https://www.victoriassecret.com/p/380x507/tif/62/09/620970966f984559b80ea0c21f658445/111893792457_OF_F.jpg	5
10	Body Sprays	Refreshing body mists	https://perfumedokan.com/wp-content/uploads/2022/11/Fogg-Paradise-Body-spray-for-Women.jpg	5
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: product_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
3c61f891-1765-42d3-99dd-b930c506dc2a	3dfb09af89eff5dd2b352b4912c4692ef3e02ccd7669270cc95e61bf39ce2a26	2025-01-26 07:33:12.472113+00	20241210063122_init	\N	\N	2025-01-26 07:33:12.413751+00	1
fe8ded64-01b3-403f-8002-0ea4eef9487e	d77bf9132ddb8cf1a063341610b64523e9d6f5fc14b165a620e62ca5c18f77e0	2025-01-26 07:33:12.537535+00	20241210065554_init	\N	\N	2025-01-26 07:33:12.486195+00	1
15295709-e8b9-4c40-95c6-ab25457bb312	de100d2b6c2f45982544afe023caa6e91c2d605b89bb526f086a39e4a0637413	2025-01-27 05:42:25.731118+00	20250127054225_add_cascade_delete	\N	\N	2025-01-27 05:42:25.718595+00	1
faf8c018-c0be-444b-82bf-cf8a5be31e3c	f695c40fa401ac8725b38c495858efac0ed5a16b7e754cd074569883eba7f9c1	2025-01-27 12:33:58.251718+00	20250127123358_removedmanufacturer	\N	\N	2025-01-27 12:33:58.205926+00	1
cda0fcb0-3ffd-4043-a3cf-f3e6d715aa4a	c2d59bb6ceddede9cd2145e24f09919baca6800f5c734963e94a46e01af9e1a6	2025-01-27 12:36:39.293058+00	20250127123639_add_tags	\N	\N	2025-01-27 12:36:39.287643+00	1
e3d0e56f-8372-49ac-a7f6-ec88809d8fc3	66e0f09a58e862327dc24b62a6b066517d74a09039ccdf79265a93e02c3b11b2	2025-01-30 05:26:42.138706+00	20250130052642_change_unit_price_to_float	\N	\N	2025-01-30 05:26:42.043875+00	1
\.


--
-- Name: ProductServiceBrand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: product_user
--

SELECT pg_catalog.setval('public."ProductServiceBrand_id_seq"', 1, false);


--
-- Name: ProductServiceCategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: product_user
--

SELECT pg_catalog.setval('public."ProductServiceCategory_id_seq"', 13, true);


--
-- Name: ProductServiceProductManufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: product_user
--

SELECT pg_catalog.setval('public."ProductServiceProductManufacturer_id_seq"', 1, false);


--
-- Name: ProductServiceProductType_id_seq; Type: SEQUENCE SET; Schema: public; Owner: product_user
--

SELECT pg_catalog.setval('public."ProductServiceProductType_id_seq"', 19, true);


--
-- Name: ProductServiceSubcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: product_user
--

SELECT pg_catalog.setval('public."ProductServiceSubcategory_id_seq"', 21, true);


--
-- Name: ProductServiceBrand ProductServiceBrand_pkey; Type: CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceBrand"
    ADD CONSTRAINT "ProductServiceBrand_pkey" PRIMARY KEY (id);


--
-- Name: ProductServiceCategory ProductServiceCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceCategory"
    ADD CONSTRAINT "ProductServiceCategory_pkey" PRIMARY KEY (id);


--
-- Name: ProductServiceProductManufacturer ProductServiceProductManufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceProductManufacturer"
    ADD CONSTRAINT "ProductServiceProductManufacturer_pkey" PRIMARY KEY (id);


--
-- Name: ProductServiceProductType ProductServiceProductType_pkey; Type: CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceProductType"
    ADD CONSTRAINT "ProductServiceProductType_pkey" PRIMARY KEY (id);


--
-- Name: ProductServiceSubcategory ProductServiceSubcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceSubcategory"
    ADD CONSTRAINT "ProductServiceSubcategory_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: ProductServiceBrand ProductServiceBrand_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceBrand"
    ADD CONSTRAINT "ProductServiceBrand_manufacturer_id_fkey" FOREIGN KEY (manufacturer_id) REFERENCES public."ProductServiceProductManufacturer"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ProductServiceProductType ProductServiceProductType_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceProductType"
    ADD CONSTRAINT "ProductServiceProductType_brand_id_fkey" FOREIGN KEY (brand_id) REFERENCES public."ProductServiceBrand"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProductServiceProductType ProductServiceProductType_subcategory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceProductType"
    ADD CONSTRAINT "ProductServiceProductType_subcategory_id_fkey" FOREIGN KEY (subcategory_id) REFERENCES public."ProductServiceSubcategory"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProductServiceSubcategory ProductServiceSubcategory_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: product_user
--

ALTER TABLE ONLY public."ProductServiceSubcategory"
    ADD CONSTRAINT "ProductServiceSubcategory_category_id_fkey" FOREIGN KEY (category_id) REFERENCES public."ProductServiceCategory"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT CREATE ON SCHEMA public TO product_user;


--
-- PostgreSQL database dump complete
--

