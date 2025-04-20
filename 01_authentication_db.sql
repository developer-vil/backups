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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: UserOtp; Type: TABLE; Schema: public; Owner: auth_user
--

CREATE TABLE public."UserOtp" (
    id integer NOT NULL,
    "userId" text,
    sent_to text,
    otp integer,
    sid text,
    "createdDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedDate" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."UserOtp" OWNER TO auth_user;

--
-- Name: UserOtp_id_seq; Type: SEQUENCE; Schema: public; Owner: auth_user
--

CREATE SEQUENCE public."UserOtp_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."UserOtp_id_seq" OWNER TO auth_user;

--
-- Name: UserOtp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auth_user
--

ALTER SEQUENCE public."UserOtp_id_seq" OWNED BY public."UserOtp".id;


--
-- Name: forget_password; Type: TABLE; Schema: public; Owner: auth_user
--

CREATE TABLE public.forget_password (
    id integer NOT NULL,
    email text DEFAULT ''::text NOT NULL,
    "createdDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedDate" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.forget_password OWNER TO auth_user;

--
-- Name: forget_password_id_seq; Type: SEQUENCE; Schema: public; Owner: auth_user
--

CREATE SEQUENCE public.forget_password_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forget_password_id_seq OWNER TO auth_user;

--
-- Name: forget_password_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auth_user
--

ALTER SEQUENCE public.forget_password_id_seq OWNED BY public.forget_password.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: auth_user
--

CREATE TABLE public.users (
    id text NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO auth_user;

--
-- Name: UserOtp id; Type: DEFAULT; Schema: public; Owner: auth_user
--

ALTER TABLE ONLY public."UserOtp" ALTER COLUMN id SET DEFAULT nextval('public."UserOtp_id_seq"'::regclass);


--
-- Name: forget_password id; Type: DEFAULT; Schema: public; Owner: auth_user
--

ALTER TABLE ONLY public.forget_password ALTER COLUMN id SET DEFAULT nextval('public.forget_password_id_seq'::regclass);


--
-- Data for Name: UserOtp; Type: TABLE DATA; Schema: public; Owner: auth_user
--

COPY public."UserOtp" (id, "userId", sent_to, otp, sid, "createdDate", "updatedDate") FROM stdin;
\.


--
-- Data for Name: forget_password; Type: TABLE DATA; Schema: public; Owner: auth_user
--

COPY public.forget_password (id, email, "createdDate", "updatedDate") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: auth_user
--

COPY public.users (id, email, username, password) FROM stdin;
2c8146f7-20e9-409f-9e6b-58875ec01065	test@example.com	testuser	$2a$10$6aXvZhFLcHVArHwX1JVgl.iMODDdlT/5FEPkfykukQHBI7IxTTl7m
224e5817-fd0f-4a14-ab71-51b5fd00a25b	test1@example.com	testuser1	$2a$10$IcOC9lofbMTfDVtCtfS1kuVCfmSoa7CSbkEOe2ppGanePiuynTtwS
4562f04a-6938-40a2-9b7d-1eafb41ac52b	test2@example.com	test2@example.com	$2a$10$h6DwYauvSflmofcfoxvwWOvnxZrH/pbuXmVOqwlonHEvlE/iqZLzW
bc22067b-99c1-4801-b294-3f3d6f0796ea	test3@example.com	test3@example.com	$2a$10$ISJ4wrp/ttiWVHKQj4aQuu3UdqmX/TmjtVDlHkfN0K5tFgwKaxBBG
6655b8a8-db32-439f-8331-6fd8b628d787	test4@example.com	test4@example.com	$2a$10$7pS8vel9c.aXmS5Jn7YW1eU683nF0IDB9iYQRbIWVBT8MEeB7c1qi
a990c847-bdba-46d1-a342-ded48da76155	test5@example.com	test5@example.com	$2a$10$LVPGuhGqKA.vJf1pyhmEIOReQ5hcJz6jsi7ai.SgW5QF5zp7ydf/u
99bd0169-de55-4508-aa9f-6e20cd8f83bf	test6@example.com	test6@example.com	$2a$10$fC5K0jL.6zNR0VgCbNR0lemPzVAmVGgxQDgkbIcE.WAkH7umj0y5e
865ffec1-ac33-4407-99d3-52b238ae0d16	dina@gmail.com	dina@gmail.com	$2a$10$vfqtfqcdKeLU6a5NqArybekYq6tSif1.hJ3JSJGBE0vRWTIWBv5l2
d6229189-7f1a-4a55-b5f3-9e59e7acfd81	dina@vertical-innovations.com	dina@vertical-innovations.com	$2a$10$8uUdnUgaE9gw2W/EEpGCDuiU9Tkh4aGyS9KDVVlCvpKF13fFJmRmi
bc0c0d10-baaf-4fce-8b92-5e3622319b77	dina@vertical-innovation.com	dina@vertical-innovation.com	$2a$10$RLCHj5jVO/4gH9oh463Lce1wrZRD76ujmXHpO1EJ5SMJ4.bCYQTh6
41156e6b-b685-4dec-aade-2f5e5c05d4be	hasan@gmail.com	hasan@gmail.com	$2a$10$rLLpjqFiPRsbc9jizNgtvuxJHiMIMLDmb/M7VhiBdgYFZKxYTAbw.
\.


--
-- Name: UserOtp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auth_user
--

SELECT pg_catalog.setval('public."UserOtp_id_seq"', 1, false);


--
-- Name: forget_password_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auth_user
--

SELECT pg_catalog.setval('public.forget_password_id_seq', 1, false);


--
-- Name: UserOtp UserOtp_pkey; Type: CONSTRAINT; Schema: public; Owner: auth_user
--

ALTER TABLE ONLY public."UserOtp"
    ADD CONSTRAINT "UserOtp_pkey" PRIMARY KEY (id);


--
-- Name: forget_password forget_password_pkey; Type: CONSTRAINT; Schema: public; Owner: auth_user
--

ALTER TABLE ONLY public.forget_password
    ADD CONSTRAINT forget_password_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: auth_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: auth_user
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: users_username_key; Type: INDEX; Schema: public; Owner: auth_user
--

CREATE UNIQUE INDEX users_username_key ON public.users USING btree (username);


--
-- Name: UserOtp UserOtp_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auth_user
--

ALTER TABLE ONLY public."UserOtp"
    ADD CONSTRAINT "UserOtp_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT CREATE ON SCHEMA public TO auth_user;


--
-- PostgreSQL database dump complete
--

