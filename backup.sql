--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appointments; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE appointments (
    id integer NOT NULL,
    date character varying(255),
    hour character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.appointments OWNER TO jaelee;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO jaelee;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE appointments_id_seq OWNED BY appointments.id;


--
-- Name: charges; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE charges (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stripe_token character varying(255),
    event_id integer,
    client_id integer,
    therapist_id integer,
    amount integer,
    stripe_customer_id integer,
    stripe_email character varying(255)
);


ALTER TABLE public.charges OWNER TO jaelee;

--
-- Name: charges_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE charges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.charges_id_seq OWNER TO jaelee;

--
-- Name: charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE charges_id_seq OWNED BY charges.id;


--
-- Name: chat_users; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE chat_users (
    id integer NOT NULL,
    nickname character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    time_zone character varying(255),
    user_id integer,
    chat_id integer
);


ALTER TABLE public.chat_users OWNER TO jaelee;

--
-- Name: chat_users_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE chat_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_users_id_seq OWNER TO jaelee;

--
-- Name: chat_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE chat_users_id_seq OWNED BY chat_users.id;


--
-- Name: chats; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE chats (
    id integer NOT NULL,
    owner character varying(255),
    channel character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    client_id integer,
    therapist_id integer,
    event_id integer,
    timer_time character varying(255),
    timer_state character varying(255)
);


ALTER TABLE public.chats OWNER TO jaelee;

--
-- Name: chats_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE chats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chats_id_seq OWNER TO jaelee;

--
-- Name: chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE chats_id_seq OWNED BY chats.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    encrypted_name character varying(255),
    encrypted_name_salt character varying(255),
    encrypted_name_iv character varying(255),
    encrypted_zipcode character varying(255),
    encrypted_zipcode_salt character varying(255),
    encrypted_zipcode_iv character varying(255),
    encrypted_gender character varying(255),
    encrypted_gender_salt character varying(255),
    encrypted_gender_iv character varying(255),
    encrypted_age character varying(255),
    encrypted_age_salt character varying(255),
    encrypted_age_iv character varying(255),
    encrypted_insurance character varying(255),
    encrypted_insurance_salt character varying(255),
    encrypted_insurance_iv character varying(255),
    responses text[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    current_therapist character varying(255),
    current_therapist_name character varying(255),
    stripe_token character varying(255),
    phone character varying(255),
    flag_therapist boolean,
    therapist_id integer,
    description text,
    time_zone character varying(255)
);


ALTER TABLE public.clients OWNER TO jaelee;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO jaelee;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: email_boxes; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE email_boxes (
    id integer NOT NULL,
    email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    landing boolean
);


ALTER TABLE public.email_boxes OWNER TO jaelee;

--
-- Name: email_boxes_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE email_boxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_boxes_id_seq OWNER TO jaelee;

--
-- Name: email_boxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE email_boxes_id_seq OWNED BY email_boxes.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    title character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    therapist_id integer,
    client_id integer,
    suggested_times character varying(255)[] DEFAULT '{}'::character varying[],
    user_id integer,
    suggested_time character varying(255),
    email character varying(255),
    phone character varying(255)
);


ALTER TABLE public.events OWNER TO jaelee;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO jaelee;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE messages (
    id integer NOT NULL,
    message text,
    chat_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO jaelee;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO jaelee;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE requests (
    id integer NOT NULL,
    insurance character varying(255),
    age_preference character varying(255),
    gender_preference character varying(255),
    email character varying(255),
    first_name character varying(255),
    comments text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    document_id character varying(255)
);


ALTER TABLE public.requests OWNER TO jaelee;

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_id_seq OWNER TO jaelee;

--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE requests_id_seq OWNED BY requests.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO jaelee;

--
-- Name: therapists; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE therapists (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    first_name character varying(255),
    last_name character varying(255),
    gender character varying(255),
    state character varying(255),
    license_number character varying(255),
    degree character varying(255),
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    city character varying(255),
    zipcode character varying(255),
    phone character varying(255),
    bio text,
    permalink character varying(255),
    retina_dimensions text,
    title character varying(255),
    school_name character varying(255),
    open_slots character varying(255)[] DEFAULT '{}'::character varying[],
    client_id integer,
    years integer,
    issues character varying(255)[] DEFAULT '{}'::character varying[],
    topics character varying(255)[] DEFAULT '{}'::character varying[],
    intro_gif_subtitles text,
    address character varying(255)
);


ALTER TABLE public.therapists OWNER TO jaelee;

--
-- Name: therapists_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE therapists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.therapists_id_seq OWNER TO jaelee;

--
-- Name: therapists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE therapists_id_seq OWNED BY therapists.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    role_id integer,
    role_type character varying(255),
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    time_zone character varying(255)
);


ALTER TABLE public.users OWNER TO jaelee;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jaelee;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: video_galleries; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE video_galleries (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.video_galleries OWNER TO jaelee;

--
-- Name: video_galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE video_galleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_galleries_id_seq OWNER TO jaelee;

--
-- Name: video_galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE video_galleries_id_seq OWNED BY video_galleries.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE TABLE videos (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.videos OWNER TO jaelee;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: jaelee
--

CREATE SEQUENCE videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO jaelee;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaelee
--

ALTER SEQUENCE videos_id_seq OWNED BY videos.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY appointments ALTER COLUMN id SET DEFAULT nextval('appointments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY charges ALTER COLUMN id SET DEFAULT nextval('charges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY chat_users ALTER COLUMN id SET DEFAULT nextval('chat_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY chats ALTER COLUMN id SET DEFAULT nextval('chats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY email_boxes ALTER COLUMN id SET DEFAULT nextval('email_boxes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY requests ALTER COLUMN id SET DEFAULT nextval('requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY therapists ALTER COLUMN id SET DEFAULT nextval('therapists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY video_galleries ALTER COLUMN id SET DEFAULT nextval('video_galleries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jaelee
--

ALTER TABLE ONLY videos ALTER COLUMN id SET DEFAULT nextval('videos_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY appointments (id, date, hour, created_at, updated_at) FROM stdin;
\.


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('appointments_id_seq', 1, false);


--
-- Data for Name: charges; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY charges (id, created_at, updated_at, stripe_token, event_id, client_id, therapist_id, amount, stripe_customer_id, stripe_email) FROM stdin;
1	2014-06-29 14:54:56.126098	2014-06-29 14:54:56.126098	tok_104JMQ2k182tB9JIuoALOOp5	363	753	26	4000	0	\N
2	2014-06-29 15:51:08.736161	2014-06-29 15:51:08.736161	tok_104JNK2k182tB9JICo8tUzEf	364	718	26	4000	0	\N
3	2014-06-29 15:52:54.099199	2014-06-29 15:52:54.099199	tok_104JNM2k182tB9JIFvHyhZaI	365	718	26	4000	0	\N
4	2014-06-29 15:58:42.973639	2014-06-29 15:58:42.973639	tok_104JNS2k182tB9JI0vnW0vIc	366	718	26	4000	0	\N
5	2014-06-29 20:55:49.423281	2014-06-29 20:55:49.423281	tok_104JSF2k182tB9JIwxwEKHi2	383	779	26	4000	0	\N
6	2014-06-29 22:20:40.446058	2014-06-29 22:20:40.446058	tok_104JTc2k182tB9JIVvqBsFT8	393	718	26	4000	0	\N
7	2014-06-29 23:31:32.895043	2014-06-29 23:31:32.895043	tok_104JUl2k182tB9JITDRYFm48	402	790	26	4000	0	\N
8	2014-06-29 23:32:24.345418	2014-06-29 23:32:24.345418	tok_104JUl2k182tB9JICjhulLSu	403	790	26	4000	0	\N
9	2014-06-29 23:38:09.816431	2014-06-29 23:38:09.816431	tok_104JUr2k182tB9JIWs40XxKx	405	718	26	4000	0	\N
10	2014-06-29 23:39:40.14903	2014-06-29 23:39:40.14903	tok_104JUt2k182tB9JI5VHdRcAJ	407	790	26	4000	0	\N
11	2014-06-29 23:43:59.04375	2014-06-29 23:43:59.04375	tok_104JUx2k182tB9JIxU9I6r27	408	790	26	4000	0	\N
12	2014-06-29 23:57:03.125051	2014-06-29 23:57:03.125051	tok_104JVA2k182tB9JIswtHhjeo	414	790	26	4000	0	\N
13	2014-06-30 00:03:17.357973	2014-06-30 00:03:17.357973	tok_104JVG2k182tB9JIFqweuyp5	415	790	26	4000	0	\N
14	2014-06-30 00:05:46.183772	2014-06-30 00:05:46.183772	tok_104JVJ2k182tB9JImppUTZtF	416	790	26	4000	0	\N
15	2014-06-30 00:10:09.082546	2014-06-30 00:10:09.082546	tok_104JVN2k182tB9JIiaAGZZIB	418	806	26	4000	0	\N
16	2014-06-30 00:51:21.185233	2014-06-30 00:51:21.185233	tok_104JW22k182tB9JIt7WkAQAL	421	810	26	4000	0	\N
17	2014-06-30 00:52:11.705374	2014-06-30 00:52:11.705374	tok_104JW32k182tB9JIiCW95TDn	422	810	26	4000	0	\N
18	2014-06-30 01:12:01.97508	2014-06-30 01:12:01.97508	tok_104JWN2k182tB9JIzuJVX6Uo	423	812	26	4000	0	\N
19	2014-06-30 04:11:03.18694	2014-06-30 04:11:03.18694	tok_104JZG2k182tB9JIi34tscp4	430	835	26	4000	0	\N
20	2014-06-30 04:25:36.679541	2014-06-30 04:25:36.679541	tok_104JZV2k182tB9JIK4hVV6cv	434	839	26	4000	0	\N
21	2014-06-30 05:52:47.807961	2014-06-30 05:52:47.807961	tok_104Jau2k182tB9JIvETFiw6u	447	853	26	4000	0	\N
22	2014-06-30 06:45:35.957279	2014-06-30 06:45:35.957279	tok_104Jbl2k182tB9JI7Sqg5YYA	456	862	26	4000	0	\N
23	2014-06-30 06:47:32.560414	2014-06-30 06:47:32.560414	tok_104Jbn2k182tB9JI3PVJL6h7	457	862	26	4000	0	\N
24	2014-06-30 06:48:55.108983	2014-06-30 06:48:55.108983	tok_104Jbo2k182tB9JId04j3fND	458	862	26	4000	0	\N
25	2014-06-30 06:52:02.093828	2014-06-30 06:52:02.093828	tok_104Jbr2k182tB9JIpetM421m	459	862	26	4000	0	\N
26	2014-06-30 06:55:32.414793	2014-06-30 06:55:32.414793	tok_104Jbv2k182tB9JIMzZqfoFc	460	862	26	4000	0	\N
27	2014-06-30 06:58:19.050059	2014-06-30 06:58:19.050059	tok_104Jbx2k182tB9JIv8PNOUOB	461	862	26	4000	0	\N
28	2014-06-30 07:02:47.333185	2014-06-30 07:02:47.333185	tok_104Jc22k182tB9JI2z42uJbL	462	862	26	4000	0	\N
29	2014-06-30 07:11:39.007682	2014-06-30 07:11:39.007682	tok_104JcB2k182tB9JIqKsWV2DA	467	862	26	4000	0	\N
30	2014-06-30 07:17:48.370397	2014-06-30 07:17:48.370397	tok_104JcH2k182tB9JIvMavFTpo	468	862	26	4000	0	\N
31	2014-06-30 07:18:59.752543	2014-06-30 07:18:59.752543	tok_104JcI2k182tB9JIqLHqQStI	469	862	26	4000	0	\N
32	2014-06-30 07:20:22.418448	2014-06-30 07:20:22.418448	tok_104JcJ2k182tB9JIgLIVUN5L	471	874	26	4000	0	\N
33	2014-06-30 07:27:22.63727	2014-06-30 07:27:22.63727	tok_104JcQ2k182tB9JIcw6MRxL9	473	875	26	4000	0	\N
34	2014-06-30 15:50:22.312516	2014-06-30 15:50:22.312516	tok_104JkX2k182tB9JIj2gctGe2	474	718	26	4000	0	\N
35	2014-06-30 20:52:35.526677	2014-06-30 20:52:35.526677	tok_104JpQ2k182tB9JIVldBxdM3	486	718	26	4000	0	\N
36	2014-06-30 21:12:16.566674	2014-06-30 21:12:16.566674	tok_104Jpj2k182tB9JI99SBTHCL	487	894	26	4000	0	\N
37	2014-06-30 21:14:15.588714	2014-06-30 21:14:15.588714	tok_104Jpl2k182tB9JIBmwxwQTd	488	718	26	4000	0	\N
38	2014-06-30 21:21:41.228002	2014-06-30 21:21:41.228002	tok_104Jpt2k182tB9JIEqZtkKSK	489	718	26	4000	0	\N
39	2014-06-30 21:30:58.958918	2014-06-30 21:30:58.958918	tok_104Jq22k182tB9JInKrdWStk	490	862	26	4000	0	\N
40	2014-07-01 00:03:37.399832	2014-07-01 00:03:37.399832	tok_104JwN2k182tB9JIk0Ex5qjO	500	907	26	4000	0	\N
41	2014-07-01 00:13:50.081924	2014-07-01 00:13:50.081924	tok_104JwX2k182tB9JIpFT2fY1s	501	907	26	4000	0	\N
42	2014-07-06 22:19:51.954083	2014-07-06 22:19:51.954083	tok_14DRjJ2k182tB9JIwLaFJCKO	508	718	26	4000	0	\N
43	2014-07-07 13:21:02.737631	2014-07-07 13:21:02.737631	tok_14DfnP2k182tB9JInYVtasd5	509	718	26	4000	0	\N
44	2014-07-07 13:28:05.208194	2014-07-07 13:28:05.208194	tok_14Dfu72k182tB9JI0hLonVq8	510	718	26	4000	0	\N
45	2014-07-10 14:45:13.842261	2014-07-10 14:45:13.842261	tok_14EmXX2k182tB9JIMFP5efsc	\N	\N	\N	4000	0	geneamazon@uchicago.edu
46	2014-07-10 14:46:47.87651	2014-07-10 14:46:47.87651	tok_14EmZ22k182tB9JItGSBbTIp	\N	\N	\N	4000	0	genejaelee@uchicago.edu
47	2014-07-11 15:04:00.653775	2014-07-11 15:04:00.653775	tok_14F9JG2k182tB9JIyKkXtp1K	513	718	75	4000	0	client@gmail.com
48	2014-07-11 15:12:18.774801	2014-07-11 15:12:18.774801	tok_14F9RI2k182tB9JIu7wsPROV	515	718	75	4000	0	client@gmail.com
49	2014-07-11 15:19:13.877935	2014-07-11 15:19:13.877935	tok_14F9Y02k182tB9JI8DW7WYQn	517	1398	77	4000	0	client@gmail.com
50	2014-07-11 15:19:59.601808	2014-07-11 15:19:59.601808	tok_14F9Yj2k182tB9JI36OJf8Yc	518	1398	77	4000	0	client@gmail.com
51	2014-07-11 15:20:44.775217	2014-07-11 15:20:44.775217	tok_14F9ZS2k182tB9JIoN722dCs	519	1403	77	4000	0	client2@gmail.com
52	2014-07-11 15:23:56.938097	2014-07-11 15:23:56.938097	tok_14F9cZ2k182tB9JIf3cspWc8	520	1403	77	4000	0	client2@gmail.com
53	2014-07-11 15:40:44.267664	2014-07-11 15:40:44.267664	tok_14F9so2k182tB9JI5BxEd3YP	521	1405	77	4000	0	client3@gmail.com
54	2014-07-11 15:44:17.442239	2014-07-11 15:44:17.442239	tok_14F9wF2k182tB9JI69C7Esb2	522	1408	77	4000	0	genejaelee@gmail.com
55	2014-07-22 14:24:24.767732	2014-07-22 14:24:24.767732	\N	525	1678	80	\N	\N	\N
56	2014-07-22 14:31:58.954615	2014-07-22 14:31:58.954615	\N	526	1679	81	\N	\N	\N
57	2014-07-22 14:33:47.966997	2014-07-22 14:33:47.966997	\N	527	1680	82	\N	\N	\N
58	2014-07-24 12:40:42.166235	2014-07-24 12:40:42.166235	tok_14JpGh2k182tB9JId8ZbXqJp	533	1719	83	4000	0	test99@gmail.com
59	2014-07-24 12:46:57.546769	2014-07-24 12:46:57.546769	tok_14JpMk2k182tB9JI3H2utI8w	534	1719	1715	4000	0	test99@gmail.com
60	2014-07-24 13:02:36.686039	2014-07-24 13:02:36.686039	tok_14Jpbv2k182tB9JIMb5j3cHg	535	1722	1715	4000	0	test100@gmail.com
61	2014-07-24 17:20:15.419487	2014-07-24 17:20:15.419487	tok_14JtdG2k182tB9JIztZTG1RA	536	1892	1715	4000	0	test3@gmail.com
62	2014-07-24 17:26:56.768756	2014-07-24 17:26:56.768756	tok_14Jtjj2k182tB9JIkdzYSkG2	538	1895	1715	4000	0	test5@gmail.com
63	2014-07-24 17:31:27.033845	2014-07-24 17:31:27.033845	tok_14Jto52k182tB9JIjNvMtYR1	539	1895	1715	4000	0	test5@gmail.com
64	2014-07-24 18:36:27.791995	2014-07-24 18:36:27.791995	tok_14Jup12k182tB9JIR19asyWu	540	1895	1715	4000	0	test5@gmail.com
65	2014-07-24 18:53:00.05025	2014-07-24 18:53:00.05025	tok_14Jv512k182tB9JI0TtYDv4M	541	1895	1715	4000	0	test5@gmail.com
66	2014-07-24 18:54:08.669863	2014-07-24 18:54:08.669863	tok_14Jv682k182tB9JITDfgGF9g	542	1895	1715	4000	0	test5@gmail.com
67	2014-07-24 18:59:38.055723	2014-07-24 18:59:38.055723	tok_14JvBR2k182tB9JIEFHH2zB1	543	1895	1715	4000	0	test5@gmail.com
68	2014-07-24 19:09:24.293119	2014-07-24 19:09:24.293119	tok_14JvKu2k182tB9JIaqd3xjyX	544	1722	1715	4000	0	test100@gmail.com
69	2014-07-24 19:22:01.727485	2014-07-24 19:22:01.727485	tok_14JvX62k182tB9JIbyI4DJhg	545	1722	1715	4000	0	test100@gmail.com
70	2014-07-24 19:48:24.313893	2014-07-24 19:48:24.313893	tok_14Jvwe2k182tB9JI5DhEBs4r	546	1722	1715	4000	0	test100@gmail.com
71	2014-07-24 19:50:34.323267	2014-07-24 19:50:34.323267	tok_14Jvyj2k182tB9JIUDToaek9	547	1722	1715	4000	0	test100@gmail.com
72	2014-07-24 19:56:06.138007	2014-07-24 19:56:06.138007	tok_14Jw452k182tB9JIpl6rZwXW	548	1722	1715	4000	0	test100@gmail.com
73	2014-07-24 22:30:24.341089	2014-07-24 22:30:24.341089	tok_14JyTP2k182tB9JI7y166Plw	549	1722	1715	4000	0	test100@gmail.com
74	2014-07-24 22:33:15.473796	2014-07-24 22:33:15.473796	tok_14JyWB2k182tB9JI73qsR6XR	550	1722	1715	4000	0	test100@gmail.com
75	2014-07-25 10:12:54.450867	2014-07-25 10:12:54.450867	\N	552	1408	1715	\N	\N	\N
76	2014-07-29 16:21:06.009168	2014-07-29 16:21:06.009168	tok_14Ljtx2k182tB9JICGFpi79e	554	1984	1715	8000	0	genejaelee@gmail.com
77	2014-07-29 16:23:54.633468	2014-07-29 16:23:54.633468	tok_14Ljwg2k182tB9JIawiszXhZ	555	1986	1715	8000	0	genejaelee@gmail.com
78	2014-07-29 16:26:45.467904	2014-07-29 16:26:45.467904	tok_14LjzR2k182tB9JIVNe3fIls	556	1987	1715	8000	0	genejaelee@gmail.com
79	2014-07-29 16:29:44.600733	2014-07-29 16:29:44.600733	tok_14Lk2K2k182tB9JIpcHYgSfr	557	1988	1715	8000	0	genejaelee@gmail.com
80	2014-07-30 20:02:35.218152	2014-07-30 20:02:35.218152	tok_14M9pq2k182tB9JIg6b5bET6	563	2470	1715	3000	0	blah@gmail.com
81	2014-07-30 20:11:21.99691	2014-07-30 20:11:21.99691	tok_14M9yL2k182tB9JIM1UsksND	564	1408	1715	3000	0	genejaelee@gmail.com
82	2014-07-30 20:18:58.404082	2014-07-30 20:18:58.404082	tok_14MA5i2k182tB9JIvl130cCi	565	1408	1715	4500	0	genejaelee@gmail.com
83	2014-08-01 22:40:27.56965	2014-08-01 22:40:27.56965	tok_14MohH2k182tB9JIcrIAV5ew	571	2563	1715	3000	0	emailtest4@gmail.com
84	2014-08-01 22:41:33.588178	2014-08-01 22:41:33.588178	tok_14MoiJ2k182tB9JI9eDNKPZV	572	2563	1715	3000	0	emailtest4@gmail.com
85	2014-08-01 22:43:35.246093	2014-08-01 22:43:35.246093	tok_14MokI2k182tB9JIPx5x2lCu	573	2563	1715	3000	0	emailtest4@gmail.com
\.


--
-- Name: charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('charges_id_seq', 85, true);


--
-- Data for Name: chat_users; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY chat_users (id, nickname, created_at, updated_at, time_zone, user_id, chat_id) FROM stdin;
3	user_1401314423	2014-05-28 22:00:23.48121	2014-05-28 22:00:23.48121	\N	\N	\N
2	Gene2	2014-05-28 20:45:08.692405	2014-05-29 20:09:51.150729	America/Santiago	\N	\N
46	hello	2014-07-07 13:19:54.794226	2014-07-09 15:45:07.364859	\N	40	60
4	New-guy	2014-05-29 20:51:22.15223	2014-05-29 20:54:50.507447	\N	\N	\N
1	genobean2	2014-05-28 18:58:09.003857	2014-05-29 21:06:11.449475	America/Santiago	\N	\N
5	gene	2014-05-29 21:57:43.929461	2014-05-29 22:45:26.279808	\N	\N	\N
6	user_1401420433	2014-05-30 03:27:13.924442	2014-05-30 03:27:13.929998	America/Santiago	\N	\N
7	user_1401487343	2014-05-30 22:02:23.134719	2014-05-30 22:02:23.134719	\N	\N	\N
8	user_1401487367	2014-05-30 22:02:47.290241	2014-05-30 22:02:47.290241	\N	\N	\N
9	user_1401487368	2014-05-30 22:02:48.079239	2014-05-30 22:02:48.079239	\N	\N	\N
10	user_1401487368	2014-05-30 22:02:48.480902	2014-05-30 22:02:48.480902	\N	\N	\N
11	user_1401487385	2014-05-30 22:03:05.720307	2014-05-30 22:03:05.720307	\N	\N	\N
12	user_1401487405	2014-05-30 22:03:25.294639	2014-05-30 22:03:25.294639	\N	\N	\N
13	user_1401488168	2014-05-30 22:16:08.998787	2014-05-30 22:16:08.998787	\N	\N	\N
14	user_1401488169	2014-05-30 22:16:09.160909	2014-05-30 22:16:09.160909	\N	\N	\N
15	user_1401560628	2014-05-31 18:23:48.696671	2014-05-31 18:23:48.696671	\N	\N	\N
16	user_1401832534	2014-06-03 21:55:34.779588	2014-06-03 21:55:34.779588	\N	\N	\N
17	user_1401832561	2014-06-03 21:56:01.384158	2014-06-03 22:06:09.480785	America/Santiago	\N	\N
19	notgene	2014-06-24 17:53:19.809061	2014-06-24 17:53:31.448689	\N	\N	\N
45	nickname2	2014-07-07 13:18:52.654102	2014-07-09 15:45:39.240269	\N	86	70
21	user_1403845543	2014-06-27 05:05:43.072019	2014-07-02 22:23:10.777545	\N	669	\N
22	gene	2014-06-27 05:54:14.071295	2014-07-02 22:23:10.791095	\N	699	\N
23	user_1403884015	2014-06-27 15:46:55.274613	2014-07-02 22:23:10.792955	\N	703	\N
24	user_1403889977	2014-06-27 17:26:17.219356	2014-07-02 22:23:10.794446	\N	711	\N
25	hello	2014-06-27 17:57:01.216534	2014-07-02 22:23:10.795848	\N	715	\N
279	user_1404948887	2014-07-09 19:34:47.076026	2014-07-09 19:34:47.080449	\N	86	70
49	blah blah blah	2014-07-07 13:21:42.647979	2014-07-07 13:35:29.165207	\N	40	63
50	test	2014-07-07 13:28:05.259861	2014-07-07 13:40:50.454343	\N	40	\N
33	user_1404090032	2014-06-30 01:00:32.115789	2014-07-02 22:23:10.805303	\N	26	\N
43	change	2014-07-02 22:06:17.260667	2014-07-07 13:44:14.444546	\N	40	\N
18	genelee	2014-06-24 17:06:08.711626	2014-06-25 15:35:06.848478	America/Santiago	\N	\N
20	user_1403789989	2014-06-26 13:39:49.217168	2014-06-26 13:39:49.220686	America/Santiago	\N	\N
48	number ten	2014-07-07 13:21:35.743918	2014-07-07 14:05:32.299919	\N	40	67
52	blah	2014-07-07 14:08:51.418402	2014-07-07 14:08:59.929822	\N	40	62
51	gene10	2014-07-07 13:32:25.467068	2014-07-08 01:17:49.576554	\N	40	69
27	user_1403996482	2014-06-28 23:01:22.449201	2014-07-02 22:34:03.453276	\N	41	\N
28	genejaelee	2014-06-29 04:29:58.989817	2014-07-02 22:34:03.465059	\N	42	\N
29	user_1404075349	2014-06-29 20:55:49.46887	2014-07-02 22:34:03.467862	\N	58	\N
30	user_1404084692	2014-06-29 23:31:32.938589	2014-07-02 22:34:03.470502	\N	59	\N
31	user_1404087009	2014-06-30 00:10:09.12688	2014-07-02 22:34:03.47299	\N	60	\N
32	user_1404089481	2014-06-30 00:51:21.229596	2014-07-02 22:34:03.47554	\N	61	\N
34	user_1404090721	2014-06-30 01:12:01.997177	2014-07-02 22:34:03.47915	\N	62	\N
35	user_1404101463	2014-06-30 04:11:03.230135	2014-07-02 22:34:03.481597	\N	64	\N
36	user_1404102336	2014-06-30 04:25:36.723473	2014-07-02 22:34:03.48399	\N	65	\N
37	user_1404107567	2014-06-30 05:52:47.951459	2014-07-02 22:34:03.487453	\N	67	\N
38	user_1404110736	2014-06-30 06:45:36.101231	2014-07-02 22:34:03.489982	\N	68	\N
39	user_1404112822	2014-06-30 07:20:22.440023	2014-07-02 22:34:03.492425	\N	69	\N
40	user_1404113242	2014-06-30 07:27:22.658812	2014-07-02 22:34:03.49485	\N	70	\N
41	user_1404162736	2014-06-30 21:12:16.610916	2014-07-02 22:34:03.497286	\N	71	\N
42	user_1404187417	2014-07-01 00:03:37.496597	2014-07-02 22:34:03.499872	\N	81	\N
26	johnson	2014-06-27 21:01:33.589672	2014-07-06 17:24:08.808612	\N	40	\N
44	notjohnson	2014-07-02 22:38:11.904043	2014-07-06 17:24:14.426285	Central Time (US & Canada)	39	\N
47	user_1404753662	2014-07-07 13:21:02.773887	2014-07-07 13:21:02.775815	\N	40	\N
53	hello	2014-07-08 15:35:52.849343	2014-07-08 19:47:25.940875	Central Time (US & Canada)	39	59
54	\N	2014-07-09 13:46:21.679288	2014-07-09 13:46:21.679288	\N	\N	\N
55	\N	2014-07-09 13:46:40.692183	2014-07-09 13:46:40.692183	\N	\N	\N
56	\N	2014-07-09 13:46:42.915111	2014-07-09 13:46:42.915111	\N	\N	\N
57	user_1404928014	2014-07-09 13:46:54.748914	2014-07-09 13:46:54.751758	\N	\N	70
58	user_1404928057	2014-07-09 13:47:37.205136	2014-07-09 13:47:37.212939	\N	\N	70
59	user_1404928066	2014-07-09 13:47:46.964458	2014-07-09 13:47:46.969231	\N	\N	70
60	user_1404928119	2014-07-09 13:48:39.343666	2014-07-09 13:48:39.350357	\N	\N	70
61	user_1404928120	2014-07-09 13:48:40.517221	2014-07-09 13:48:40.5194	\N	40	70
62	user_1404928175	2014-07-09 13:49:35.125188	2014-07-09 13:49:35.128824	\N	\N	70
63	user_1404928190	2014-07-09 13:49:50.14914	2014-07-09 13:49:50.15318	\N	\N	70
64	user_1404928258	2014-07-09 13:50:58.053465	2014-07-09 13:50:58.071628	\N	\N	70
65	user_1404928259	2014-07-09 13:50:59.912256	2014-07-09 13:50:59.917022	\N	\N	70
66	user_1404928270	2014-07-09 13:51:10.013508	2014-07-09 13:51:10.026169	\N	\N	70
70	user_1404928769	2014-07-09 13:59:29.417032	2014-07-09 13:59:29.428534	\N	\N	70
71	user_1404928806	2014-07-09 14:00:06.965357	2014-07-09 14:00:06.977029	\N	\N	70
72	user_1404928815	2014-07-09 14:00:15.354481	2014-07-09 14:00:15.359681	\N	\N	70
73	user_1404929023	2014-07-09 14:03:43.692152	2014-07-09 14:03:43.70585	\N	\N	70
74	user_1404929199	2014-07-09 14:06:39.859106	2014-07-09 14:06:39.863426	\N	\N	70
75	user_1404929223	2014-07-09 14:07:03.133933	2014-07-09 14:07:03.138344	\N	\N	70
76	user_1404929231	2014-07-09 14:07:11.011024	2014-07-09 14:07:11.01539	\N	\N	70
77	user_1404929299	2014-07-09 14:08:19.11808	2014-07-09 14:08:19.122566	\N	\N	70
78	user_1404929395	2014-07-09 14:09:55.678358	2014-07-09 14:09:55.683654	\N	\N	70
79	user_1404929492	2014-07-09 14:11:32.649815	2014-07-09 14:11:32.668243	\N	\N	70
80	user_1404929505	2014-07-09 14:11:45.895753	2014-07-09 14:11:45.900737	\N	\N	70
81	user_1404929766	2014-07-09 14:16:06.749585	2014-07-09 14:16:06.754247	\N	\N	70
82	user_1404929814	2014-07-09 14:16:54.995467	2014-07-09 14:16:55.001348	\N	\N	70
83	user_1404929939	2014-07-09 14:18:59.322047	2014-07-09 14:18:59.325612	\N	\N	70
84	user_1404929986	2014-07-09 14:19:46.106799	2014-07-09 14:19:46.111639	\N	\N	70
85	user_1404930020	2014-07-09 14:20:20.868781	2014-07-09 14:20:20.873897	\N	\N	70
86	user_1404930053	2014-07-09 14:20:53.151956	2014-07-09 14:20:53.157164	\N	\N	70
87	user_1404930235	2014-07-09 14:23:55.297981	2014-07-09 14:23:55.304305	\N	\N	70
88	user_1404930305	2014-07-09 14:25:05.339262	2014-07-09 14:25:05.344306	\N	\N	70
89	user_1404930348	2014-07-09 14:25:48.030207	2014-07-09 14:25:48.03347	\N	\N	70
90	user_1404930392	2014-07-09 14:26:32.291946	2014-07-09 14:26:32.295629	\N	\N	70
91	user_1404930544	2014-07-09 14:29:04.177311	2014-07-09 14:29:04.189485	\N	\N	70
92	user_1404930579	2014-07-09 14:29:39.548353	2014-07-09 14:29:39.551363	\N	\N	70
93	user_1404930596	2014-07-09 14:29:56.720528	2014-07-09 14:29:56.725933	\N	\N	70
94	user_1404930597	2014-07-09 14:29:57.970326	2014-07-09 14:29:57.97473	\N	\N	70
95	user_1404930633	2014-07-09 14:30:33.167263	2014-07-09 14:30:33.171275	\N	\N	70
96	user_1404930638	2014-07-09 14:30:38.260752	2014-07-09 14:30:38.264536	\N	\N	70
97	user_1404930753	2014-07-09 14:32:33.839185	2014-07-09 14:32:33.853914	\N	\N	70
98	user_1404930802	2014-07-09 14:33:22.400792	2014-07-09 14:33:22.413799	\N	\N	70
67	user_1404931466	2014-07-09 13:51:46.577878	2014-07-09 14:44:26.57972	\N	\N	70
68	user_1404931483	2014-07-09 13:53:13.693209	2014-07-09 14:44:43.169763	\N	\N	70
99	user_1404930838	2014-07-09 14:33:58.758032	2014-07-09 14:33:58.774222	\N	\N	70
146	user_1404933936	2014-07-09 15:25:36.831437	2014-07-09 15:25:36.835162	\N	86	70
100	user_1404931046	2014-07-09 14:37:26.175331	2014-07-09 14:37:26.187855	\N	\N	70
147	\N	2014-07-09 15:25:39.845259	2014-07-09 15:25:39.845259	\N	\N	\N
101	user_1404931053	2014-07-09 14:37:33.653246	2014-07-09 14:37:33.658474	\N	\N	70
280	user_1404948910	2014-07-09 19:35:10.653086	2014-07-09 19:35:10.65518	\N	86	70
102	user_1404931116	2014-07-09 14:38:36.232358	2014-07-09 14:38:36.248131	\N	\N	70
148	user_1404933943	2014-07-09 15:25:43.336332	2014-07-09 15:25:43.339584	\N	86	70
103	user_1404931355	2014-07-09 14:42:35.84964	2014-07-09 14:42:35.862835	\N	\N	70
149	\N	2014-07-09 15:25:46.15803	2014-07-09 15:25:46.15803	\N	\N	\N
104	user_1404931365	2014-07-09 14:42:45.175833	2014-07-09 14:42:45.17976	\N	\N	70
105	user_1404931373	2014-07-09 14:42:53.308589	2014-07-09 14:42:53.312081	\N	\N	70
150	user_1404933966	2014-07-09 15:26:06.551621	2014-07-09 15:26:06.55491	\N	86	70
106	user_1404931376	2014-07-09 14:42:56.07121	2014-07-09 14:42:56.075928	\N	\N	70
107	user_1404931377	2014-07-09 14:42:57.721875	2014-07-09 14:42:57.726339	\N	\N	70
108	\N	2014-07-09 14:47:13.569688	2014-07-09 14:47:13.569688	\N	\N	\N
109	\N	2014-07-09 14:47:16.173853	2014-07-09 14:47:16.173853	\N	\N	\N
151	user_1404934004	2014-07-09 15:26:44.013464	2014-07-09 15:26:44.017736	\N	86	70
110	user_1404931653	2014-07-09 14:47:33.237573	2014-07-09 14:47:33.250293	\N	\N	70
111	\N	2014-07-09 14:47:36.026235	2014-07-09 14:47:36.026235	\N	\N	\N
112	\N	2014-07-09 14:47:38.007199	2014-07-09 14:47:38.007199	\N	\N	\N
113	user_1404931803	2014-07-09 14:50:03.241602	2014-07-09 14:50:03.241602	\N	\N	70
114	user_1404931894	2014-07-09 14:51:34.181114	2014-07-09 14:51:34.181114	\N	\N	70
115	user_1404932057	2014-07-09 14:54:17.142413	2014-07-09 14:54:17.142413	\N	\N	70
116	user_1404932084	2014-07-09 14:54:44.314803	2014-07-09 14:54:44.314803	\N	\N	70
117	user_1404932315	2014-07-09 14:58:35.099341	2014-07-09 14:58:35.099341	\N	\N	70
118	user_1404932397	2014-07-09 14:59:57.382239	2014-07-09 14:59:57.382239	\N	\N	70
152	\N	2014-07-09 15:26:47.38101	2014-07-09 15:26:47.38101	\N	\N	\N
119	user_1404933223	2014-07-09 15:13:43.734165	2014-07-09 15:13:43.738554	\N	\N	70
120	\N	2014-07-09 15:13:48.323674	2014-07-09 15:13:48.323674	\N	\N	\N
153	\N	2014-07-09 15:27:38.983265	2014-07-09 15:27:38.983265	\N	\N	\N
121	user_1404933324	2014-07-09 15:15:24.243786	2014-07-09 15:15:24.247593	\N	86	70
122	\N	2014-07-09 15:15:27.413054	2014-07-09 15:15:27.413054	\N	\N	\N
123	user_1404933378	2014-07-09 15:16:18.741234	2014-07-09 15:16:18.744951	\N	86	70
124	\N	2014-07-09 15:16:21.249729	2014-07-09 15:16:21.249729	\N	\N	\N
154	user_1404934063	2014-07-09 15:27:43.113599	2014-07-09 15:27:43.117654	\N	86	70
125	user_1404933541	2014-07-09 15:19:01.170956	2014-07-09 15:19:01.174663	\N	86	70
126	\N	2014-07-09 15:19:04.813259	2014-07-09 15:19:04.813259	\N	\N	\N
155	\N	2014-07-09 15:27:46.593651	2014-07-09 15:27:46.593651	\N	\N	\N
127	user_1404933612	2014-07-09 15:20:12.325627	2014-07-09 15:20:12.329898	\N	86	70
128	\N	2014-07-09 15:20:16.434748	2014-07-09 15:20:16.434748	\N	\N	\N
129	user_1404933636	2014-07-09 15:20:36.112561	2014-07-09 15:20:36.116905	\N	86	70
130	\N	2014-07-09 15:20:37.898571	2014-07-09 15:20:37.898571	\N	\N	\N
156	user_1404934108	2014-07-09 15:28:28.091748	2014-07-09 15:28:28.096175	\N	86	70
131	user_1404933678	2014-07-09 15:21:18.205438	2014-07-09 15:21:18.209331	\N	86	70
132	\N	2014-07-09 15:21:34.184685	2014-07-09 15:21:34.184685	\N	\N	\N
133	user_1404933729	2014-07-09 15:22:09.461076	2014-07-09 15:22:09.465013	\N	86	70
157	user_1404934110	2014-07-09 15:28:30.012085	2014-07-09 15:28:30.014195	\N	86	70
134	user_1404933757	2014-07-09 15:22:37.205242	2014-07-09 15:22:37.209281	\N	86	70
135	\N	2014-07-09 15:22:38.855174	2014-07-09 15:22:38.855174	\N	\N	\N
136	user_1404933789	2014-07-09 15:23:09.586198	2014-07-09 15:23:09.590403	\N	86	70
137	\N	2014-07-09 15:23:12.307066	2014-07-09 15:23:12.307066	\N	\N	\N
158	user_1404934112	2014-07-09 15:28:32.776143	2014-07-09 15:28:32.779276	\N	86	70
138	user_1404933849	2014-07-09 15:24:09.859649	2014-07-09 15:24:09.863469	\N	86	70
139	\N	2014-07-09 15:24:16.573165	2014-07-09 15:24:16.573165	\N	\N	\N
140	user_1404933860	2014-07-09 15:24:20.291126	2014-07-09 15:24:20.293499	\N	86	70
141	\N	2014-07-09 15:24:25.885908	2014-07-09 15:24:25.885908	\N	\N	\N
159	user_1404934115	2014-07-09 15:28:35.587209	2014-07-09 15:28:35.589856	\N	86	70
142	user_1404933875	2014-07-09 15:24:35.623222	2014-07-09 15:24:35.627604	\N	86	70
143	\N	2014-07-09 15:24:37.251716	2014-07-09 15:24:37.251716	\N	\N	\N
144	user_1404933914	2014-07-09 15:25:14.483264	2014-07-09 15:25:14.487579	\N	86	70
145	user_1404933918	2014-07-09 15:25:18.576543	2014-07-09 15:25:18.583153	\N	86	70
175	user_1404935557	2014-07-09 15:52:37.102082	2014-07-09 15:52:37.105243	\N	86	70
176	user_1404935561	2014-07-09 15:52:41.245085	2014-07-09 15:52:41.248429	\N	86	70
69	whywhy	2014-07-09 13:53:15.311037	2014-07-09 15:41:35.907306	\N	86	70
160	im sad	2014-07-09 15:28:39.308239	2014-07-09 15:41:44.066391	\N	86	70
161	user_1404935346	2014-07-09 15:49:06.714217	2014-07-09 15:49:06.718023	\N	86	70
162	user_1404935349	2014-07-09 15:49:09.694924	2014-07-09 15:49:09.697025	\N	86	70
163	user_1404935368	2014-07-09 15:49:28.930245	2014-07-09 15:49:28.934048	\N	86	70
164	user_1404935370	2014-07-09 15:49:30.683933	2014-07-09 15:49:30.686259	\N	86	70
165	user_1404935450	2014-07-09 15:50:50.74595	2014-07-09 15:50:50.750308	\N	86	70
166	user_1404935453	2014-07-09 15:50:53.660285	2014-07-09 15:50:53.663124	\N	86	70
167	user_1404935458	2014-07-09 15:50:58.384659	2014-07-09 15:50:58.38644	\N	86	70
168	user_1404935461	2014-07-09 15:51:01.316308	2014-07-09 15:51:01.318386	\N	86	70
169	user_1404935464	2014-07-09 15:51:04.355305	2014-07-09 15:51:04.3575	\N	86	70
177	user_1404935663	2014-07-09 15:54:23.563103	2014-07-09 15:54:23.567731	\N	86	70
170	user_1404935467	2014-07-09 15:51:07.800612	2014-07-09 15:51:07.802893	\N	86	70
171	user_1404935486	2014-07-09 15:51:26.829043	2014-07-09 15:51:26.832897	\N	86	70
172	user_1404935489	2014-07-09 15:51:29.870106	2014-07-09 15:51:29.872575	\N	86	70
173	user_1404935512	2014-07-09 15:51:52.837931	2014-07-09 15:51:52.84181	\N	86	70
174	user_1404935513	2014-07-09 15:51:53.423202	2014-07-09 15:51:53.42693	\N	86	70
178	user_1404935687	2014-07-09 15:54:47.538195	2014-07-09 15:54:47.542254	\N	86	70
179	changing it	2014-07-09 15:55:08.014997	2014-07-09 15:55:37.88665	\N	40	59
180	user_1404936160	2014-07-09 16:02:40.781393	2014-07-09 16:02:40.78564	\N	86	70
181	user_1404936184	2014-07-09 16:03:04.987929	2014-07-09 16:03:04.989771	\N	86	70
182	user_1404936186	2014-07-09 16:03:06.505107	2014-07-09 16:03:06.508248	\N	86	70
183	user_1404936205	2014-07-09 16:03:25.362144	2014-07-09 16:03:25.366372	\N	86	70
184	user_1404936227	2014-07-09 16:03:47.634626	2014-07-09 16:03:47.637044	\N	86	70
185	user_1404936249	2014-07-09 16:04:09.378622	2014-07-09 16:04:09.382065	\N	86	70
186	user_1404936354	2014-07-09 16:05:54.158556	2014-07-09 16:05:54.162455	\N	86	70
187	user_1404936519	2014-07-09 16:08:39.512753	2014-07-09 16:08:39.517087	\N	86	70
188	change	2014-07-09 16:08:48.456818	2014-07-09 16:08:57.811036	\N	86	70
189	user_1404936546	2014-07-09 16:09:06.900015	2014-07-09 16:09:06.902998	\N	86	70
190	test	2014-07-09 16:47:32.841711	2014-07-09 16:47:44.36331	\N	86	70
191	user_1404938867	2014-07-09 16:47:47.909539	2014-07-09 16:47:47.913122	\N	86	70
192	user_1404938898	2014-07-09 16:48:18.667572	2014-07-09 16:48:18.669594	\N	86	70
193	user_1404938901	2014-07-09 16:48:21.111978	2014-07-09 16:48:21.115506	\N	86	70
194	user_1404938905	2014-07-09 16:48:25.003434	2014-07-09 16:48:25.006806	\N	86	70
195	user_1404938941	2014-07-09 16:49:01.567522	2014-07-09 16:49:01.570821	\N	86	70
196	user_1404940602	2014-07-09 17:16:42.337744	2014-07-09 17:16:42.341725	\N	86	70
197	user_1404940637	2014-07-09 17:17:17.385026	2014-07-09 17:17:17.388539	\N	86	70
198	user_1404940647	2014-07-09 17:17:27.237563	2014-07-09 17:17:27.239283	\N	86	70
199	user_1404940767	2014-07-09 17:19:27.792219	2014-07-09 17:19:27.795756	Central Time (US & Canada)	39	60
281	user_1404948928	2014-07-09 19:35:28.140141	2014-07-09 19:35:28.143924	\N	86	70
200	user_1404944907	2014-07-09 18:28:27.151667	2014-07-09 18:28:27.158541	\N	86	70
201	user_1404944907	2014-07-09 18:28:27.43449	2014-07-09 18:28:27.440665	\N	86	70
282	user_1404949000	2014-07-09 19:36:40.038455	2014-07-09 19:36:40.041495	\N	86	70
202	user_1404945052	2014-07-09 18:30:52.303639	2014-07-09 18:30:52.308125	\N	86	70
203	user_1404945099	2014-07-09 18:31:39.47125	2014-07-09 18:31:39.475559	\N	86	70
283	user_1404949027	2014-07-09 19:37:07.079597	2014-07-09 19:37:07.081682	\N	86	70
235	user_1404946402	2014-07-09 18:53:22.147877	2014-07-09 18:53:22.168081	\N	86	70
236	user_1404946415	2014-07-09 18:53:35.286353	2014-07-09 18:53:35.289527	\N	86	70
284	user_1404949128	2014-07-09 19:38:48.472583	2014-07-09 19:38:48.477131	\N	86	70
237	user_1404946905	2014-07-09 19:01:45.808871	2014-07-09 19:01:45.812628	\N	86	70
238	user_1404946905	2014-07-09 19:01:45.958347	2014-07-09 19:01:45.961956	\N	86	70
285	user_1404949136	2014-07-09 19:38:56.844849	2014-07-09 19:38:56.848553	\N	86	70
239	user_1404946982	2014-07-09 19:03:02.885098	2014-07-09 19:03:02.888545	\N	86	70
240	user_1404946990	2014-07-09 19:03:10.131068	2014-07-09 19:03:10.134213	\N	86	70
286	user_1404949159	2014-07-09 19:39:19.639423	2014-07-09 19:39:19.643649	\N	86	70
241	user_1404947070	2014-07-09 19:04:30.232744	2014-07-09 19:04:30.236748	\N	86	70
242	user_1404947089	2014-07-09 19:04:49.672463	2014-07-09 19:04:49.676187	\N	86	70
287	user_1404949188	2014-07-09 19:39:48.272634	2014-07-09 19:39:48.274372	\N	86	70
243	user_1404947118	2014-07-09 19:05:18.070805	2014-07-09 19:05:18.074488	\N	86	70
244	user_1404947134	2014-07-09 19:05:34.625974	2014-07-09 19:05:34.627859	\N	86	70
288	user_1404949203	2014-07-09 19:40:03.026253	2014-07-09 19:40:03.030377	\N	86	70
245	user_1404947163	2014-07-09 19:06:03.056149	2014-07-09 19:06:03.059259	\N	86	70
246	user_1404947181	2014-07-09 19:06:21.316778	2014-07-09 19:06:21.318531	\N	86	70
289	user_1404949219	2014-07-09 19:40:19.312163	2014-07-09 19:40:19.315277	\N	86	70
247	user_1404947296	2014-07-09 19:08:16.077278	2014-07-09 19:08:16.079708	\N	86	70
248	user_1404947301	2014-07-09 19:08:21.889394	2014-07-09 19:08:21.891251	\N	86	70
290	user_1404949257	2014-07-09 19:40:57.84219	2014-07-09 19:40:57.847175	\N	86	70
249	user_1404947313	2014-07-09 19:08:32.996846	2014-07-09 19:08:33.00126	\N	86	70
250	user_1404947359	2014-07-09 19:09:19.059054	2014-07-09 19:09:19.062685	\N	86	70
291	user_1404949270	2014-07-09 19:41:10.322479	2014-07-09 19:41:10.324228	\N	86	70
251	user_1404947689	2014-07-09 19:14:49.443501	2014-07-09 19:14:49.449288	\N	86	70
252	user_1404947838	2014-07-09 19:17:18.881778	2014-07-09 19:17:18.885958	\N	86	70
292	user_1404949360	2014-07-09 19:42:40.082882	2014-07-09 19:42:40.085841	\N	86	70
253	user_1404947926	2014-07-09 19:18:46.603291	2014-07-09 19:18:46.607074	\N	86	70
254	user_1404947939	2014-07-09 19:18:59.402072	2014-07-09 19:18:59.40782	\N	86	70
293	user_1404949371	2014-07-09 19:42:51.927122	2014-07-09 19:42:51.931611	\N	86	70
255	user_1404947996	2014-07-09 19:19:56.063649	2014-07-09 19:19:56.067291	\N	86	70
256	user_1404948095	2014-07-09 19:21:35.045521	2014-07-09 19:21:35.048496	\N	86	70
294	user_1404949386	2014-07-09 19:43:06.457593	2014-07-09 19:43:06.460453	\N	86	70
257	user_1404948139	2014-07-09 19:22:19.263541	2014-07-09 19:22:19.26562	\N	86	70
258	user_1404948209	2014-07-09 19:23:29.271689	2014-07-09 19:23:29.275122	\N	86	70
295	user_1404949466	2014-07-09 19:44:26.166493	2014-07-09 19:44:26.170623	\N	86	70
259	user_1404948247	2014-07-09 19:24:07.225408	2014-07-09 19:24:07.22873	\N	86	70
260	user_1404948308	2014-07-09 19:25:08.837921	2014-07-09 19:25:08.841175	\N	86	70
296	user_1404949501	2014-07-09 19:45:01.833285	2014-07-09 19:45:01.835442	\N	86	70
261	user_1404948325	2014-07-09 19:25:25.102854	2014-07-09 19:25:25.104819	\N	86	70
262	user_1404948363	2014-07-09 19:26:03.018036	2014-07-09 19:26:03.022098	\N	86	70
297	user_1404949585	2014-07-09 19:46:25.995433	2014-07-09 19:46:25.997119	\N	86	70
263	user_1404948373	2014-07-09 19:26:13.885098	2014-07-09 19:26:13.888405	\N	86	70
264	user_1404948379	2014-07-09 19:26:19.957986	2014-07-09 19:26:19.961989	\N	86	70
298	user_1404949602	2014-07-09 19:46:42.746298	2014-07-09 19:46:42.748578	\N	86	70
265	user_1404948386	2014-07-09 19:26:26.177199	2014-07-09 19:26:26.180636	\N	86	70
266	user_1404948406	2014-07-09 19:26:46.197625	2014-07-09 19:26:46.201252	\N	86	70
299	user_1404949608	2014-07-09 19:46:48.768903	2014-07-09 19:46:48.77219	\N	86	70
267	user_1404948430	2014-07-09 19:27:10.614563	2014-07-09 19:27:10.61635	\N	86	70
268	user_1404948458	2014-07-09 19:27:38.086996	2014-07-09 19:27:38.088785	\N	86	70
300	user_1404949627	2014-07-09 19:47:07.897136	2014-07-09 19:47:07.898888	\N	86	70
269	user_1404948519	2014-07-09 19:28:39.6354	2014-07-09 19:28:39.637563	\N	86	70
270	user_1404948558	2014-07-09 19:29:18.165718	2014-07-09 19:29:18.167672	\N	86	70
301	user_1404949684	2014-07-09 19:48:04.698252	2014-07-09 19:48:04.701837	\N	86	70
271	user_1404948574	2014-07-09 19:29:34.887481	2014-07-09 19:29:34.891034	\N	86	70
272	user_1404948664	2014-07-09 19:31:04.172505	2014-07-09 19:31:04.175685	\N	86	70
302	user_1404949702	2014-07-09 19:48:22.779201	2014-07-09 19:48:22.781086	\N	86	70
273	user_1404948670	2014-07-09 19:31:10.929868	2014-07-09 19:31:10.931639	\N	86	70
274	user_1404948703	2014-07-09 19:31:43.61352	2014-07-09 19:31:43.671878	\N	86	70
303	user_1404951932	2014-07-09 20:25:32.466685	2014-07-09 20:25:32.469927	\N	86	70
275	user_1404948726	2014-07-09 19:32:06.742953	2014-07-09 19:32:06.747339	\N	86	70
276	user_1404948728	2014-07-09 19:32:08.94991	2014-07-09 19:32:08.957368	\N	86	70
304	user_1404951964	2014-07-09 20:26:04.664769	2014-07-09 20:26:04.668225	\N	86	70
277	user_1404948845	2014-07-09 19:34:05.223372	2014-07-09 19:34:05.227147	\N	86	70
278	user_1404948858	2014-07-09 19:34:18.222732	2014-07-09 19:34:18.227328	\N	86	70
305	user_1404952013	2014-07-09 20:26:53.245224	2014-07-09 20:26:53.248838	\N	86	70
306	user_1404952039	2014-07-09 20:27:19.453142	2014-07-09 20:27:19.454849	\N	86	70
307	user_1404952062	2014-07-09 20:27:42.781333	2014-07-09 20:27:42.783434	\N	86	70
308	user_1404952090	2014-07-09 20:28:10.748877	2014-07-09 20:28:10.750676	\N	86	70
309	user_1404952117	2014-07-09 20:28:37.583705	2014-07-09 20:28:37.586945	\N	86	70
310	user_1404952217	2014-07-09 20:30:17.326751	2014-07-09 20:30:17.331851	\N	86	70
311	user_1404952294	2014-07-09 20:31:34.403096	2014-07-09 20:31:34.406392	\N	86	70
312	user_1404952380	2014-07-09 20:33:00.168921	2014-07-09 20:33:00.172921	\N	86	70
313	user_1404952388	2014-07-09 20:33:08.331983	2014-07-09 20:33:08.335549	\N	86	70
314	user_1404952399	2014-07-09 20:33:19.636234	2014-07-09 20:33:19.639755	\N	86	70
315	user_1404952434	2014-07-09 20:33:54.283127	2014-07-09 20:33:54.284965	\N	86	70
316	user_1404952492	2014-07-09 20:34:52.164318	2014-07-09 20:34:52.168427	\N	86	70
317	user_1404952507	2014-07-09 20:35:07.809759	2014-07-09 20:35:07.812012	\N	86	70
318	user_1404952512	2014-07-09 20:35:12.577491	2014-07-09 20:35:12.580424	\N	86	70
319	user_1404952548	2014-07-09 20:35:48.953474	2014-07-09 20:35:48.955532	\N	86	70
320	user_1404952591	2014-07-09 20:36:31.607951	2014-07-09 20:36:31.611747	\N	86	70
321	user_1404952628	2014-07-09 20:37:08.284174	2014-07-09 20:37:08.285851	\N	86	70
322	user_1404952633	2014-07-09 20:37:13.446953	2014-07-09 20:37:13.448723	\N	86	70
323	user_1404952729	2014-07-09 20:38:49.006841	2014-07-09 20:38:49.01043	\N	86	70
324	user_1404952875	2014-07-09 20:41:15.235521	2014-07-09 20:41:15.237892	\N	86	70
400	user_1405441831	2014-07-15 12:30:31.620543	2014-07-15 12:30:31.62569	\N	94	70
325	user_1404952971	2014-07-09 20:42:51.83015	2014-07-09 20:42:51.832009	\N	86	70
2571	user_1405997534	2014-07-21 22:52:14.272442	2014-07-21 22:52:14.275979	\N	94	79
326	user_1404953006	2014-07-09 20:43:26.880817	2014-07-09 20:43:26.885016	\N	86	70
401	user_1405443528	2014-07-15 12:58:48.836496	2014-07-15 12:58:48.838744	\N	94	70
327	user_1404953066	2014-07-09 20:44:26.807456	2014-07-09 20:44:26.812178	\N	86	70
328	user_1404953070	2014-07-09 20:44:30.826606	2014-07-09 20:44:30.829184	\N	86	70
402	user_1405443549	2014-07-15 12:59:09.57508	2014-07-15 12:59:09.576894	\N	94	70
329	user_1404953234	2014-07-09 20:47:14.526597	2014-07-09 20:47:14.529864	\N	86	70
330	user_1404953338	2014-07-09 20:48:58.510879	2014-07-09 20:48:58.516048	\N	86	70
403	user_1405443554	2014-07-15 12:59:14.446197	2014-07-15 12:59:14.448053	\N	94	70
331	user_1404953368	2014-07-09 20:49:28.37909	2014-07-09 20:49:28.382476	\N	86	70
332	user_1404953371	2014-07-09 20:49:31.970255	2014-07-09 20:49:31.975053	\N	86	70
404	user_1405443564	2014-07-15 12:59:24.453669	2014-07-15 12:59:24.455539	\N	94	70
333	user_1404953382	2014-07-09 20:49:42.300969	2014-07-09 20:49:42.304655	\N	86	70
334	user_1404953411	2014-07-09 20:50:11.282191	2014-07-09 20:50:11.286915	\N	86	70
405	user_1405443575	2014-07-15 12:59:35.399096	2014-07-15 12:59:35.400957	\N	94	70
335	user_1404953443	2014-07-09 20:50:43.138461	2014-07-09 20:50:43.140153	\N	86	70
336	user_1404953455	2014-07-09 20:50:55.430964	2014-07-09 20:50:55.433358	\N	86	70
406	user_1405443578	2014-07-15 12:59:38.749642	2014-07-15 12:59:38.751636	\N	94	70
337	user_1404953472	2014-07-09 20:51:12.481184	2014-07-09 20:51:12.484727	\N	86	70
338	user_1404953479	2014-07-09 20:51:19.460289	2014-07-09 20:51:19.462329	\N	86	70
407	user_1405443583	2014-07-15 12:59:43.560542	2014-07-15 12:59:43.562673	\N	94	70
339	user_1404953493	2014-07-09 20:51:33.709766	2014-07-09 20:51:33.712962	\N	86	70
340	user_1404953502	2014-07-09 20:51:42.188726	2014-07-09 20:51:42.190868	\N	86	70
408	user_1405443589	2014-07-15 12:59:49.830479	2014-07-15 12:59:49.832283	\N	94	70
341	user_1404953507	2014-07-09 20:51:47.374127	2014-07-09 20:51:47.376596	\N	86	70
342	user_1404953528	2014-07-09 20:52:08.917225	2014-07-09 20:52:08.920834	\N	86	70
409	user_1405443897	2014-07-15 13:04:57.328433	2014-07-15 13:04:57.330557	\N	94	70
343	user_1404953534	2014-07-09 20:52:14.983171	2014-07-09 20:52:14.987034	\N	86	70
344	user_1404953660	2014-07-09 20:54:20.909851	2014-07-09 20:54:20.911637	\N	86	70
410	user_1405444677	2014-07-15 13:17:57.905156	2014-07-15 13:17:57.907828	\N	94	70
345	user_1404953713	2014-07-09 20:55:13.136113	2014-07-09 20:55:13.137999	\N	86	70
346	user_1404953736	2014-07-09 20:55:36.136853	2014-07-09 20:55:36.138991	\N	86	70
411	user_1405444678	2014-07-15 13:17:58.037004	2014-07-15 13:17:58.03911	\N	94	70
347	user_1404953810	2014-07-09 20:56:50.027885	2014-07-09 20:56:50.029816	\N	86	70
348	user_1404953817	2014-07-09 20:56:57.641441	2014-07-09 20:56:57.644692	\N	86	70
349	user_1404953828	2014-07-09 20:57:08.388136	2014-07-09 20:57:08.389999	\N	86	70
350	user_1404953839	2014-07-09 20:57:19.461111	2014-07-09 20:57:19.464671	\N	86	70
351	user_1404953846	2014-07-09 20:57:26.068531	2014-07-09 20:57:26.072889	\N	86	70
413	user_1405476542	2014-07-15 22:09:02.125266	2014-07-15 22:09:02.127618	\N	94	70
352	user_1404953852	2014-07-09 20:57:32.82373	2014-07-09 20:57:32.829263	\N	86	70
353	user_1404953868	2014-07-09 20:57:48.219996	2014-07-09 20:57:48.221747	\N	86	70
354	user_1404953874	2014-07-09 20:57:54.712114	2014-07-09 20:57:54.716187	\N	86	70
414	gene	2014-07-15 22:09:02.322526	2014-07-15 22:09:07.826598	\N	94	70
355	user_1404953947	2014-07-09 20:59:07.937273	2014-07-09 20:59:07.940576	\N	86	70
356	user_1404953963	2014-07-09 20:59:23.93303	2014-07-09 20:59:23.938571	\N	86	70
415	user_1405476632	2014-07-15 22:10:32.522906	2014-07-15 22:10:32.524563	\N	94	70
357	user_1404953970	2014-07-09 20:59:30.222704	2014-07-09 20:59:30.226717	\N	86	70
358	user_1404953978	2014-07-09 20:59:38.443397	2014-07-09 20:59:38.445866	\N	86	70
416	user_1405476794	2014-07-15 22:13:14.0143	2014-07-15 22:13:14.016142	\N	94	70
359	user_1404953990	2014-07-09 20:59:50.911396	2014-07-09 20:59:50.914537	\N	86	70
360	user_1404954049	2014-07-09 21:00:49.127133	2014-07-09 21:00:49.132061	\N	86	70
417	user_1405476798	2014-07-15 22:13:18.260514	2014-07-15 22:13:18.26383	\N	94	70
361	user_1404954069	2014-07-09 21:01:09.095755	2014-07-09 21:01:09.097952	\N	86	70
362	user_1404954113	2014-07-09 21:01:53.897331	2014-07-09 21:01:53.900318	\N	86	70
412	hey	2014-07-15 22:04:06.068496	2014-07-15 22:28:06.852192	\N	94	79
363	user_1404954358	2014-07-09 21:05:58.727203	2014-07-09 21:05:58.731492	\N	86	70
364	user_1404955671	2014-07-09 21:27:51.624899	2014-07-09 21:27:51.627882	\N	86	70
365	user_1404955671	2014-07-09 21:27:51.812474	2014-07-09 21:27:51.814964	\N	86	70
366	user_1404955776	2014-07-09 21:29:36.01843	2014-07-09 21:29:36.023513	\N	86	70
367	user_1404955807	2014-07-09 21:30:07.629912	2014-07-09 21:30:07.6339	\N	86	70
368	gene	2014-07-09 21:31:15.220745	2014-07-09 21:31:18.672306	\N	86	70
369	hello	2014-07-09 21:31:47.002489	2014-07-09 21:31:52.475879	\N	86	70
370	user_1405039517	2014-07-10 20:45:17.510663	2014-07-10 20:45:17.518228	\N	88	70
371	user_1405039517	2014-07-10 20:45:17.639886	2014-07-10 20:45:17.64164	\N	88	70
372	user_1405039522	2014-07-10 20:45:22.671744	2014-07-10 20:45:22.673783	\N	88	70
373	user_1405039529	2014-07-10 20:45:29.641465	2014-07-10 20:45:29.643569	\N	88	70
374	user_1405039689	2014-07-10 20:48:09.283974	2014-07-10 20:48:09.287132	\N	88	70
375	user_1405039850	2014-07-10 20:50:50.740004	2014-07-10 20:50:50.742587	\N	88	70
376	user_1405039856	2014-07-10 20:50:56.003863	2014-07-10 20:50:56.007991	\N	88	70
377	user_1405039893	2014-07-10 20:51:33.774258	2014-07-10 20:51:33.778712	\N	88	70
378	user_1405042150	2014-07-10 21:29:10.661105	2014-07-10 21:29:10.66449	\N	88	70
379	user_1405042192	2014-07-10 21:29:52.95625	2014-07-10 21:29:52.95801	\N	88	70
380	user_1405105440	2014-07-11 15:04:00.711868	2014-07-11 15:04:00.714494	\N	40	71
381	user_1405105938	2014-07-11 15:12:18.827632	2014-07-11 15:12:18.830152	\N	40	72
383	user_1405106399	2014-07-11 15:19:59.628364	2014-07-11 15:19:59.629911	Hawaii	89	74
384	user_1405106444	2014-07-11 15:20:44.798319	2014-07-11 15:20:44.799814	Santiago	91	75
385	user_1405106637	2014-07-11 15:23:57.097583	2014-07-11 15:23:57.100294	Santiago	91	76
386	user_1405107644	2014-07-11 15:40:44.325081	2014-07-11 15:40:44.328338	\N	92	77
387	user_1405107857	2014-07-11 15:44:17.47277	2014-07-11 15:44:17.475902	\N	93	78
388	user_1405118523	2014-07-11 18:42:03.042059	2014-07-11 18:42:03.046384	Santiago	90	78
389	user_1405362629	2014-07-14 14:30:29.705602	2014-07-14 14:30:29.710337	\N	94	70
390	user_1405362629	2014-07-14 14:30:29.979154	2014-07-14 14:30:29.982784	\N	94	70
391	user_1405362637	2014-07-14 14:30:37.066821	2014-07-14 14:30:37.069746	\N	94	70
392	user_1405362902	2014-07-14 14:35:01.966258	2014-07-14 14:35:02.039587	\N	94	70
393	user_1405388046	2014-07-14 21:34:06.87498	2014-07-14 21:34:06.884499	\N	94	70
394	user_1405388248	2014-07-14 21:37:28.941101	2014-07-14 21:37:28.945189	\N	94	70
395	user_1405388288	2014-07-14 21:38:08.189448	2014-07-14 21:38:08.193775	\N	94	70
396	user_1405388293	2014-07-14 21:38:13.610582	2014-07-14 21:38:13.61243	\N	94	70
397	user_1405388298	2014-07-14 21:38:18.328154	2014-07-14 21:38:18.330141	\N	94	70
398	user_1405438917	2014-07-15 11:41:57.673291	2014-07-15 11:41:57.682638	\N	94	70
399	user_1405438917	2014-07-15 11:41:57.842697	2014-07-15 11:41:57.845425	\N	94	70
418	user_1405476806	2014-07-15 22:13:26.905755	2014-07-15 22:13:26.907691	\N	94	70
546	user_1405608063	2014-07-17 10:41:03.58542	2014-07-17 10:41:03.588055	\N	94	79
419	user_1405476950	2014-07-15 22:15:50.543627	2014-07-15 22:15:50.545328	\N	94	70
420	user_1405477011	2014-07-15 22:16:51.925779	2014-07-15 22:16:51.927634	\N	94	70
421	user_1405477806	2014-07-15 22:30:06.678659	2014-07-15 22:30:06.682729	\N	94	79
422	user_1405477818	2014-07-15 22:30:18.467276	2014-07-15 22:30:18.470365	\N	94	79
423	user_1405477830	2014-07-15 22:30:30.317148	2014-07-15 22:30:30.320422	\N	94	79
424	gene	2014-07-15 22:30:31.747562	2014-07-15 22:30:39.549962	\N	94	79
425	user_1405477842	2014-07-15 22:30:42.712138	2014-07-15 22:30:42.715206	\N	94	79
426	user_1405526245	2014-07-16 11:57:25.949044	2014-07-16 11:57:25.955133	\N	94	79
427	user_1405526288	2014-07-16 11:58:08.927403	2014-07-16 11:58:08.929482	\N	94	79
428	user_1405526298	2014-07-16 11:58:18.935097	2014-07-16 11:58:18.937233	\N	94	79
429	user_1405526302	2014-07-16 11:58:22.442439	2014-07-16 11:58:22.444459	\N	94	79
430	user_1405526323	2014-07-16 11:58:43.862396	2014-07-16 11:58:43.865694	\N	94	79
431	user_1405526343	2014-07-16 11:59:03.919612	2014-07-16 11:59:03.922542	\N	94	79
432	user_1405526369	2014-07-16 11:59:29.332094	2014-07-16 11:59:29.335643	\N	94	79
433	user_1405526377	2014-07-16 11:59:37.226061	2014-07-16 11:59:37.229264	\N	94	70
434	user_1405526378	2014-07-16 11:59:38.005957	2014-07-16 11:59:38.008473	\N	94	70
435	user_1405526394	2014-07-16 11:59:54.329584	2014-07-16 11:59:54.331447	\N	94	70
436	user_1405526394	2014-07-16 11:59:54.43141	2014-07-16 11:59:54.432962	\N	94	70
437	user_1405526398	2014-07-16 11:59:58.681869	2014-07-16 11:59:58.684863	\N	94	79
438	gene	2014-07-16 11:59:59.049551	2014-07-16 12:01:36.880346	\N	94	79
439	user_1405526499	2014-07-16 12:01:39.737701	2014-07-16 12:01:39.740928	\N	94	79
440	user_1405526697	2014-07-16 12:04:57.64836	2014-07-16 12:04:57.651799	\N	94	79
441	user_1405528160	2014-07-16 12:29:20.612461	2014-07-16 12:29:20.616033	\N	94	79
442	user_1405528174	2014-07-16 12:29:34.504391	2014-07-16 12:29:34.50736	\N	94	70
443	user_1405528174	2014-07-16 12:29:34.636808	2014-07-16 12:29:34.639784	\N	94	70
444	user_1405528245	2014-07-16 12:30:45.773515	2014-07-16 12:30:45.77665	\N	94	70
445	user_1405528256	2014-07-16 12:30:56.37552	2014-07-16 12:30:56.377217	\N	94	70
446	user_1405528258	2014-07-16 12:30:58.892408	2014-07-16 12:30:58.895763	\N	94	79
447	user_1405528259	2014-07-16 12:30:59.332935	2014-07-16 12:30:59.334698	\N	94	79
448	user_1405528303	2014-07-16 12:31:43.353312	2014-07-16 12:31:43.355428	\N	94	79
449	user_1405528426	2014-07-16 12:33:46.311405	2014-07-16 12:33:46.314765	\N	94	79
450	user_1405528892	2014-07-16 12:41:32.544552	2014-07-16 12:41:32.547853	\N	94	79
451	user_1405528914	2014-07-16 12:41:54.041925	2014-07-16 12:41:54.045177	\N	94	79
452	user_1405528921	2014-07-16 12:42:01.080091	2014-07-16 12:42:01.082051	\N	94	79
453	user_1405528930	2014-07-16 12:42:10.465918	2014-07-16 12:42:10.468315	\N	94	79
454	user_1405528937	2014-07-16 12:42:17.874562	2014-07-16 12:42:17.876801	\N	94	79
455	user_1405528943	2014-07-16 12:42:23.33159	2014-07-16 12:42:23.334769	\N	94	79
456	user_1405528947	2014-07-16 12:42:27.362191	2014-07-16 12:42:27.365648	\N	94	79
457	user_1405528955	2014-07-16 12:42:35.39004	2014-07-16 12:42:35.392196	\N	94	79
458	user_1405528966	2014-07-16 12:42:46.28393	2014-07-16 12:42:46.285804	\N	94	79
459	user_1405528972	2014-07-16 12:42:52.508629	2014-07-16 12:42:52.510331	\N	94	79
460	user_1405529315	2014-07-16 12:48:35.821704	2014-07-16 12:48:35.825414	\N	94	79
461	user_1405529345	2014-07-16 12:49:05.632439	2014-07-16 12:49:05.634242	\N	94	79
462	gene	2014-07-16 12:51:42.934116	2014-07-16 12:51:48.785542	\N	94	79
463	hello test	2014-07-16 12:52:02.979182	2014-07-16 12:52:08.826084	\N	94	79
464	test	2014-07-16 12:52:22.773239	2014-07-16 12:52:26.462241	\N	94	79
465	gene	2014-07-16 12:54:46.446773	2014-07-16 12:54:51.342243	\N	94	79
466	gene	2014-07-16 12:57:00.519427	2014-07-16 12:57:39.615807	\N	94	79
467	user_1405530037	2014-07-16 13:00:37.396979	2014-07-16 13:00:37.400015	\N	94	79
468	user_1405530051	2014-07-16 13:00:51.104071	2014-07-16 13:00:51.106138	\N	94	79
469	user_1405530257	2014-07-16 13:04:17.791556	2014-07-16 13:04:17.795023	\N	94	79
470	user_1405530661	2014-07-16 13:11:01.003948	2014-07-16 13:11:01.00753	\N	94	79
471	user_1405530713	2014-07-16 13:11:53.607165	2014-07-16 13:11:53.608996	\N	94	79
472	user_1405530741	2014-07-16 13:12:21.012798	2014-07-16 13:12:21.014533	\N	94	79
473	user_1405530762	2014-07-16 13:12:42.39192	2014-07-16 13:12:42.395042	\N	94	79
474	user_1405530788	2014-07-16 13:13:08.722723	2014-07-16 13:13:08.724634	\N	94	79
475	user_1405530804	2014-07-16 13:13:24.669393	2014-07-16 13:13:24.751112	\N	94	79
476	user_1405530827	2014-07-16 13:13:47.511849	2014-07-16 13:13:47.513576	\N	94	79
477	user_1405530838	2014-07-16 13:13:58.673909	2014-07-16 13:13:58.675654	\N	94	79
478	user_1405530845	2014-07-16 13:14:05.49534	2014-07-16 13:14:05.497056	\N	94	79
479	user_1405530964	2014-07-16 13:16:04.389059	2014-07-16 13:16:04.392917	\N	94	79
480	user_1405530992	2014-07-16 13:16:32.360879	2014-07-16 13:16:32.363818	\N	94	79
481	user_1405531000	2014-07-16 13:16:40.573143	2014-07-16 13:16:40.575664	\N	94	79
482	user_1405531011	2014-07-16 13:16:51.511583	2014-07-16 13:16:51.51387	\N	94	79
483	user_1405531076	2014-07-16 13:17:56.243315	2014-07-16 13:17:56.246788	\N	94	79
484	user_1405531127	2014-07-16 13:18:47.427793	2014-07-16 13:18:47.429505	\N	94	79
485	user_1405531141	2014-07-16 13:19:01.040357	2014-07-16 13:19:01.042441	\N	94	79
486	user_1405531182	2014-07-16 13:19:42.077777	2014-07-16 13:19:42.079713	\N	94	79
487	user_1405531309	2014-07-16 13:21:49.931438	2014-07-16 13:21:49.934582	\N	94	79
488	user_1405531328	2014-07-16 13:22:08.883293	2014-07-16 13:22:08.885263	\N	94	79
489	user_1405531340	2014-07-16 13:22:20.412067	2014-07-16 13:22:20.415551	\N	94	79
490	user_1405531354	2014-07-16 13:22:34.866098	2014-07-16 13:22:34.867834	\N	94	79
491	user_1405531550	2014-07-16 13:25:50.156555	2014-07-16 13:25:50.161731	\N	94	79
492	user_1405531562	2014-07-16 13:26:02.313913	2014-07-16 13:26:02.317433	\N	94	79
493	user_1405531660	2014-07-16 13:27:40.354729	2014-07-16 13:27:40.357772	\N	94	79
494	user_1405531695	2014-07-16 13:28:15.685417	2014-07-16 13:28:15.689052	\N	94	79
495	user_1405531761	2014-07-16 13:29:21.194651	2014-07-16 13:29:21.197973	\N	94	79
496	user_1405531815	2014-07-16 13:30:15.772017	2014-07-16 13:30:15.775342	\N	94	79
497	user_1405531892	2014-07-16 13:31:32.727187	2014-07-16 13:31:32.730427	\N	94	79
498	user_1405531922	2014-07-16 13:32:02.33524	2014-07-16 13:32:02.336833	\N	94	79
499	user_1405531987	2014-07-16 13:33:07.54528	2014-07-16 13:33:07.548622	\N	94	79
500	user_1405532007	2014-07-16 13:33:27.789479	2014-07-16 13:33:27.79114	\N	94	79
501	user_1405532018	2014-07-16 13:33:38.214713	2014-07-16 13:33:38.217115	\N	94	79
502	user_1405532028	2014-07-16 13:33:48.902582	2014-07-16 13:33:48.904856	\N	94	79
503	user_1405532044	2014-07-16 13:34:04.100989	2014-07-16 13:34:04.102803	\N	94	79
504	user_1405532088	2014-07-16 13:34:48.838579	2014-07-16 13:34:48.915259	\N	94	79
505	user_1405532112	2014-07-16 13:35:12.701896	2014-07-16 13:35:12.703652	\N	94	79
506	user_1405532162	2014-07-16 13:36:02.223044	2014-07-16 13:36:02.22605	\N	94	79
507	user_1405532168	2014-07-16 13:36:08.030629	2014-07-16 13:36:08.03392	\N	94	79
508	user_1405532195	2014-07-16 13:36:35.364413	2014-07-16 13:36:35.36657	\N	94	79
509	user_1405532261	2014-07-16 13:37:41.155756	2014-07-16 13:37:41.157707	\N	94	79
510	user_1405532270	2014-07-16 13:37:50.173353	2014-07-16 13:37:50.176495	\N	94	79
730	user_1405623316	2014-07-17 14:55:16.378994	2014-07-17 14:55:16.391151	\N	94	79
511	user_1405532276	2014-07-16 13:37:56.804219	2014-07-16 13:37:56.806143	\N	94	79
547	user_1405608073	2014-07-17 10:41:13.84899	2014-07-17 10:41:13.85281	\N	94	79
512	user_1405532280	2014-07-16 13:38:00.821226	2014-07-16 13:38:00.824399	\N	94	79
513	user_1405532286	2014-07-16 13:38:06.733894	2014-07-16 13:38:06.736909	\N	94	79
548	user_1405608191	2014-07-17 10:43:11.989578	2014-07-17 10:43:11.99318	\N	94	79
514	user_1405532291	2014-07-16 13:38:11.495874	2014-07-16 13:38:11.497746	\N	94	79
515	user_1405532307	2014-07-16 13:38:27.591186	2014-07-16 13:38:27.592927	\N	94	79
549	user_1405608828	2014-07-17 10:53:48.844473	2014-07-17 10:53:48.849474	\N	94	79
516	user_1405532316	2014-07-16 13:38:36.498211	2014-07-16 13:38:36.501712	\N	94	79
517	user_1405532366	2014-07-16 13:39:26.926533	2014-07-16 13:39:26.928782	\N	94	79
550	user_1405608850	2014-07-17 10:54:10.962242	2014-07-17 10:54:10.965425	\N	94	79
518	user_1405532375	2014-07-16 13:39:35.407263	2014-07-16 13:39:35.410797	\N	94	79
519	user_1405532412	2014-07-16 13:40:12.869547	2014-07-16 13:40:12.871356	\N	94	79
551	user_1405608853	2014-07-17 10:54:13.480957	2014-07-17 10:54:13.484062	\N	94	79
520	user_1405532440	2014-07-16 13:40:40.285639	2014-07-16 13:40:40.288798	\N	94	79
521	user_1405532456	2014-07-16 13:40:56.417822	2014-07-16 13:40:56.421255	\N	94	79
552	user_1405608967	2014-07-17 10:56:07.858907	2014-07-17 10:56:07.862303	\N	94	79
522	user_1405532472	2014-07-16 13:41:12.650458	2014-07-16 13:41:12.652044	\N	94	79
523	user_1405532510	2014-07-16 13:41:50.888898	2014-07-16 13:41:50.892204	\N	94	79
553	user_1405608972	2014-07-17 10:56:12.390681	2014-07-17 10:56:12.392845	\N	94	79
524	user_1405532603	2014-07-16 13:43:23.176684	2014-07-16 13:43:23.18007	\N	94	79
525	user_1405532647	2014-07-16 13:44:07.217604	2014-07-16 13:44:07.221372	\N	94	79
554	user_1405609014	2014-07-17 10:56:54.006435	2014-07-17 10:56:54.010108	\N	94	79
526	user_1405532730	2014-07-16 13:45:30.66183	2014-07-16 13:45:30.663848	\N	94	79
527	user_1405532754	2014-07-16 13:45:54.216777	2014-07-16 13:45:54.218466	\N	94	79
555	user_1405609018	2014-07-17 10:56:58.79662	2014-07-17 10:56:58.799799	\N	94	79
528	user_1405532773	2014-07-16 13:46:13.116718	2014-07-16 13:46:13.118384	\N	94	79
529	user_1405536884	2014-07-16 14:54:44.246466	2014-07-16 14:54:44.250447	\N	94	79
556	user_1405609022	2014-07-17 10:57:02.134559	2014-07-17 10:57:02.137909	\N	94	79
530	gene	2014-07-16 14:54:44.55385	2014-07-16 14:54:50.291362	\N	94	79
531	user_1405538812	2014-07-16 15:26:52.096599	2014-07-16 15:26:52.100006	\N	94	79
557	user_1405609055	2014-07-17 10:57:35.896114	2014-07-17 10:57:35.899526	\N	94	79
532	gene	2014-07-16 15:27:26.983654	2014-07-16 15:27:40.295857	\N	94	79
533	hello	2014-07-16 15:27:42.536461	2014-07-16 15:27:50.12783	\N	94	79
558	user_1405609069	2014-07-17 10:57:49.681725	2014-07-17 10:57:49.683491	\N	94	79
534	hello	2014-07-16 15:27:52.405259	2014-07-16 15:27:56.753102	\N	94	79
535	user_1405538878	2014-07-16 15:27:58.435459	2014-07-16 15:27:58.438693	\N	94	79
559	user_1405609072	2014-07-17 10:57:52.146448	2014-07-17 10:57:52.149678	\N	94	79
536	user_1405538904	2014-07-16 15:28:24.700745	2014-07-16 15:28:24.704191	\N	94	79
537	user_1405549595	2014-07-16 18:26:35.636085	2014-07-16 18:26:35.639642	\N	94	79
560	user_1405610565	2014-07-17 11:22:45.443608	2014-07-17 11:22:45.445956	\N	94	79
538	user_1405549617	2014-07-16 18:26:57.924727	2014-07-16 18:26:57.928238	\N	94	79
539	user_1405573302	2014-07-17 01:01:42.626828	2014-07-17 01:01:42.629356	\N	94	79
561	user_1405610603	2014-07-17 11:23:23.232392	2014-07-17 11:23:23.237211	\N	94	79
540	user_1405573358	2014-07-17 01:02:38.35288	2014-07-17 01:02:38.355077	\N	94	79
541	user_1405573421	2014-07-17 01:03:41.24025	2014-07-17 01:03:41.243747	\N	94	79
562	user_1405610785	2014-07-17 11:26:25.03967	2014-07-17 11:26:25.043102	\N	94	79
542	user_1405573554	2014-07-17 01:05:54.678851	2014-07-17 01:05:54.682289	\N	94	79
543	user_1405573657	2014-07-17 01:07:37.109327	2014-07-17 01:07:37.111277	\N	94	79
563	user_1405610794	2014-07-17 11:26:34.473299	2014-07-17 11:26:34.475788	\N	94	79
544	user_1405573678	2014-07-17 01:07:58.892805	2014-07-17 01:07:58.894794	\N	94	79
545	user_1405573682	2014-07-17 01:08:02.876114	2014-07-17 01:08:02.878031	\N	94	79
564	user_1405611496	2014-07-17 11:38:16.026238	2014-07-17 11:38:16.029597	\N	94	79
565	user_1405611529	2014-07-17 11:38:49.075597	2014-07-17 11:38:49.07876	\N	94	79
566	user_1405611535	2014-07-17 11:38:55.094284	2014-07-17 11:38:55.09632	\N	94	79
567	user_1405611552	2014-07-17 11:39:12.675164	2014-07-17 11:39:12.677211	\N	94	79
568	user_1405611569	2014-07-17 11:39:29.503276	2014-07-17 11:39:29.505569	\N	94	79
569	user_1405611609	2014-07-17 11:40:09.639837	2014-07-17 11:40:09.643239	\N	94	79
570	user_1405611849	2014-07-17 11:44:09.482786	2014-07-17 11:44:09.484651	\N	94	79
571	user_1405611862	2014-07-17 11:44:22.137648	2014-07-17 11:44:22.139673	\N	94	79
572	user_1405611880	2014-07-17 11:44:40.107534	2014-07-17 11:44:40.109862	\N	94	79
573	user_1405611884	2014-07-17 11:44:44.897158	2014-07-17 11:44:44.900528	\N	94	79
574	user_1405611919	2014-07-17 11:45:19.828754	2014-07-17 11:45:19.831048	\N	94	79
575	user_1405612106	2014-07-17 11:48:26.763581	2014-07-17 11:48:26.766931	\N	94	79
576	user_1405612169	2014-07-17 11:49:29.635653	2014-07-17 11:49:29.637443	\N	94	79
577	user_1405612184	2014-07-17 11:49:44.991295	2014-07-17 11:49:44.993251	\N	94	79
578	user_1405612197	2014-07-17 11:49:57.347401	2014-07-17 11:49:57.351015	\N	94	79
579	user_1405612206	2014-07-17 11:50:06.977875	2014-07-17 11:50:06.979601	\N	94	79
580	user_1405612222	2014-07-17 11:50:22.020308	2014-07-17 11:50:22.022044	\N	94	79
581	user_1405612255	2014-07-17 11:50:55.562429	2014-07-17 11:50:55.566159	\N	94	79
582	user_1405612267	2014-07-17 11:51:07.83733	2014-07-17 11:51:07.839024	\N	94	79
583	user_1405612419	2014-07-17 11:53:39.620916	2014-07-17 11:53:39.624204	\N	94	79
584	user_1405612469	2014-07-17 11:54:29.366719	2014-07-17 11:54:29.37019	\N	94	79
585	user_1405612472	2014-07-17 11:54:32.235785	2014-07-17 11:54:32.237632	\N	94	79
586	user_1405612521	2014-07-17 11:55:21.158851	2014-07-17 11:55:21.162056	\N	94	79
587	user_1405612632	2014-07-17 11:57:12.623628	2014-07-17 11:57:12.625647	\N	94	79
588	user_1405612641	2014-07-17 11:57:21.153645	2014-07-17 11:57:21.157067	\N	94	79
589	user_1405612652	2014-07-17 11:57:32.581973	2014-07-17 11:57:32.584907	\N	94	79
590	user_1405612808	2014-07-17 12:00:08.337012	2014-07-17 12:00:08.340703	\N	94	79
591	user_1405612876	2014-07-17 12:01:16.87684	2014-07-17 12:01:16.880032	\N	94	79
592	user_1405612886	2014-07-17 12:01:26.680382	2014-07-17 12:01:26.682464	\N	94	79
593	user_1405613329	2014-07-17 12:08:49.234283	2014-07-17 12:08:49.238013	\N	94	79
594	user_1405613346	2014-07-17 12:09:06.409118	2014-07-17 12:09:06.412287	\N	94	79
595	user_1405613355	2014-07-17 12:09:15.387279	2014-07-17 12:09:15.388876	\N	94	79
596	user_1405613360	2014-07-17 12:09:20.320685	2014-07-17 12:09:20.324069	\N	94	79
597	user_1405613378	2014-07-17 12:09:38.348266	2014-07-17 12:09:38.350013	\N	94	79
598	user_1405613428	2014-07-17 12:10:28.731129	2014-07-17 12:10:28.73471	\N	94	79
599	user_1405613473	2014-07-17 12:11:13.426316	2014-07-17 12:11:13.429503	\N	94	79
600	user_1405613518	2014-07-17 12:11:58.966569	2014-07-17 12:11:58.969771	\N	94	79
601	user_1405613539	2014-07-17 12:12:19.664662	2014-07-17 12:12:19.668323	\N	94	79
602	user_1405613546	2014-07-17 12:12:26.988044	2014-07-17 12:12:26.990042	\N	94	79
603	user_1405614305	2014-07-17 12:25:05.840997	2014-07-17 12:25:05.844609	\N	94	79
604	user_1405614460	2014-07-17 12:27:40.31316	2014-07-17 12:27:40.316463	\N	94	79
960	user_1405698099	2014-07-18 11:41:39.305269	2014-07-18 11:41:39.310796	\N	94	79
605	user_1405614473	2014-07-17 12:27:53.014498	2014-07-17 12:27:53.01814	\N	94	79
731	user_1405623326	2014-07-17 14:55:26.835328	2014-07-17 14:55:26.839638	\N	94	79
606	user_1405614507	2014-07-17 12:28:27.886739	2014-07-17 12:28:27.8885	\N	94	79
607	user_1405614848	2014-07-17 12:34:08.104497	2014-07-17 12:34:08.108016	\N	94	79
732	user_1405623366	2014-07-17 14:56:06.497923	2014-07-17 14:56:06.55144	\N	94	79
608	user_1405614868	2014-07-17 12:34:28.140892	2014-07-17 12:34:28.144601	\N	94	79
609	user_1405614883	2014-07-17 12:34:43.285179	2014-07-17 12:34:43.288051	\N	94	79
733	user_1405623912	2014-07-17 15:05:12.476684	2014-07-17 15:05:12.481602	\N	94	79
610	user_1405615054	2014-07-17 12:37:34.219337	2014-07-17 12:37:34.221266	\N	94	79
795	user_1405639297	2014-07-17 19:21:37.482611	2014-07-17 19:21:37.488399	\N	94	79
611	user_1405615212	2014-07-17 12:40:12.633869	2014-07-17 12:40:12.636926	\N	94	79
612	user_1405615292	2014-07-17 12:41:32.172474	2014-07-17 12:41:32.175744	\N	94	79
796	user_1405639318	2014-07-17 19:21:58.26265	2014-07-17 19:21:58.267063	\N	94	79
613	user_1405615358	2014-07-17 12:42:38.580585	2014-07-17 12:42:38.583608	\N	94	79
614	user_1405615560	2014-07-17 12:46:00.479714	2014-07-17 12:46:00.483067	\N	94	79
797	user_1405639353	2014-07-17 19:22:33.679159	2014-07-17 19:22:33.684109	\N	94	79
615	user_1405615677	2014-07-17 12:47:57.526784	2014-07-17 12:47:57.530412	\N	94	79
616	user_1405615767	2014-07-17 12:49:27.827476	2014-07-17 12:49:27.831218	\N	94	79
798	user_1405639623	2014-07-17 19:27:03.754707	2014-07-17 19:27:03.759588	\N	94	79
617	user_1405616039	2014-07-17 12:53:59.782629	2014-07-17 12:53:59.786139	\N	94	79
618	user_1405616207	2014-07-17 12:56:47.318325	2014-07-17 12:56:47.322189	\N	94	79
799	user_1405639749	2014-07-17 19:29:09.162426	2014-07-17 19:29:09.167793	\N	94	79
800	user_1405639783	2014-07-17 19:29:43.19643	2014-07-17 19:29:43.199984	\N	94	79
801	user_1405639804	2014-07-17 19:30:04.602	2014-07-17 19:30:04.606508	\N	94	79
802	user_1405639865	2014-07-17 19:31:05.706806	2014-07-17 19:31:05.712574	\N	94	79
803	user_1405639913	2014-07-17 19:31:53.521285	2014-07-17 19:31:53.526838	\N	94	79
804	user_1405640026	2014-07-17 19:33:46.413343	2014-07-17 19:33:46.418757	\N	94	79
805	user_1405640056	2014-07-17 19:34:16.830544	2014-07-17 19:34:16.834699	\N	94	79
806	user_1405641089	2014-07-17 19:51:29.151556	2014-07-17 19:51:29.156788	\N	94	79
807	user_1405641101	2014-07-17 19:51:41.320909	2014-07-17 19:51:41.324801	\N	94	79
808	user_1405641150	2014-07-17 19:52:30.58572	2014-07-17 19:52:30.590863	\N	94	79
809	user_1405654840	2014-07-17 23:40:40.162689	2014-07-17 23:40:40.174241	\N	94	79
810	user_1405654963	2014-07-17 23:42:43.579822	2014-07-17 23:42:43.584776	\N	94	79
811	user_1405655006	2014-07-17 23:43:26.939939	2014-07-17 23:43:26.944631	\N	94	79
812	user_1405655119	2014-07-17 23:45:19.444045	2014-07-17 23:45:19.450172	\N	94	79
813	user_1405655165	2014-07-17 23:46:05.488494	2014-07-17 23:46:05.493656	\N	94	79
814	user_1405655179	2014-07-17 23:46:19.379314	2014-07-17 23:46:19.384214	\N	94	79
815	user_1405655331	2014-07-17 23:48:51.743657	2014-07-17 23:48:51.748702	\N	94	79
816	user_1405655786	2014-07-17 23:56:26.911116	2014-07-17 23:56:26.916296	\N	94	79
817	user_1405655819	2014-07-17 23:56:59.092995	2014-07-17 23:56:59.099262	\N	94	79
818	user_1405656456	2014-07-18 00:07:36.291091	2014-07-18 00:07:36.296872	\N	94	79
819	user_1405656486	2014-07-18 00:08:06.612109	2014-07-18 00:08:06.616589	\N	94	79
820	user_1405656539	2014-07-18 00:08:59.253253	2014-07-18 00:08:59.25675	\N	94	79
821	user_1405656627	2014-07-18 00:10:27.182042	2014-07-18 00:10:27.186539	\N	94	79
822	user_1405656636	2014-07-18 00:10:36.490485	2014-07-18 00:10:36.494696	\N	94	79
823	user_1405656661	2014-07-18 00:11:01.232498	2014-07-18 00:11:01.23853	\N	94	79
824	user_1405656683	2014-07-18 00:11:23.672476	2014-07-18 00:11:23.676737	\N	94	79
825	user_1405658585	2014-07-18 00:43:05.22153	2014-07-18 00:43:05.227136	\N	94	79
826	user_1405659289	2014-07-18 00:54:49.127035	2014-07-18 00:54:49.133287	\N	94	79
827	user_1405659807	2014-07-18 01:03:27.151802	2014-07-18 01:03:27.157595	\N	94	79
828	user_1405659823	2014-07-18 01:03:43.688615	2014-07-18 01:03:43.692029	\N	94	79
829	user_1405659844	2014-07-18 01:04:04.011184	2014-07-18 01:04:04.015624	\N	94	79
830	user_1405660222	2014-07-18 01:10:22.971203	2014-07-18 01:10:22.976659	\N	94	79
831	user_1405660229	2014-07-18 01:10:29.74866	2014-07-18 01:10:29.751233	\N	94	79
832	user_1405660275	2014-07-18 01:11:15.457103	2014-07-18 01:11:15.461495	\N	94	79
833	user_1405660285	2014-07-18 01:11:25.447089	2014-07-18 01:11:25.44997	\N	94	79
834	user_1405660317	2014-07-18 01:11:57.935907	2014-07-18 01:11:57.939991	\N	94	79
835	user_1405660343	2014-07-18 01:12:23.535108	2014-07-18 01:12:23.539127	\N	94	79
836	user_1405660360	2014-07-18 01:12:40.058329	2014-07-18 01:12:40.0614	\N	94	79
837	user_1405660643	2014-07-18 01:17:23.787301	2014-07-18 01:17:23.792351	\N	94	79
838	user_1405660664	2014-07-18 01:17:44.462829	2014-07-18 01:17:44.467542	\N	94	79
839	user_1405660766	2014-07-18 01:19:26.181753	2014-07-18 01:19:26.186628	\N	94	79
840	user_1405660837	2014-07-18 01:20:37.536363	2014-07-18 01:20:37.540455	\N	94	79
841	user_1405660864	2014-07-18 01:21:04.72619	2014-07-18 01:21:04.732074	\N	94	79
842	user_1405660912	2014-07-18 01:21:52.142381	2014-07-18 01:21:52.146586	\N	94	79
843	user_1405660918	2014-07-18 01:21:58.613151	2014-07-18 01:21:58.617416	\N	94	79
844	user_1405660927	2014-07-18 01:22:07.17472	2014-07-18 01:22:07.177534	\N	94	79
845	user_1405660936	2014-07-18 01:22:16.149345	2014-07-18 01:22:16.152617	\N	94	79
846	user_1405660973	2014-07-18 01:22:53.152851	2014-07-18 01:22:53.155632	\N	94	79
847	user_1405660990	2014-07-18 01:23:10.849301	2014-07-18 01:23:10.85218	\N	94	79
848	user_1405661052	2014-07-18 01:24:12.107676	2014-07-18 01:24:12.112516	\N	94	79
849	user_1405661069	2014-07-18 01:24:29.034596	2014-07-18 01:24:29.038452	\N	94	79
850	user_1405661085	2014-07-18 01:24:45.394317	2014-07-18 01:24:45.3986	\N	94	79
851	user_1405661137	2014-07-18 01:25:37.97138	2014-07-18 01:25:37.976476	\N	94	79
852	user_1405661299	2014-07-18 01:28:19.731708	2014-07-18 01:28:19.736679	\N	94	79
853	user_1405661308	2014-07-18 01:28:28.99436	2014-07-18 01:28:28.997195	\N	94	79
854	user_1405661345	2014-07-18 01:29:05.418554	2014-07-18 01:29:05.502073	\N	94	79
855	user_1405661361	2014-07-18 01:29:21.042958	2014-07-18 01:29:21.046217	\N	94	79
856	user_1405661371	2014-07-18 01:29:31.779432	2014-07-18 01:29:31.781995	\N	94	79
857	user_1405661385	2014-07-18 01:29:45.801367	2014-07-18 01:29:45.806978	\N	94	79
858	user_1405661526	2014-07-18 01:32:06.637713	2014-07-18 01:32:06.643243	\N	94	79
859	user_1405661565	2014-07-18 01:32:45.076989	2014-07-18 01:32:45.082362	\N	94	79
876	user_1405663157	2014-07-18 01:59:17.623493	2014-07-18 01:59:17.634183	\N	94	79
877	user_1405663174	2014-07-18 01:59:34.297259	2014-07-18 01:59:34.306362	\N	94	79
878	user_1405663178	2014-07-18 01:59:38.673895	2014-07-18 01:59:38.684362	\N	94	79
879	user_1405663417	2014-07-18 02:03:37.671972	2014-07-18 02:03:37.677039	\N	94	79
880	user_1405663450	2014-07-18 02:04:10.612606	2014-07-18 02:04:10.617549	\N	94	79
881	user_1405663452	2014-07-18 02:04:12.624064	2014-07-18 02:04:12.701017	\N	94	79
882	user_1405663457	2014-07-18 02:04:17.820766	2014-07-18 02:04:17.823862	\N	94	79
883	user_1405663549	2014-07-18 02:05:49.082451	2014-07-18 02:05:49.087631	\N	94	79
884	user_1405663584	2014-07-18 02:06:24.572291	2014-07-18 02:06:24.57668	\N	94	79
619	user_1405616228	2014-07-17 12:57:08.142388	2014-07-17 12:57:08.144544	\N	94	79
1252	user_1405787616	2014-07-19 12:33:36.541795	2014-07-19 12:33:36.547807	\N	94	79
620	user_1405616268	2014-07-17 12:57:48.875066	2014-07-17 12:57:48.878339	\N	94	79
734	user_1405624000	2014-07-17 15:06:40.254697	2014-07-17 15:06:40.259608	\N	94	79
621	user_1405616302	2014-07-17 12:58:22.226061	2014-07-17 12:58:22.228086	\N	94	79
622	user_1405616383	2014-07-17 12:59:43.755276	2014-07-17 12:59:43.759181	\N	94	79
735	user_1405624007	2014-07-17 15:06:47.86425	2014-07-17 15:06:47.921143	\N	94	79
623	user_1405616399	2014-07-17 12:59:59.871743	2014-07-17 12:59:59.873577	\N	94	79
624	user_1405616404	2014-07-17 13:00:04.399889	2014-07-17 13:00:04.401654	\N	94	79
736	user_1405624018	2014-07-17 15:06:58.034956	2014-07-17 15:06:58.037967	\N	94	79
625	user_1405616416	2014-07-17 13:00:16.751503	2014-07-17 13:00:16.754683	\N	94	79
626	user_1405616427	2014-07-17 13:00:27.240552	2014-07-17 13:00:27.242218	\N	94	79
737	user_1405624046	2014-07-17 15:07:26.027098	2014-07-17 15:07:26.030611	\N	94	79
627	user_1405616437	2014-07-17 13:00:37.128385	2014-07-17 13:00:37.130209	\N	94	79
628	user_1405616525	2014-07-17 13:02:05.434158	2014-07-17 13:02:05.437682	\N	94	79
738	user_1405624471	2014-07-17 15:14:31.920299	2014-07-17 15:14:31.925033	\N	94	79
629	user_1405616690	2014-07-17 13:04:50.283835	2014-07-17 13:04:50.286834	\N	94	79
630	user_1405616736	2014-07-17 13:05:36.20273	2014-07-17 13:05:36.205249	\N	94	79
739	user_1405624491	2014-07-17 15:14:51.880238	2014-07-17 15:14:51.884178	\N	94	79
631	user_1405616762	2014-07-17 13:06:02.474529	2014-07-17 13:06:02.476269	\N	94	79
632	user_1405616780	2014-07-17 13:06:20.4246	2014-07-17 13:06:20.426774	\N	94	79
740	user_1405624962	2014-07-17 15:22:42.674664	2014-07-17 15:22:42.679609	\N	94	79
633	user_1405616805	2014-07-17 13:06:45.399395	2014-07-17 13:06:45.401259	\N	94	79
634	user_1405616818	2014-07-17 13:06:58.77643	2014-07-17 13:06:58.778279	\N	94	79
741	user_1405624971	2014-07-17 15:22:51.910443	2014-07-17 15:22:51.913433	\N	94	79
635	user_1405616825	2014-07-17 13:07:05.373929	2014-07-17 13:07:05.376932	\N	94	79
636	user_1405616842	2014-07-17 13:07:22.549618	2014-07-17 13:07:22.553362	\N	94	79
742	user_1405625060	2014-07-17 15:24:20.383195	2014-07-17 15:24:20.387788	\N	94	79
637	user_1405616878	2014-07-17 13:07:58.12679	2014-07-17 13:07:58.128661	\N	94	79
638	user_1405616949	2014-07-17 13:09:09.61856	2014-07-17 13:09:09.620833	\N	94	79
743	user_1405625070	2014-07-17 15:24:30.784681	2014-07-17 15:24:30.788972	\N	94	79
639	user_1405616958	2014-07-17 13:09:18.134026	2014-07-17 13:09:18.136371	\N	94	79
640	user_1405616960	2014-07-17 13:09:20.973483	2014-07-17 13:09:20.976404	\N	94	79
744	user_1405625100	2014-07-17 15:25:00.414292	2014-07-17 15:25:00.420009	\N	94	79
641	user_1405616978	2014-07-17 13:09:38.888515	2014-07-17 13:09:38.891973	\N	94	79
642	user_1405617004	2014-07-17 13:10:04.949774	2014-07-17 13:10:04.953327	\N	94	79
745	user_1405625108	2014-07-17 15:25:08.713638	2014-07-17 15:25:08.716287	\N	94	79
643	user_1405617283	2014-07-17 13:14:43.935472	2014-07-17 13:14:43.938688	\N	94	79
644	user_1405617298	2014-07-17 13:14:58.013151	2014-07-17 13:14:58.014924	\N	94	79
746	user_1405625398	2014-07-17 15:29:58.540439	2014-07-17 15:29:58.5464	\N	94	79
645	user_1405617302	2014-07-17 13:15:02.588119	2014-07-17 13:15:02.590951	\N	94	79
646	user_1405617314	2014-07-17 13:15:14.527549	2014-07-17 13:15:14.531309	\N	94	79
747	user_1405625476	2014-07-17 15:31:16.311019	2014-07-17 15:31:16.316036	\N	94	79
647	user_1405617394	2014-07-17 13:16:34.712017	2014-07-17 13:16:34.71531	\N	94	79
648	user_1405617403	2014-07-17 13:16:43.645063	2014-07-17 13:16:43.646678	\N	94	79
748	user_1405625691	2014-07-17 15:34:50.996436	2014-07-17 15:34:51.001265	\N	94	79
649	user_1405617430	2014-07-17 13:17:10.91233	2014-07-17 13:17:10.915984	\N	94	79
650	user_1405617745	2014-07-17 13:22:25.405779	2014-07-17 13:22:25.410579	\N	94	79
749	user_1405626494	2014-07-17 15:48:14.410278	2014-07-17 15:48:14.414819	\N	94	79
651	user_1405617763	2014-07-17 13:22:43.650071	2014-07-17 13:22:43.653667	\N	94	79
652	user_1405617770	2014-07-17 13:22:50.765009	2014-07-17 13:22:50.7681	\N	94	79
750	user_1405626506	2014-07-17 15:48:26.086757	2014-07-17 15:48:26.09029	\N	94	79
653	user_1405617773	2014-07-17 13:22:53.722791	2014-07-17 13:22:53.724378	\N	94	79
654	user_1405617782	2014-07-17 13:23:02.893817	2014-07-17 13:23:02.89701	\N	94	79
751	user_1405626667	2014-07-17 15:51:07.22648	2014-07-17 15:51:07.298026	\N	94	79
655	user_1405617787	2014-07-17 13:23:07.962944	2014-07-17 13:23:07.966319	\N	94	79
656	user_1405617792	2014-07-17 13:23:12.228684	2014-07-17 13:23:12.230292	\N	94	79
752	user_1405626721	2014-07-17 15:52:01.701136	2014-07-17 15:52:01.706169	\N	94	79
657	user_1405617820	2014-07-17 13:23:40.384847	2014-07-17 13:23:40.388236	\N	94	79
658	user_1405617830	2014-07-17 13:23:50.442469	2014-07-17 13:23:50.444323	\N	94	79
753	user_1405626899	2014-07-17 15:54:59.905413	2014-07-17 15:54:59.910378	\N	94	79
659	user_1405617835	2014-07-17 13:23:55.519418	2014-07-17 13:23:55.521069	\N	94	79
660	user_1405618212	2014-07-17 13:30:12.361706	2014-07-17 13:30:12.364937	\N	94	79
754	user_1405635046	2014-07-17 18:10:46.822617	2014-07-17 18:10:46.828009	\N	94	79
661	user_1405618360	2014-07-17 13:32:40.661377	2014-07-17 13:32:40.665925	\N	94	79
662	user_1405618477	2014-07-17 13:34:37.723182	2014-07-17 13:34:37.726958	\N	94	79
755	user_1405635283	2014-07-17 18:14:43.237357	2014-07-17 18:14:43.243051	\N	94	79
663	user_1405618796	2014-07-17 13:39:56.760878	2014-07-17 13:39:56.764247	\N	94	79
664	user_1405618807	2014-07-17 13:40:07.176076	2014-07-17 13:40:07.177744	\N	94	79
756	user_1405635429	2014-07-17 18:17:09.770324	2014-07-17 18:17:09.776001	\N	94	79
665	user_1405618911	2014-07-17 13:41:51.883335	2014-07-17 13:41:51.88666	\N	94	79
666	user_1405618929	2014-07-17 13:42:09.599538	2014-07-17 13:42:09.602783	\N	94	79
757	user_1405635658	2014-07-17 18:20:58.681358	2014-07-17 18:20:58.685993	\N	94	79
667	user_1405618936	2014-07-17 13:42:16.963999	2014-07-17 13:42:16.966249	\N	94	79
668	user_1405618942	2014-07-17 13:42:22.01566	2014-07-17 13:42:22.018723	\N	94	79
758	user_1405635669	2014-07-17 18:21:09.797093	2014-07-17 18:21:09.80152	\N	94	79
669	user_1405618971	2014-07-17 13:42:51.312715	2014-07-17 13:42:51.316004	\N	94	79
670	user_1405619096	2014-07-17 13:44:56.773704	2014-07-17 13:44:56.776908	\N	94	79
759	user_1405635709	2014-07-17 18:21:49.856271	2014-07-17 18:21:49.861475	\N	94	79
671	user_1405619107	2014-07-17 13:45:07.392312	2014-07-17 13:45:07.395415	\N	94	79
672	user_1405619114	2014-07-17 13:45:14.02719	2014-07-17 13:45:14.02893	\N	94	79
760	user_1405635730	2014-07-17 18:22:10.598673	2014-07-17 18:22:10.60266	\N	94	79
673	user_1405619211	2014-07-17 13:46:51.855194	2014-07-17 13:46:51.860317	\N	94	79
761	user_1405635793	2014-07-17 18:23:13.211453	2014-07-17 18:23:13.28605	\N	94	79
762	user_1405635827	2014-07-17 18:23:47.741474	2014-07-17 18:23:47.746881	\N	94	79
763	user_1405636214	2014-07-17 18:30:14.774482	2014-07-17 18:30:14.778416	\N	94	79
764	user_1405636467	2014-07-17 18:34:27.626474	2014-07-17 18:34:27.632088	\N	94	79
765	user_1405636620	2014-07-17 18:37:00.415107	2014-07-17 18:37:00.419115	\N	94	79
766	user_1405636670	2014-07-17 18:37:50.539241	2014-07-17 18:37:50.545095	\N	94	79
767	user_1405637229	2014-07-17 18:47:09.644343	2014-07-17 18:47:09.64942	\N	94	79
768	user_1405637269	2014-07-17 18:47:49.548969	2014-07-17 18:47:49.554318	\N	94	79
769	user_1405637569	2014-07-17 18:52:49.461332	2014-07-17 18:52:49.46792	\N	94	79
770	user_1405637608	2014-07-17 18:53:28.76454	2014-07-17 18:53:28.768492	\N	94	79
771	user_1405637630	2014-07-17 18:53:50.865127	2014-07-17 18:53:50.870077	\N	94	79
772	user_1405637757	2014-07-17 18:55:57.836384	2014-07-17 18:55:57.841578	\N	94	79
674	user_1405619224	2014-07-17 13:47:04.069541	2014-07-17 13:47:04.072031	\N	94	79
773	user_1405637796	2014-07-17 18:56:36.61574	2014-07-17 18:56:36.620735	\N	94	79
675	user_1405619231	2014-07-17 13:47:11.101684	2014-07-17 13:47:11.103467	\N	94	79
961	user_1405698154	2014-07-18 11:42:34.043065	2014-07-18 11:42:34.048574	\N	94	79
676	user_1405619240	2014-07-17 13:47:20.328774	2014-07-17 13:47:20.330671	\N	94	79
774	user_1405638107	2014-07-17 19:01:47.21152	2014-07-17 19:01:47.217067	\N	94	79
677	user_1405619248	2014-07-17 13:47:28.692491	2014-07-17 13:47:28.695256	\N	94	79
678	user_1405619314	2014-07-17 13:48:34.678452	2014-07-17 13:48:34.680741	\N	94	79
775	user_1405638191	2014-07-17 19:03:11.924792	2014-07-17 19:03:11.930029	\N	94	79
679	user_1405619375	2014-07-17 13:49:35.433488	2014-07-17 13:49:35.437053	\N	94	79
680	user_1405619581	2014-07-17 13:53:01.825072	2014-07-17 13:53:01.828503	\N	94	79
776	user_1405638212	2014-07-17 19:03:32.408898	2014-07-17 19:03:32.413126	\N	94	79
681	user_1405619604	2014-07-17 13:53:24.514377	2014-07-17 13:53:24.517737	\N	94	79
682	user_1405619754	2014-07-17 13:55:54.987107	2014-07-17 13:55:54.99045	\N	94	79
777	user_1405638224	2014-07-17 19:03:44.618075	2014-07-17 19:03:44.622835	\N	94	79
683	user_1405620439	2014-07-17 14:07:19.965401	2014-07-17 14:07:19.967494	\N	94	79
684	user_1405620526	2014-07-17 14:08:46.81944	2014-07-17 14:08:46.822447	\N	94	79
778	user_1405638325	2014-07-17 19:05:25.626395	2014-07-17 19:05:25.631848	\N	94	79
685	user_1405620664	2014-07-17 14:11:04.866052	2014-07-17 14:11:04.869464	\N	94	79
686	user_1405620694	2014-07-17 14:11:34.960117	2014-07-17 14:11:34.963167	\N	94	79
779	user_1405638361	2014-07-17 19:06:01.613729	2014-07-17 19:06:01.618845	\N	94	79
687	user_1405620735	2014-07-17 14:12:15.313363	2014-07-17 14:12:15.315141	\N	94	79
688	user_1405620765	2014-07-17 14:12:45.893416	2014-07-17 14:12:45.89576	\N	94	79
780	user_1405638421	2014-07-17 19:07:01.692661	2014-07-17 19:07:01.696452	\N	94	79
689	user_1405620795	2014-07-17 14:13:15.624435	2014-07-17 14:13:15.626624	\N	94	79
690	user_1405620807	2014-07-17 14:13:27.167871	2014-07-17 14:13:27.169968	\N	94	79
781	user_1405638603	2014-07-17 19:10:03.843505	2014-07-17 19:10:03.848893	\N	94	79
691	user_1405620890	2014-07-17 14:14:50.986074	2014-07-17 14:14:50.988727	\N	94	79
692	user_1405621032	2014-07-17 14:17:12.406412	2014-07-17 14:17:12.409672	\N	94	79
782	user_1405638616	2014-07-17 19:10:16.938586	2014-07-17 19:10:16.943534	\N	94	79
693	user_1405621044	2014-07-17 14:17:24.635161	2014-07-17 14:17:24.63721	\N	94	79
694	user_1405621065	2014-07-17 14:17:45.997753	2014-07-17 14:17:45.999616	\N	94	79
783	user_1405638679	2014-07-17 19:11:19.782801	2014-07-17 19:11:19.787658	\N	94	79
695	user_1405621083	2014-07-17 14:18:03.830361	2014-07-17 14:18:03.833932	\N	94	79
696	user_1405621103	2014-07-17 14:18:23.654368	2014-07-17 14:18:23.657682	\N	94	79
784	user_1405638771	2014-07-17 19:12:51.175649	2014-07-17 19:12:51.180476	\N	94	79
697	user_1405621573	2014-07-17 14:26:13.30931	2014-07-17 14:26:13.313003	\N	94	79
698	user_1405621581	2014-07-17 14:26:21.944383	2014-07-17 14:26:21.948037	\N	94	79
785	user_1405638805	2014-07-17 19:13:25.912949	2014-07-17 19:13:25.916784	\N	94	79
699	user_1405621593	2014-07-17 14:26:33.819378	2014-07-17 14:26:33.821105	\N	94	79
700	user_1405621605	2014-07-17 14:26:45.686201	2014-07-17 14:26:45.687995	\N	94	79
786	user_1405638874	2014-07-17 19:14:34.579957	2014-07-17 19:14:34.584972	\N	94	79
701	user_1405621913	2014-07-17 14:31:53.245702	2014-07-17 14:31:53.248978	\N	94	79
702	user_1405621995	2014-07-17 14:33:15.209088	2014-07-17 14:33:15.210814	\N	94	79
787	user_1405638888	2014-07-17 19:14:48.41004	2014-07-17 19:14:48.415811	\N	94	79
703	user_1405622080	2014-07-17 14:34:40.107853	2014-07-17 14:34:40.111387	\N	94	79
704	user_1405622091	2014-07-17 14:34:51.092362	2014-07-17 14:34:51.09545	\N	94	79
788	user_1405638931	2014-07-17 19:15:31.068731	2014-07-17 19:15:31.073778	\N	94	79
705	user_1405622190	2014-07-17 14:36:30.233979	2014-07-17 14:36:30.237784	\N	94	79
706	user_1405622202	2014-07-17 14:36:42.012859	2014-07-17 14:36:42.014737	\N	94	79
789	user_1405638959	2014-07-17 19:15:59.010546	2014-07-17 19:15:59.091915	\N	94	79
707	user_1405622222	2014-07-17 14:37:02.420679	2014-07-17 14:37:02.42326	\N	94	79
708	user_1405622233	2014-07-17 14:37:13.421212	2014-07-17 14:37:13.423167	\N	94	79
790	user_1405638968	2014-07-17 19:16:08.296025	2014-07-17 19:16:08.301235	\N	94	79
709	user_1405622252	2014-07-17 14:37:32.007086	2014-07-17 14:37:32.009079	\N	94	79
710	user_1405622262	2014-07-17 14:37:42.50127	2014-07-17 14:37:42.5032	\N	94	79
791	user_1405638987	2014-07-17 19:16:27.406374	2014-07-17 19:16:27.411019	\N	94	79
711	user_1405622264	2014-07-17 14:37:44.815177	2014-07-17 14:37:44.818212	\N	94	79
712	user_1405622268	2014-07-17 14:37:48.406233	2014-07-17 14:37:48.409819	\N	94	79
792	user_1405639073	2014-07-17 19:17:53.422209	2014-07-17 19:17:53.427778	\N	94	79
713	user_1405622278	2014-07-17 14:37:58.235307	2014-07-17 14:37:58.237343	\N	94	79
714	user_1405622284	2014-07-17 14:38:04.405267	2014-07-17 14:38:04.406981	\N	94	79
793	user_1405639157	2014-07-17 19:19:17.074235	2014-07-17 19:19:17.079494	\N	94	79
715	user_1405622304	2014-07-17 14:38:24.968597	2014-07-17 14:38:24.970683	\N	94	79
716	user_1405622321	2014-07-17 14:38:41.843333	2014-07-17 14:38:41.845082	\N	94	79
794	user_1405639208	2014-07-17 19:20:08.748485	2014-07-17 19:20:08.753652	\N	94	79
717	user_1405622364	2014-07-17 14:39:24.831893	2014-07-17 14:39:24.83547	\N	94	79
718	user_1405622439	2014-07-17 14:40:39.059997	2014-07-17 14:40:39.061761	\N	94	79
860	user_1405661594	2014-07-18 01:33:14.13919	2014-07-18 01:33:14.144832	\N	94	79
719	user_1405622446	2014-07-17 14:40:46.260908	2014-07-17 14:40:46.263089	\N	94	79
720	user_1405622611	2014-07-17 14:43:31.370856	2014-07-17 14:43:31.374502	\N	94	79
861	user_1405661617	2014-07-18 01:33:37.111578	2014-07-18 01:33:37.116072	\N	94	79
721	user_1405622637	2014-07-17 14:43:57.390269	2014-07-17 14:43:57.392447	\N	94	79
722	user_1405623043	2014-07-17 14:50:43.74647	2014-07-17 14:50:43.74887	\N	94	79
862	user_1405661797	2014-07-18 01:36:37.546907	2014-07-18 01:36:37.552011	\N	94	79
723	user_1405623053	2014-07-17 14:50:53.033126	2014-07-17 14:50:53.036482	\N	94	79
724	user_1405623122	2014-07-17 14:52:02.764422	2014-07-17 14:52:02.768181	\N	94	79
863	user_1405661960	2014-07-18 01:39:20.336362	2014-07-18 01:39:20.341395	\N	94	79
725	user_1405623141	2014-07-17 14:52:21.216922	2014-07-17 14:52:21.21888	\N	94	70
726	user_1405623141	2014-07-17 14:52:21.547748	2014-07-17 14:52:21.549372	\N	94	70
864	user_1405662004	2014-07-18 01:40:04.236712	2014-07-18 01:40:04.241185	\N	94	79
727	user_1405623153	2014-07-17 14:52:33.488576	2014-07-17 14:52:33.491725	\N	94	79
728	user_1405623153	2014-07-17 14:52:33.732983	2014-07-17 14:52:33.734566	\N	94	79
865	user_1405662016	2014-07-18 01:40:16.036628	2014-07-18 01:40:16.04147	\N	94	79
729	user_1405623180	2014-07-17 14:53:00.221958	2014-07-17 14:53:00.225344	\N	94	79
866	user_1405662197	2014-07-18 01:43:17.591079	2014-07-18 01:43:17.597827	\N	94	79
867	user_1405662221	2014-07-18 01:43:41.51768	2014-07-18 01:43:41.522883	\N	94	79
868	user_1405662276	2014-07-18 01:44:36.320611	2014-07-18 01:44:36.325133	\N	94	79
869	user_1405662291	2014-07-18 01:44:51.561792	2014-07-18 01:44:51.56464	\N	94	79
870	user_1405662501	2014-07-18 01:48:21.489614	2014-07-18 01:48:21.494838	\N	94	79
871	user_1405662516	2014-07-18 01:48:36.324703	2014-07-18 01:48:36.329015	\N	94	79
872	user_1405662869	2014-07-18 01:54:29.422306	2014-07-18 01:54:29.427796	\N	94	79
873	user_1405662889	2014-07-18 01:54:49.989998	2014-07-18 01:54:49.993465	\N	94	79
874	user_1405662945	2014-07-18 01:55:45.467637	2014-07-18 01:55:45.472405	\N	94	79
875	user_1405663092	2014-07-18 01:58:12.357266	2014-07-18 01:58:12.367801	\N	94	79
885	user_1405663618	2014-07-18 02:06:58.036123	2014-07-18 02:06:58.041315	\N	94	79
886	user_1405663733	2014-07-18 02:08:53.070297	2014-07-18 02:08:53.075586	\N	94	79
962	user_1405698188	2014-07-18 11:43:08.741171	2014-07-18 11:43:08.747266	\N	94	79
887	user_1405663762	2014-07-18 02:09:22.426145	2014-07-18 02:09:22.431154	\N	94	79
888	user_1405663898	2014-07-18 02:11:38.580397	2014-07-18 02:11:38.585628	\N	94	79
963	user_1405698202	2014-07-18 11:43:22.270455	2014-07-18 11:43:22.273131	\N	94	79
889	user_1405663906	2014-07-18 02:11:46.058191	2014-07-18 02:11:46.063149	\N	94	79
890	user_1405663915	2014-07-18 02:11:55.754424	2014-07-18 02:11:55.758947	\N	94	79
964	user_1405707131	2014-07-18 14:12:11.574991	2014-07-18 14:12:11.583529	\N	94	79
891	user_1405663939	2014-07-18 02:12:19.130997	2014-07-18 02:12:19.135529	\N	94	79
892	user_1405663955	2014-07-18 02:12:35.390962	2014-07-18 02:12:35.45442	\N	94	79
965	user_1405707151	2014-07-18 14:12:31.956162	2014-07-18 14:12:31.960388	\N	94	79
893	user_1405663967	2014-07-18 02:12:47.537814	2014-07-18 02:12:47.542642	\N	94	79
894	user_1405663981	2014-07-18 02:13:01.498271	2014-07-18 02:13:01.500953	\N	94	79
966	user_1405707166	2014-07-18 14:12:46.785662	2014-07-18 14:12:46.790497	\N	94	79
895	user_1405664033	2014-07-18 02:13:53.849273	2014-07-18 02:13:53.854128	\N	94	79
896	user_1405664047	2014-07-18 02:14:07.756442	2014-07-18 02:14:07.760612	\N	94	79
967	user_1405707194	2014-07-18 14:13:14.533244	2014-07-18 14:13:14.536067	\N	94	79
897	user_1405664222	2014-07-18 02:17:02.97944	2014-07-18 02:17:02.984443	\N	94	79
898	user_1405664238	2014-07-18 02:17:18.560995	2014-07-18 02:17:18.565641	\N	94	79
968	user_1405707200	2014-07-18 14:13:20.863498	2014-07-18 14:13:20.866474	\N	94	79
899	user_1405664294	2014-07-18 02:18:14.353353	2014-07-18 02:18:14.358148	\N	94	79
900	user_1405664312	2014-07-18 02:18:32.504655	2014-07-18 02:18:32.50775	\N	94	79
969	user_1405707211	2014-07-18 14:13:31.437796	2014-07-18 14:13:31.440786	\N	94	79
901	user_1405664373	2014-07-18 02:19:33.724142	2014-07-18 02:19:33.730177	\N	94	79
902	user_1405664389	2014-07-18 02:19:49.726706	2014-07-18 02:19:49.73347	\N	94	79
970	user_1405707338	2014-07-18 14:15:38.231286	2014-07-18 14:15:38.236176	\N	94	79
903	user_1405664400	2014-07-18 02:20:00.186628	2014-07-18 02:20:00.189393	\N	94	79
904	user_1405664413	2014-07-18 02:20:13.779063	2014-07-18 02:20:13.78147	\N	94	79
971	user_1405707434	2014-07-18 14:17:14.284819	2014-07-18 14:17:14.292014	\N	94	79
905	user_1405664773	2014-07-18 02:26:13.452512	2014-07-18 02:26:13.459569	\N	94	79
906	user_1405664781	2014-07-18 02:26:21.544559	2014-07-18 02:26:21.547407	\N	94	79
972	user_1405707478	2014-07-18 14:17:58.668158	2014-07-18 14:17:58.673352	\N	94	79
907	user_1405665196	2014-07-18 02:33:16.51266	2014-07-18 02:33:16.519756	\N	94	79
908	user_1405665282	2014-07-18 02:34:42.516334	2014-07-18 02:34:42.521208	\N	94	79
973	user_1405707583	2014-07-18 14:19:43.972928	2014-07-18 14:19:43.977752	\N	94	79
909	user_1405665430	2014-07-18 02:37:10.460947	2014-07-18 02:37:10.466162	\N	94	79
910	user_1405665457	2014-07-18 02:37:37.143277	2014-07-18 02:37:37.147998	\N	94	79
974	user_1405707638	2014-07-18 14:20:38.221781	2014-07-18 14:20:38.226244	\N	94	79
911	user_1405665479	2014-07-18 02:37:59.26542	2014-07-18 02:37:59.355062	\N	94	79
912	user_1405665498	2014-07-18 02:38:18.76813	2014-07-18 02:38:18.772431	\N	94	79
975	user_1405707761	2014-07-18 14:22:41.707637	2014-07-18 14:22:41.713516	\N	94	79
913	user_1405665518	2014-07-18 02:38:38.678496	2014-07-18 02:38:38.681136	\N	94	79
914	user_1405665530	2014-07-18 02:38:50.68883	2014-07-18 02:38:50.691729	\N	94	79
976	user_1405707774	2014-07-18 14:22:54.936803	2014-07-18 14:22:54.941189	\N	94	79
915	user_1405665541	2014-07-18 02:39:01.309422	2014-07-18 02:39:01.312434	\N	94	79
916	user_1405665574	2014-07-18 02:39:34.276514	2014-07-18 02:39:34.280954	\N	94	79
977	user_1405708047	2014-07-18 14:27:27.521827	2014-07-18 14:27:27.527262	\N	94	79
917	user_1405665587	2014-07-18 02:39:47.446479	2014-07-18 02:39:47.451593	\N	94	79
918	user_1405665599	2014-07-18 02:39:59.41075	2014-07-18 02:39:59.414727	\N	94	79
978	user_1405708197	2014-07-18 14:29:57.345893	2014-07-18 14:29:57.35088	\N	94	79
919	user_1405665673	2014-07-18 02:41:13.742946	2014-07-18 02:41:13.747885	\N	94	79
920	user_1405666200	2014-07-18 02:50:00.427274	2014-07-18 02:50:00.43284	\N	94	79
979	user_1405708480	2014-07-18 14:34:40.089754	2014-07-18 14:34:40.096149	\N	94	79
921	user_1405666302	2014-07-18 02:51:42.29368	2014-07-18 02:51:42.298317	\N	94	79
922	user_1405666326	2014-07-18 02:52:06.083585	2014-07-18 02:52:06.087887	\N	94	79
980	user_1405709030	2014-07-18 14:43:50.59933	2014-07-18 14:43:50.604101	\N	94	79
923	user_1405666335	2014-07-18 02:52:15.018575	2014-07-18 02:52:15.021425	\N	94	79
924	user_1405666363	2014-07-18 02:52:43.040516	2014-07-18 02:52:43.046089	\N	94	79
981	user_1405709172	2014-07-18 14:46:12.294025	2014-07-18 14:46:12.301283	\N	94	79
925	user_1405666368	2014-07-18 02:52:48.201207	2014-07-18 02:52:48.204057	\N	94	79
926	user_1405666379	2014-07-18 02:52:59.994327	2014-07-18 02:52:59.998269	\N	94	79
982	user_1405709191	2014-07-18 14:46:31.420461	2014-07-18 14:46:31.425368	\N	94	79
983	user_1405709375	2014-07-18 14:49:35.740154	2014-07-18 14:49:35.745298	\N	94	79
984	user_1405709388	2014-07-18 14:49:48.915455	2014-07-18 14:49:48.920939	\N	94	79
985	user_1405709421	2014-07-18 14:50:21.686142	2014-07-18 14:50:21.68887	\N	94	79
986	user_1405709538	2014-07-18 14:52:18.830008	2014-07-18 14:52:18.836463	\N	94	79
987	user_1405709567	2014-07-18 14:52:47.470204	2014-07-18 14:52:47.474814	\N	94	79
988	user_1405709704	2014-07-18 14:55:04.882484	2014-07-18 14:55:04.88586	\N	94	79
989	user_1405709776	2014-07-18 14:56:16.115536	2014-07-18 14:56:16.120131	\N	94	79
990	user_1405709794	2014-07-18 14:56:34.744301	2014-07-18 14:56:34.747743	\N	94	79
991	user_1405709820	2014-07-18 14:57:00.209466	2014-07-18 14:57:00.215005	\N	94	79
992	user_1405709841	2014-07-18 14:57:21.024976	2014-07-18 14:57:21.028697	\N	94	79
993	user_1405709894	2014-07-18 14:58:14.971684	2014-07-18 14:58:14.976849	\N	94	79
994	user_1405713232	2014-07-18 15:53:52.09787	2014-07-18 15:53:52.105028	\N	94	79
995	user_1405713369	2014-07-18 15:56:09.836121	2014-07-18 15:56:09.840903	\N	94	79
996	user_1405713376	2014-07-18 15:56:16.082912	2014-07-18 15:56:16.085565	\N	94	79
997	user_1405713389	2014-07-18 15:56:29.872224	2014-07-18 15:56:29.876383	\N	94	79
998	user_1405713416	2014-07-18 15:56:56.609215	2014-07-18 15:56:56.613866	\N	94	79
1059	user_1405722489	2014-07-18 18:28:09.249532	2014-07-18 18:28:09.254934	\N	94	79
1060	user_1405722527	2014-07-18 18:28:47.582876	2014-07-18 18:28:47.588199	\N	94	79
1061	user_1405722580	2014-07-18 18:29:40.430465	2014-07-18 18:29:40.434945	\N	94	79
1062	user_1405722597	2014-07-18 18:29:57.595342	2014-07-18 18:29:57.598252	\N	94	79
1063	user_1405722621	2014-07-18 18:30:21.620013	2014-07-18 18:30:21.625085	\N	94	79
1064	user_1405722741	2014-07-18 18:32:21.39906	2014-07-18 18:32:21.404635	\N	94	79
1065	user_1405722827	2014-07-18 18:33:47.982566	2014-07-18 18:33:47.98855	\N	94	79
1066	user_1405722880	2014-07-18 18:34:40.225798	2014-07-18 18:34:40.229115	\N	94	79
1067	user_1405722917	2014-07-18 18:35:17.267634	2014-07-18 18:35:17.272312	\N	94	79
1068	user_1405722953	2014-07-18 18:35:53.395715	2014-07-18 18:35:53.399627	\N	94	79
1069	user_1405723167	2014-07-18 18:39:26.995432	2014-07-18 18:39:27.001186	\N	94	79
1070	user_1405723209	2014-07-18 18:40:09.745544	2014-07-18 18:40:09.750826	\N	94	79
1071	user_1405723272	2014-07-18 18:41:12.162522	2014-07-18 18:41:12.166829	\N	94	79
1072	user_1405723312	2014-07-18 18:41:52.347342	2014-07-18 18:41:52.351502	\N	94	79
1073	user_1405723351	2014-07-18 18:42:31.843778	2014-07-18 18:42:31.846452	\N	94	79
927	user_1405666387	2014-07-18 02:53:07.983391	2014-07-18 02:53:07.988547	\N	94	79
1253	user_1405787618	2014-07-19 12:33:38.586436	2014-07-19 12:33:38.590904	\N	94	79
928	user_1405666506	2014-07-18 02:55:06.304564	2014-07-18 02:55:06.309883	\N	94	79
999	user_1405713454	2014-07-18 15:57:34.380005	2014-07-18 15:57:34.461137	\N	94	79
929	user_1405666522	2014-07-18 02:55:22.283175	2014-07-18 02:55:22.287765	\N	94	79
930	user_1405666593	2014-07-18 02:56:33.354975	2014-07-18 02:56:33.36111	\N	94	79
1000	user_1405713498	2014-07-18 15:58:18.783525	2014-07-18 15:58:18.788354	\N	94	79
931	user_1405666633	2014-07-18 02:57:13.066239	2014-07-18 02:57:13.07349	\N	94	79
932	user_1405666703	2014-07-18 02:58:23.88989	2014-07-18 02:58:23.986564	\N	94	79
1001	user_1405713607	2014-07-18 16:00:07.095785	2014-07-18 16:00:07.101222	\N	94	79
933	user_1405666770	2014-07-18 02:59:30.233325	2014-07-18 02:59:30.237017	\N	94	79
934	user_1405695203	2014-07-18 10:53:23.345303	2014-07-18 10:53:23.350235	\N	94	79
1002	user_1405713615	2014-07-18 16:00:15.920224	2014-07-18 16:00:15.924031	\N	94	79
935	user_1405695428	2014-07-18 10:57:08.211209	2014-07-18 10:57:08.215995	\N	94	79
936	user_1405695474	2014-07-18 10:57:54.914166	2014-07-18 10:57:54.91929	\N	94	79
1003	user_1405713648	2014-07-18 16:00:48.182567	2014-07-18 16:00:48.187987	\N	94	79
937	user_1405695492	2014-07-18 10:58:12.705046	2014-07-18 10:58:12.710415	\N	94	79
938	user_1405695534	2014-07-18 10:58:54.0936	2014-07-18 10:58:54.098734	\N	94	79
1004	user_1405713667	2014-07-18 16:01:07.057396	2014-07-18 16:01:07.06126	\N	94	79
939	user_1405696168	2014-07-18 11:09:28.027179	2014-07-18 11:09:28.031116	\N	94	79
940	user_1405696185	2014-07-18 11:09:45.764832	2014-07-18 11:09:45.769697	\N	94	79
1005	user_1405713704	2014-07-18 16:01:44.128406	2014-07-18 16:01:44.133937	\N	94	79
941	user_1405696315	2014-07-18 11:11:55.954531	2014-07-18 11:11:55.959563	\N	94	79
942	user_1405696324	2014-07-18 11:12:04.057881	2014-07-18 11:12:04.06329	\N	94	79
1006	user_1405713716	2014-07-18 16:01:56.081132	2014-07-18 16:01:56.085273	\N	94	79
943	user_1405696344	2014-07-18 11:12:24.770587	2014-07-18 11:12:24.775392	\N	94	79
944	user_1405696393	2014-07-18 11:13:13.699105	2014-07-18 11:13:13.703243	\N	94	79
1007	user_1405713813	2014-07-18 16:03:33.295245	2014-07-18 16:03:33.30255	\N	94	79
945	user_1405696449	2014-07-18 11:14:09.161404	2014-07-18 11:14:09.167089	\N	94	79
946	user_1405696470	2014-07-18 11:14:30.239389	2014-07-18 11:14:30.243744	\N	94	79
1008	user_1405714787	2014-07-18 16:19:47.171546	2014-07-18 16:19:47.17601	\N	94	79
947	user_1405696522	2014-07-18 11:15:22.509342	2014-07-18 11:15:22.514942	\N	94	79
948	user_1405696540	2014-07-18 11:15:40.56439	2014-07-18 11:15:40.569766	\N	94	79
1009	user_1405719237	2014-07-18 17:33:57.833021	2014-07-18 17:33:57.838982	\N	94	79
949	user_1405696595	2014-07-18 11:16:35.932725	2014-07-18 11:16:35.937983	\N	94	79
950	user_1405696610	2014-07-18 11:16:50.279441	2014-07-18 11:16:50.284217	\N	94	79
1010	user_1405719258	2014-07-18 17:34:18.214043	2014-07-18 17:34:18.216698	\N	94	79
951	user_1405697509	2014-07-18 11:31:49.004026	2014-07-18 11:31:49.012614	\N	94	79
952	user_1405697532	2014-07-18 11:32:12.851295	2014-07-18 11:32:12.855684	\N	94	79
1011	user_1405719323	2014-07-18 17:35:23.958201	2014-07-18 17:35:23.96336	\N	94	79
953	user_1405697541	2014-07-18 11:32:21.936424	2014-07-18 11:32:21.940781	\N	94	79
954	user_1405697583	2014-07-18 11:33:03.769515	2014-07-18 11:33:03.775069	\N	94	79
1012	user_1405719327	2014-07-18 17:35:27.919394	2014-07-18 17:35:27.921983	\N	94	79
955	user_1405697613	2014-07-18 11:33:33.894373	2014-07-18 11:33:33.897574	\N	94	79
956	user_1405697945	2014-07-18 11:39:05.224233	2014-07-18 11:39:05.228306	\N	94	79
1013	user_1405719434	2014-07-18 17:37:14.689908	2014-07-18 17:37:14.695086	\N	94	79
957	user_1405697994	2014-07-18 11:39:54.414524	2014-07-18 11:39:54.419182	\N	94	79
958	user_1405698004	2014-07-18 11:40:04.788472	2014-07-18 11:40:04.792209	\N	94	79
1014	user_1405719452	2014-07-18 17:37:32.375076	2014-07-18 17:37:32.379572	\N	94	79
959	user_1405698059	2014-07-18 11:40:59.5563	2014-07-18 11:40:59.560571	\N	94	79
1015	user_1405719695	2014-07-18 17:41:35.344537	2014-07-18 17:41:35.349725	\N	94	79
1016	user_1405719743	2014-07-18 17:42:23.606863	2014-07-18 17:42:23.61157	\N	94	79
1017	user_1405719789	2014-07-18 17:43:09.117014	2014-07-18 17:43:09.121959	\N	94	79
1018	user_1405719825	2014-07-18 17:43:45.508752	2014-07-18 17:43:45.514132	\N	94	79
1019	user_1405719849	2014-07-18 17:44:09.124956	2014-07-18 17:44:09.129869	\N	94	79
1020	user_1405719886	2014-07-18 17:44:46.24974	2014-07-18 17:44:46.252971	\N	94	79
1021	user_1405719998	2014-07-18 17:46:38.503105	2014-07-18 17:46:38.508305	\N	94	79
1022	user_1405720017	2014-07-18 17:46:57.119757	2014-07-18 17:46:57.124432	\N	94	79
1023	user_1405720197	2014-07-18 17:49:57.004714	2014-07-18 17:49:57.010843	\N	94	79
1024	user_1405720238	2014-07-18 17:50:38.207115	2014-07-18 17:50:38.210724	\N	94	79
1025	user_1405720306	2014-07-18 17:51:46.990129	2014-07-18 17:51:46.99416	\N	94	79
1026	user_1405720350	2014-07-18 17:52:30.527893	2014-07-18 17:52:30.532486	\N	94	79
1027	user_1405720382	2014-07-18 17:53:02.065163	2014-07-18 17:53:02.068263	\N	94	79
1028	user_1405720403	2014-07-18 17:53:23.090911	2014-07-18 17:53:23.095584	\N	94	79
1029	user_1405720415	2014-07-18 17:53:35.413053	2014-07-18 17:53:35.41576	\N	94	79
1030	user_1405720464	2014-07-18 17:54:24.786994	2014-07-18 17:54:24.792008	\N	94	79
1031	user_1405720538	2014-07-18 17:55:38.961463	2014-07-18 17:55:38.966078	\N	94	79
1032	user_1405720568	2014-07-18 17:56:08.166813	2014-07-18 17:56:08.171442	\N	94	79
1033	user_1405720601	2014-07-18 17:56:41.722956	2014-07-18 17:56:41.728371	\N	94	79
1034	user_1405720621	2014-07-18 17:57:01.773697	2014-07-18 17:57:01.77631	\N	94	79
1035	user_1405720893	2014-07-18 18:01:33.554227	2014-07-18 18:01:33.559684	\N	94	79
1036	user_1405721187	2014-07-18 18:06:27.648523	2014-07-18 18:06:27.653895	\N	94	79
1037	user_1405721234	2014-07-18 18:07:14.859584	2014-07-18 18:07:14.862782	\N	94	79
1038	user_1405721282	2014-07-18 18:08:02.823709	2014-07-18 18:08:02.827054	\N	94	79
1039	user_1405721355	2014-07-18 18:09:15.77703	2014-07-18 18:09:15.782555	\N	94	79
1040	user_1405721368	2014-07-18 18:09:28.863303	2014-07-18 18:09:28.866093	\N	94	79
1041	user_1405721377	2014-07-18 18:09:37.035484	2014-07-18 18:09:37.038287	\N	94	79
1042	user_1405721378	2014-07-18 18:09:38.926125	2014-07-18 18:09:38.928975	\N	94	79
1043	user_1405721393	2014-07-18 18:09:53.976819	2014-07-18 18:09:53.980527	\N	94	79
1044	user_1405721424	2014-07-18 18:10:24.163734	2014-07-18 18:10:24.168637	\N	94	79
1045	user_1405721433	2014-07-18 18:10:33.697011	2014-07-18 18:10:33.700229	\N	94	79
1046	user_1405721460	2014-07-18 18:11:00.800495	2014-07-18 18:11:00.804249	\N	94	79
1047	user_1405721485	2014-07-18 18:11:25.685251	2014-07-18 18:11:25.689506	\N	94	70
1048	gene	2014-07-18 18:11:25.928406	2014-07-18 18:11:35.362041	\N	94	70
1049	user_1405721506	2014-07-18 18:11:46.055827	2014-07-18 18:11:46.06016	\N	94	79
1050	user_1405721506	2014-07-18 18:11:46.674109	2014-07-18 18:11:46.678377	\N	94	79
1051	gene	2014-07-18 18:15:19.238418	2014-07-18 18:15:24.778249	\N	94	79
1052	user_1405721966	2014-07-18 18:19:26.627415	2014-07-18 18:19:26.632498	\N	94	79
1053	user_1405722332	2014-07-18 18:25:32.382364	2014-07-18 18:25:32.388367	\N	94	79
1054	user_1405722332	2014-07-18 18:25:32.750656	2014-07-18 18:25:32.754775	\N	94	79
1055	user_1405722359	2014-07-18 18:25:59.547003	2014-07-18 18:25:59.551774	\N	94	79
1056	user_1405722390	2014-07-18 18:26:30.733392	2014-07-18 18:26:30.736346	\N	94	79
1057	user_1405722404	2014-07-18 18:26:44.947536	2014-07-18 18:26:44.950959	\N	94	79
1058	user_1405722411	2014-07-18 18:26:51.653314	2014-07-18 18:26:51.657439	\N	94	79
1074	user_1405723402	2014-07-18 18:43:22.100352	2014-07-18 18:43:22.104555	\N	94	79
1075	user_1405723461	2014-07-18 18:44:21.057606	2014-07-18 18:44:21.062252	\N	94	79
1076	user_1405723474	2014-07-18 18:44:34.197689	2014-07-18 18:44:34.201648	\N	94	79
1077	user_1405723479	2014-07-18 18:44:39.141937	2014-07-18 18:44:39.146118	\N	94	79
1078	user_1405723482	2014-07-18 18:44:42.277604	2014-07-18 18:44:42.283224	\N	94	79
1079	user_1405723489	2014-07-18 18:44:49.894941	2014-07-18 18:44:49.901428	\N	94	79
1080	user_1405723505	2014-07-18 18:45:05.580669	2014-07-18 18:45:05.583615	\N	94	79
1081	user_1405723524	2014-07-18 18:45:24.438492	2014-07-18 18:45:24.441738	\N	94	79
1082	user_1405723557	2014-07-18 18:45:57.761771	2014-07-18 18:45:57.764985	\N	94	79
1083	user_1405723593	2014-07-18 18:46:33.527773	2014-07-18 18:46:33.530223	\N	94	79
1084	user_1405723656	2014-07-18 18:47:36.135582	2014-07-18 18:47:36.140584	\N	94	79
1085	user_1405723666	2014-07-18 18:47:46.034859	2014-07-18 18:47:46.03794	\N	94	79
1086	user_1405723695	2014-07-18 18:48:15.816508	2014-07-18 18:48:15.819218	\N	94	79
1087	user_1405723710	2014-07-18 18:48:30.810179	2014-07-18 18:48:30.813587	\N	94	79
1088	user_1405723756	2014-07-18 18:49:16.517676	2014-07-18 18:49:16.521675	\N	94	79
1089	user_1405723773	2014-07-18 18:49:33.995587	2014-07-18 18:49:33.998635	\N	94	79
1090	user_1405723857	2014-07-18 18:50:57.890608	2014-07-18 18:50:57.894767	\N	94	79
1091	user_1405724023	2014-07-18 18:53:43.017738	2014-07-18 18:53:43.022456	\N	94	79
1092	user_1405724098	2014-07-18 18:54:58.98347	2014-07-18 18:54:58.988917	\N	94	79
1093	user_1405724145	2014-07-18 18:55:45.977015	2014-07-18 18:55:45.982834	\N	94	79
1094	user_1405724222	2014-07-18 18:57:02.711175	2014-07-18 18:57:02.714297	\N	94	79
1095	user_1405724266	2014-07-18 18:57:46.378774	2014-07-18 18:57:46.381749	\N	94	79
1096	user_1405724287	2014-07-18 18:58:07.840546	2014-07-18 18:58:07.843318	\N	94	79
1097	user_1405724329	2014-07-18 18:58:49.916509	2014-07-18 18:58:49.920219	\N	94	79
1098	user_1405724405	2014-07-18 19:00:05.386776	2014-07-18 19:00:05.391894	\N	94	79
1099	user_1405724458	2014-07-18 19:00:58.233981	2014-07-18 19:00:58.238487	\N	94	79
1100	user_1405724546	2014-07-18 19:02:26.59743	2014-07-18 19:02:26.602543	\N	94	79
1101	user_1405724590	2014-07-18 19:03:10.273354	2014-07-18 19:03:10.276929	\N	94	79
1102	user_1405724639	2014-07-18 19:03:59.819371	2014-07-18 19:03:59.825	\N	94	79
1103	user_1405724770	2014-07-18 19:06:10.665248	2014-07-18 19:06:10.670649	\N	94	79
1104	user_1405724796	2014-07-18 19:06:36.698497	2014-07-18 19:06:36.701999	\N	94	79
1105	user_1405724983	2014-07-18 19:09:43.238499	2014-07-18 19:09:43.244059	\N	94	79
1106	user_1405725027	2014-07-18 19:10:27.901451	2014-07-18 19:10:27.906415	\N	94	79
1107	user_1405725101	2014-07-18 19:11:41.871829	2014-07-18 19:11:41.877267	\N	94	79
1108	user_1405725163	2014-07-18 19:12:43.149188	2014-07-18 19:12:43.154295	\N	94	79
1109	user_1405725212	2014-07-18 19:13:32.460393	2014-07-18 19:13:32.46522	\N	94	79
1110	user_1405725287	2014-07-18 19:14:47.237171	2014-07-18 19:14:47.240602	\N	94	79
1111	user_1405725300	2014-07-18 19:15:00.443168	2014-07-18 19:15:00.447442	\N	94	79
1112	user_1405725319	2014-07-18 19:15:19.955307	2014-07-18 19:15:19.958486	\N	94	79
1113	user_1405725449	2014-07-18 19:17:29.459315	2014-07-18 19:17:29.464123	\N	94	79
1114	user_1405725506	2014-07-18 19:18:26.127117	2014-07-18 19:18:26.132064	\N	94	79
1115	user_1405725548	2014-07-18 19:19:08.570377	2014-07-18 19:19:08.576233	\N	94	79
1116	user_1405725631	2014-07-18 19:20:31.0521	2014-07-18 19:20:31.056784	\N	94	79
1117	user_1405725662	2014-07-18 19:21:02.629168	2014-07-18 19:21:02.633633	\N	94	79
1118	user_1405725928	2014-07-18 19:25:28.134647	2014-07-18 19:25:28.139779	\N	94	79
1119	user_1405726623	2014-07-18 19:37:03.445682	2014-07-18 19:37:03.449545	\N	94	79
1120	user_1405726636	2014-07-18 19:37:16.257726	2014-07-18 19:37:16.262617	\N	94	79
1121	user_1405726645	2014-07-18 19:37:25.988305	2014-07-18 19:37:25.992686	\N	94	79
1122	user_1405726653	2014-07-18 19:37:33.443013	2014-07-18 19:37:33.445569	\N	94	79
1123	user_1405726664	2014-07-18 19:37:44.224402	2014-07-18 19:37:44.228307	\N	94	79
1124	user_1405726689	2014-07-18 19:38:09.455115	2014-07-18 19:38:09.459713	\N	94	79
1125	user_1405726770	2014-07-18 19:39:30.556963	2014-07-18 19:39:30.562251	\N	94	79
1126	user_1405726829	2014-07-18 19:40:29.006988	2014-07-18 19:40:29.01171	\N	94	79
1127	user_1405726891	2014-07-18 19:41:31.049372	2014-07-18 19:41:31.054708	\N	94	79
1128	user_1405726989	2014-07-18 19:43:09.026952	2014-07-18 19:43:09.032556	\N	94	79
1129	user_1405727015	2014-07-18 19:43:35.339378	2014-07-18 19:43:35.342796	\N	94	79
1130	user_1405727115	2014-07-18 19:45:15.55239	2014-07-18 19:45:15.555664	\N	94	79
1131	user_1405727178	2014-07-18 19:46:18.419472	2014-07-18 19:46:18.424165	\N	94	79
1132	user_1405727243	2014-07-18 19:47:23.882716	2014-07-18 19:47:23.888379	\N	94	79
1133	user_1405727329	2014-07-18 19:48:49.449486	2014-07-18 19:48:49.455239	\N	94	79
1134	user_1405733104	2014-07-18 21:25:04.223982	2014-07-18 21:25:04.231488	\N	94	70
1135	user_1405733116	2014-07-18 21:25:16.986857	2014-07-18 21:25:16.990799	\N	94	70
1136	user_1405733131	2014-07-18 21:25:31.785467	2014-07-18 21:25:31.789397	\N	94	70
1137	user_1405733138	2014-07-18 21:25:38.212249	2014-07-18 21:25:38.21606	\N	94	70
1138	user_1405733749	2014-07-18 21:35:49.073853	2014-07-18 21:35:49.077184	\N	94	79
1139	user_1405733757	2014-07-18 21:35:57.144561	2014-07-18 21:35:57.147538	\N	94	79
1140	user_1405733983	2014-07-18 21:39:43.022343	2014-07-18 21:39:43.025771	\N	94	79
1141	user_1405734047	2014-07-18 21:40:47.410925	2014-07-18 21:40:47.416192	\N	94	79
1142	user_1405734185	2014-07-18 21:43:05.719127	2014-07-18 21:43:05.723621	\N	94	79
1143	user_1405734204	2014-07-18 21:43:24.793283	2014-07-18 21:43:24.887679	\N	94	79
1144	user_1405734232	2014-07-18 21:43:52.662428	2014-07-18 21:43:52.667508	\N	94	79
1145	user_1405734237	2014-07-18 21:43:57.398461	2014-07-18 21:43:57.403102	\N	94	79
1146	user_1405734265	2014-07-18 21:44:25.886229	2014-07-18 21:44:25.8897	\N	94	79
1147	user_1405734342	2014-07-18 21:45:42.457909	2014-07-18 21:45:42.463333	\N	94	79
1148	user_1405734351	2014-07-18 21:45:51.958804	2014-07-18 21:45:51.962605	\N	94	79
1149	user_1405734382	2014-07-18 21:46:22.346114	2014-07-18 21:46:22.350975	\N	94	79
1150	user_1405734509	2014-07-18 21:48:29.483816	2014-07-18 21:48:29.491015	\N	94	79
1151	user_1405734654	2014-07-18 21:50:54.154841	2014-07-18 21:50:54.15966	\N	94	79
1152	user_1405734826	2014-07-18 21:53:46.537344	2014-07-18 21:53:46.543708	\N	94	79
1153	user_1405734937	2014-07-18 21:55:37.487055	2014-07-18 21:55:37.491167	\N	94	79
1154	user_1405735559	2014-07-18 22:05:59.211725	2014-07-18 22:05:59.216841	\N	94	79
1155	user_1405736211	2014-07-18 22:16:51.643559	2014-07-18 22:16:51.648604	\N	94	79
1156	user_1405736246	2014-07-18 22:17:26.87377	2014-07-18 22:17:26.87841	\N	94	79
1157	user_1405736286	2014-07-18 22:18:06.233703	2014-07-18 22:18:06.238198	\N	94	79
1158	user_1405736305	2014-07-18 22:18:25.839544	2014-07-18 22:18:25.842363	\N	94	79
1159	user_1405736337	2014-07-18 22:18:57.962889	2014-07-18 22:18:57.966808	\N	94	79
1160	gene	2014-07-18 22:19:05.260032	2014-07-18 22:19:12.871039	\N	94	79
1161	user_1405736466	2014-07-18 22:21:06.675523	2014-07-18 22:21:06.68074	\N	94	79
1162	user_1405736535	2014-07-18 22:22:15.723284	2014-07-18 22:22:15.727929	\N	94	79
1163	user_1405736542	2014-07-18 22:22:22.864447	2014-07-18 22:22:22.867395	\N	94	79
1164	user_1405736637	2014-07-18 22:23:57.852631	2014-07-18 22:23:57.856714	\N	94	79
1165	user_1405736644	2014-07-18 22:24:04.406779	2014-07-18 22:24:04.409608	\N	94	79
1166	user_1405736713	2014-07-18 22:25:13.22351	2014-07-18 22:25:13.228457	\N	94	79
1254	user_1405787632	2014-07-19 12:33:52.513932	2014-07-19 12:33:52.517709	\N	94	79
1167	gene	2014-07-18 22:25:34.754746	2014-07-18 22:25:48.267277	\N	94	79
1598	user_1405805368	2014-07-19 17:29:28.942202	2014-07-19 17:29:28.947996	\N	94	79
1168	user_1405736860	2014-07-18 22:27:40.641453	2014-07-18 22:27:40.648101	\N	94	79
1255	user_1405787658	2014-07-19 12:34:18.933155	2014-07-19 12:34:18.935711	\N	94	79
1169	user_1405736899	2014-07-18 22:28:19.976621	2014-07-18 22:28:19.982009	\N	94	79
1170	user_1405736944	2014-07-18 22:29:04.411259	2014-07-18 22:29:04.416847	\N	94	79
1256	user_1405787660	2014-07-19 12:34:20.261384	2014-07-19 12:34:20.26606	\N	94	79
1171	user_1405736976	2014-07-18 22:29:36.329078	2014-07-18 22:29:36.333076	\N	94	79
1172	user_1405739744	2014-07-18 23:15:44.33488	2014-07-18 23:15:44.340256	\N	94	79
1257	user_1405787780	2014-07-19 12:36:20.136368	2014-07-19 12:36:20.141902	\N	94	79
1173	user_1405739797	2014-07-18 23:16:37.752014	2014-07-18 23:16:37.75469	\N	94	79
1174	user_1405745737	2014-07-19 00:55:37.564473	2014-07-19 00:55:37.571219	\N	94	79
1258	user_1405787957	2014-07-19 12:39:17.379334	2014-07-19 12:39:17.383877	\N	94	79
1175	user_1405745747	2014-07-19 00:55:47.53811	2014-07-19 00:55:47.542387	\N	94	79
1176	user_1405745775	2014-07-19 00:56:15.145613	2014-07-19 00:56:15.151441	\N	94	79
1259	user_1405788005	2014-07-19 12:40:05.110366	2014-07-19 12:40:05.115207	\N	94	79
1177	user_1405745782	2014-07-19 00:56:22.814502	2014-07-19 00:56:22.817324	\N	94	79
1178	user_1405745789	2014-07-19 00:56:29.17331	2014-07-19 00:56:29.175876	\N	94	79
1179	user_1405746185	2014-07-19 01:03:05.411539	2014-07-19 01:03:05.417684	\N	94	79
1180	user_1405746363	2014-07-19 01:06:03.344133	2014-07-19 01:06:03.349472	\N	94	79
1181	user_1405746376	2014-07-19 01:06:16.037872	2014-07-19 01:06:16.042302	\N	94	79
1182	user_1405746398	2014-07-19 01:06:38.589536	2014-07-19 01:06:38.593317	\N	94	79
1183	user_1405746409	2014-07-19 01:06:49.618746	2014-07-19 01:06:49.623086	\N	94	79
1184	user_1405746501	2014-07-19 01:08:21.13663	2014-07-19 01:08:21.14251	\N	94	79
1185	user_1405746593	2014-07-19 01:09:53.820973	2014-07-19 01:09:53.825264	\N	94	79
1186	user_1405746637	2014-07-19 01:10:37.060933	2014-07-19 01:10:37.06578	\N	94	79
1187	user_1405746651	2014-07-19 01:10:51.556776	2014-07-19 01:10:51.562315	\N	94	79
1188	user_1405746665	2014-07-19 01:11:05.421677	2014-07-19 01:11:05.42562	\N	94	79
1189	user_1405746678	2014-07-19 01:11:18.394947	2014-07-19 01:11:18.39902	\N	94	79
1190	user_1405746708	2014-07-19 01:11:48.69427	2014-07-19 01:11:48.697752	\N	94	79
1191	user_1405747126	2014-07-19 01:18:46.514546	2014-07-19 01:18:46.519062	\N	94	79
1192	user_1405747137	2014-07-19 01:18:57.394536	2014-07-19 01:18:57.398353	\N	94	79
1193	user_1405747733	2014-07-19 01:28:53.027174	2014-07-19 01:28:53.032601	\N	94	79
1194	user_1405748753	2014-07-19 01:45:53.537918	2014-07-19 01:45:53.543518	\N	94	79
1195	user_1405748764	2014-07-19 01:46:04.732594	2014-07-19 01:46:04.735112	\N	94	79
1196	user_1405748771	2014-07-19 01:46:11.93221	2014-07-19 01:46:11.936592	\N	94	79
1197	user_1405749333	2014-07-19 01:55:33.421907	2014-07-19 01:55:33.426887	\N	94	79
1198	user_1405749747	2014-07-19 02:02:27.075794	2014-07-19 02:02:27.080515	\N	94	79
1199	user_1405749763	2014-07-19 02:02:43.132609	2014-07-19 02:02:43.136096	\N	94	79
1200	user_1405749815	2014-07-19 02:03:35.224349	2014-07-19 02:03:35.228952	\N	94	79
1201	user_1405749914	2014-07-19 02:05:14.842075	2014-07-19 02:05:14.847523	\N	94	79
1202	user_1405749941	2014-07-19 02:05:41.914578	2014-07-19 02:05:41.921453	\N	94	79
1203	user_1405750100	2014-07-19 02:08:20.537077	2014-07-19 02:08:20.54005	\N	94	79
1204	user_1405750126	2014-07-19 02:08:46.787626	2014-07-19 02:08:46.792503	\N	94	79
1205	user_1405750153	2014-07-19 02:09:13.264747	2014-07-19 02:09:13.268995	\N	94	79
1206	user_1405750163	2014-07-19 02:09:23.287806	2014-07-19 02:09:23.291001	\N	94	79
1207	user_1405751646	2014-07-19 02:34:06.503699	2014-07-19 02:34:06.510646	\N	94	79
1208	user_1405751668	2014-07-19 02:34:28.407319	2014-07-19 02:34:28.411508	\N	94	79
1209	user_1405751722	2014-07-19 02:35:22.300636	2014-07-19 02:35:22.303976	\N	94	79
1210	user_1405751768	2014-07-19 02:36:08.377634	2014-07-19 02:36:08.381451	\N	94	79
1211	user_1405751888	2014-07-19 02:38:08.280078	2014-07-19 02:38:08.28519	\N	94	79
1212	gene	2014-07-19 02:39:09.048108	2014-07-19 02:39:14.501462	\N	94	79
1213	user_1405751990	2014-07-19 02:39:50.710429	2014-07-19 02:39:50.715412	\N	94	79
1214	user_1405752019	2014-07-19 02:40:19.964344	2014-07-19 02:40:19.969673	\N	94	79
1215	user_1405752108	2014-07-19 02:41:48.283093	2014-07-19 02:41:48.288907	\N	94	79
1216	user_1405752165	2014-07-19 02:42:45.189791	2014-07-19 02:42:45.194581	\N	94	79
1217	user_1405752349	2014-07-19 02:45:49.829332	2014-07-19 02:45:49.835299	\N	94	79
1218	user_1405752408	2014-07-19 02:46:48.144079	2014-07-19 02:46:48.149132	\N	94	79
1219	user_1405752492	2014-07-19 02:48:12.813251	2014-07-19 02:48:12.820943	\N	94	79
1220	user_1405752745	2014-07-19 02:52:25.595615	2014-07-19 02:52:25.601937	\N	94	79
1221	user_1405752840	2014-07-19 02:54:00.149398	2014-07-19 02:54:00.154751	\N	94	79
1222	user_1405752864	2014-07-19 02:54:24.124499	2014-07-19 02:54:24.128427	\N	94	79
1223	user_1405752972	2014-07-19 02:56:12.549684	2014-07-19 02:56:12.554482	\N	94	79
1224	user_1405752991	2014-07-19 02:56:31.988546	2014-07-19 02:56:31.992884	\N	94	79
1225	user_1405753019	2014-07-19 02:56:59.981261	2014-07-19 02:56:59.98469	\N	94	79
1226	user_1405753200	2014-07-19 03:00:00.79923	2014-07-19 03:00:00.804292	\N	94	79
1227	user_1405753546	2014-07-19 03:05:46.977006	2014-07-19 03:05:46.983982	\N	94	79
1228	user_1405753590	2014-07-19 03:06:30.66792	2014-07-19 03:06:30.671685	\N	94	79
1229	user_1405753594	2014-07-19 03:06:34.886889	2014-07-19 03:06:34.890818	\N	94	79
1230	user_1405753614	2014-07-19 03:06:54.983731	2014-07-19 03:06:54.989183	\N	94	79
1231	user_1405753623	2014-07-19 03:07:03.865614	2014-07-19 03:07:03.871358	\N	94	79
1232	user_1405753680	2014-07-19 03:08:00.807388	2014-07-19 03:08:00.813307	\N	94	79
1233	user_1405753683	2014-07-19 03:08:03.577435	2014-07-19 03:08:03.583119	\N	94	79
1234	user_1405785139	2014-07-19 11:52:19.140787	2014-07-19 11:52:19.148236	\N	94	79
1235	user_1405785148	2014-07-19 11:52:28.036851	2014-07-19 11:52:28.04102	\N	94	79
1236	user_1405785172	2014-07-19 11:52:52.508111	2014-07-19 11:52:52.515085	\N	94	79
1237	user_1405785215	2014-07-19 11:53:35.701325	2014-07-19 11:53:35.705982	\N	94	79
1238	user_1405785216	2014-07-19 11:53:36.564806	2014-07-19 11:53:36.569786	\N	94	79
1239	user_1405785475	2014-07-19 11:57:55.795846	2014-07-19 11:57:55.800467	\N	94	79
1240	user_1405785476	2014-07-19 11:57:56.973018	2014-07-19 11:57:56.976322	\N	94	79
1241	user_1405785501	2014-07-19 11:58:21.810257	2014-07-19 11:58:21.813556	\N	94	79
1242	user_1405785524	2014-07-19 11:58:44.389599	2014-07-19 11:58:44.394222	\N	94	79
1243	user_1405785584	2014-07-19 11:59:44.100001	2014-07-19 11:59:44.104937	\N	94	79
1244	user_1405785597	2014-07-19 11:59:57.122799	2014-07-19 11:59:57.12566	\N	94	79
1245	user_1405785613	2014-07-19 12:00:13.166144	2014-07-19 12:00:13.171765	\N	94	79
1246	user_1405785708	2014-07-19 12:01:48.039539	2014-07-19 12:01:48.04878	\N	94	79
1247	user_1405785729	2014-07-19 12:02:09.716393	2014-07-19 12:02:09.719883	\N	94	79
1248	user_1405786580	2014-07-19 12:16:20.345512	2014-07-19 12:16:20.35183	\N	94	79
1249	user_1405786926	2014-07-19 12:22:06.474199	2014-07-19 12:22:06.479438	\N	94	79
1250	user_1405786927	2014-07-19 12:22:07.540962	2014-07-19 12:22:07.543628	\N	94	79
1251	user_1405786967	2014-07-19 12:22:47.269518	2014-07-19 12:22:47.274912	\N	94	79
1260	user_1405788006	2014-07-19 12:40:06.319936	2014-07-19 12:40:06.322918	\N	94	79
2032	user_1405838872	2014-07-20 02:47:52.985107	2014-07-20 02:47:52.989317	\N	94	79
1261	user_1405788095	2014-07-19 12:41:35.41631	2014-07-19 12:41:35.421747	\N	94	79
1599	user_1405805369	2014-07-19 17:29:29.63629	2014-07-19 17:29:29.641098	\N	94	79
1262	user_1405788096	2014-07-19 12:41:36.553952	2014-07-19 12:41:36.557108	\N	94	79
1263	user_1405788117	2014-07-19 12:41:57.625466	2014-07-19 12:41:57.629483	\N	94	79
1600	user_1405805507	2014-07-19 17:31:47.277331	2014-07-19 17:31:47.282766	\N	94	79
1264	user_1405788211	2014-07-19 12:43:31.97375	2014-07-19 12:43:31.980233	\N	94	79
1265	user_1405791374	2014-07-19 13:36:14.914122	2014-07-19 13:36:14.918377	\N	94	79
1601	user_1405805508	2014-07-19 17:31:48.12379	2014-07-19 17:31:48.128566	\N	94	79
1266	user_1405791375	2014-07-19 13:36:15.143268	2014-07-19 13:36:15.148557	\N	94	79
1267	user_1405791433	2014-07-19 13:37:13.616194	2014-07-19 13:37:13.620775	\N	94	79
1602	user_1405805549	2014-07-19 17:32:29.882064	2014-07-19 17:32:29.884802	\N	94	79
1268	user_1405791452	2014-07-19 13:37:32.401453	2014-07-19 13:37:32.406457	\N	94	79
1269	user_1405791456	2014-07-19 13:37:36.633583	2014-07-19 13:37:36.636299	\N	94	79
1603	user_1405805550	2014-07-19 17:32:30.654729	2014-07-19 17:32:30.657564	\N	94	79
1270	user_1405791461	2014-07-19 13:37:41.847637	2014-07-19 13:37:41.852548	\N	94	79
1271	user_1405791653	2014-07-19 13:40:53.773091	2014-07-19 13:40:53.778819	\N	94	79
1604	user_1405805582	2014-07-19 17:33:02.732277	2014-07-19 17:33:02.735825	\N	94	79
1272	user_1405791673	2014-07-19 13:41:13.303942	2014-07-19 13:41:13.306734	\N	94	79
1273	user_1405791691	2014-07-19 13:41:31.460699	2014-07-19 13:41:31.465913	\N	94	79
1605	user_1405805583	2014-07-19 17:33:03.397656	2014-07-19 17:33:03.402145	\N	94	79
1274	user_1405791768	2014-07-19 13:42:48.951941	2014-07-19 13:42:48.955126	\N	94	79
1275	user_1405791805	2014-07-19 13:43:25.22806	2014-07-19 13:43:25.233948	\N	94	79
1606	user_1405806361	2014-07-19 17:46:01.497081	2014-07-19 17:46:01.502759	\N	94	79
1276	user_1405791880	2014-07-19 13:44:40.280589	2014-07-19 13:44:40.28394	\N	94	79
1277	user_1405791886	2014-07-19 13:44:46.395954	2014-07-19 13:44:46.39921	\N	94	79
1607	user_1405806362	2014-07-19 17:46:02.041464	2014-07-19 17:46:02.044112	\N	94	79
1278	user_1405791899	2014-07-19 13:44:59.664035	2014-07-19 13:44:59.668443	\N	94	79
1279	user_1405791934	2014-07-19 13:45:34.403441	2014-07-19 13:45:34.406253	\N	94	79
1608	user_1405806450	2014-07-19 17:47:30.184941	2014-07-19 17:47:30.190287	\N	94	79
1280	user_1405791944	2014-07-19 13:45:44.856907	2014-07-19 13:45:44.860487	\N	94	79
1281	user_1405791991	2014-07-19 13:46:31.593024	2014-07-19 13:46:31.597027	\N	94	79
1609	user_1405806450	2014-07-19 17:47:30.720785	2014-07-19 17:47:30.725471	\N	94	79
1282	user_1405792000	2014-07-19 13:46:40.309278	2014-07-19 13:46:40.312582	\N	94	79
1283	user_1405792193	2014-07-19 13:49:53.957667	2014-07-19 13:49:53.961996	\N	94	79
1610	user_1405806543	2014-07-19 17:49:03.379974	2014-07-19 17:49:03.384518	\N	94	79
1284	user_1405792214	2014-07-19 13:50:14.144505	2014-07-19 13:50:14.147221	\N	94	79
1285	user_1405792259	2014-07-19 13:50:59.445494	2014-07-19 13:50:59.44838	\N	94	79
1611	user_1405806547	2014-07-19 17:49:07.755488	2014-07-19 17:49:07.75839	\N	94	79
1286	user_1405792422	2014-07-19 13:53:42.217148	2014-07-19 13:53:42.220841	\N	94	79
1719	user_1405810174	2014-07-19 18:49:34.251117	2014-07-19 18:49:34.255565	\N	94	79
1287	user_1405792912	2014-07-19 14:01:52.806061	2014-07-19 14:01:52.811859	\N	94	79
1288	user_1405792922	2014-07-19 14:02:02.213179	2014-07-19 14:02:02.217792	\N	94	79
1720	user_1405810174	2014-07-19 18:49:34.84635	2014-07-19 18:49:34.850662	\N	94	79
1289	user_1405792934	2014-07-19 14:02:14.573454	2014-07-19 14:02:14.576274	\N	94	79
1290	user_1405792956	2014-07-19 14:02:36.530817	2014-07-19 14:02:36.533744	\N	94	79
1721	user_1405810179	2014-07-19 18:49:39.031086	2014-07-19 18:49:39.035452	\N	94	79
1291	user_1405792974	2014-07-19 14:02:54.157221	2014-07-19 14:02:54.160047	\N	94	79
1292	user_1405792989	2014-07-19 14:03:09.846603	2014-07-19 14:03:09.851257	\N	94	79
1722	user_1405810181	2014-07-19 18:49:41.119032	2014-07-19 18:49:41.12414	\N	94	79
1293	user_1405793011	2014-07-19 14:03:31.619659	2014-07-19 14:03:31.62259	\N	94	79
1294	user_1405793051	2014-07-19 14:04:11.610226	2014-07-19 14:04:11.614231	\N	94	79
1723	user_1405810187	2014-07-19 18:49:47.688835	2014-07-19 18:49:47.692622	\N	94	79
1295	user_1405793236	2014-07-19 14:07:16.367953	2014-07-19 14:07:16.372813	\N	94	79
1296	user_1405793247	2014-07-19 14:07:27.691768	2014-07-19 14:07:27.694749	\N	94	79
1724	user_1405810188	2014-07-19 18:49:48.6462	2014-07-19 18:49:48.65013	\N	94	79
1297	user_1405793261	2014-07-19 14:07:41.086814	2014-07-19 14:07:41.089404	\N	94	79
1298	user_1405793290	2014-07-19 14:08:10.627139	2014-07-19 14:08:10.630084	\N	94	79
1725	user_1405810197	2014-07-19 18:49:57.752817	2014-07-19 18:49:57.757463	\N	94	79
1299	user_1405793441	2014-07-19 14:10:41.983792	2014-07-19 14:10:41.987489	\N	94	79
1300	user_1405793552	2014-07-19 14:12:32.877436	2014-07-19 14:12:32.882636	\N	94	79
1726	user_1405810247	2014-07-19 18:50:47.484597	2014-07-19 18:50:47.487887	\N	94	79
1301	user_1405793573	2014-07-19 14:12:53.7544	2014-07-19 14:12:53.758383	\N	94	79
1302	user_1405793622	2014-07-19 14:13:42.514284	2014-07-19 14:13:42.51892	\N	94	79
1727	user_1405810248	2014-07-19 18:50:48.685767	2014-07-19 18:50:48.690088	\N	94	79
1303	user_1405793670	2014-07-19 14:14:30.518602	2014-07-19 14:14:30.521233	\N	94	79
1304	user_1405793700	2014-07-19 14:15:00.674643	2014-07-19 14:15:00.678359	\N	94	79
1728	user_1405810263	2014-07-19 18:51:03.596159	2014-07-19 18:51:03.600289	\N	94	79
1305	user_1405793733	2014-07-19 14:15:33.477052	2014-07-19 14:15:33.481835	\N	94	79
1306	user_1405793761	2014-07-19 14:16:01.513265	2014-07-19 14:16:01.517009	\N	94	79
1729	user_1405810710	2014-07-19 18:58:30.109892	2014-07-19 18:58:30.115306	\N	94	79
1307	user_1405793801	2014-07-19 14:16:41.881759	2014-07-19 14:16:41.887281	\N	94	79
1308	user_1405793861	2014-07-19 14:17:41.616688	2014-07-19 14:17:41.62179	\N	94	79
1730	user_1405810732	2014-07-19 18:58:52.496517	2014-07-19 18:58:52.499412	\N	94	79
1309	user_1405793898	2014-07-19 14:18:18.483892	2014-07-19 14:18:18.486783	\N	94	79
1310	user_1405793969	2014-07-19 14:19:29.4038	2014-07-19 14:19:29.407576	\N	94	79
1731	user_1405810734	2014-07-19 18:58:54.372109	2014-07-19 18:58:54.376608	\N	94	79
1311	user_1405793987	2014-07-19 14:19:47.119728	2014-07-19 14:19:47.124223	\N	94	79
1312	user_1405793988	2014-07-19 14:19:48.089405	2014-07-19 14:19:48.094339	\N	94	79
1732	user_1405810760	2014-07-19 18:59:20.147826	2014-07-19 18:59:20.15059	\N	94	79
1313	user_1405794102	2014-07-19 14:21:42.935843	2014-07-19 14:21:42.940418	\N	94	79
1314	user_1405794108	2014-07-19 14:21:48.948958	2014-07-19 14:21:48.951985	\N	94	79
1733	user_1405810818	2014-07-19 19:00:18.362655	2014-07-19 19:00:18.367183	\N	94	79
1315	user_1405794145	2014-07-19 14:22:25.138303	2014-07-19 14:22:25.1408	\N	94	79
1316	user_1405794145	2014-07-19 14:22:25.986866	2014-07-19 14:22:25.990546	\N	94	79
1734	user_1405810818	2014-07-19 19:00:18.688041	2014-07-19 19:00:18.691815	\N	94	79
1317	user_1405794215	2014-07-19 14:23:35.499619	2014-07-19 14:23:35.506486	\N	94	79
1318	user_1405794598	2014-07-19 14:29:58.348417	2014-07-19 14:29:58.353194	\N	94	79
1735	user_1405810872	2014-07-19 19:01:12.167586	2014-07-19 19:01:12.170738	\N	94	79
1736	user_1405810873	2014-07-19 19:01:13.44878	2014-07-19 19:01:13.453234	\N	94	79
1737	user_1405810957	2014-07-19 19:02:37.683111	2014-07-19 19:02:37.688701	\N	94	79
1738	user_1405810958	2014-07-19 19:02:38.826898	2014-07-19 19:02:38.82951	\N	94	79
1739	user_1405811000	2014-07-19 19:03:20.831703	2014-07-19 19:03:20.836786	\N	94	79
1740	user_1405811001	2014-07-19 19:03:21.697247	2014-07-19 19:03:21.701391	\N	94	79
1319	user_1405795077	2014-07-19 14:37:57.635494	2014-07-19 14:37:57.644667	\N	94	79
1320	user_1405795092	2014-07-19 14:38:12.523749	2014-07-19 14:38:12.526274	\N	94	79
1321	user_1405795104	2014-07-19 14:38:24.906305	2014-07-19 14:38:24.909072	\N	94	79
1322	user_1405795160	2014-07-19 14:39:20.164089	2014-07-19 14:39:20.169116	\N	94	79
1323	user_1405795206	2014-07-19 14:40:06.135314	2014-07-19 14:40:06.139975	\N	94	79
1324	user_1405795227	2014-07-19 14:40:27.234446	2014-07-19 14:40:27.237487	\N	94	79
1325	user_1405795242	2014-07-19 14:40:42.58416	2014-07-19 14:40:42.589033	\N	94	79
1326	user_1405795250	2014-07-19 14:40:50.51425	2014-07-19 14:40:50.517643	\N	94	79
1327	user_1405795287	2014-07-19 14:41:27.461172	2014-07-19 14:41:27.463925	\N	94	79
1328	user_1405795323	2014-07-19 14:42:03.224281	2014-07-19 14:42:03.229183	\N	94	79
1329	user_1405795413	2014-07-19 14:43:33.723025	2014-07-19 14:43:33.72823	\N	94	79
1330	user_1405795423	2014-07-19 14:43:43.363854	2014-07-19 14:43:43.367621	\N	94	79
1331	user_1405795442	2014-07-19 14:44:02.749337	2014-07-19 14:44:02.753289	\N	94	79
1332	user_1405795509	2014-07-19 14:45:09.289353	2014-07-19 14:45:09.294882	\N	94	79
1333	user_1405795660	2014-07-19 14:47:40.509372	2014-07-19 14:47:40.514305	\N	94	79
1334	user_1405795674	2014-07-19 14:47:54.228613	2014-07-19 14:47:54.233372	\N	94	79
1335	user_1405795687	2014-07-19 14:48:07.019054	2014-07-19 14:48:07.022773	\N	94	79
1336	user_1405795936	2014-07-19 14:52:16.106337	2014-07-19 14:52:16.111243	\N	94	79
1337	user_1405795967	2014-07-19 14:52:47.99441	2014-07-19 14:52:47.997453	\N	94	79
1338	user_1405796323	2014-07-19 14:58:43.54941	2014-07-19 14:58:43.552665	\N	94	79
1339	user_1405796513	2014-07-19 15:01:53.683685	2014-07-19 15:01:53.688443	\N	94	79
1340	user_1405796514	2014-07-19 15:01:54.700103	2014-07-19 15:01:54.703126	\N	94	79
1341	user_1405796572	2014-07-19 15:02:52.661736	2014-07-19 15:02:52.666959	\N	94	79
1342	user_1405796573	2014-07-19 15:02:53.771129	2014-07-19 15:02:53.775143	\N	94	79
1343	user_1405796594	2014-07-19 15:03:14.966302	2014-07-19 15:03:14.968939	\N	94	79
1344	user_1405796595	2014-07-19 15:03:15.783075	2014-07-19 15:03:15.78711	\N	94	79
1345	user_1405797080	2014-07-19 15:11:20.101482	2014-07-19 15:11:20.106593	\N	94	79
1346	user_1405797080	2014-07-19 15:11:20.971167	2014-07-19 15:11:20.974073	\N	94	79
1347	user_1405797140	2014-07-19 15:12:20.803364	2014-07-19 15:12:20.807765	\N	94	79
1348	user_1405797141	2014-07-19 15:12:21.697118	2014-07-19 15:12:21.70004	\N	94	79
1349	user_1405797278	2014-07-19 15:14:38.003259	2014-07-19 15:14:38.007968	\N	94	79
1350	user_1405797279	2014-07-19 15:14:39.027385	2014-07-19 15:14:39.032062	\N	94	79
1351	user_1405797327	2014-07-19 15:15:27.390935	2014-07-19 15:15:27.393921	\N	94	79
1352	user_1405797328	2014-07-19 15:15:28.093303	2014-07-19 15:15:28.095912	\N	94	79
1353	user_1405797362	2014-07-19 15:16:02.329166	2014-07-19 15:16:02.332183	\N	94	79
1354	user_1405797363	2014-07-19 15:16:03.249876	2014-07-19 15:16:03.254186	\N	94	79
1355	user_1405797407	2014-07-19 15:16:47.430003	2014-07-19 15:16:47.433347	\N	94	79
1356	user_1405797408	2014-07-19 15:16:48.34962	2014-07-19 15:16:48.353527	\N	94	79
1357	user_1405797433	2014-07-19 15:17:13.68696	2014-07-19 15:17:13.69027	\N	94	79
1358	user_1405797434	2014-07-19 15:17:14.566892	2014-07-19 15:17:14.571394	\N	94	79
1359	user_1405797477	2014-07-19 15:17:57.770735	2014-07-19 15:17:57.774792	\N	94	79
1360	user_1405797478	2014-07-19 15:17:58.690525	2014-07-19 15:17:58.695355	\N	94	79
1361	user_1405797502	2014-07-19 15:18:22.602605	2014-07-19 15:18:22.605987	\N	94	79
1362	user_1405797503	2014-07-19 15:18:23.383308	2014-07-19 15:18:23.387033	\N	94	79
1363	user_1405797655	2014-07-19 15:20:55.282705	2014-07-19 15:20:55.287527	\N	94	79
1364	user_1405797656	2014-07-19 15:20:56.000452	2014-07-19 15:20:56.004818	\N	94	79
1365	user_1405797664	2014-07-19 15:21:04.613874	2014-07-19 15:21:04.616651	\N	94	79
1366	user_1405797665	2014-07-19 15:21:05.913656	2014-07-19 15:21:05.91793	\N	94	79
1367	user_1405797707	2014-07-19 15:21:47.310948	2014-07-19 15:21:47.314279	\N	94	79
1368	user_1405797708	2014-07-19 15:21:48.358133	2014-07-19 15:21:48.364186	\N	94	79
1369	user_1405797727	2014-07-19 15:22:07.419437	2014-07-19 15:22:07.423907	\N	94	79
1370	user_1405797728	2014-07-19 15:22:08.487178	2014-07-19 15:22:08.491897	\N	94	79
1371	user_1405797838	2014-07-19 15:23:58.510917	2014-07-19 15:23:58.516674	\N	94	79
1372	user_1405797839	2014-07-19 15:23:59.102633	2014-07-19 15:23:59.10604	\N	94	79
1373	user_1405797926	2014-07-19 15:25:26.768824	2014-07-19 15:25:26.77229	\N	94	79
1374	user_1405797927	2014-07-19 15:25:27.546852	2014-07-19 15:25:27.550545	\N	94	79
1375	user_1405797969	2014-07-19 15:26:09.232203	2014-07-19 15:26:09.237787	\N	94	79
1376	user_1405797970	2014-07-19 15:26:10.1938	2014-07-19 15:26:10.196544	\N	94	79
1377	user_1405798079	2014-07-19 15:27:59.940197	2014-07-19 15:27:59.945606	\N	94	79
1378	user_1405798080	2014-07-19 15:28:00.767985	2014-07-19 15:28:00.773033	\N	94	79
1379	user_1405798413	2014-07-19 15:33:33.921061	2014-07-19 15:33:33.925731	\N	94	79
1380	user_1405798414	2014-07-19 15:33:34.626127	2014-07-19 15:33:34.63078	\N	94	79
1381	user_1405798478	2014-07-19 15:34:38.89143	2014-07-19 15:34:38.896603	\N	94	79
1382	user_1405798479	2014-07-19 15:34:39.787109	2014-07-19 15:34:39.792107	\N	94	79
1383	user_1405798527	2014-07-19 15:35:27.812787	2014-07-19 15:35:27.815955	\N	94	79
1384	user_1405798528	2014-07-19 15:35:28.49576	2014-07-19 15:35:28.502187	\N	94	79
1385	user_1405798542	2014-07-19 15:35:42.576089	2014-07-19 15:35:42.581169	\N	94	79
1386	user_1405798543	2014-07-19 15:35:43.22077	2014-07-19 15:35:43.225021	\N	94	79
1387	user_1405798765	2014-07-19 15:39:25.099783	2014-07-19 15:39:25.104545	\N	94	79
1388	user_1405798765	2014-07-19 15:39:25.937663	2014-07-19 15:39:25.941365	\N	94	79
1389	user_1405798876	2014-07-19 15:41:16.638232	2014-07-19 15:41:16.641786	\N	94	79
1390	user_1405798877	2014-07-19 15:41:17.387531	2014-07-19 15:41:17.391711	\N	94	79
1391	user_1405798910	2014-07-19 15:41:50.591625	2014-07-19 15:41:50.595366	\N	94	79
1392	user_1405798911	2014-07-19 15:41:51.592584	2014-07-19 15:41:51.59692	\N	94	79
1393	user_1405798949	2014-07-19 15:42:29.975594	2014-07-19 15:42:29.978454	\N	94	79
1394	user_1405798950	2014-07-19 15:42:30.209391	2014-07-19 15:42:30.213033	\N	94	79
1395	user_1405799021	2014-07-19 15:43:40.971996	2014-07-19 15:43:41.097044	\N	94	79
1396	user_1405799021	2014-07-19 15:43:41.639107	2014-07-19 15:43:41.643795	\N	94	79
1397	user_1405799055	2014-07-19 15:44:15.19799	2014-07-19 15:44:15.201663	\N	94	79
1398	user_1405799056	2014-07-19 15:44:16.728692	2014-07-19 15:44:16.733404	\N	94	79
1399	user_1405799159	2014-07-19 15:45:59.323946	2014-07-19 15:45:59.330146	\N	94	79
1400	user_1405799160	2014-07-19 15:46:00.535609	2014-07-19 15:46:00.539688	\N	94	79
1401	user_1405799329	2014-07-19 15:48:49.054589	2014-07-19 15:48:49.059817	\N	94	79
1402	user_1405799330	2014-07-19 15:48:50.417048	2014-07-19 15:48:50.421334	\N	94	79
1403	user_1405799333	2014-07-19 15:48:53.9325	2014-07-19 15:48:53.935154	\N	94	79
1404	user_1405799334	2014-07-19 15:48:54.614202	2014-07-19 15:48:54.617671	\N	94	79
1405	user_1405799361	2014-07-19 15:49:21.889802	2014-07-19 15:49:21.89241	\N	94	79
1406	user_1405799362	2014-07-19 15:49:22.621629	2014-07-19 15:49:22.626175	\N	94	79
1407	user_1405799391	2014-07-19 15:49:51.632796	2014-07-19 15:49:51.635696	\N	94	79
1408	user_1405799392	2014-07-19 15:49:52.392452	2014-07-19 15:49:52.396898	\N	94	79
1409	user_1405799395	2014-07-19 15:49:55.931893	2014-07-19 15:49:55.934451	\N	94	79
1410	user_1405799396	2014-07-19 15:49:56.766465	2014-07-19 15:49:56.770784	\N	94	79
1411	user_1405799404	2014-07-19 15:50:04.990237	2014-07-19 15:50:05.083442	\N	94	79
1612	user_1405807338	2014-07-19 18:02:18.658735	2014-07-19 18:02:18.664354	\N	94	79
1412	user_1405799405	2014-07-19 15:50:05.703865	2014-07-19 15:50:05.70804	\N	94	79
1613	user_1405807339	2014-07-19 18:02:19.655974	2014-07-19 18:02:19.660498	\N	94	79
1614	user_1405807362	2014-07-19 18:02:42.158618	2014-07-19 18:02:42.162711	\N	94	79
1615	user_1405807363	2014-07-19 18:02:43.038824	2014-07-19 18:02:43.04317	\N	94	79
1616	user_1405807382	2014-07-19 18:03:02.606964	2014-07-19 18:03:02.609714	\N	94	79
1617	user_1405807383	2014-07-19 18:03:03.5953	2014-07-19 18:03:03.599163	\N	94	79
1618	user_1405807403	2014-07-19 18:03:23.977608	2014-07-19 18:03:23.981807	\N	94	79
1619	user_1405807501	2014-07-19 18:05:01.849882	2014-07-19 18:05:01.853497	\N	94	79
1620	user_1405807544	2014-07-19 18:05:44.104788	2014-07-19 18:05:44.108305	\N	94	79
1621	user_1405807550	2014-07-19 18:05:50.486294	2014-07-19 18:05:50.490787	\N	94	79
1622	user_1405807722	2014-07-19 18:08:42.203117	2014-07-19 18:08:42.209464	\N	94	79
1623	user_1405807722	2014-07-19 18:08:42.96205	2014-07-19 18:08:42.965097	\N	94	79
1624	user_1405807762	2014-07-19 18:09:22.103682	2014-07-19 18:09:22.106393	\N	94	79
1625	user_1405807767	2014-07-19 18:09:27.53844	2014-07-19 18:09:27.542666	\N	94	79
1626	user_1405807813	2014-07-19 18:10:13.686594	2014-07-19 18:10:13.69173	\N	94	79
1627	user_1405807814	2014-07-19 18:10:14.49725	2014-07-19 18:10:14.499767	\N	94	79
1628	user_1405807856	2014-07-19 18:10:56.199514	2014-07-19 18:10:56.205507	\N	94	79
1629	user_1405807856	2014-07-19 18:10:56.952527	2014-07-19 18:10:56.957634	\N	94	79
1630	user_1405807871	2014-07-19 18:11:11.718237	2014-07-19 18:11:11.721181	\N	94	79
1631	user_1405807872	2014-07-19 18:11:12.316179	2014-07-19 18:11:12.321332	\N	94	79
1632	user_1405807912	2014-07-19 18:11:52.108206	2014-07-19 18:11:52.11147	\N	94	79
1633	user_1405807912	2014-07-19 18:11:52.728955	2014-07-19 18:11:52.734471	\N	94	79
1634	user_1405807946	2014-07-19 18:12:26.043874	2014-07-19 18:12:26.048006	\N	94	79
1635	user_1405807946	2014-07-19 18:12:26.763808	2014-07-19 18:12:26.768023	\N	94	79
1636	user_1405807970	2014-07-19 18:12:50.148431	2014-07-19 18:12:50.153356	\N	94	79
1637	user_1405807970	2014-07-19 18:12:50.850845	2014-07-19 18:12:50.855182	\N	94	79
1638	user_1405808005	2014-07-19 18:13:25.69346	2014-07-19 18:13:25.696411	\N	94	79
1639	user_1405808006	2014-07-19 18:13:26.52389	2014-07-19 18:13:26.527735	\N	94	79
1640	user_1405808078	2014-07-19 18:14:38.442334	2014-07-19 18:14:38.446807	\N	94	79
1641	user_1405808079	2014-07-19 18:14:39.217525	2014-07-19 18:14:39.222049	\N	94	79
1642	user_1405808093	2014-07-19 18:14:53.945642	2014-07-19 18:14:53.950362	\N	94	79
1643	user_1405808094	2014-07-19 18:14:54.564084	2014-07-19 18:14:54.568526	\N	94	79
1644	user_1405808095	2014-07-19 18:14:55.653542	2014-07-19 18:14:55.657661	\N	94	79
1645	user_1405808112	2014-07-19 18:15:12.422699	2014-07-19 18:15:12.425517	\N	94	79
1646	user_1405808138	2014-07-19 18:15:38.792546	2014-07-19 18:15:38.796344	\N	94	79
1647	user_1405808139	2014-07-19 18:15:39.410209	2014-07-19 18:15:39.414416	\N	94	79
1648	user_1405808223	2014-07-19 18:17:03.908461	2014-07-19 18:17:03.912168	\N	94	79
1649	user_1405808225	2014-07-19 18:17:05.73399	2014-07-19 18:17:05.73827	\N	94	79
1650	user_1405808254	2014-07-19 18:17:34.643458	2014-07-19 18:17:34.646258	\N	94	79
1651	user_1405808318	2014-07-19 18:18:38.462667	2014-07-19 18:18:38.466113	\N	94	79
1652	user_1405808321	2014-07-19 18:18:41.065107	2014-07-19 18:18:41.069445	\N	94	79
1653	user_1405808362	2014-07-19 18:19:22.761708	2014-07-19 18:19:22.766151	\N	94	79
1654	user_1405808363	2014-07-19 18:19:23.373948	2014-07-19 18:19:23.378566	\N	94	79
1655	user_1405808528	2014-07-19 18:22:08.46472	2014-07-19 18:22:08.467467	\N	94	79
1656	user_1405808529	2014-07-19 18:22:09.77607	2014-07-19 18:22:09.781009	\N	94	79
1657	user_1405808536	2014-07-19 18:22:16.384326	2014-07-19 18:22:16.388594	\N	94	79
1658	user_1405808563	2014-07-19 18:22:43.555458	2014-07-19 18:22:43.560235	\N	94	79
1659	user_1405808564	2014-07-19 18:22:44.14392	2014-07-19 18:22:44.149308	\N	94	79
1660	user_1405808572	2014-07-19 18:22:52.207509	2014-07-19 18:22:52.21221	\N	94	79
1661	user_1405808573	2014-07-19 18:22:53.084279	2014-07-19 18:22:53.088381	\N	94	79
1662	user_1405808827	2014-07-19 18:27:07.127084	2014-07-19 18:27:07.131961	\N	94	79
1663	user_1405808844	2014-07-19 18:27:24.936423	2014-07-19 18:27:24.939234	\N	94	79
1664	user_1405809134	2014-07-19 18:32:14.708615	2014-07-19 18:32:14.713793	\N	94	79
1665	user_1405809145	2014-07-19 18:32:25.947118	2014-07-19 18:32:25.950217	\N	94	79
1666	user_1405809226	2014-07-19 18:33:46.072045	2014-07-19 18:33:46.077021	\N	94	79
1667	user_1405809230	2014-07-19 18:33:50.015106	2014-07-19 18:33:50.018543	\N	94	79
1668	user_1405809289	2014-07-19 18:34:49.722818	2014-07-19 18:34:49.725823	\N	94	79
1669	user_1405809290	2014-07-19 18:34:50.934342	2014-07-19 18:34:50.938503	\N	94	79
1670	user_1405809314	2014-07-19 18:35:14.358074	2014-07-19 18:35:14.360972	\N	94	79
1671	user_1405809315	2014-07-19 18:35:15.387105	2014-07-19 18:35:15.39107	\N	94	79
1672	user_1405809369	2014-07-19 18:36:09.359546	2014-07-19 18:36:09.364524	\N	94	79
1673	user_1405809370	2014-07-19 18:36:10.039328	2014-07-19 18:36:10.043217	\N	94	79
1674	user_1405809474	2014-07-19 18:37:54.447901	2014-07-19 18:37:54.451512	\N	94	79
1675	user_1405809475	2014-07-19 18:37:55.373579	2014-07-19 18:37:55.376436	\N	94	79
1676	user_1405809507	2014-07-19 18:38:27.624332	2014-07-19 18:38:27.628825	\N	94	79
1677	user_1405809508	2014-07-19 18:38:28.290831	2014-07-19 18:38:28.293419	\N	94	79
1678	user_1405809540	2014-07-19 18:39:00.126103	2014-07-19 18:39:00.129976	\N	94	79
1679	user_1405809540	2014-07-19 18:39:00.79531	2014-07-19 18:39:00.799845	\N	94	79
1680	user_1405809591	2014-07-19 18:39:51.339178	2014-07-19 18:39:51.343688	\N	94	79
1681	user_1405809591	2014-07-19 18:39:51.93655	2014-07-19 18:39:51.940678	\N	94	79
1682	user_1405809618	2014-07-19 18:40:18.306781	2014-07-19 18:40:18.30978	\N	94	79
1683	user_1405809618	2014-07-19 18:40:18.920663	2014-07-19 18:40:18.924614	\N	94	79
1684	user_1405809661	2014-07-19 18:41:01.090586	2014-07-19 18:41:01.094265	\N	94	79
1685	user_1405809662	2014-07-19 18:41:02.576926	2014-07-19 18:41:02.581102	\N	94	79
1686	user_1405809676	2014-07-19 18:41:16.938947	2014-07-19 18:41:16.941873	\N	94	79
1687	user_1405809677	2014-07-19 18:41:17.846333	2014-07-19 18:41:17.849979	\N	94	79
1688	user_1405809696	2014-07-19 18:41:36.490401	2014-07-19 18:41:36.494381	\N	94	79
1689	user_1405809697	2014-07-19 18:41:37.238885	2014-07-19 18:41:37.242452	\N	94	79
1690	user_1405809716	2014-07-19 18:41:56.203627	2014-07-19 18:41:56.206667	\N	94	79
1691	user_1405809717	2014-07-19 18:41:57.367132	2014-07-19 18:41:57.369676	\N	94	79
1692	user_1405809729	2014-07-19 18:42:09.369498	2014-07-19 18:42:09.372114	\N	94	79
1693	user_1405809730	2014-07-19 18:42:10.145561	2014-07-19 18:42:10.14818	\N	94	79
1694	user_1405809746	2014-07-19 18:42:26.598512	2014-07-19 18:42:26.602425	\N	94	79
1695	user_1405809747	2014-07-19 18:42:27.163532	2014-07-19 18:42:27.167498	\N	94	79
1696	user_1405809810	2014-07-19 18:43:30.520377	2014-07-19 18:43:30.525807	\N	94	79
1697	user_1405809812	2014-07-19 18:43:32.043204	2014-07-19 18:43:32.047136	\N	94	79
1698	user_1405809837	2014-07-19 18:43:57.455363	2014-07-19 18:43:57.458532	\N	94	79
1699	user_1405809838	2014-07-19 18:43:58.217608	2014-07-19 18:43:58.222426	\N	94	79
1700	user_1405809855	2014-07-19 18:44:15.027064	2014-07-19 18:44:15.02976	\N	94	79
1701	user_1405809855	2014-07-19 18:44:15.647309	2014-07-19 18:44:15.651661	\N	94	79
1413	user_1405799523	2014-07-19 15:52:03.112356	2014-07-19 15:52:03.117533	\N	94	79
1414	user_1405799523	2014-07-19 15:52:03.699291	2014-07-19 15:52:03.703821	\N	94	79
1415	user_1405799541	2014-07-19 15:52:21.453325	2014-07-19 15:52:21.455987	\N	94	79
1416	user_1405799542	2014-07-19 15:52:22.014672	2014-07-19 15:52:22.019281	\N	94	79
1417	user_1405799617	2014-07-19 15:53:37.23178	2014-07-19 15:53:37.236814	\N	94	79
1418	user_1405799617	2014-07-19 15:53:37.992414	2014-07-19 15:53:37.996913	\N	94	79
1419	user_1405799629	2014-07-19 15:53:49.625843	2014-07-19 15:53:49.62961	\N	94	79
1420	user_1405799630	2014-07-19 15:53:50.310367	2014-07-19 15:53:50.314907	\N	94	79
1421	user_1405799651	2014-07-19 15:54:11.434196	2014-07-19 15:54:11.43719	\N	94	79
1422	user_1405799652	2014-07-19 15:54:12.002843	2014-07-19 15:54:12.007301	\N	94	79
1423	user_1405799751	2014-07-19 15:55:51.010448	2014-07-19 15:55:51.014085	\N	94	79
1424	user_1405799751	2014-07-19 15:55:51.865395	2014-07-19 15:55:51.869336	\N	94	79
1425	user_1405799780	2014-07-19 15:56:20.145837	2014-07-19 15:56:20.150157	\N	94	79
1426	user_1405799780	2014-07-19 15:56:20.912965	2014-07-19 15:56:20.917083	\N	94	79
1427	user_1405799858	2014-07-19 15:57:38.514535	2014-07-19 15:57:38.520264	\N	94	79
1428	user_1405799884	2014-07-19 15:58:04.293152	2014-07-19 15:58:04.297619	\N	94	79
1429	user_1405799885	2014-07-19 15:58:05.090368	2014-07-19 15:58:05.095077	\N	94	79
1430	user_1405800080	2014-07-19 16:01:20.787227	2014-07-19 16:01:20.7917	\N	94	79
1431	user_1405800081	2014-07-19 16:01:21.522279	2014-07-19 16:01:21.526772	\N	94	79
1432	user_1405800101	2014-07-19 16:01:41.266595	2014-07-19 16:01:41.26942	\N	94	79
1433	user_1405800102	2014-07-19 16:01:42.118187	2014-07-19 16:01:42.122178	\N	94	79
1434	user_1405800110	2014-07-19 16:01:50.004572	2014-07-19 16:01:50.007315	\N	94	79
1435	user_1405800110	2014-07-19 16:01:50.713125	2014-07-19 16:01:50.716661	\N	94	79
1436	user_1405800132	2014-07-19 16:02:12.174123	2014-07-19 16:02:12.178143	\N	94	79
1437	user_1405800286	2014-07-19 16:04:46.141083	2014-07-19 16:04:46.146496	\N	94	79
1438	user_1405800286	2014-07-19 16:04:46.759593	2014-07-19 16:04:46.844097	\N	94	79
1439	user_1405800372	2014-07-19 16:06:12.26925	2014-07-19 16:06:12.274763	\N	94	79
1440	user_1405800373	2014-07-19 16:06:13.773146	2014-07-19 16:06:13.777557	\N	94	79
1441	user_1405800402	2014-07-19 16:06:42.5314	2014-07-19 16:06:42.534894	\N	94	79
1442	user_1405800403	2014-07-19 16:06:43.274012	2014-07-19 16:06:43.368364	\N	94	79
1443	user_1405800417	2014-07-19 16:06:57.652609	2014-07-19 16:06:57.656839	\N	94	79
1444	user_1405800418	2014-07-19 16:06:58.678407	2014-07-19 16:06:58.681554	\N	94	79
1445	user_1405800426	2014-07-19 16:07:06.58986	2014-07-19 16:07:06.592729	\N	94	79
1446	user_1405800427	2014-07-19 16:07:07.250575	2014-07-19 16:07:07.253284	\N	94	79
1447	user_1405800428	2014-07-19 16:07:08.159139	2014-07-19 16:07:08.163553	\N	94	79
1448	user_1405800447	2014-07-19 16:07:27.077972	2014-07-19 16:07:27.081568	\N	94	79
1449	user_1405800447	2014-07-19 16:07:27.827637	2014-07-19 16:07:27.830288	\N	94	79
1450	user_1405800520	2014-07-19 16:08:40.515624	2014-07-19 16:08:40.518955	\N	94	79
1451	user_1405800521	2014-07-19 16:08:41.387559	2014-07-19 16:08:41.3918	\N	94	79
1452	user_1405800543	2014-07-19 16:09:03.946303	2014-07-19 16:09:03.95103	\N	94	79
1453	user_1405800560	2014-07-19 16:09:20.445423	2014-07-19 16:09:20.44806	\N	94	79
1454	user_1405800561	2014-07-19 16:09:21.186583	2014-07-19 16:09:21.191368	\N	94	79
1455	user_1405800572	2014-07-19 16:09:32.392368	2014-07-19 16:09:32.394944	\N	94	79
1456	user_1405800602	2014-07-19 16:10:02.633239	2014-07-19 16:10:02.63775	\N	94	79
1457	user_1405800603	2014-07-19 16:10:03.295987	2014-07-19 16:10:03.300877	\N	94	79
1458	user_1405800620	2014-07-19 16:10:20.742966	2014-07-19 16:10:20.745967	\N	94	79
1459	user_1405800621	2014-07-19 16:10:21.47073	2014-07-19 16:10:21.475945	\N	94	79
1460	user_1405800634	2014-07-19 16:10:34.091016	2014-07-19 16:10:34.094218	\N	94	79
1461	user_1405800718	2014-07-19 16:11:58.208653	2014-07-19 16:11:58.21251	\N	94	79
1462	user_1405800719	2014-07-19 16:11:59.243155	2014-07-19 16:11:59.246223	\N	94	79
1463	user_1405800721	2014-07-19 16:12:01.193225	2014-07-19 16:12:01.197654	\N	94	79
1464	user_1405800732	2014-07-19 16:12:12.539503	2014-07-19 16:12:12.543762	\N	94	79
1465	user_1405800810	2014-07-19 16:13:30.84728	2014-07-19 16:13:30.851829	\N	94	79
1466	user_1405800989	2014-07-19 16:16:29.043055	2014-07-19 16:16:29.047572	\N	94	79
1467	user_1405800989	2014-07-19 16:16:29.617837	2014-07-19 16:16:29.620416	\N	94	79
1468	user_1405801021	2014-07-19 16:17:01.593901	2014-07-19 16:17:01.59916	\N	94	79
1469	user_1405801022	2014-07-19 16:17:02.233381	2014-07-19 16:17:02.237888	\N	94	79
1470	user_1405801087	2014-07-19 16:18:07.848962	2014-07-19 16:18:07.855217	\N	94	79
1471	user_1405801088	2014-07-19 16:18:08.700387	2014-07-19 16:18:08.791627	\N	94	79
1472	user_1405801089	2014-07-19 16:18:09.684002	2014-07-19 16:18:09.686981	\N	94	79
1473	user_1405801110	2014-07-19 16:18:30.245084	2014-07-19 16:18:30.247792	\N	94	79
1474	user_1405801111	2014-07-19 16:18:31.152016	2014-07-19 16:18:31.155049	\N	94	79
1475	user_1405801129	2014-07-19 16:18:49.200318	2014-07-19 16:18:49.319618	\N	94	79
1476	user_1405801159	2014-07-19 16:19:19.104165	2014-07-19 16:19:19.108529	\N	94	79
1477	user_1405801159	2014-07-19 16:19:19.629903	2014-07-19 16:19:19.634513	\N	94	79
1478	user_1405801182	2014-07-19 16:19:42.383511	2014-07-19 16:19:42.387983	\N	94	79
1479	user_1405801182	2014-07-19 16:19:42.990905	2014-07-19 16:19:42.993527	\N	94	79
1480	user_1405801191	2014-07-19 16:19:51.189704	2014-07-19 16:19:51.1928	\N	94	79
1481	user_1405801192	2014-07-19 16:19:52.007837	2014-07-19 16:19:52.012333	\N	94	79
1482	user_1405801199	2014-07-19 16:19:59.342601	2014-07-19 16:19:59.347114	\N	94	79
1483	user_1405801209	2014-07-19 16:20:09.171555	2014-07-19 16:20:09.176157	\N	94	79
1484	user_1405801210	2014-07-19 16:20:10.000285	2014-07-19 16:20:10.004721	\N	94	79
1485	user_1405801210	2014-07-19 16:20:10.667136	2014-07-19 16:20:10.670134	\N	94	79
1486	user_1405801232	2014-07-19 16:20:32.557836	2014-07-19 16:20:32.561645	\N	94	79
1487	user_1405801263	2014-07-19 16:21:03.27743	2014-07-19 16:21:03.280977	\N	94	79
1488	user_1405801263	2014-07-19 16:21:03.932279	2014-07-19 16:21:03.936564	\N	94	79
1489	user_1405801299	2014-07-19 16:21:39.628627	2014-07-19 16:21:39.631629	\N	94	79
1490	user_1405801300	2014-07-19 16:21:40.236289	2014-07-19 16:21:40.239345	\N	94	79
1491	user_1405801315	2014-07-19 16:21:55.12008	2014-07-19 16:21:55.124502	\N	94	79
1492	user_1405801315	2014-07-19 16:21:55.852949	2014-07-19 16:21:55.856999	\N	94	79
1493	user_1405801323	2014-07-19 16:22:03.373868	2014-07-19 16:22:03.376629	\N	94	79
1494	user_1405801410	2014-07-19 16:23:30.369172	2014-07-19 16:23:30.374489	\N	94	79
1495	user_1405801411	2014-07-19 16:23:31.036011	2014-07-19 16:23:31.038766	\N	94	79
1496	user_1405801422	2014-07-19 16:23:42.120234	2014-07-19 16:23:42.123415	\N	94	79
1497	user_1405801432	2014-07-19 16:23:52.79103	2014-07-19 16:23:52.794706	\N	94	79
1498	user_1405801440	2014-07-19 16:24:00.282121	2014-07-19 16:24:00.284915	\N	94	79
1499	user_1405801457	2014-07-19 16:24:17.6014	2014-07-19 16:24:17.605868	\N	94	79
1500	user_1405801458	2014-07-19 16:24:18.588783	2014-07-19 16:24:18.593723	\N	94	79
1501	user_1405801470	2014-07-19 16:24:30.472748	2014-07-19 16:24:30.47558	\N	94	79
1502	user_1405801482	2014-07-19 16:24:42.968449	2014-07-19 16:24:42.97304	\N	94	79
1503	user_1405801497	2014-07-19 16:24:57.624838	2014-07-19 16:24:57.627575	\N	94	79
1504	user_1405801516	2014-07-19 16:25:16.790551	2014-07-19 16:25:16.793123	\N	94	79
1505	user_1405801529	2014-07-19 16:25:29.445396	2014-07-19 16:25:29.449779	\N	94	79
1702	user_1405809864	2014-07-19 18:44:24.596197	2014-07-19 18:44:24.60085	\N	94	79
1506	user_1405801532	2014-07-19 16:25:32.655283	2014-07-19 16:25:32.659781	\N	94	79
1507	user_1405801533	2014-07-19 16:25:33.311897	2014-07-19 16:25:33.316084	\N	94	79
1703	user_1405809865	2014-07-19 18:44:25.551395	2014-07-19 18:44:25.556676	\N	94	79
1704	user_1405809882	2014-07-19 18:44:42.213389	2014-07-19 18:44:42.21888	\N	94	79
1705	user_1405809882	2014-07-19 18:44:42.705681	2014-07-19 18:44:42.71039	\N	94	79
1706	user_1405809933	2014-07-19 18:45:33.674391	2014-07-19 18:45:33.676992	\N	94	79
1707	user_1405809934	2014-07-19 18:45:34.42315	2014-07-19 18:45:34.427948	\N	94	79
1708	user_1405809939	2014-07-19 18:45:39.857063	2014-07-19 18:45:39.861439	\N	94	79
1709	user_1405809940	2014-07-19 18:45:40.546984	2014-07-19 18:45:40.55048	\N	94	79
1710	user_1405809958	2014-07-19 18:45:58.465297	2014-07-19 18:45:58.468089	\N	94	79
1711	user_1405809985	2014-07-19 18:46:25.507465	2014-07-19 18:46:25.510531	\N	94	79
1712	user_1405809986	2014-07-19 18:46:26.214057	2014-07-19 18:46:26.218686	\N	94	79
1713	user_1405809997	2014-07-19 18:46:37.82498	2014-07-19 18:46:37.827696	\N	94	79
1714	user_1405809998	2014-07-19 18:46:38.527536	2014-07-19 18:46:38.531118	\N	94	79
1715	user_1405810013	2014-07-19 18:46:53.310328	2014-07-19 18:46:53.313681	\N	94	79
1716	user_1405810013	2014-07-19 18:46:53.908165	2014-07-19 18:46:53.911649	\N	94	79
1741	user_1405811023	2014-07-19 19:03:43.985729	2014-07-19 19:03:43.988931	\N	94	79
1742	user_1405811024	2014-07-19 19:03:44.753336	2014-07-19 19:03:44.758228	\N	94	79
1743	user_1405811079	2014-07-19 19:04:39.755311	2014-07-19 19:04:39.759258	\N	94	79
1744	user_1405811080	2014-07-19 19:04:40.355233	2014-07-19 19:04:40.359063	\N	94	79
1745	user_1405811199	2014-07-19 19:06:39.568127	2014-07-19 19:06:39.572955	\N	94	79
1746	user_1405811200	2014-07-19 19:06:40.231689	2014-07-19 19:06:40.236191	\N	94	79
1747	user_1405811483	2014-07-19 19:11:23.785044	2014-07-19 19:11:23.789868	\N	94	79
1748	user_1405811484	2014-07-19 19:11:24.543243	2014-07-19 19:11:24.54786	\N	94	79
1749	user_1405811668	2014-07-19 19:14:28.587497	2014-07-19 19:14:28.593839	\N	94	79
1750	user_1405811669	2014-07-19 19:14:29.419523	2014-07-19 19:14:29.423907	\N	94	79
1751	user_1405812070	2014-07-19 19:21:10.229578	2014-07-19 19:21:10.235158	\N	94	79
1752	user_1405812071	2014-07-19 19:21:11.205362	2014-07-19 19:21:11.209861	\N	94	79
1753	user_1405812098	2014-07-19 19:21:38.580085	2014-07-19 19:21:38.582837	\N	94	79
1754	user_1405812099	2014-07-19 19:21:39.230794	2014-07-19 19:21:39.235026	\N	94	79
1755	user_1405812123	2014-07-19 19:22:03.200973	2014-07-19 19:22:03.204627	\N	94	79
1756	user_1405812123	2014-07-19 19:22:03.9517	2014-07-19 19:22:03.956609	\N	94	79
1757	user_1405812340	2014-07-19 19:25:40.586137	2014-07-19 19:25:40.591464	\N	94	79
1758	user_1405812341	2014-07-19 19:25:41.618325	2014-07-19 19:25:41.623724	\N	94	79
1759	user_1405812379	2014-07-19 19:26:19.703444	2014-07-19 19:26:19.706198	\N	94	79
1760	user_1405812381	2014-07-19 19:26:21.114983	2014-07-19 19:26:21.119182	\N	94	79
1761	user_1405812445	2014-07-19 19:27:25.135363	2014-07-19 19:27:25.140579	\N	94	79
1762	user_1405812446	2014-07-19 19:27:26.578031	2014-07-19 19:27:26.582419	\N	94	79
1763	user_1405812454	2014-07-19 19:27:34.402967	2014-07-19 19:27:34.407637	\N	94	79
1764	user_1405812455	2014-07-19 19:27:35.339262	2014-07-19 19:27:35.344096	\N	94	79
1765	user_1405814069	2014-07-19 19:54:29.722403	2014-07-19 19:54:29.727403	\N	94	79
1766	user_1405814073	2014-07-19 19:54:33.023217	2014-07-19 19:54:33.026854	\N	94	79
1767	user_1405814174	2014-07-19 19:56:14.947586	2014-07-19 19:56:14.953731	\N	94	79
1768	user_1405814180	2014-07-19 19:56:20.186982	2014-07-19 19:56:20.191512	\N	94	79
1769	user_1405814288	2014-07-19 19:58:08.926898	2014-07-19 19:58:08.931857	\N	94	79
1770	user_1405814289	2014-07-19 19:58:09.740995	2014-07-19 19:58:09.743594	\N	94	79
1771	user_1405814290	2014-07-19 19:58:10.567571	2014-07-19 19:58:10.572188	\N	94	79
1772	user_1405814507	2014-07-19 20:01:47.459403	2014-07-19 20:01:47.464535	\N	94	79
1773	user_1405814864	2014-07-19 20:07:44.346019	2014-07-19 20:07:44.351192	\N	94	79
1774	user_1405814877	2014-07-19 20:07:57.830382	2014-07-19 20:07:57.833376	\N	94	79
1775	user_1405814893	2014-07-19 20:08:13.439931	2014-07-19 20:08:13.442462	\N	94	79
1776	user_1405814920	2014-07-19 20:08:40.926423	2014-07-19 20:08:40.931068	\N	94	79
1777	user_1405814922	2014-07-19 20:08:42.482427	2014-07-19 20:08:42.488123	\N	94	79
1778	user_1405815011	2014-07-19 20:10:11.744864	2014-07-19 20:10:11.751501	\N	94	79
1779	user_1405815013	2014-07-19 20:10:13.862455	2014-07-19 20:10:13.867018	\N	94	79
1780	user_1405815038	2014-07-19 20:10:38.669416	2014-07-19 20:10:38.672095	\N	94	79
1781	user_1405815039	2014-07-19 20:10:39.554273	2014-07-19 20:10:39.558855	\N	94	79
1782	user_1405815076	2014-07-19 20:11:16.394492	2014-07-19 20:11:16.399279	\N	94	79
1783	user_1405815076	2014-07-19 20:11:16.884185	2014-07-19 20:11:16.888591	\N	94	79
1784	user_1405815319	2014-07-19 20:15:19.532762	2014-07-19 20:15:19.537477	\N	94	79
1785	user_1405815328	2014-07-19 20:15:28.701384	2014-07-19 20:15:28.704113	\N	94	79
1786	user_1405815335	2014-07-19 20:15:35.115762	2014-07-19 20:15:35.120437	\N	94	79
1787	user_1405815340	2014-07-19 20:15:40.967093	2014-07-19 20:15:40.971197	\N	94	79
1788	user_1405815850	2014-07-19 20:24:10.361094	2014-07-19 20:24:10.366368	\N	94	79
1789	user_1405815851	2014-07-19 20:24:11.717921	2014-07-19 20:24:11.72285	\N	94	79
1790	user_1405815961	2014-07-19 20:26:01.127197	2014-07-19 20:26:01.131333	\N	94	79
1791	user_1405815962	2014-07-19 20:26:02.006527	2014-07-19 20:26:02.011262	\N	94	79
1792	user_1405815986	2014-07-19 20:26:26.684597	2014-07-19 20:26:26.689053	\N	94	79
1793	user_1405815987	2014-07-19 20:26:27.93927	2014-07-19 20:26:27.943462	\N	94	79
1794	user_1405816079	2014-07-19 20:27:59.208628	2014-07-19 20:27:59.212075	\N	94	79
1795	user_1405816081	2014-07-19 20:28:01.095531	2014-07-19 20:28:01.100044	\N	94	79
1796	user_1405816184	2014-07-19 20:29:44.934466	2014-07-19 20:29:44.939887	\N	94	79
1797	user_1405816187	2014-07-19 20:29:47.018641	2014-07-19 20:29:47.023352	\N	94	79
1798	user_1405816398	2014-07-19 20:33:18.512791	2014-07-19 20:33:18.643785	\N	94	79
1799	user_1405816399	2014-07-19 20:33:19.951278	2014-07-19 20:33:19.956288	\N	94	79
1800	user_1405816446	2014-07-19 20:34:06.946869	2014-07-19 20:34:06.951179	\N	94	79
1801	user_1405816462	2014-07-19 20:34:22.18452	2014-07-19 20:34:22.276502	\N	94	79
1802	user_1405816471	2014-07-19 20:34:31.872377	2014-07-19 20:34:31.875384	\N	94	79
1803	user_1405816741	2014-07-19 20:39:01.502954	2014-07-19 20:39:01.507669	\N	94	79
1804	user_1405816843	2014-07-19 20:40:43.898856	2014-07-19 20:40:43.902005	\N	94	79
1805	user_1405816844	2014-07-19 20:40:44.833247	2014-07-19 20:40:44.838336	\N	94	79
1806	user_1405816858	2014-07-19 20:40:58.251917	2014-07-19 20:40:58.254913	\N	94	79
1807	user_1405816859	2014-07-19 20:40:59.025412	2014-07-19 20:40:59.029689	\N	94	79
1808	user_1405816933	2014-07-19 20:42:13.148459	2014-07-19 20:42:13.153126	\N	94	79
1809	user_1405816934	2014-07-19 20:42:14.439811	2014-07-19 20:42:14.444867	\N	94	79
1810	user_1405816977	2014-07-19 20:42:56.9988	2014-07-19 20:42:57.00225	\N	94	79
1811	user_1405816977	2014-07-19 20:42:57.929903	2014-07-19 20:42:57.9342	\N	94	79
1812	user_1405817029	2014-07-19 20:43:49.906472	2014-07-19 20:43:49.911518	\N	94	79
1813	user_1405817030	2014-07-19 20:43:50.844106	2014-07-19 20:43:50.848845	\N	94	79
1814	user_1405817044	2014-07-19 20:44:04.147677	2014-07-19 20:44:04.150669	\N	94	79
1508	user_1405801574	2014-07-19 16:26:14.436443	2014-07-19 16:26:14.441736	\N	94	79
1509	user_1405801575	2014-07-19 16:26:15.443708	2014-07-19 16:26:15.449156	\N	94	79
1717	user_1405810157	2014-07-19 18:49:17.922109	2014-07-19 18:49:17.927776	\N	94	79
1510	user_1405801652	2014-07-19 16:27:32.411985	2014-07-19 16:27:32.416911	\N	94	79
1511	user_1405801653	2014-07-19 16:27:33.339858	2014-07-19 16:27:33.344333	\N	94	79
1718	user_1405810159	2014-07-19 18:49:19.414504	2014-07-19 18:49:19.419166	\N	94	79
1512	user_1405801663	2014-07-19 16:27:43.813645	2014-07-19 16:27:43.818527	\N	94	79
1513	user_1405801664	2014-07-19 16:27:44.528364	2014-07-19 16:27:44.532747	\N	94	79
1514	user_1405801689	2014-07-19 16:28:09.097188	2014-07-19 16:28:09.102309	\N	94	79
1515	user_1405801719	2014-07-19 16:28:39.720201	2014-07-19 16:28:39.724249	\N	94	79
1516	user_1405801721	2014-07-19 16:28:41.261107	2014-07-19 16:28:41.265217	\N	94	79
1517	user_1405801742	2014-07-19 16:29:02.07232	2014-07-19 16:29:02.077164	\N	94	79
1518	user_1405801742	2014-07-19 16:29:02.714276	2014-07-19 16:29:02.718259	\N	94	79
1519	user_1405801857	2014-07-19 16:30:57.45245	2014-07-19 16:30:57.457643	\N	94	79
1520	user_1405801858	2014-07-19 16:30:58.367832	2014-07-19 16:30:58.372466	\N	94	79
1521	user_1405801908	2014-07-19 16:31:48.166275	2014-07-19 16:31:48.169671	\N	94	79
1522	user_1405801908	2014-07-19 16:31:48.994954	2014-07-19 16:31:48.998601	\N	94	79
1523	user_1405802763	2014-07-19 16:46:03.409654	2014-07-19 16:46:03.414542	\N	94	79
1524	user_1405802841	2014-07-19 16:47:21.747626	2014-07-19 16:47:21.75208	\N	94	79
1525	user_1405802843	2014-07-19 16:47:23.263991	2014-07-19 16:47:23.268384	\N	94	79
1526	user_1405802880	2014-07-19 16:48:00.650376	2014-07-19 16:48:00.653637	\N	94	79
1527	user_1405802970	2014-07-19 16:49:30.295801	2014-07-19 16:49:30.298967	\N	94	79
1528	user_1405803046	2014-07-19 16:50:46.522325	2014-07-19 16:50:46.527948	\N	94	79
1529	user_1405803184	2014-07-19 16:53:04.94058	2014-07-19 16:53:04.945648	\N	94	79
1530	user_1405803235	2014-07-19 16:53:55.724508	2014-07-19 16:53:55.730028	\N	94	79
1531	user_1405803236	2014-07-19 16:53:56.608872	2014-07-19 16:53:56.611826	\N	94	79
1532	user_1405803237	2014-07-19 16:53:57.471326	2014-07-19 16:53:57.473815	\N	94	79
1533	user_1405803296	2014-07-19 16:54:56.890068	2014-07-19 16:54:56.895889	\N	94	79
1534	user_1405803297	2014-07-19 16:54:57.745779	2014-07-19 16:54:57.750263	\N	94	79
1535	user_1405803393	2014-07-19 16:56:33.885178	2014-07-19 16:56:33.890123	\N	94	79
1536	user_1405803408	2014-07-19 16:56:48.511592	2014-07-19 16:56:48.515107	\N	94	79
1537	user_1405803416	2014-07-19 16:56:56.792426	2014-07-19 16:56:56.796969	\N	94	79
1538	user_1405803433	2014-07-19 16:57:13.574709	2014-07-19 16:57:13.577286	\N	94	79
1539	user_1405803436	2014-07-19 16:57:16.492398	2014-07-19 16:57:16.495964	\N	94	79
1540	user_1405803456	2014-07-19 16:57:36.975668	2014-07-19 16:57:36.980052	\N	94	79
1541	user_1405803471	2014-07-19 16:57:51.683837	2014-07-19 16:57:51.688924	\N	94	79
1542	user_1405803488	2014-07-19 16:58:08.352728	2014-07-19 16:58:08.357344	\N	94	79
1543	user_1405803495	2014-07-19 16:58:15.625547	2014-07-19 16:58:15.628662	\N	94	79
1544	user_1405803540	2014-07-19 16:59:00.205383	2014-07-19 16:59:00.208633	\N	94	79
1545	user_1405803556	2014-07-19 16:59:16.478299	2014-07-19 16:59:16.481581	\N	94	79
1546	user_1405803681	2014-07-19 17:01:21.993851	2014-07-19 17:01:21.998871	\N	94	79
1547	user_1405803698	2014-07-19 17:01:38.236133	2014-07-19 17:01:38.239994	\N	94	79
1548	user_1405803722	2014-07-19 17:02:02.872814	2014-07-19 17:02:02.876328	\N	94	79
1549	user_1405803744	2014-07-19 17:02:24.315034	2014-07-19 17:02:24.318281	\N	94	79
1550	user_1405803754	2014-07-19 17:02:34.622092	2014-07-19 17:02:34.625246	\N	94	79
1551	user_1405803757	2014-07-19 17:02:37.703358	2014-07-19 17:02:37.707924	\N	94	79
1552	user_1405803812	2014-07-19 17:03:32.565029	2014-07-19 17:03:32.56799	\N	94	79
1553	user_1405803828	2014-07-19 17:03:48.398908	2014-07-19 17:03:48.403881	\N	94	79
1554	user_1405803838	2014-07-19 17:03:58.067631	2014-07-19 17:03:58.071806	\N	94	79
1555	user_1405803856	2014-07-19 17:04:16.22924	2014-07-19 17:04:16.232115	\N	94	79
1556	user_1405803867	2014-07-19 17:04:27.603917	2014-07-19 17:04:27.606519	\N	94	79
1557	user_1405803884	2014-07-19 17:04:44.086988	2014-07-19 17:04:44.092801	\N	94	79
1558	user_1405803897	2014-07-19 17:04:57.767479	2014-07-19 17:04:57.771746	\N	94	79
1559	user_1405803908	2014-07-19 17:05:08.568776	2014-07-19 17:05:08.573089	\N	94	79
1560	user_1405803919	2014-07-19 17:05:19.995229	2014-07-19 17:05:19.998275	\N	94	79
1561	user_1405803928	2014-07-19 17:05:28.469181	2014-07-19 17:05:28.473726	\N	94	79
1562	user_1405803942	2014-07-19 17:05:42.539132	2014-07-19 17:05:42.544483	\N	94	79
1563	user_1405803950	2014-07-19 17:05:50.844388	2014-07-19 17:05:50.847956	\N	94	79
1564	user_1405803957	2014-07-19 17:05:57.014448	2014-07-19 17:05:57.017133	\N	94	79
1565	user_1405803965	2014-07-19 17:06:05.963399	2014-07-19 17:06:05.967582	\N	94	79
1566	user_1405803978	2014-07-19 17:06:18.371512	2014-07-19 17:06:18.37623	\N	94	79
1567	user_1405803994	2014-07-19 17:06:34.101208	2014-07-19 17:06:34.103994	\N	94	79
1568	user_1405804001	2014-07-19 17:06:41.405822	2014-07-19 17:06:41.410277	\N	94	79
1569	user_1405804021	2014-07-19 17:07:01.172576	2014-07-19 17:07:01.17551	\N	94	79
1570	user_1405804044	2014-07-19 17:07:24.511096	2014-07-19 17:07:24.515349	\N	94	79
1571	user_1405804061	2014-07-19 17:07:41.30051	2014-07-19 17:07:41.303206	\N	94	79
1572	user_1405804075	2014-07-19 17:07:55.677085	2014-07-19 17:07:55.681345	\N	94	79
1573	user_1405804081	2014-07-19 17:08:01.349693	2014-07-19 17:08:01.353273	\N	94	79
1574	user_1405804087	2014-07-19 17:08:07.025016	2014-07-19 17:08:07.029357	\N	94	79
1575	user_1405804097	2014-07-19 17:08:17.66891	2014-07-19 17:08:17.673006	\N	94	79
1576	user_1405804106	2014-07-19 17:08:26.196213	2014-07-19 17:08:26.199909	\N	94	79
1577	user_1405804114	2014-07-19 17:08:34.2539	2014-07-19 17:08:34.25817	\N	94	79
1578	user_1405804121	2014-07-19 17:08:41.471207	2014-07-19 17:08:41.475288	\N	94	79
1579	user_1405804128	2014-07-19 17:08:48.711807	2014-07-19 17:08:48.715182	\N	94	79
1580	user_1405804133	2014-07-19 17:08:53.684661	2014-07-19 17:08:53.68756	\N	94	79
1581	user_1405804152	2014-07-19 17:09:12.387796	2014-07-19 17:09:12.3918	\N	94	79
1582	user_1405804171	2014-07-19 17:09:31.769274	2014-07-19 17:09:31.772073	\N	94	79
1583	user_1405804181	2014-07-19 17:09:41.772761	2014-07-19 17:09:41.777751	\N	94	79
1584	user_1405804329	2014-07-19 17:12:09.060237	2014-07-19 17:12:09.064713	\N	94	79
1585	user_1405804331	2014-07-19 17:12:11.482778	2014-07-19 17:12:11.486749	\N	94	79
1586	user_1405804343	2014-07-19 17:12:23.077157	2014-07-19 17:12:23.081412	\N	94	79
1587	user_1405804343	2014-07-19 17:12:23.749621	2014-07-19 17:12:23.753698	\N	94	79
1588	user_1405804963	2014-07-19 17:22:43.618088	2014-07-19 17:22:43.623408	\N	94	79
1589	user_1405804967	2014-07-19 17:22:47.947158	2014-07-19 17:22:47.951293	\N	94	79
1590	user_1405805014	2014-07-19 17:23:34.58076	2014-07-19 17:23:34.583653	\N	94	79
1591	user_1405805015	2014-07-19 17:23:35.092415	2014-07-19 17:23:35.095917	\N	94	79
1592	user_1405805114	2014-07-19 17:25:14.506552	2014-07-19 17:25:14.509573	\N	94	79
1593	user_1405805115	2014-07-19 17:25:15.042223	2014-07-19 17:25:15.046131	\N	94	79
1594	user_1405805141	2014-07-19 17:25:41.386605	2014-07-19 17:25:41.391294	\N	94	79
1595	user_1405805141	2014-07-19 17:25:41.950835	2014-07-19 17:25:41.95549	\N	94	79
1596	user_1405805234	2014-07-19 17:27:14.319461	2014-07-19 17:27:14.324624	\N	94	79
1597	user_1405805242	2014-07-19 17:27:22.046998	2014-07-19 17:27:22.051841	\N	94	79
1815	user_1405817181	2014-07-19 20:46:21.771215	2014-07-19 20:46:21.776613	\N	94	79
2033	user_1405838927	2014-07-20 02:48:47.911703	2014-07-20 02:48:48.036596	\N	94	79
1816	user_1405817182	2014-07-19 20:46:22.874653	2014-07-19 20:46:22.879187	\N	94	79
2572	user_1405997540	2014-07-21 22:52:20.432813	2014-07-21 22:52:20.437335	\N	94	79
1817	user_1405817198	2014-07-19 20:46:38.327375	2014-07-19 20:46:38.330168	\N	94	79
2034	user_1405838945	2014-07-20 02:49:05.66542	2014-07-20 02:49:05.667907	\N	94	79
1818	user_1405817199	2014-07-19 20:46:39.306571	2014-07-19 20:46:39.310479	\N	94	79
1819	user_1405817231	2014-07-19 20:47:11.981358	2014-07-19 20:47:11.984539	\N	94	79
2035	user_1405838992	2014-07-20 02:49:52.745814	2014-07-20 02:49:52.749289	\N	94	79
1820	user_1405817232	2014-07-19 20:47:12.891733	2014-07-19 20:47:12.895792	\N	94	79
1821	user_1405817242	2014-07-19 20:47:22.976383	2014-07-19 20:47:22.979417	\N	94	79
2036	user_1405839021	2014-07-20 02:50:21.812649	2014-07-20 02:50:21.817054	\N	94	79
1822	user_1405817243	2014-07-19 20:47:23.769574	2014-07-19 20:47:23.77393	\N	94	79
1823	user_1405817256	2014-07-19 20:47:36.129946	2014-07-19 20:47:36.133195	\N	94	79
2037	user_1405839034	2014-07-20 02:50:34.154604	2014-07-20 02:50:34.157488	\N	94	79
1824	user_1405817256	2014-07-19 20:47:36.79385	2014-07-19 20:47:36.798176	\N	94	79
1825	user_1405817276	2014-07-19 20:47:56.005759	2014-07-19 20:47:56.009047	\N	94	79
2038	user_1405839083	2014-07-20 02:51:23.030088	2014-07-20 02:51:23.035421	\N	94	79
1826	user_1405817276	2014-07-19 20:47:56.966333	2014-07-19 20:47:56.969769	\N	94	79
2039	user_1405839106	2014-07-20 02:51:46.266995	2014-07-20 02:51:46.270899	\N	94	79
2040	user_1405839107	2014-07-20 02:51:47.011382	2014-07-20 02:51:47.014364	\N	94	79
2041	user_1405839139	2014-07-20 02:52:19.040454	2014-07-20 02:52:19.044626	\N	94	79
2042	user_1405839145	2014-07-20 02:52:25.728214	2014-07-20 02:52:25.731527	\N	94	79
2043	user_1405839172	2014-07-20 02:52:52.533287	2014-07-20 02:52:52.537962	\N	94	79
2044	user_1405839188	2014-07-20 02:53:08.608992	2014-07-20 02:53:08.611556	\N	94	79
2045	user_1405839216	2014-07-20 02:53:36.553581	2014-07-20 02:53:36.55648	\N	94	79
2046	user_1405839266	2014-07-20 02:54:26.291732	2014-07-20 02:54:26.297114	\N	94	79
2047	user_1405839284	2014-07-20 02:54:44.164536	2014-07-20 02:54:44.168176	\N	94	79
2048	user_1405839326	2014-07-20 02:55:26.74597	2014-07-20 02:55:26.750301	\N	94	79
2049	user_1405839337	2014-07-20 02:55:37.316028	2014-07-20 02:55:37.320889	\N	94	79
2050	user_1405839356	2014-07-20 02:55:56.209059	2014-07-20 02:55:56.21244	\N	94	79
2051	user_1405839379	2014-07-20 02:56:19.219412	2014-07-20 02:56:19.222546	\N	94	79
2052	user_1405839396	2014-07-20 02:56:36.920736	2014-07-20 02:56:36.925219	\N	94	79
2053	user_1405839418	2014-07-20 02:56:58.523516	2014-07-20 02:56:58.527597	\N	94	79
2054	user_1405839433	2014-07-20 02:57:13.961423	2014-07-20 02:57:13.964097	\N	94	79
2055	user_1405839451	2014-07-20 02:57:31.304015	2014-07-20 02:57:31.306928	\N	94	79
2056	user_1405839469	2014-07-20 02:57:49.462435	2014-07-20 02:57:49.465928	\N	94	79
2057	user_1405839480	2014-07-20 02:58:00.511748	2014-07-20 02:58:00.515473	\N	94	79
2058	user_1405839498	2014-07-20 02:58:18.767597	2014-07-20 02:58:18.772104	\N	94	79
2059	user_1405839512	2014-07-20 02:58:32.511942	2014-07-20 02:58:32.51711	\N	94	79
2060	user_1405839522	2014-07-20 02:58:42.722121	2014-07-20 02:58:42.727344	\N	94	79
2061	user_1405839536	2014-07-20 02:58:56.855075	2014-07-20 02:58:56.85778	\N	94	79
2062	user_1405839551	2014-07-20 02:59:11.7621	2014-07-20 02:59:11.766196	\N	94	79
2063	user_1405839590	2014-07-20 02:59:50.128921	2014-07-20 02:59:50.134207	\N	94	79
2064	user_1405839613	2014-07-20 03:00:13.503968	2014-07-20 03:00:13.50714	\N	94	79
2065	user_1405839639	2014-07-20 03:00:39.511973	2014-07-20 03:00:39.516725	\N	94	79
2066	user_1405839656	2014-07-20 03:00:56.59838	2014-07-20 03:00:56.601634	\N	94	79
2067	user_1405839670	2014-07-20 03:01:10.206669	2014-07-20 03:01:10.209736	\N	94	79
2068	user_1405839686	2014-07-20 03:01:26.218519	2014-07-20 03:01:26.222476	\N	94	79
2069	user_1405839702	2014-07-20 03:01:42.33168	2014-07-20 03:01:42.335462	\N	94	79
2070	user_1405839713	2014-07-20 03:01:53.526189	2014-07-20 03:01:53.52913	\N	94	79
2071	user_1405839743	2014-07-20 03:02:23.750527	2014-07-20 03:02:23.754741	\N	94	79
2145	user_1405843382	2014-07-20 04:03:02.598015	2014-07-20 04:03:02.603394	\N	94	79
2146	user_1405843401	2014-07-20 04:03:21.560155	2014-07-20 04:03:21.565075	\N	94	79
2147	user_1405843435	2014-07-20 04:03:55.680578	2014-07-20 04:03:55.686121	\N	94	79
2148	user_1405843468	2014-07-20 04:04:28.829476	2014-07-20 04:04:28.832007	\N	94	79
2149	user_1405843608	2014-07-20 04:06:48.275448	2014-07-20 04:06:48.280487	\N	94	79
2150	user_14058436	2014-07-20 04:07:30.362439	2014-07-20 04:07:34.470871	\N	94	79
2151	user_1405843704	2014-07-20 04:08:24.801572	2014-07-20 04:08:24.805753	\N	94	79
2152	user_1405843736	2014-07-20 04:08:56.259233	2014-07-20 04:08:56.263016	\N	94	79
2153	user_1405843807	2014-07-20 04:10:07.351882	2014-07-20 04:10:07.356512	\N	94	79
2154	user_1405843826	2014-07-20 04:10:26.979131	2014-07-20 04:10:26.981778	\N	94	79
2155	user_1405843879	2014-07-20 04:11:19.671948	2014-07-20 04:11:19.677144	\N	94	79
2156	user_1405843905	2014-07-20 04:11:45.199779	2014-07-20 04:11:45.204814	\N	94	79
2157	user_1405843985	2014-07-20 04:13:05.834622	2014-07-20 04:13:05.840044	\N	94	79
2158	user_1405844020	2014-07-20 04:13:40.053824	2014-07-20 04:13:40.058149	\N	94	79
2159	user_1405844028	2014-07-20 04:13:48.362349	2014-07-20 04:13:48.367353	\N	94	79
2160	user_1405844042	2014-07-20 04:14:02.277487	2014-07-20 04:14:02.281527	\N	94	79
2161	user_1405844199	2014-07-20 04:16:39.272773	2014-07-20 04:16:39.277205	\N	94	79
2162	user_1405844224	2014-07-20 04:17:04.411071	2014-07-20 04:17:04.415776	\N	94	79
2163	gene	2014-07-20 04:17:29.256538	2014-07-20 04:17:37.373575	\N	94	79
2164	user_1405844554	2014-07-20 04:22:34.454649	2014-07-20 04:22:34.460414	\N	94	79
2165	user_1405844631	2014-07-20 04:23:51.076386	2014-07-20 04:23:51.082231	\N	94	79
2166	user_1405844641	2014-07-20 04:24:01.751785	2014-07-20 04:24:01.75571	\N	94	79
2167	user_1405844692	2014-07-20 04:24:52.417547	2014-07-20 04:24:52.421038	\N	94	79
2168	user_1405844696	2014-07-20 04:24:56.406279	2014-07-20 04:24:56.409288	\N	94	79
2169	user_1405844699	2014-07-20 04:24:59.895489	2014-07-20 04:24:59.898901	\N	94	79
2170	user_1405844796	2014-07-20 04:26:36.213958	2014-07-20 04:26:36.219009	\N	94	79
2171	user_1405844826	2014-07-20 04:27:06.81942	2014-07-20 04:27:06.824205	\N	94	79
2172	user_1405844836	2014-07-20 04:27:16.253685	2014-07-20 04:27:16.258323	\N	94	79
2173	user_1405844901	2014-07-20 04:28:21.711877	2014-07-20 04:28:21.716255	\N	94	79
2174	user_1405844928	2014-07-20 04:28:48.087996	2014-07-20 04:28:48.091772	\N	94	79
2175	user_1405844938	2014-07-20 04:28:58.682114	2014-07-20 04:28:58.685007	\N	94	79
2176	user_1405844954	2014-07-20 04:29:14.612976	2014-07-20 04:29:14.617532	\N	94	79
2177	user_1405844988	2014-07-20 04:29:48.624749	2014-07-20 04:29:48.63132	\N	94	79
2178	user_1405845036	2014-07-20 04:30:36.798953	2014-07-20 04:30:36.802175	\N	94	79
2179	user_1405845098	2014-07-20 04:31:38.309113	2014-07-20 04:31:38.313018	\N	94	79
2180	user_1405845129	2014-07-20 04:32:09.798633	2014-07-20 04:32:09.804009	\N	94	79
2181	user_1405845179	2014-07-20 04:32:59.288422	2014-07-20 04:32:59.291825	\N	94	79
2182	user_1405845208	2014-07-20 04:33:28.086126	2014-07-20 04:33:28.089369	\N	94	79
2183	user_1405845222	2014-07-20 04:33:42.960644	2014-07-20 04:33:42.963768	\N	94	79
2184	user_1405845288	2014-07-20 04:34:48.519247	2014-07-20 04:34:48.522644	\N	94	79
2185	user_1405845320	2014-07-20 04:35:20.198126	2014-07-20 04:35:20.20268	\N	94	79
1827	user_1405817349	2014-07-19 20:49:09.903704	2014-07-19 20:49:09.90924	\N	94	79
1828	user_1405817351	2014-07-19 20:49:11.360125	2014-07-19 20:49:11.364008	\N	94	79
1829	user_1405817370	2014-07-19 20:49:30.400804	2014-07-19 20:49:30.404606	\N	94	79
1830	user_1405817393	2014-07-19 20:49:53.090085	2014-07-19 20:49:53.093408	\N	94	79
1831	user_1405817394	2014-07-19 20:49:54.191501	2014-07-19 20:49:54.195994	\N	94	79
1832	user_1405817408	2014-07-19 20:50:08.402006	2014-07-19 20:50:08.40463	\N	94	79
1833	user_1405817409	2014-07-19 20:50:09.015249	2014-07-19 20:50:09.019649	\N	94	79
1834	user_1405817425	2014-07-19 20:50:25.198179	2014-07-19 20:50:25.20197	\N	94	79
1835	user_1405817425	2014-07-19 20:50:25.773218	2014-07-19 20:50:25.776845	\N	94	79
1836	user_1405817439	2014-07-19 20:50:39.296329	2014-07-19 20:50:39.299041	\N	94	79
1837	user_1405817440	2014-07-19 20:50:40.185226	2014-07-19 20:50:40.189829	\N	94	79
1838	user_1405817465	2014-07-19 20:51:05.239575	2014-07-19 20:51:05.242898	\N	94	79
1839	user_1405817465	2014-07-19 20:51:05.958782	2014-07-19 20:51:05.96301	\N	94	79
1840	user_1405817480	2014-07-19 20:51:20.125501	2014-07-19 20:51:20.128233	\N	94	79
1841	user_1405817481	2014-07-19 20:51:21.447458	2014-07-19 20:51:21.452144	\N	94	79
1842	user_1405817590	2014-07-19 20:53:09.999656	2014-07-19 20:53:10.003341	\N	94	79
1843	user_1405817590	2014-07-19 20:53:10.776043	2014-07-19 20:53:10.780496	\N	94	79
1844	user_1405817619	2014-07-19 20:53:39.381026	2014-07-19 20:53:39.383769	\N	94	79
1845	user_1405817620	2014-07-19 20:53:40.31319	2014-07-19 20:53:40.315651	\N	94	79
1846	user_1405817657	2014-07-19 20:54:17.285566	2014-07-19 20:54:17.290536	\N	94	79
1847	user_1405817658	2014-07-19 20:54:18.071122	2014-07-19 20:54:18.076189	\N	94	79
1848	user_1405817715	2014-07-19 20:55:15.158929	2014-07-19 20:55:15.163666	\N	94	79
1849	user_1405817716	2014-07-19 20:55:16.098621	2014-07-19 20:55:16.104103	\N	94	79
1850	user_1405817832	2014-07-19 20:57:12.268294	2014-07-19 20:57:12.273166	\N	94	79
1851	user_1405817833	2014-07-19 20:57:13.645305	2014-07-19 20:57:13.648019	\N	94	79
1852	user_1405817866	2014-07-19 20:57:46.503457	2014-07-19 20:57:46.507153	\N	94	79
1853	user_1405817867	2014-07-19 20:57:47.391418	2014-07-19 20:57:47.395002	\N	94	79
1854	user_1405817913	2014-07-19 20:58:33.001392	2014-07-19 20:58:33.006108	\N	94	79
1855	user_1405817913	2014-07-19 20:58:33.714508	2014-07-19 20:58:33.718931	\N	94	79
1856	user_1405817943	2014-07-19 20:59:03.483589	2014-07-19 20:59:03.487349	\N	94	79
1857	user_1405817944	2014-07-19 20:59:04.145811	2014-07-19 20:59:04.151387	\N	94	79
1858	user_1405817981	2014-07-19 20:59:41.660733	2014-07-19 20:59:41.664784	\N	94	79
1859	user_1405817982	2014-07-19 20:59:42.215991	2014-07-19 20:59:42.22022	\N	94	79
1860	user_1405817997	2014-07-19 20:59:57.24791	2014-07-19 20:59:57.251069	\N	94	79
1861	user_1405818052	2014-07-19 21:00:52.363055	2014-07-19 21:00:52.367353	\N	94	79
1862	user_1405818053	2014-07-19 21:00:53.82666	2014-07-19 21:00:53.83103	\N	94	79
1863	user_1405818058	2014-07-19 21:00:58.326061	2014-07-19 21:00:58.32982	\N	94	79
1864	user_1405818059	2014-07-19 21:00:59.460899	2014-07-19 21:00:59.465507	\N	94	79
1865	user_1405818080	2014-07-19 21:01:20.956743	2014-07-19 21:01:20.961126	\N	94	79
1866	user_1405818081	2014-07-19 21:01:21.666133	2014-07-19 21:01:21.670795	\N	94	79
1867	user_1405818108	2014-07-19 21:01:48.382258	2014-07-19 21:01:48.386019	\N	94	79
1868	user_1405818108	2014-07-19 21:01:48.984149	2014-07-19 21:01:48.988935	\N	94	79
1869	user_1405818149	2014-07-19 21:02:29.591309	2014-07-19 21:02:29.595678	\N	94	79
1870	user_1405818150	2014-07-19 21:02:30.339274	2014-07-19 21:02:30.3435	\N	94	79
1871	user_1405818192	2014-07-19 21:03:12.5405	2014-07-19 21:03:12.543811	\N	94	79
1872	user_1405818193	2014-07-19 21:03:13.183641	2014-07-19 21:03:13.188318	\N	94	79
1873	user_1405818207	2014-07-19 21:03:27.432174	2014-07-19 21:03:27.434959	\N	94	79
1874	user_1405818208	2014-07-19 21:03:28.137214	2014-07-19 21:03:28.14114	\N	94	79
1875	user_1405818247	2014-07-19 21:04:07.305215	2014-07-19 21:04:07.308513	\N	94	79
1876	user_1405818248	2014-07-19 21:04:08.088996	2014-07-19 21:04:08.093236	\N	94	79
1877	user_1405818269	2014-07-19 21:04:29.495855	2014-07-19 21:04:29.498419	\N	94	79
1878	user_1405818344	2014-07-19 21:05:44.068498	2014-07-19 21:05:44.072282	\N	94	79
1879	user_1405818344	2014-07-19 21:05:44.678502	2014-07-19 21:05:44.683127	\N	94	79
1880	user_1405818388	2014-07-19 21:06:28.455764	2014-07-19 21:06:28.458659	\N	94	79
1881	user_1405818389	2014-07-19 21:06:29.470031	2014-07-19 21:06:29.474852	\N	94	79
1882	user_1405818487	2014-07-19 21:08:07.540739	2014-07-19 21:08:07.545696	\N	94	79
1883	user_1405818488	2014-07-19 21:08:08.490458	2014-07-19 21:08:08.493513	\N	94	79
1884	user_1405818509	2014-07-19 21:08:29.747275	2014-07-19 21:08:29.7515	\N	94	79
1885	user_1405818510	2014-07-19 21:08:30.487796	2014-07-19 21:08:30.492109	\N	94	79
1886	user_1405818566	2014-07-19 21:09:26.757941	2014-07-19 21:09:26.761836	\N	94	79
1887	user_1405818568	2014-07-19 21:09:28.135179	2014-07-19 21:09:28.139844	\N	94	79
1888	user_1405818582	2014-07-19 21:09:42.845554	2014-07-19 21:09:42.848774	\N	94	79
1889	user_1405818583	2014-07-19 21:09:43.414731	2014-07-19 21:09:43.420538	\N	94	79
1890	user_1405818612	2014-07-19 21:10:12.312189	2014-07-19 21:10:12.314978	\N	94	79
1891	user_1405818612	2014-07-19 21:10:12.88359	2014-07-19 21:10:12.887621	\N	94	79
1892	user_1405818619	2014-07-19 21:10:19.415028	2014-07-19 21:10:19.420095	\N	94	79
1893	user_1405818620	2014-07-19 21:10:20.373327	2014-07-19 21:10:20.377905	\N	94	79
1894	user_1405818645	2014-07-19 21:10:45.151772	2014-07-19 21:10:45.155573	\N	94	79
1895	user_1405818645	2014-07-19 21:10:45.690005	2014-07-19 21:10:45.695304	\N	94	79
1896	user_1405818676	2014-07-19 21:11:16.340658	2014-07-19 21:11:16.343454	\N	94	79
1897	user_1405818677	2014-07-19 21:11:17.009416	2014-07-19 21:11:17.014907	\N	94	79
1898	user_1405818698	2014-07-19 21:11:38.936886	2014-07-19 21:11:38.940938	\N	94	79
1899	user_1405818700	2014-07-19 21:11:39.997271	2014-07-19 21:11:40.001855	\N	94	79
1900	user_1405818700	2014-07-19 21:11:40.518995	2014-07-19 21:11:40.523644	\N	94	79
1901	user_1405818719	2014-07-19 21:11:59.984154	2014-07-19 21:11:59.989427	\N	94	79
1902	user_1405818720	2014-07-19 21:12:00.649231	2014-07-19 21:12:00.654002	\N	94	79
1903	user_1405818770	2014-07-19 21:12:50.339124	2014-07-19 21:12:50.342805	\N	94	79
1904	user_1405818773	2014-07-19 21:12:53.543465	2014-07-19 21:12:53.548325	\N	94	79
1905	user_1405818791	2014-07-19 21:13:11.118047	2014-07-19 21:13:11.12233	\N	94	79
1906	user_1405818791	2014-07-19 21:13:11.89143	2014-07-19 21:13:11.896733	\N	94	79
1907	user_1405818800	2014-07-19 21:13:20.776234	2014-07-19 21:13:20.779041	\N	94	79
1908	user_1405818801	2014-07-19 21:13:21.424567	2014-07-19 21:13:21.429558	\N	94	79
1909	user_1405818841	2014-07-19 21:14:01.328738	2014-07-19 21:14:01.332137	\N	94	79
1910	user_1405818841	2014-07-19 21:14:01.881326	2014-07-19 21:14:01.88545	\N	94	79
1911	user_1405818854	2014-07-19 21:14:14.990811	2014-07-19 21:14:14.993587	\N	94	79
1912	user_1405818855	2014-07-19 21:14:15.5478	2014-07-19 21:14:15.551814	\N	94	79
1913	user_1405818878	2014-07-19 21:14:38.989468	2014-07-19 21:14:38.992406	\N	94	79
1914	user_1405818879	2014-07-19 21:14:39.961637	2014-07-19 21:14:39.967844	\N	94	79
1915	user_1405818945	2014-07-19 21:15:45.691811	2014-07-19 21:15:45.694905	\N	94	79
1916	user_1405818947	2014-07-19 21:15:47.079514	2014-07-19 21:15:47.083888	\N	94	79
1917	user_1405818960	2014-07-19 21:16:00.049745	2014-07-19 21:16:00.052814	\N	94	79
1918	user_1405818960	2014-07-19 21:16:00.630228	2014-07-19 21:16:00.635344	\N	94	79
1919	user_1405819015	2014-07-19 21:16:55.60418	2014-07-19 21:16:55.609393	\N	94	79
2072	user_1405839756	2014-07-20 03:02:36.79598	2014-07-20 03:02:36.800374	\N	94	79
1920	user_1405819016	2014-07-19 21:16:56.09295	2014-07-19 21:16:56.09749	\N	94	79
1921	user_1405819024	2014-07-19 21:17:04.582189	2014-07-19 21:17:04.58529	\N	94	79
2073	user_1405839799	2014-07-20 03:03:19.350736	2014-07-20 03:03:19.355814	\N	94	79
1922	user_1405819025	2014-07-19 21:17:05.223599	2014-07-19 21:17:05.227229	\N	94	79
1923	user_1405819083	2014-07-19 21:18:03.438582	2014-07-19 21:18:03.444073	\N	94	79
2074	user_1405839809	2014-07-20 03:03:29.603404	2014-07-20 03:03:29.60776	\N	94	79
1924	user_1405819084	2014-07-19 21:18:04.841658	2014-07-19 21:18:04.845965	\N	94	79
1925	user_1405819131	2014-07-19 21:18:51.657971	2014-07-19 21:18:51.66323	\N	94	79
2075	user_1405839832	2014-07-20 03:03:52.917252	2014-07-20 03:03:52.921399	\N	94	79
1926	user_1405819132	2014-07-19 21:18:52.301716	2014-07-19 21:18:52.305091	\N	94	79
1927	user_1405819250	2014-07-19 21:20:50.60525	2014-07-19 21:20:50.610124	\N	94	79
2076	user_1405839833	2014-07-20 03:03:53.975075	2014-07-20 03:03:53.979886	\N	94	79
1928	user_1405819251	2014-07-19 21:20:51.39691	2014-07-19 21:20:51.401511	\N	94	79
1929	user_1405819286	2014-07-19 21:21:26.456184	2014-07-19 21:21:26.46035	\N	94	79
2077	user_1405839865	2014-07-20 03:04:25.825817	2014-07-20 03:04:25.828251	\N	94	79
1930	user_1405819287	2014-07-19 21:21:27.153301	2014-07-19 21:21:27.158692	\N	94	79
1931	user_1405819438	2014-07-19 21:23:58.21796	2014-07-19 21:23:58.223089	\N	94	79
2078	user_1405839867	2014-07-20 03:04:27.309897	2014-07-20 03:04:27.314565	\N	94	79
1932	user_1405819438	2014-07-19 21:23:58.784075	2014-07-19 21:23:58.788314	\N	94	79
1933	user_1405819490	2014-07-19 21:24:50.633487	2014-07-19 21:24:50.636929	\N	94	79
2079	user_1405839891	2014-07-20 03:04:51.199634	2014-07-20 03:04:51.202906	\N	94	79
1934	user_1405819491	2014-07-19 21:24:51.185912	2014-07-19 21:24:51.190043	\N	94	79
1935	user_1405819506	2014-07-19 21:25:06.1648	2014-07-19 21:25:06.167462	\N	94	79
2080	user_1405839916	2014-07-20 03:05:16.483111	2014-07-20 03:05:16.485728	\N	94	79
1936	user_1405819506	2014-07-19 21:25:06.807593	2014-07-19 21:25:06.811894	\N	94	79
1937	user_1405819521	2014-07-19 21:25:21.888517	2014-07-19 21:25:21.891089	\N	94	79
2081	user_1405839932	2014-07-20 03:05:32.043662	2014-07-20 03:05:32.047522	\N	94	79
1938	user_1405819522	2014-07-19 21:25:22.488676	2014-07-19 21:25:22.491307	\N	94	79
1939	user_1405819532	2014-07-19 21:25:32.243623	2014-07-19 21:25:32.247686	\N	94	79
2082	user_1405839933	2014-07-20 03:05:33.510699	2014-07-20 03:05:33.514801	\N	94	79
1940	user_1405819532	2014-07-19 21:25:32.827692	2014-07-19 21:25:32.831829	\N	94	79
1941	user_1405819577	2014-07-19 21:26:17.290682	2014-07-19 21:26:17.294776	\N	94	79
2083	user_1405839988	2014-07-20 03:06:28.701001	2014-07-20 03:06:28.70552	\N	94	79
1942	user_1405819578	2014-07-19 21:26:18.693858	2014-07-19 21:26:18.697898	\N	94	79
1943	user_1405819584	2014-07-19 21:26:24.951789	2014-07-19 21:26:24.955622	\N	94	79
2084	user_1405840001	2014-07-20 03:06:41.971308	2014-07-20 03:06:41.974337	\N	94	79
1944	user_1405819592	2014-07-19 21:26:32.523282	2014-07-19 21:26:32.526192	\N	94	79
1945	user_1405819593	2014-07-19 21:26:33.580596	2014-07-19 21:26:33.586227	\N	94	79
2085	user_1405840016	2014-07-20 03:06:56.388451	2014-07-20 03:06:56.392726	\N	94	79
2086	user_1405840016	2014-07-20 03:06:56.855389	2014-07-20 03:06:56.85967	\N	94	79
2087	user_1405840040	2014-07-20 03:07:20.921152	2014-07-20 03:07:20.925332	\N	94	79
2088	user_1405840055	2014-07-20 03:07:35.150425	2014-07-20 03:07:35.153205	\N	94	79
2089	user_1405840068	2014-07-20 03:07:48.615522	2014-07-20 03:07:48.620762	\N	94	79
2090	user_1405840077	2014-07-20 03:07:57.863185	2014-07-20 03:07:57.868402	\N	94	79
2091	user_1405840143	2014-07-20 03:09:03.483519	2014-07-20 03:09:03.488139	\N	94	79
2092	user_1405840157	2014-07-20 03:09:17.801449	2014-07-20 03:09:17.805376	\N	94	79
2093	user_1405840200	2014-07-20 03:10:00.415025	2014-07-20 03:10:00.420088	\N	94	79
2094	user_1405840217	2014-07-20 03:10:17.248846	2014-07-20 03:10:17.25154	\N	94	79
2095	user_1405840231	2014-07-20 03:10:31.837556	2014-07-20 03:10:31.84057	\N	94	79
2096	user_1405840251	2014-07-20 03:10:51.519771	2014-07-20 03:10:51.523734	\N	94	79
2097	user_1405840275	2014-07-20 03:11:15.404688	2014-07-20 03:11:15.408692	\N	94	79
2098	user_1405840284	2014-07-20 03:11:24.809141	2014-07-20 03:11:24.811914	\N	94	79
2099	user_1405840299	2014-07-20 03:11:39.143443	2014-07-20 03:11:39.14617	\N	94	79
2100	user_1405840317	2014-07-20 03:11:57.921672	2014-07-20 03:11:57.926824	\N	94	79
2101	user_1405840329	2014-07-20 03:12:09.79463	2014-07-20 03:12:09.797373	\N	94	79
2102	user_1405840338	2014-07-20 03:12:18.864073	2014-07-20 03:12:18.868375	\N	94	79
2103	user_1405840367	2014-07-20 03:12:47.149138	2014-07-20 03:12:47.152668	\N	94	79
2104	user_1405840372	2014-07-20 03:12:52.423101	2014-07-20 03:12:52.426537	\N	94	79
2105	user_1405840383	2014-07-20 03:13:03.526515	2014-07-20 03:13:03.529264	\N	94	79
2106	user_1405840424	2014-07-20 03:13:44.135282	2014-07-20 03:13:44.140595	\N	94	79
2107	user_1405840476	2014-07-20 03:14:36.981014	2014-07-20 03:14:36.984918	\N	94	79
2108	user_1405840496	2014-07-20 03:14:56.291414	2014-07-20 03:14:56.295483	\N	94	79
2109	user_1405840523	2014-07-20 03:15:23.773145	2014-07-20 03:15:23.775959	\N	94	79
2110	user_1405840534	2014-07-20 03:15:34.356752	2014-07-20 03:15:34.360817	\N	94	79
2111	user_1405840585	2014-07-20 03:16:25.658627	2014-07-20 03:16:25.663524	\N	94	79
2112	user_1405840620	2014-07-20 03:17:00.049834	2014-07-20 03:17:00.052839	\N	94	79
2113	user_1405840646	2014-07-20 03:17:26.12794	2014-07-20 03:17:26.131482	\N	94	79
2114	user_1405840715	2014-07-20 03:18:35.13083	2014-07-20 03:18:35.136531	\N	94	79
2115	user_1405840742	2014-07-20 03:19:02.514149	2014-07-20 03:19:02.517551	\N	94	79
2116	user_1405840771	2014-07-20 03:19:31.274954	2014-07-20 03:19:31.277535	\N	94	79
2117	user_1405840793	2014-07-20 03:19:53.049376	2014-07-20 03:19:53.052401	\N	94	79
2118	user_1405840818	2014-07-20 03:20:18.325608	2014-07-20 03:20:18.328337	\N	94	79
2119	user_1405840833	2014-07-20 03:20:33.223314	2014-07-20 03:20:33.226208	\N	94	79
2120	user_1405840867	2014-07-20 03:21:07.322334	2014-07-20 03:21:07.45555	\N	94	79
2121	user_1405840887	2014-07-20 03:21:27.022663	2014-07-20 03:21:27.025316	\N	94	79
2122	user_1405840922	2014-07-20 03:22:02.097043	2014-07-20 03:22:02.101851	\N	94	79
2123	user_1405840937	2014-07-20 03:22:17.079819	2014-07-20 03:22:17.082611	\N	94	79
2124	user_1405841262	2014-07-20 03:27:42.701718	2014-07-20 03:27:42.706241	\N	94	79
2125	user_1405841277	2014-07-20 03:27:57.655224	2014-07-20 03:27:57.658064	\N	94	79
2126	user_1405841697	2014-07-20 03:34:57.216707	2014-07-20 03:34:57.220057	\N	94	79
2127	user_1405841716	2014-07-20 03:35:16.049203	2014-07-20 03:35:16.052645	\N	94	79
2128	user_1405841746	2014-07-20 03:35:46.493555	2014-07-20 03:35:46.498011	\N	94	79
2129	user_1405841799	2014-07-20 03:36:39.227677	2014-07-20 03:36:39.23187	\N	94	79
2130	user_1405841889	2014-07-20 03:38:09.971277	2014-07-20 03:38:09.977675	\N	94	79
2131	user_1405841932	2014-07-20 03:38:52.598952	2014-07-20 03:38:52.603682	\N	94	79
2132	user_1405841998	2014-07-20 03:39:58.820928	2014-07-20 03:39:58.825434	\N	94	79
2133	user_1405842008	2014-07-20 03:40:08.94585	2014-07-20 03:40:08.948672	\N	94	79
2134	user_1405842043	2014-07-20 03:40:43.373384	2014-07-20 03:40:43.378318	\N	94	79
2135	user_1405842192	2014-07-20 03:43:12.129302	2014-07-20 03:43:12.134527	\N	94	79
2136	user_1405842203	2014-07-20 03:43:23.577506	2014-07-20 03:43:23.580362	\N	94	79
2137	user_1405842790	2014-07-20 03:53:10.010964	2014-07-20 03:53:10.01548	\N	94	79
1946	user_1405819607	2014-07-19 21:26:47.401904	2014-07-19 21:26:47.406816	\N	94	79
2138	user_1405842819	2014-07-20 03:53:39.910392	2014-07-20 03:53:39.914394	\N	94	79
1947	user_1405819608	2014-07-19 21:26:48.02063	2014-07-19 21:26:48.024435	\N	94	79
1948	user_1405819617	2014-07-19 21:26:57.655334	2014-07-19 21:26:57.658292	\N	94	79
1949	user_1405819618	2014-07-19 21:26:58.397822	2014-07-19 21:26:58.402316	\N	94	79
2139	gene	2014-07-20 03:54:51.591297	2014-07-20 03:55:00.426431	\N	94	79
1950	user_1405819637	2014-07-19 21:27:17.669471	2014-07-19 21:27:17.67361	\N	94	79
1951	user_1405819638	2014-07-19 21:27:18.439196	2014-07-19 21:27:18.442759	\N	94	79
2140	user_1405842919	2014-07-20 03:55:19.234275	2014-07-20 03:55:19.238362	\N	94	79
1952	user_1405819649	2014-07-19 21:27:29.569594	2014-07-19 21:27:29.572409	\N	94	79
1953	user_1405819650	2014-07-19 21:27:30.160364	2014-07-19 21:27:30.164784	\N	94	79
2141	user_1405842940	2014-07-20 03:55:40.284752	2014-07-20 03:55:40.287445	\N	94	79
1954	user_1405820789	2014-07-19 21:46:29.702315	2014-07-19 21:46:29.707368	\N	94	79
1955	user_1405820789	2014-07-19 21:46:29.886961	2014-07-19 21:46:29.891556	\N	94	79
1956	user_1405820805	2014-07-19 21:46:45.530079	2014-07-19 21:46:45.535871	\N	94	79
2142	gee	2014-07-20 03:56:36.043166	2014-07-20 03:56:42.058599	\N	94	79
1957	user_1405820807	2014-07-19 21:46:47.134849	2014-07-19 21:46:47.138776	\N	94	79
1958	user_1405820837	2014-07-19 21:47:17.348891	2014-07-19 21:47:17.3535	\N	94	79
2143	user_1405843145	2014-07-20 03:59:05.185452	2014-07-20 03:59:05.192746	\N	94	79
1959	user_1405820837	2014-07-19 21:47:17.961404	2014-07-19 21:47:17.965762	\N	94	79
1960	user_1405820869	2014-07-19 21:47:49.844737	2014-07-19 21:47:49.849432	\N	94	79
1961	user_1405820870	2014-07-19 21:47:50.401613	2014-07-19 21:47:50.405314	\N	94	79
2144	Gene	2014-07-20 03:59:20.609866	2014-07-20 03:59:40.156733	\N	94	79
1962	user_1405820884	2014-07-19 21:48:04.111275	2014-07-19 21:48:04.113915	\N	94	79
1963	user_1405820884	2014-07-19 21:48:04.794441	2014-07-19 21:48:04.79845	\N	94	79
1964	user_1405820900	2014-07-19 21:48:20.818395	2014-07-19 21:48:20.823468	\N	94	79
1965	user_1405820901	2014-07-19 21:48:21.409412	2014-07-19 21:48:21.414184	\N	94	79
1966	user_1405820913	2014-07-19 21:48:33.101455	2014-07-19 21:48:33.104497	\N	94	79
1967	user_1405820913	2014-07-19 21:48:33.760168	2014-07-19 21:48:33.763924	\N	94	79
1968	user_1405820925	2014-07-19 21:48:45.359558	2014-07-19 21:48:45.365561	\N	94	79
1969	user_1405820925	2014-07-19 21:48:45.968463	2014-07-19 21:48:45.973282	\N	94	79
1970	user_1405820943	2014-07-19 21:49:03.685579	2014-07-19 21:49:03.689468	\N	94	79
1971	user_1405820944	2014-07-19 21:49:04.311362	2014-07-19 21:49:04.315268	\N	94	79
1972	user_1405820952	2014-07-19 21:49:12.063789	2014-07-19 21:49:12.068536	\N	94	79
1973	user_1405820952	2014-07-19 21:49:12.668764	2014-07-19 21:49:12.673513	\N	94	79
1974	user_1405820966	2014-07-19 21:49:26.118406	2014-07-19 21:49:26.122977	\N	94	79
1975	user_1405820966	2014-07-19 21:49:26.699793	2014-07-19 21:49:26.705122	\N	94	79
1976	user_1405820987	2014-07-19 21:49:47.491929	2014-07-19 21:49:47.497809	\N	94	79
1977	user_1405820988	2014-07-19 21:49:48.110062	2014-07-19 21:49:48.114348	\N	94	79
1978	user_1405820998	2014-07-19 21:49:58.608483	2014-07-19 21:49:58.612699	\N	94	79
1979	user_1405820999	2014-07-19 21:49:59.411263	2014-07-19 21:49:59.417003	\N	94	79
1980	user_1405821045	2014-07-19 21:50:45.479752	2014-07-19 21:50:45.484369	\N	94	79
1981	user_1405821046	2014-07-19 21:50:46.122803	2014-07-19 21:50:46.126076	\N	94	79
1982	user_1405821104	2014-07-19 21:51:44.168472	2014-07-19 21:51:44.173216	\N	94	79
1983	user_1405821104	2014-07-19 21:51:44.98167	2014-07-19 21:51:44.986295	\N	94	79
1984	user_1405821145	2014-07-19 21:52:25.961724	2014-07-19 21:52:25.965158	\N	94	79
1985	user_1405821147	2014-07-19 21:52:27.487797	2014-07-19 21:52:27.49214	\N	94	79
1986	user_1405821160	2014-07-19 21:52:40.656551	2014-07-19 21:52:40.659219	\N	94	79
1987	user_1405821161	2014-07-19 21:52:41.226769	2014-07-19 21:52:41.231479	\N	94	79
1988	user_1405821178	2014-07-19 21:52:58.07439	2014-07-19 21:52:58.077407	\N	94	79
1989	user_1405821178	2014-07-19 21:52:58.740998	2014-07-19 21:52:58.745073	\N	94	79
1990	user_1405821200	2014-07-19 21:53:20.636701	2014-07-19 21:53:20.640828	\N	94	79
1991	user_1405821233	2014-07-19 21:53:53.265758	2014-07-19 21:53:53.271279	\N	94	79
1992	user_1405821266	2014-07-19 21:54:26.888753	2014-07-19 21:54:26.893069	\N	94	79
1993	user_1405821267	2014-07-19 21:54:27.446053	2014-07-19 21:54:27.45053	\N	94	79
1994	user_1405821295	2014-07-19 21:54:55.091007	2014-07-19 21:54:55.094849	\N	94	79
1995	user_1405821295	2014-07-19 21:54:55.794904	2014-07-19 21:54:55.798977	\N	94	79
1996	user_1405821306	2014-07-19 21:55:06.28724	2014-07-19 21:55:06.289892	\N	94	79
1997	user_1405821306	2014-07-19 21:55:06.967422	2014-07-19 21:55:06.971272	\N	94	79
1998	user_1405821327	2014-07-19 21:55:27.884074	2014-07-19 21:55:27.888366	\N	94	79
1999	user_1405821328	2014-07-19 21:55:28.658174	2014-07-19 21:55:28.663373	\N	94	79
2000	user_1405821348	2014-07-19 21:55:48.907575	2014-07-19 21:55:48.912313	\N	94	79
2001	user_1405821349	2014-07-19 21:55:49.536226	2014-07-19 21:55:49.540754	\N	94	79
2002	user_1405821974	2014-07-19 22:06:14.156166	2014-07-19 22:06:14.161409	\N	94	79
2003	user_1405821980	2014-07-19 22:06:20.096958	2014-07-19 22:06:20.099794	\N	94	79
2004	user_1405822003	2014-07-19 22:06:43.648915	2014-07-19 22:06:43.653228	\N	94	79
2005	user_1405822042	2014-07-19 22:07:22.451589	2014-07-19 22:07:22.454635	\N	94	79
2006	user_1405822047	2014-07-19 22:07:27.903849	2014-07-19 22:07:27.906527	\N	94	79
2007	user_1405822069	2014-07-19 22:07:49.305584	2014-07-19 22:07:49.309539	\N	94	79
2008	user_1405822099	2014-07-19 22:08:19.870041	2014-07-19 22:08:19.873535	\N	94	79
2009	user_1405822120	2014-07-19 22:08:40.450154	2014-07-19 22:08:40.45322	\N	94	79
2010	user_1405822165	2014-07-19 22:09:25.44502	2014-07-19 22:09:25.449913	\N	94	79
2011	user_1405822230	2014-07-19 22:10:30.286011	2014-07-19 22:10:30.291296	\N	94	79
2012	gene	2014-07-19 22:10:40.278608	2014-07-19 22:10:45.095284	\N	94	79
2014	user_1405822252	2014-07-19 22:10:52.751336	2014-07-19 22:10:52.755552	\N	94	79
2013	steven	2014-07-19 22:10:51.85082	2014-07-19 22:11:02.519949	\N	94	79
2015	user_1405822301	2014-07-19 22:11:41.647916	2014-07-19 22:11:41.650786	\N	94	79
2016	user_1405822308	2014-07-19 22:11:48.980576	2014-07-19 22:11:48.983615	\N	94	79
2017	user_1405822321	2014-07-19 22:12:01.098741	2014-07-19 22:12:01.103902	\N	94	79
2018	user_1405822395	2014-07-19 22:13:15.092772	2014-07-19 22:13:15.097501	\N	94	79
2019	user_1405822406	2014-07-19 22:13:26.647412	2014-07-19 22:13:26.650194	\N	94	79
2020	user_1405822410	2014-07-19 22:13:30.875836	2014-07-19 22:13:30.885226	\N	94	79
2021	user_1405822436	2014-07-19 22:13:56.515179	2014-07-19 22:13:56.518442	\N	94	79
2022	gebe	2014-07-19 22:14:03.576783	2014-07-19 22:14:21.298395	\N	94	79
2023	user_1405822600	2014-07-19 22:16:40.753751	2014-07-19 22:16:40.757754	\N	94	79
2024	user_1405822620	2014-07-19 22:17:00.486078	2014-07-19 22:17:00.490742	\N	94	79
2025	user_1405822663	2014-07-19 22:17:43.053857	2014-07-19 22:17:43.05795	\N	94	79
2026	user_1405822826	2014-07-19 22:20:26.128003	2014-07-19 22:20:26.133568	\N	94	79
2027	user_1405822838	2014-07-19 22:20:38.451127	2014-07-19 22:20:38.454041	\N	94	79
2028	user_1405822863	2014-07-19 22:21:03.99181	2014-07-19 22:21:03.997115	\N	94	79
2029	user_1405826501	2014-07-19 23:21:41.535906	2014-07-19 23:21:41.540947	\N	94	79
2030	gene	2014-07-20 02:47:01.017618	2014-07-20 02:47:06.874798	\N	94	79
2031	user_1405838845	2014-07-20 02:47:25.627534	2014-07-20 02:47:25.631869	\N	94	79
2186	user_1405845345	2014-07-20 04:35:45.486871	2014-07-20 04:35:45.491258	\N	94	79
2573	user_1405997543	2014-07-21 22:52:23.417038	2014-07-21 22:52:23.421801	\N	94	79
2187	user_1405845406	2014-07-20 04:36:46.332574	2014-07-20 04:36:46.336423	\N	94	79
2188	user_1405845483	2014-07-20 04:38:03.479559	2014-07-20 04:38:03.482986	\N	94	79
2574	user_1405997547	2014-07-21 22:52:27.972442	2014-07-21 22:52:27.974978	\N	94	79
2189	user_1405846527	2014-07-20 04:55:27.305434	2014-07-20 04:55:27.310062	\N	94	79
2190	user_1405846563	2014-07-20 04:56:03.530194	2014-07-20 04:56:03.532941	\N	94	79
2575	user_1405997554	2014-07-21 22:52:34.28121	2014-07-21 22:52:34.284133	\N	94	79
2191	user_1405846600	2014-07-20 04:56:40.028393	2014-07-20 04:56:40.031536	\N	94	79
2192	user_1405846627	2014-07-20 04:57:07.536345	2014-07-20 04:57:07.541158	\N	94	79
2576	user_1405997561	2014-07-21 22:52:41.065576	2014-07-21 22:52:41.069437	\N	94	79
2193	user_1405846699	2014-07-20 04:58:19.18578	2014-07-20 04:58:19.189112	\N	94	79
2194	user_1405846838	2014-07-20 05:00:38.703139	2014-07-20 05:00:38.708182	\N	94	79
2577	user_1405997567	2014-07-21 22:52:47.464884	2014-07-21 22:52:47.467854	\N	94	79
2195	user_1405846898	2014-07-20 05:01:38.045932	2014-07-20 05:01:38.049377	\N	94	79
2196	user_1405846962	2014-07-20 05:02:41.999392	2014-07-20 05:02:42.003045	\N	94	79
2578	user_1405997573	2014-07-21 22:52:53.69752	2014-07-21 22:52:53.701988	\N	94	79
2197	user_1405846994	2014-07-20 05:03:14.880769	2014-07-20 05:03:14.883528	\N	94	79
2579	user_1405997578	2014-07-21 22:52:58.49563	2014-07-21 22:52:58.500414	\N	94	79
2580	user_1405997588	2014-07-21 22:53:08.233972	2014-07-21 22:53:08.238591	\N	94	79
2581	user_1405997598	2014-07-21 22:53:18.375538	2014-07-21 22:53:18.378973	\N	94	79
2582	user_1405997604	2014-07-21 22:53:24.103933	2014-07-21 22:53:24.106665	\N	94	79
2583	user_1405997622	2014-07-21 22:53:42.220053	2014-07-21 22:53:42.224345	\N	94	79
2584	user_1405997625	2014-07-21 22:53:45.568673	2014-07-21 22:53:45.572608	\N	94	79
2585	user_1405997639	2014-07-21 22:53:59.683701	2014-07-21 22:53:59.687869	\N	94	79
2586	user_1405997642	2014-07-21 22:54:02.955497	2014-07-21 22:54:02.959524	\N	94	79
2587	user_1405997654	2014-07-21 22:54:14.77382	2014-07-21 22:54:14.77776	\N	94	79
2588	user_1405998028	2014-07-21 23:00:28.932219	2014-07-21 23:00:28.937266	\N	94	79
2589	user_1405998061	2014-07-21 23:01:01.837016	2014-07-21 23:01:01.840912	\N	94	79
2590	user_1405998084	2014-07-21 23:01:24.272058	2014-07-21 23:01:24.2747	\N	94	79
2591	user_1405998114	2014-07-21 23:01:54.33073	2014-07-21 23:01:54.335114	\N	94	79
2592	user_1405998149	2014-07-21 23:02:29.572526	2014-07-21 23:02:29.575152	\N	94	79
2593	user_1405998157	2014-07-21 23:02:37.379981	2014-07-21 23:02:37.384432	\N	94	79
2594	user_1405998168	2014-07-21 23:02:48.375263	2014-07-21 23:02:48.378215	\N	94	79
2595	user_1405998207	2014-07-21 23:03:27.253156	2014-07-21 23:03:27.257205	\N	94	70
2596	user_1405998345	2014-07-21 23:05:45.471008	2014-07-21 23:05:45.474241	\N	94	70
2597	user_1405998387	2014-07-21 23:06:27.428757	2014-07-21 23:06:27.431262	\N	94	70
2598	user_1405998411	2014-07-21 23:06:51.855601	2014-07-21 23:06:51.859442	\N	94	70
2599	user_1405998432	2014-07-21 23:07:12.228807	2014-07-21 23:07:12.231389	\N	94	70
2600	user_1405998468	2014-07-21 23:07:48.622286	2014-07-21 23:07:48.625359	\N	94	70
2601	user_1405998522	2014-07-21 23:08:42.932731	2014-07-21 23:08:42.936331	\N	94	70
2602	user_1405998665	2014-07-21 23:11:05.504679	2014-07-21 23:11:05.509995	\N	94	70
2603	user_1405999077	2014-07-21 23:17:57.384494	2014-07-21 23:17:57.38898	\N	94	70
2604	user_1405999087	2014-07-21 23:18:07.729649	2014-07-21 23:18:07.734603	\N	94	70
2605	user_1405999102	2014-07-21 23:18:22.920353	2014-07-21 23:18:22.925256	\N	94	70
2606	user_1405999786	2014-07-21 23:29:46.236333	2014-07-21 23:29:46.241329	\N	94	79
2607	user_1406004911	2014-07-22 00:55:11.094509	2014-07-22 00:55:11.098163	\N	94	70
2608	user_1406005063	2014-07-22 00:57:43.165966	2014-07-22 00:57:43.171253	\N	94	70
2609	user_1406005079	2014-07-22 00:57:59.234547	2014-07-22 00:57:59.237404	\N	94	70
2610	user_1406005260	2014-07-22 01:01:00.547386	2014-07-22 01:01:00.552853	\N	94	70
2611	user_1406005362	2014-07-22 01:02:42.963164	2014-07-22 01:02:42.968056	\N	94	70
2612	user_1406005368	2014-07-22 01:02:48.786399	2014-07-22 01:02:48.790733	\N	94	70
2613	user_1406005376	2014-07-22 01:02:56.953336	2014-07-22 01:02:56.956908	\N	94	70
2614	user_1406005485	2014-07-22 01:04:45.039355	2014-07-22 01:04:45.044278	\N	94	70
2615	user_1406005509	2014-07-22 01:05:09.05696	2014-07-22 01:05:09.061321	\N	94	70
2616	user_1406005859	2014-07-22 01:10:59.876429	2014-07-22 01:10:59.881602	\N	94	70
2617	user_1406006260	2014-07-22 01:17:40.327165	2014-07-22 01:17:40.332526	\N	94	70
2618	user_1406006284	2014-07-22 01:18:04.622442	2014-07-22 01:18:04.625452	\N	94	70
2619	user_1406006300	2014-07-22 01:18:20.840313	2014-07-22 01:18:20.842862	\N	94	70
2620	user_1406006401	2014-07-22 01:20:01.229913	2014-07-22 01:20:01.234613	\N	94	70
2621	user_1406006430	2014-07-22 01:20:30.249757	2014-07-22 01:20:30.254218	\N	94	70
2622	user_1406006465	2014-07-22 01:21:05.889361	2014-07-22 01:21:05.894663	\N	94	70
2725	client_1406053464	2014-07-22 14:24:24.806606	2014-07-22 14:24:24.806606	\N	98	80
2726	therapist_1406053464	2014-07-22 14:24:24.81055	2014-07-22 14:24:24.81055	\N	99	80
2727	client_1406053918	2014-07-22 14:31:58.960191	2014-07-22 14:31:58.960191	\N	100	81
2728	therapist_1406053918	2014-07-22 14:31:58.961853	2014-07-22 14:31:58.961853	\N	101	81
2776	user_1406069203	2014-07-22 18:46:43.405774	2014-07-22 18:46:43.409416	\N	94	79
2777	user_1406069223	2014-07-22 18:47:03.794574	2014-07-22 18:47:03.798451	\N	94	79
2778	user_1406069248	2014-07-22 18:47:28.232369	2014-07-22 18:47:28.235498	\N	94	79
2779	user_1406069261	2014-07-22 18:47:41.576208	2014-07-22 18:47:41.581115	\N	94	79
2780	user_1406069396	2014-07-22 18:49:56.407016	2014-07-22 18:49:56.414698	\N	94	79
2781	user_1406069410	2014-07-22 18:50:10.868091	2014-07-22 18:50:10.870764	\N	94	79
2782	user_1406069432	2014-07-22 18:50:32.196239	2014-07-22 18:50:32.199282	\N	94	79
2783	user_1406069971	2014-07-22 18:59:31.817533	2014-07-22 18:59:31.824484	\N	94	79
2784	user_1406069995	2014-07-22 18:59:55.644115	2014-07-22 18:59:55.65001	\N	94	79
2785	user_1406070082	2014-07-22 19:01:22.384193	2014-07-22 19:01:22.38959	\N	94	79
2786	user_1406070323	2014-07-22 19:05:23.074819	2014-07-22 19:05:23.081418	\N	94	79
2787	user_1406070637	2014-07-22 19:10:37.309343	2014-07-22 19:10:37.316226	\N	94	79
2788	user_1406070655	2014-07-22 19:10:55.691787	2014-07-22 19:10:55.695927	\N	94	79
2789	user_1406070699	2014-07-22 19:11:39.438532	2014-07-22 19:11:39.442624	\N	94	79
2790	user_1406070802	2014-07-22 19:13:22.365774	2014-07-22 19:13:22.370971	\N	94	79
2791	user_1406070880	2014-07-22 19:14:40.515765	2014-07-22 19:14:40.519895	\N	94	79
2792	user_1406079164	2014-07-22 21:32:44.456624	2014-07-22 21:32:44.463197	\N	94	79
2793	user_1406082170	2014-07-22 22:22:50.018953	2014-07-22 22:22:50.022605	\N	94	79
2794	user_1406082544	2014-07-22 22:29:04.991566	2014-07-22 22:29:04.99653	\N	94	79
2795	user_1406082922	2014-07-22 22:35:22.220327	2014-07-22 22:35:22.2274	\N	94	79
2796	user_1406082938	2014-07-22 22:35:38.800902	2014-07-22 22:35:38.804885	\N	94	79
2797	user_1406139594	2014-07-23 14:19:54.318477	2014-07-23 14:19:54.327867	\N	94	79
2798	user_1406139607	2014-07-23 14:20:07.48423	2014-07-23 14:20:07.488344	\N	94	79
2799	user_1406139621	2014-07-23 14:20:21.261925	2014-07-23 14:20:21.265969	\N	94	79
2800	user_1406139650	2014-07-23 14:20:50.247607	2014-07-23 14:20:50.25301	\N	94	79
2801	user_1406139674	2014-07-23 14:21:14.536636	2014-07-23 14:21:14.539659	\N	94	79
2198	user_1405847022	2014-07-20 05:03:42.285539	2014-07-20 05:03:42.289352	\N	94	79
2199	user_1405847037hey	2014-07-20 05:03:57.225526	2014-07-20 05:04:01.116474	\N	94	79
2200	user_1405847110	2014-07-20 05:05:10.366822	2014-07-20 05:05:10.370134	\N	94	79
2245	Therapist2	2014-07-20 15:20:48.333054	2014-07-22 13:12:46.899998	Santiago	90	73
2201	user_1405847201	2014-07-20 05:06:41.637368	2014-07-20 05:06:41.641402	\N	94	79
2202	user_1405847226	2014-07-20 05:07:06.146208	2014-07-20 05:07:06.149096	\N	94	79
2203	user_1405847288	2014-07-20 05:08:08.463749	2014-07-20 05:08:08.468933	\N	94	79
2204	user_1405847388	2014-07-20 05:09:48.452606	2014-07-20 05:09:48.458109	\N	94	79
2205	user_1405847427	2014-07-20 05:10:27.292393	2014-07-20 05:10:27.295155	\N	94	79
2206	user_1405847449	2014-07-20 05:10:49.290827	2014-07-20 05:10:49.29545	\N	94	79
2207	user_1405847470	2014-07-20 05:11:10.107825	2014-07-20 05:11:10.110725	\N	94	79
2208	user_1405847508	2014-07-20 05:11:48.488202	2014-07-20 05:11:48.491296	\N	94	79
2209	user_1405847534	2014-07-20 05:12:14.83519	2014-07-20 05:12:14.838414	\N	94	79
2210	user_1405847562	2014-07-20 05:12:42.311632	2014-07-20 05:12:42.314924	\N	94	79
2211	user_1405847579	2014-07-20 05:12:59.900723	2014-07-20 05:12:59.90343	\N	94	79
2212	user_1405847596	2014-07-20 05:13:16.275574	2014-07-20 05:13:16.278964	\N	94	79
2213	user_1405847630	2014-07-20 05:13:50.052735	2014-07-20 05:13:50.05647	\N	94	79
2214	user_1405847649	2014-07-20 05:14:09.316483	2014-07-20 05:14:09.320893	\N	94	79
2215	user_1405847685	2014-07-20 05:14:45.850872	2014-07-20 05:14:45.855668	\N	94	79
2216	user_1405847726	2014-07-20 05:15:26.803218	2014-07-20 05:15:26.807892	\N	94	79
2217	user_1405847787	2014-07-20 05:16:27.268149	2014-07-20 05:16:27.27119	\N	94	79
2218	user_1405847808	2014-07-20 05:16:48.822464	2014-07-20 05:16:48.826188	\N	94	79
2219	user_1405847850	2014-07-20 05:17:30.872615	2014-07-20 05:17:30.87517	\N	94	79
2220	user_1405847867	2014-07-20 05:17:47.69397	2014-07-20 05:17:47.697677	\N	94	79
2221	user_1405847875	2014-07-20 05:17:55.845182	2014-07-20 05:17:55.848108	\N	94	79
2222	user_1405847985	2014-07-20 05:19:45.716704	2014-07-20 05:19:45.721805	\N	94	79
2223	user_1405848010	2014-07-20 05:20:10.788684	2014-07-20 05:20:10.792687	\N	94	79
2224	user_1405848038	2014-07-20 05:20:38.859605	2014-07-20 05:20:38.862933	\N	94	79
2225	user_1405848067	2014-07-20 05:21:07.120602	2014-07-20 05:21:07.124646	\N	94	79
2226	user_1405848120	2014-07-20 05:22:00.426804	2014-07-20 05:22:00.430938	\N	94	79
2227	user_1405848169	2014-07-20 05:22:49.408159	2014-07-20 05:22:49.413542	\N	94	79
2228	user_1405848198	2014-07-20 05:23:18.574897	2014-07-20 05:23:18.577896	\N	94	79
2229	user_1405848219	2014-07-20 05:23:39.087855	2014-07-20 05:23:39.091805	\N	94	79
2230	user_1405848237	2014-07-20 05:23:57.647958	2014-07-20 05:23:57.652948	\N	94	79
2231	user_1405848299	2014-07-20 05:24:59.384679	2014-07-20 05:24:59.389058	\N	94	79
2232	user_1405848328	2014-07-20 05:25:28.861395	2014-07-20 05:25:28.866181	\N	94	79
2233	user_1405879121	2014-07-20 13:58:41.117835	2014-07-20 13:58:41.126115	\N	94	79
2234	user_1405879156	2014-07-20 13:59:16.082093	2014-07-20 13:59:16.086311	\N	94	79
2235	user_1405879236	2014-07-20 14:00:36.474722	2014-07-20 14:00:36.478167	\N	94	79
2236	user_1405879281	2014-07-20 14:01:21.134224	2014-07-20 14:01:21.138493	\N	94	79
2237	user_1405879306	2014-07-20 14:01:46.211352	2014-07-20 14:01:46.216524	\N	94	79
2238	user_1405879685	2014-07-20 14:08:05.52946	2014-07-20 14:08:05.534417	\N	94	79
2239	user_1405879695	2014-07-20 14:08:15.83481	2014-07-20 14:08:15.83867	\N	94	79
2240	user_1405879897	2014-07-20 14:11:37.058039	2014-07-20 14:11:37.063633	\N	94	79
2241	user_1405879927	2014-07-20 14:12:07.085048	2014-07-20 14:12:07.088661	\N	94	79
2242	user_1405880006	2014-07-20 14:13:26.287726	2014-07-20 14:13:26.292962	\N	94	79
2243	user_1405880030	2014-07-20 14:13:50.241915	2014-07-20 14:13:50.245244	\N	94	79
2264	user_1405886512	2014-07-20 16:01:52.178961	2014-07-20 16:01:52.182265	\N	94	70
2265	user_1405886529	2014-07-20 16:02:09.532286	2014-07-20 16:02:09.536513	\N	94	70
2246	yo	2014-07-20 15:27:14.905736	2014-07-20 15:27:20.242725	\N	94	70
2247	user_1405885334	2014-07-20 15:42:14.035106	2014-07-20 15:42:14.039838	\N	94	70
2248	user_1405885403	2014-07-20 15:43:23.677062	2014-07-20 15:43:23.682184	\N	94	70
2249	user_1405885491	2014-07-20 15:44:51.037749	2014-07-20 15:44:51.04257	\N	94	70
2250	user_1405885511	2014-07-20 15:45:11.691679	2014-07-20 15:45:11.695455	\N	94	70
2251	user_1405885522	2014-07-20 15:45:22.84915	2014-07-20 15:45:22.853959	\N	94	70
2252	user_1405885925	2014-07-20 15:52:05.548207	2014-07-20 15:52:05.553363	\N	94	70
2253	user_1405885961	2014-07-20 15:52:41.22495	2014-07-20 15:52:41.229339	\N	94	70
2254	user_1405886010	2014-07-20 15:53:30.305018	2014-07-20 15:53:30.309678	\N	94	70
2255	user_1405886060	2014-07-20 15:54:20.163043	2014-07-20 15:54:20.167424	\N	94	70
2256	user_1405886177	2014-07-20 15:56:17.615274	2014-07-20 15:56:17.619537	\N	94	70
2257	user_1405886189	2014-07-20 15:56:29.071989	2014-07-20 15:56:29.07544	\N	94	70
2258	user_1405886214	2014-07-20 15:56:54.35585	2014-07-20 15:56:54.362027	\N	94	70
2259	user_1405886233	2014-07-20 15:57:13.103782	2014-07-20 15:57:13.10864	\N	94	70
2260	user_1405886288	2014-07-20 15:58:08.057359	2014-07-20 15:58:08.063122	\N	94	70
2261	user_1405886340	2014-07-20 15:59:00.910425	2014-07-20 15:59:00.915881	\N	94	70
2262	user_1405886354	2014-07-20 15:59:14.984743	2014-07-20 15:59:14.987288	\N	94	70
2263	user_1405886487	2014-07-20 16:01:27.203563	2014-07-20 16:01:27.206713	\N	94	70
2266	user_1405886557	2014-07-20 16:02:37.947043	2014-07-20 16:02:37.949697	\N	94	70
2267	user_1405886568	2014-07-20 16:02:48.434972	2014-07-20 16:02:48.439825	\N	94	70
2268	user_1405886598	2014-07-20 16:03:18.758538	2014-07-20 16:03:18.762207	\N	94	70
2269	user_1405886602	2014-07-20 16:03:22.983427	2014-07-20 16:03:22.987156	\N	94	70
2270	user_1405886632	2014-07-20 16:03:52.617139	2014-07-20 16:03:52.620753	\N	94	70
2271	user_1405886642	2014-07-20 16:04:02.100351	2014-07-20 16:04:02.104241	\N	94	70
2272	user_1405886656	2014-07-20 16:04:16.44011	2014-07-20 16:04:16.443022	\N	94	70
2273	user_1405886668	2014-07-20 16:04:28.017737	2014-07-20 16:04:28.021938	\N	94	70
2274	user_1405886727	2014-07-20 16:05:27.391516	2014-07-20 16:05:27.397132	\N	94	70
2275	user_1405886736	2014-07-20 16:05:36.745647	2014-07-20 16:05:36.749059	\N	94	70
2276	user_1405886742	2014-07-20 16:05:42.462046	2014-07-20 16:05:42.466802	\N	94	70
2277	user_1405886748	2014-07-20 16:05:48.274123	2014-07-20 16:05:48.277372	\N	94	70
2278	user_1405886761	2014-07-20 16:06:01.058879	2014-07-20 16:06:01.06184	\N	94	70
2279	user_1405886767	2014-07-20 16:06:07.166503	2014-07-20 16:06:07.168995	\N	94	70
2280	user_1405886779	2014-07-20 16:06:19.580173	2014-07-20 16:06:19.583265	\N	94	70
2281	user_1405886784	2014-07-20 16:06:24.827411	2014-07-20 16:06:24.830095	\N	94	70
2282	user_1405886792	2014-07-20 16:06:32.112736	2014-07-20 16:06:32.117652	\N	94	70
2283	user_1405886859	2014-07-20 16:07:39.343686	2014-07-20 16:07:39.349294	\N	94	70
2284	user_1405886883	2014-07-20 16:08:03.23057	2014-07-20 16:08:03.234404	\N	94	70
2285	user_1405886958	2014-07-20 16:09:18.397686	2014-07-20 16:09:18.401482	\N	94	70
2286	user_1405886980	2014-07-20 16:09:40.491344	2014-07-20 16:09:40.494385	\N	94	70
2287	user_1405886993	2014-07-20 16:09:53.064219	2014-07-20 16:09:53.06948	\N	94	70
2288	user_1405886995	2014-07-20 16:09:55.312883	2014-07-20 16:09:55.31738	\N	94	70
2289	user_1405887037	2014-07-20 16:10:37.930168	2014-07-20 16:10:37.93458	\N	94	70
2290	user_1405887121	2014-07-20 16:12:01.969543	2014-07-20 16:12:01.975112	\N	94	70
2623	user_1406006513	2014-07-22 01:21:53.71862	2014-07-22 01:21:53.724621	\N	94	70
2291	user_1405887127	2014-07-20 16:12:07.370442	2014-07-20 16:12:07.374592	\N	94	70
2292	user_1405887148	2014-07-20 16:12:28.307143	2014-07-20 16:12:28.310194	\N	94	70
2624	user_1406006529	2014-07-22 01:22:09.985122	2014-07-22 01:22:09.989318	\N	94	70
2293	user_1405887169	2014-07-20 16:12:48.929544	2014-07-20 16:12:49.051075	\N	94	70
2294	user_1405887175	2014-07-20 16:12:55.842084	2014-07-20 16:12:55.846943	\N	94	70
2625	user_1406006638	2014-07-22 01:23:58.592682	2014-07-22 01:23:58.597349	\N	94	70
2295	user_1405887199	2014-07-20 16:13:19.853681	2014-07-20 16:13:19.856813	\N	94	70
2296	user_1405887205	2014-07-20 16:13:25.034018	2014-07-20 16:13:25.0394	\N	94	70
2626	user_1406006682	2014-07-22 01:24:42.064381	2014-07-22 01:24:42.068805	\N	94	79
2297	user_1405887211	2014-07-20 16:13:31.479959	2014-07-20 16:13:31.484512	\N	94	70
2298	user_1405887250	2014-07-20 16:14:10.324557	2014-07-20 16:14:10.330277	\N	94	70
2627	user_1406006759	2014-07-22 01:25:59.030596	2014-07-22 01:25:59.033661	\N	94	79
2299	user_1405887310	2014-07-20 16:15:10.013862	2014-07-20 16:15:10.017373	\N	94	70
2300	user_1405887363	2014-07-20 16:16:03.715645	2014-07-20 16:16:03.718683	\N	94	70
2628	user_1406006881	2014-07-22 01:28:01.710361	2014-07-22 01:28:01.714772	\N	94	79
2301	user_1405887373	2014-07-20 16:16:13.833146	2014-07-20 16:16:13.835783	\N	94	70
2302	user_1405887502	2014-07-20 16:18:22.20311	2014-07-20 16:18:22.207547	\N	94	70
2629	user_1406006917	2014-07-22 01:28:37.159025	2014-07-22 01:28:37.162961	\N	94	79
2303	user_1405887570	2014-07-20 16:19:30.761345	2014-07-20 16:19:30.766385	\N	94	70
2304	user_1405887581	2014-07-20 16:19:41.839779	2014-07-20 16:19:41.845273	\N	94	70
2630	user_1406007076	2014-07-22 01:31:16.344395	2014-07-22 01:31:16.349733	\N	94	79
2305	user_1405887593	2014-07-20 16:19:53.901807	2014-07-20 16:19:53.996247	\N	94	70
2306	user_1405887658	2014-07-20 16:20:58.361608	2014-07-20 16:20:58.367561	\N	94	70
2631	user_1406007094	2014-07-22 01:31:34.38632	2014-07-22 01:31:34.39058	\N	94	79
2307	user_1405887679	2014-07-20 16:21:19.313093	2014-07-20 16:21:19.315883	\N	94	70
2308	user_1405887699	2014-07-20 16:21:39.807342	2014-07-20 16:21:39.810202	\N	94	70
2632	user_1406007556	2014-07-22 01:39:16.759056	2014-07-22 01:39:16.763939	\N	94	79
2309	user_1405887736	2014-07-20 16:22:16.71945	2014-07-20 16:22:16.7225	\N	94	70
2310	user_1405887773	2014-07-20 16:22:53.674477	2014-07-20 16:22:53.678212	\N	94	70
2633	user_1406007733	2014-07-22 01:42:13.921978	2014-07-22 01:42:13.927466	\N	94	79
2311	user_1405887900	2014-07-20 16:25:00.425919	2014-07-20 16:25:00.43112	\N	94	70
2312	user_1405887917	2014-07-20 16:25:17.537385	2014-07-20 16:25:17.54014	\N	94	70
2634	user_1406007743	2014-07-22 01:42:23.577704	2014-07-22 01:42:23.581353	\N	94	79
2313	user_1405888001	2014-07-20 16:26:41.504015	2014-07-20 16:26:41.508188	\N	94	70
2314	user_1405888095	2014-07-20 16:28:15.866712	2014-07-20 16:28:15.871432	\N	94	70
2635	user_1406007766	2014-07-22 01:42:46.104729	2014-07-22 01:42:46.109333	\N	94	79
2315	user_1405888336	2014-07-20 16:32:16.749846	2014-07-20 16:32:16.75415	\N	94	70
2316	user_1405888351	2014-07-20 16:32:31.150899	2014-07-20 16:32:31.15351	\N	94	70
2636	user_1406007876	2014-07-22 01:44:36.439267	2014-07-22 01:44:36.444727	\N	94	79
2317	user_1405888381	2014-07-20 16:33:01.621122	2014-07-20 16:33:01.62531	\N	94	70
2318	user_1405888413	2014-07-20 16:33:33.83356	2014-07-20 16:33:33.837792	\N	94	70
2637	user_1406007910	2014-07-22 01:45:10.971571	2014-07-22 01:45:10.977539	\N	94	79
2319	user_1405888440	2014-07-20 16:34:00.610723	2014-07-20 16:34:00.613845	\N	94	70
2320	user_1405888449	2014-07-20 16:34:09.976791	2014-07-20 16:34:09.980739	\N	94	70
2638	user_1406007937	2014-07-22 01:45:37.970665	2014-07-22 01:45:37.976061	\N	94	79
2321	user_1405888453	2014-07-20 16:34:13.130051	2014-07-20 16:34:13.132739	\N	94	70
2322	user_1405888490	2014-07-20 16:34:50.966849	2014-07-20 16:34:50.971053	\N	94	70
2639	user_1406007967	2014-07-22 01:46:07.02516	2014-07-22 01:46:07.029186	\N	94	79
2323	user_1405888494	2014-07-20 16:34:54.783514	2014-07-20 16:34:54.787458	\N	94	70
2324	user_1405888497	2014-07-20 16:34:57.805167	2014-07-20 16:34:57.809347	\N	94	70
2640	user_1406007990	2014-07-22 01:46:30.081342	2014-07-22 01:46:30.084228	\N	94	79
2325	user_1405888518	2014-07-20 16:35:18.389487	2014-07-20 16:35:18.392572	\N	94	70
2326	user_1405888521	2014-07-20 16:35:21.925812	2014-07-20 16:35:21.9282	\N	94	70
2641	user_1406008009	2014-07-22 01:46:49.257544	2014-07-22 01:46:49.261145	\N	94	79
2327	user_1405888532	2014-07-20 16:35:32.534423	2014-07-20 16:35:32.53876	\N	94	70
2328	user_1405888548	2014-07-20 16:35:48.948208	2014-07-20 16:35:48.953277	\N	94	70
2642	user_1406008027	2014-07-22 01:47:07.823274	2014-07-22 01:47:07.828963	\N	94	79
2643	user_1406008513	2014-07-22 01:55:13.743315	2014-07-22 01:55:13.747778	\N	94	79
2644	user_1406008643	2014-07-22 01:57:23.003906	2014-07-22 01:57:23.009416	\N	94	79
2645	user_1406008671	2014-07-22 01:57:51.120159	2014-07-22 01:57:51.127385	\N	94	79
2646	user_1406008696	2014-07-22 01:58:16.664575	2014-07-22 01:58:16.67425	\N	94	79
2647	user_1406008733	2014-07-22 01:58:53.94132	2014-07-22 01:58:53.945534	\N	94	79
2648	user_1406008753	2014-07-22 01:59:13.979888	2014-07-22 01:59:13.984061	\N	94	79
2649	user_1406008780	2014-07-22 01:59:40.813619	2014-07-22 01:59:40.817976	\N	94	79
2650	user_1406009209	2014-07-22 02:06:49.62449	2014-07-22 02:06:49.630407	\N	94	79
2651	user_1406009388	2014-07-22 02:09:48.225429	2014-07-22 02:09:48.231051	\N	94	79
2652	user_1406009400	2014-07-22 02:10:00.590232	2014-07-22 02:10:00.593357	\N	94	79
2653	user_1406009439	2014-07-22 02:10:39.360667	2014-07-22 02:10:39.364842	\N	94	79
2654	user_1406011083	2014-07-22 02:38:03.496658	2014-07-22 02:38:03.501376	\N	94	79
2655	user_1406011099	2014-07-22 02:38:19.744284	2014-07-22 02:38:19.749269	\N	94	79
2656	user_1406011164	2014-07-22 02:39:24.200341	2014-07-22 02:39:24.208609	\N	94	79
2657	user_1406011197	2014-07-22 02:39:57.023283	2014-07-22 02:39:57.032067	\N	94	79
2658	user_1406011228	2014-07-22 02:40:28.889801	2014-07-22 02:40:28.897354	\N	94	79
2659	user_1406011317	2014-07-22 02:41:57.235692	2014-07-22 02:41:57.239798	\N	94	79
2660	user_1406011353	2014-07-22 02:42:33.975025	2014-07-22 02:42:33.980308	\N	94	79
2661	user_1406011442	2014-07-22 02:44:02.710382	2014-07-22 02:44:02.714975	\N	94	79
2662	user_1406011458	2014-07-22 02:44:18.121073	2014-07-22 02:44:18.124406	\N	94	79
2663	user_1406011501	2014-07-22 02:45:01.298678	2014-07-22 02:45:01.302726	\N	94	79
2664	user_1406011516	2014-07-22 02:45:16.727277	2014-07-22 02:45:16.733939	\N	94	79
2665	user_1406011778	2014-07-22 02:49:38.685236	2014-07-22 02:49:38.690136	\N	94	79
2666	user_1406011799	2014-07-22 02:49:59.690752	2014-07-22 02:49:59.694202	\N	94	79
2667	user_1406012093	2014-07-22 02:54:53.131851	2014-07-22 02:54:53.137876	\N	94	79
2668	user_1406012137	2014-07-22 02:55:37.171529	2014-07-22 02:55:37.175551	\N	94	79
2669	user_1406012280	2014-07-22 02:58:00.848237	2014-07-22 02:58:00.851478	\N	94	70
2670	user_1406012284	2014-07-22 02:58:04.286325	2014-07-22 02:58:04.293773	\N	94	79
2671	user_1406012395	2014-07-22 02:59:55.140542	2014-07-22 02:59:55.144715	\N	94	79
2672	user_1406012436	2014-07-22 03:00:36.644328	2014-07-22 03:00:36.648041	\N	94	79
2673	user_1406012528	2014-07-22 03:02:08.766255	2014-07-22 03:02:08.770145	\N	94	79
2674	user_1406012555	2014-07-22 03:02:35.514678	2014-07-22 03:02:35.517639	\N	94	79
2675	user_1406013136	2014-07-22 03:12:16.113398	2014-07-22 03:12:16.119391	\N	94	79
2676	user_1406013171	2014-07-22 03:12:51.165665	2014-07-22 03:12:51.170458	\N	94	79
2329	user_1405888618	2014-07-20 16:36:58.458977	2014-07-20 16:36:58.462975	\N	94	70
2330	user_1405891182	2014-07-20 17:19:42.168202	2014-07-20 17:19:42.172735	\N	94	70
2331	user_1405891220	2014-07-20 17:20:20.372494	2014-07-20 17:20:20.376645	\N	94	70
2332	user_1405891244	2014-07-20 17:20:44.981811	2014-07-20 17:20:44.984671	\N	94	70
2333	user_1405891255	2014-07-20 17:20:55.831514	2014-07-20 17:20:55.836044	\N	94	70
2334	user_1405891279	2014-07-20 17:21:19.079947	2014-07-20 17:21:19.083676	\N	94	70
2335	user_1405891358	2014-07-20 17:22:38.29137	2014-07-20 17:22:38.296329	\N	94	79
2336	user_1405891427	2014-07-20 17:23:47.217446	2014-07-20 17:23:47.221858	\N	94	79
2337	user_1405891546	2014-07-20 17:25:46.898651	2014-07-20 17:25:46.902628	\N	94	70
2338	user_1405891673	2014-07-20 17:27:53.31919	2014-07-20 17:27:53.322719	\N	94	70
2339	user_1405891692	2014-07-20 17:28:12.381361	2014-07-20 17:28:12.385489	\N	94	70
2340	user_1405891809	2014-07-20 17:30:09.936043	2014-07-20 17:30:09.939519	\N	94	70
2341	user_1405891835	2014-07-20 17:30:35.357398	2014-07-20 17:30:35.359944	\N	94	70
2342	user_1405891857	2014-07-20 17:30:57.239402	2014-07-20 17:30:57.242464	\N	94	70
2343	user_1405891873	2014-07-20 17:31:13.134377	2014-07-20 17:31:13.137519	\N	94	70
2344	user_1405891932	2014-07-20 17:32:12.650122	2014-07-20 17:32:12.655586	\N	94	79
2345	user_1405906956	2014-07-20 21:42:36.48425	2014-07-20 21:42:36.48795	\N	94	70
2346	user_1405906970	2014-07-20 21:42:50.285273	2014-07-20 21:42:50.28844	\N	94	70
2347	user_1405906979	2014-07-20 21:42:59.177004	2014-07-20 21:42:59.180023	\N	94	70
2348	user_1405906993	2014-07-20 21:43:13.403802	2014-07-20 21:43:13.40617	\N	94	70
2349	user_1405907013	2014-07-20 21:43:33.985358	2014-07-20 21:43:33.988254	\N	94	70
2350	user_1405907072	2014-07-20 21:44:32.719868	2014-07-20 21:44:32.724036	\N	94	70
2351	user_1405907111	2014-07-20 21:45:11.420382	2014-07-20 21:45:11.425309	\N	94	70
2352	user_1405907141	2014-07-20 21:45:41.810776	2014-07-20 21:45:41.816893	\N	94	70
2353	user_1405907229	2014-07-20 21:47:09.972151	2014-07-20 21:47:09.977362	\N	94	70
2354	user_1405907255	2014-07-20 21:47:35.458039	2014-07-20 21:47:35.461525	\N	94	70
2355	user_1405907266	2014-07-20 21:47:46.370415	2014-07-20 21:47:46.375537	\N	94	70
2356	user_1405907288	2014-07-20 21:48:08.439318	2014-07-20 21:48:08.443985	\N	94	70
2357	user_1405907361	2014-07-20 21:49:21.276882	2014-07-20 21:49:21.282644	\N	94	70
2358	user_1405907385	2014-07-20 21:49:45.159574	2014-07-20 21:49:45.162782	\N	94	70
2359	user_1405907423	2014-07-20 21:50:23.544405	2014-07-20 21:50:23.548599	\N	94	70
2360	user_1405907469	2014-07-20 21:51:09.015878	2014-07-20 21:51:09.020619	\N	94	70
2361	user_1405907498	2014-07-20 21:51:38.314326	2014-07-20 21:51:38.409923	\N	94	70
2362	user_1405907515	2014-07-20 21:51:55.003906	2014-07-20 21:51:55.007567	\N	94	70
2363	user_1405907543	2014-07-20 21:52:23.79175	2014-07-20 21:52:23.795041	\N	94	70
2364	user_1405907553	2014-07-20 21:52:33.024276	2014-07-20 21:52:33.026962	\N	94	70
2365	user_1405907561	2014-07-20 21:52:41.034925	2014-07-20 21:52:41.038192	\N	94	70
2366	user_1405908104	2014-07-20 22:01:44.038625	2014-07-20 22:01:44.043727	\N	94	70
2367	user_1405908128	2014-07-20 22:02:08.239395	2014-07-20 22:02:08.242563	\N	94	70
2368	user_1405908225	2014-07-20 22:03:45.811357	2014-07-20 22:03:45.816447	\N	94	70
2369	user_1405908324	2014-07-20 22:05:24.350089	2014-07-20 22:05:24.356691	\N	94	70
2370	user_1405908364	2014-07-20 22:06:04.855786	2014-07-20 22:06:04.860756	\N	94	70
2371	user_1405908381	2014-07-20 22:06:21.660786	2014-07-20 22:06:21.663418	\N	94	70
2372	user_1405908479	2014-07-20 22:07:59.096942	2014-07-20 22:07:59.100598	\N	94	70
2373	user_1405908993	2014-07-20 22:16:33.352408	2014-07-20 22:16:33.356668	\N	94	70
2374	user_1405909328	2014-07-20 22:22:08.126951	2014-07-20 22:22:08.133413	\N	94	79
2375	user_1405909356	2014-07-20 22:22:36.512923	2014-07-20 22:22:36.51544	\N	94	79
2376	user_1405909361	2014-07-20 22:22:41.875513	2014-07-20 22:22:41.879449	\N	94	79
2377	user_1405909367	2014-07-20 22:22:47.474192	2014-07-20 22:22:47.476908	\N	94	79
2378	user_1405909382	2014-07-20 22:23:02.001068	2014-07-20 22:23:02.003517	\N	94	79
2379	user_1405909388	2014-07-20 22:23:08.894839	2014-07-20 22:23:08.897627	\N	94	79
2380	user_1405909661	2014-07-20 22:27:41.97175	2014-07-20 22:27:41.978312	\N	94	79
2381	user_1405909702	2014-07-20 22:28:22.910316	2014-07-20 22:28:22.915114	\N	94	79
2382	user_1405909709	2014-07-20 22:28:29.216886	2014-07-20 22:28:29.220365	\N	94	79
2383	user_1405910133	2014-07-20 22:35:33.311143	2014-07-20 22:35:33.315897	\N	94	70
2384	user_1405910135	2014-07-20 22:35:35.646047	2014-07-20 22:35:35.650049	\N	94	70
2385	user_1405910197	2014-07-20 22:36:37.040189	2014-07-20 22:36:37.044729	\N	94	70
2386	user_1405921990	2014-07-21 01:53:10.28926	2014-07-21 01:53:10.293587	\N	94	70
2387	user_1405957272	2014-07-21 11:41:12.070485	2014-07-21 11:41:12.074542	\N	94	79
2388	user_1405957346	2014-07-21 11:42:26.379662	2014-07-21 11:42:26.385534	\N	94	79
2389	user_1405957448	2014-07-21 11:44:08.50124	2014-07-21 11:44:08.504677	\N	94	79
2390	user_1405957460	2014-07-21 11:44:20.181203	2014-07-21 11:44:20.185245	\N	94	79
2391	user_1405957510	2014-07-21 11:45:10.701826	2014-07-21 11:45:10.705145	\N	94	70
2392	user_1405957552	2014-07-21 11:45:52.329315	2014-07-21 11:45:52.334255	\N	94	70
2393	user_1405957556	2014-07-21 11:45:56.565582	2014-07-21 11:45:56.57013	\N	94	79
2394	user_1405957620	2014-07-21 11:47:00.559461	2014-07-21 11:47:00.566528	\N	94	79
2395	user_1405965728	2014-07-21 14:02:08.551616	2014-07-21 14:02:08.554548	\N	94	79
2396	user_1405975860	2014-07-21 16:51:00.909426	2014-07-21 16:51:00.921298	\N	94	79
2397	user_1405975924	2014-07-21 16:52:04.386618	2014-07-21 16:52:04.39167	\N	94	79
2398	user_1405975935	2014-07-21 16:52:15.126824	2014-07-21 16:52:15.131007	\N	94	79
2399	user_1405976316	2014-07-21 16:58:36.959966	2014-07-21 16:58:36.965117	\N	94	79
2400	user_1405976463	2014-07-21 17:01:03.123911	2014-07-21 17:01:03.128643	\N	94	79
2401	user_1405976479	2014-07-21 17:01:19.550718	2014-07-21 17:01:19.554053	\N	94	79
2402	user_1405976515	2014-07-21 17:01:55.732092	2014-07-21 17:01:55.737823	\N	94	79
2403	user_1405976628	2014-07-21 17:03:48.80243	2014-07-21 17:03:48.807462	\N	94	79
2404	user_1405977342	2014-07-21 17:15:42.158433	2014-07-21 17:15:42.163659	\N	94	79
2405	user_1405977375	2014-07-21 17:16:15.3585	2014-07-21 17:16:15.362445	\N	94	79
2406	user_1405977382	2014-07-21 17:16:22.362323	2014-07-21 17:16:22.366808	\N	94	79
2407	user_1405977489	2014-07-21 17:18:09.550513	2014-07-21 17:18:09.555767	\N	94	79
2408	user_1405977552	2014-07-21 17:19:12.106036	2014-07-21 17:19:12.111052	\N	94	79
2409	user_1405977572	2014-07-21 17:19:32.479207	2014-07-21 17:19:32.482828	\N	94	79
2410	user_1405977587	2014-07-21 17:19:47.673722	2014-07-21 17:19:47.678563	\N	94	79
2411	user_1405977683	2014-07-21 17:21:23.404905	2014-07-21 17:21:23.408393	\N	94	79
2412	user_1405977771	2014-07-21 17:22:51.117404	2014-07-21 17:22:51.12353	\N	94	79
2413	user_1405977840	2014-07-21 17:24:00.95	2014-07-21 17:24:00.952906	\N	94	79
2414	user_1405977950	2014-07-21 17:25:50.609446	2014-07-21 17:25:50.61373	\N	94	79
2415	user_1405978009	2014-07-21 17:26:49.617338	2014-07-21 17:26:49.623386	\N	94	79
2416	user_1405978032	2014-07-21 17:27:12.252764	2014-07-21 17:27:12.256951	\N	94	79
2417	user_1405978073	2014-07-21 17:27:53.552862	2014-07-21 17:27:53.557877	\N	94	79
2418	user_1405978150	2014-07-21 17:29:10.060355	2014-07-21 17:29:10.065803	\N	94	79
2419	user_1405978175	2014-07-21 17:29:35.582974	2014-07-21 17:29:35.587165	\N	94	79
2420	user_1405978334	2014-07-21 17:32:14.489627	2014-07-21 17:32:14.495006	\N	94	79
2421	user_1405978361	2014-07-21 17:32:41.78137	2014-07-21 17:32:41.786153	\N	94	79
2677	user_1406013322	2014-07-22 03:15:22.767549	2014-07-22 03:15:22.774061	\N	94	79
2422	user_1405978412	2014-07-21 17:33:32.416207	2014-07-21 17:33:32.420346	\N	94	79
2423	user_1405978476	2014-07-21 17:34:36.66541	2014-07-21 17:34:36.671218	\N	94	79
2678	user_1406013325	2014-07-22 03:15:25.291266	2014-07-22 03:15:25.295657	\N	94	70
2424	user_1405978530	2014-07-21 17:35:30.572534	2014-07-21 17:35:30.577433	\N	94	79
2425	user_1405978579	2014-07-21 17:36:19.124742	2014-07-21 17:36:19.129817	\N	94	79
2679	user_1406013370	2014-07-22 03:16:10.960021	2014-07-22 03:16:10.964259	\N	94	79
2426	user_1405978711	2014-07-21 17:38:31.491749	2014-07-21 17:38:31.495058	\N	94	79
2427	user_1405978963	2014-07-21 17:42:43.874871	2014-07-21 17:42:43.879677	\N	94	79
2680	user_1406013371	2014-07-22 03:16:11.75399	2014-07-22 03:16:11.75657	\N	94	70
2428	user_1405979038	2014-07-21 17:43:58.860839	2014-07-21 17:43:58.865806	\N	94	79
2429	user_1405979158	2014-07-21 17:45:58.4892	2014-07-21 17:45:58.495175	\N	94	79
2681	user_1406013534	2014-07-22 03:18:54.592275	2014-07-22 03:18:54.59777	\N	94	79
2430	user_1405979244	2014-07-21 17:47:24.64604	2014-07-21 17:47:24.651415	\N	94	79
2431	user_1405979254	2014-07-21 17:47:34.629556	2014-07-21 17:47:34.633642	\N	94	79
2682	user_1406013535	2014-07-22 03:18:55.405686	2014-07-22 03:18:55.410292	\N	94	79
2432	user_1405979275	2014-07-21 17:47:55.159538	2014-07-21 17:47:55.163575	\N	94	79
2433	user_1405979288	2014-07-21 17:48:08.614437	2014-07-21 17:48:08.619047	\N	94	79
2683	user_1406013570	2014-07-22 03:19:30.777868	2014-07-22 03:19:30.782094	\N	94	79
2434	user_1405979387	2014-07-21 17:49:47.550665	2014-07-21 17:49:47.555157	\N	94	79
2435	user_1405979448	2014-07-21 17:50:48.110503	2014-07-21 17:50:48.11444	\N	94	79
2684	user_1406013983	2014-07-22 03:26:23.32954	2014-07-22 03:26:23.33717	\N	94	79
2436	user_1405979461	2014-07-21 17:51:01.120323	2014-07-21 17:51:01.123306	\N	94	79
2437	user_1405979530	2014-07-21 17:52:10.668519	2014-07-21 17:52:10.673936	\N	94	79
2685	user_1406014020	2014-07-22 03:27:00.064391	2014-07-22 03:27:00.069768	\N	94	79
2438	user_1405979592	2014-07-21 17:53:12.75407	2014-07-21 17:53:12.759306	\N	94	79
2439	user_1405979879	2014-07-21 17:57:59.835668	2014-07-21 17:57:59.838678	\N	94	79
2686	user_1406014023	2014-07-22 03:27:03.224894	2014-07-22 03:27:03.231068	\N	94	70
2440	user_1405979936	2014-07-21 17:58:56.404638	2014-07-21 17:58:56.409498	\N	94	79
2441	user_1405980129	2014-07-21 18:02:09.704016	2014-07-21 18:02:09.708894	\N	94	79
2687	user_1406014036	2014-07-22 03:27:16.85905	2014-07-22 03:27:16.864323	\N	94	79
2442	user_1405980217	2014-07-21 18:03:37.29334	2014-07-21 18:03:37.29913	\N	94	79
2443	user_1405980343	2014-07-21 18:05:43.761166	2014-07-21 18:05:43.764846	\N	94	79
2688	user_1406014082	2014-07-22 03:28:02.565533	2014-07-22 03:28:02.57018	\N	94	79
2444	user_1405980370	2014-07-21 18:06:10.434184	2014-07-21 18:06:10.439287	\N	94	79
2445	user_1405980459	2014-07-21 18:07:39.71245	2014-07-21 18:07:39.716248	\N	94	79
2689	user_1406014083	2014-07-22 03:28:03.433098	2014-07-22 03:28:03.440716	\N	94	79
2446	user_1405980465	2014-07-21 18:07:45.678734	2014-07-21 18:07:45.681675	\N	94	79
2447	user_1405980466	2014-07-21 18:07:46.028299	2014-07-21 18:07:46.031712	\N	94	79
2690	user_1406014126	2014-07-22 03:28:46.702697	2014-07-22 03:28:46.708676	\N	94	79
2448	user_1405980600	2014-07-21 18:10:00.160346	2014-07-21 18:10:00.1647	\N	94	79
2449	user_1405980601	2014-07-21 18:10:01.189437	2014-07-21 18:10:01.195342	\N	94	79
2691	user_1406014128	2014-07-22 03:28:48.004463	2014-07-22 03:28:48.010509	\N	94	79
2450	user_1405980659	2014-07-21 18:10:59.521696	2014-07-21 18:10:59.524828	\N	94	79
2451	user_1405980676	2014-07-21 18:11:16.353835	2014-07-21 18:11:16.35642	\N	94	79
2692	user_1406014138	2014-07-22 03:28:58.77666	2014-07-22 03:28:58.779674	\N	94	79
2452	user_1405980691	2014-07-21 18:11:31.288843	2014-07-21 18:11:31.291839	\N	94	79
2453	user_1405980705	2014-07-21 18:11:45.492712	2014-07-21 18:11:45.49544	\N	94	79
2693	user_1406014179	2014-07-22 03:29:39.958141	2014-07-22 03:29:39.961111	\N	94	79
2454	user_1405980733	2014-07-21 18:12:13.835857	2014-07-21 18:12:13.838411	\N	94	79
2455	user_1405980780	2014-07-21 18:13:00.719733	2014-07-21 18:13:00.725166	\N	94	79
2694	user_1406014180	2014-07-22 03:29:40.931854	2014-07-22 03:29:40.936069	\N	94	79
2456	user_1405980826	2014-07-21 18:13:46.642055	2014-07-21 18:13:46.649968	\N	94	79
2457	user_1405980827	2014-07-21 18:13:47.328826	2014-07-21 18:13:47.333928	\N	94	79
2695	user_1406014199	2014-07-22 03:29:59.351833	2014-07-22 03:29:59.358775	\N	94	79
2458	user_1405981248	2014-07-21 18:20:48.409685	2014-07-21 18:20:48.415361	\N	94	79
2459	user_1405981275	2014-07-21 18:21:15.451154	2014-07-21 18:21:15.455329	\N	94	79
2696	user_1406014200	2014-07-22 03:30:00.030975	2014-07-22 03:30:00.037559	\N	94	79
2460	user_1405981304	2014-07-21 18:21:44.400808	2014-07-21 18:21:44.40585	\N	94	79
2461	user_1405981813	2014-07-21 18:30:13.320872	2014-07-21 18:30:13.326616	\N	94	79
2697	user_1406014229	2014-07-22 03:30:29.104227	2014-07-22 03:30:29.110524	\N	94	79
2462	user_1405981837	2014-07-21 18:30:37.152177	2014-07-21 18:30:37.156447	\N	94	79
2463	user_1405981902	2014-07-21 18:31:42.11004	2014-07-21 18:31:42.117367	\N	94	79
2698	user_1406014229	2014-07-22 03:30:29.92604	2014-07-22 03:30:29.93016	\N	94	79
2464	user_1405981921	2014-07-21 18:32:01.48623	2014-07-21 18:32:01.492354	\N	94	79
2465	user_1405981928	2014-07-21 18:32:08.056516	2014-07-21 18:32:08.059646	\N	94	79
2699	user_1406014237	2014-07-22 03:30:37.665928	2014-07-22 03:30:37.674735	\N	94	79
2466	user_1405981939	2014-07-21 18:32:19.089382	2014-07-21 18:32:19.093618	\N	94	79
2467	user_1405982056	2014-07-21 18:34:16.785828	2014-07-21 18:34:16.790734	\N	94	79
2700	user_1406014519	2014-07-22 03:35:19.44777	2014-07-22 03:35:19.450668	\N	94	79
2468	user_1405982153	2014-07-21 18:35:53.780041	2014-07-21 18:35:53.784323	\N	94	79
2701	user_1406014520	2014-07-22 03:35:20.362581	2014-07-22 03:35:20.367712	\N	94	79
2702	user_1406014537	2014-07-22 03:35:37.350216	2014-07-22 03:35:37.353562	\N	94	79
2703	user_1406014546	2014-07-22 03:35:46.144165	2014-07-22 03:35:46.151477	\N	94	79
2704	user_1406014627	2014-07-22 03:37:07.218158	2014-07-22 03:37:07.223125	\N	94	79
2705	user_1406014628	2014-07-22 03:37:08.186299	2014-07-22 03:37:08.190649	\N	94	79
2706	user_1406014641	2014-07-22 03:37:21.928622	2014-07-22 03:37:21.931131	\N	94	79
2707	user_1406014716	2014-07-22 03:38:36.872009	2014-07-22 03:38:36.875309	\N	94	79
2708	user_1406014718	2014-07-22 03:38:38.786163	2014-07-22 03:38:38.794364	\N	94	79
2709	user_1406014730	2014-07-22 03:38:50.838549	2014-07-22 03:38:50.84631	\N	94	79
2710	user_1406014731	2014-07-22 03:38:51.974938	2014-07-22 03:38:51.979475	\N	94	79
2711	user_1406014760	2014-07-22 03:39:20.762924	2014-07-22 03:39:20.767408	\N	94	79
2712	user_1406014782	2014-07-22 03:39:42.334005	2014-07-22 03:39:42.337209	\N	94	79
2713	user_1406014994	2014-07-22 03:43:14.532736	2014-07-22 03:43:14.541318	\N	94	79
2714	user_1406015001	2014-07-22 03:43:21.593348	2014-07-22 03:43:21.596075	\N	94	79
2715	user_1406015002	2014-07-22 03:43:22.422825	2014-07-22 03:43:22.428405	\N	94	79
2716	user_1406045484	2014-07-22 12:11:24.659965	2014-07-22 12:11:24.668011	\N	94	79
2717	user_1406045498	2014-07-22 12:11:38.546919	2014-07-22 12:11:38.549556	\N	94	79
2718	user_1406045499	2014-07-22 12:11:39.809645	2014-07-22 12:11:39.816432	\N	94	79
2719	user_1406045640	2014-07-22 12:14:00.036537	2014-07-22 12:14:00.041799	\N	94	79
2720	user_1406045641	2014-07-22 12:14:01.307257	2014-07-22 12:14:01.313578	\N	94	79
2721	user_1406046035	2014-07-22 12:20:35.505506	2014-07-22 12:20:35.511879	\N	94	79
2722	user_1406046081	2014-07-22 12:21:21.234724	2014-07-22 12:21:21.2375	\N	94	70
2469	user_1405982191	2014-07-21 18:36:31.641257	2014-07-21 18:36:31.646504	\N	94	79
2470	user_1405982212	2014-07-21 18:36:52.676015	2014-07-21 18:36:52.680804	\N	94	79
2471	user_1405982229	2014-07-21 18:37:09.405696	2014-07-21 18:37:09.409295	\N	94	79
2472	user_1405982246	2014-07-21 18:37:26.719505	2014-07-21 18:37:26.722446	\N	94	79
2473	user_1405982271	2014-07-21 18:37:51.601668	2014-07-21 18:37:51.607238	\N	94	79
2474	user_1405982276	2014-07-21 18:37:56.573702	2014-07-21 18:37:56.577026	\N	94	79
2475	user_1405982499	2014-07-21 18:41:39.094009	2014-07-21 18:41:39.099625	\N	94	79
2476	user_1405982506	2014-07-21 18:41:46.930639	2014-07-21 18:41:46.935271	\N	94	79
2477	user_1405982511	2014-07-21 18:41:51.677903	2014-07-21 18:41:51.682311	\N	94	79
2478	user_1405982527	2014-07-21 18:42:07.869821	2014-07-21 18:42:07.873865	\N	94	79
2479	user_1405982532	2014-07-21 18:42:12.92837	2014-07-21 18:42:12.932531	\N	94	79
2480	user_1405982543	2014-07-21 18:42:23.647391	2014-07-21 18:42:23.651632	\N	94	79
2481	user_1405982571	2014-07-21 18:42:51.242134	2014-07-21 18:42:51.247121	\N	94	79
2482	user_1405982575	2014-07-21 18:42:55.926384	2014-07-21 18:42:55.92938	\N	94	79
2483	user_1405982621	2014-07-21 18:43:41.660423	2014-07-21 18:43:41.664506	\N	94	79
2484	user_1405982781	2014-07-21 18:46:21.667315	2014-07-21 18:46:21.672853	\N	94	79
2485	user_1405982794	2014-07-21 18:46:34.607832	2014-07-21 18:46:34.611031	\N	94	79
2486	user_1405982803	2014-07-21 18:46:43.970189	2014-07-21 18:46:43.975251	\N	94	79
2487	user_1405982806	2014-07-21 18:46:46.070807	2014-07-21 18:46:46.075576	\N	94	79
2488	user_1405982928	2014-07-21 18:48:48.015321	2014-07-21 18:48:48.019783	\N	94	79
2489	user_1405982944	2014-07-21 18:49:04.170592	2014-07-21 18:49:04.174073	\N	94	79
2490	user_1405982952	2014-07-21 18:49:12.617101	2014-07-21 18:49:12.62131	\N	94	79
2491	user_1405983568	2014-07-21 18:59:28.551534	2014-07-21 18:59:28.555736	\N	94	79
2492	user_1405983578	2014-07-21 18:59:38.497959	2014-07-21 18:59:38.502509	\N	94	79
2493	user_1405983606	2014-07-21 19:00:06.495151	2014-07-21 19:00:06.499246	\N	94	79
2494	user_1405983690	2014-07-21 19:01:30.052974	2014-07-21 19:01:30.057979	\N	94	79
2495	user_1405983751	2014-07-21 19:02:31.638716	2014-07-21 19:02:31.642324	\N	94	79
2496	user_1405983818	2014-07-21 19:03:38.890444	2014-07-21 19:03:38.895609	\N	94	79
2497	user_1405983991	2014-07-21 19:06:31.037757	2014-07-21 19:06:31.042849	\N	94	79
2498	user_1405984015	2014-07-21 19:06:55.106744	2014-07-21 19:06:55.109771	\N	94	79
2499	user_1405984034	2014-07-21 19:07:14.221202	2014-07-21 19:07:14.223692	\N	94	79
2500	user_1405984069	2014-07-21 19:07:49.286063	2014-07-21 19:07:49.291917	\N	94	79
2501	user_1405984077	2014-07-21 19:07:57.627654	2014-07-21 19:07:57.630788	\N	94	79
2502	user_1405984171	2014-07-21 19:09:31.909856	2014-07-21 19:09:31.914934	\N	94	79
2503	user_1405984204	2014-07-21 19:10:04.838085	2014-07-21 19:10:04.841879	\N	94	79
2504	user_1405984250	2014-07-21 19:10:50.128925	2014-07-21 19:10:50.134161	\N	94	79
2505	user_1405993204	2014-07-21 21:40:04.375914	2014-07-21 21:40:04.389307	\N	94	79
2506	user_1405993235	2014-07-21 21:40:35.107449	2014-07-21 21:40:35.11264	\N	94	79
2507	user_1405993278	2014-07-21 21:41:18.703511	2014-07-21 21:41:18.707853	\N	94	79
2508	user_1405993311	2014-07-21 21:41:51.439362	2014-07-21 21:41:51.442707	\N	94	79
2509	user_1405993351	2014-07-21 21:42:31.221062	2014-07-21 21:42:31.225454	\N	94	79
2510	user_1405993377	2014-07-21 21:42:57.735138	2014-07-21 21:42:57.741376	\N	94	79
2511	user_1405993390	2014-07-21 21:43:10.487315	2014-07-21 21:43:10.493236	\N	94	79
2512	user_1405993912	2014-07-21 21:51:52.979535	2014-07-21 21:51:52.984967	\N	94	79
2513	user_1405994025	2014-07-21 21:53:45.809085	2014-07-21 21:53:45.813514	\N	94	79
2514	user_1405994058	2014-07-21 21:54:18.788415	2014-07-21 21:54:18.792633	\N	94	79
2515	user_1405994084	2014-07-21 21:54:44.335489	2014-07-21 21:54:44.340279	\N	94	79
2516	user_1405994126	2014-07-21 21:55:26.416099	2014-07-21 21:55:26.422786	\N	94	79
2517	user_1405994141	2014-07-21 21:55:41.447325	2014-07-21 21:55:41.451058	\N	94	79
2518	user_1405994158	2014-07-21 21:55:58.147878	2014-07-21 21:55:58.150538	\N	94	79
2519	user_1405994176	2014-07-21 21:56:16.007331	2014-07-21 21:56:16.010928	\N	94	79
2520	user_1405994191	2014-07-21 21:56:31.358027	2014-07-21 21:56:31.361428	\N	94	79
2521	user_1405994210	2014-07-21 21:56:50.417951	2014-07-21 21:56:50.422757	\N	94	79
2522	user_1405994285	2014-07-21 21:58:05.700633	2014-07-21 21:58:05.705982	\N	94	79
2523	user_1405994353	2014-07-21 21:59:13.71178	2014-07-21 21:59:13.715442	\N	94	79
2524	user_1405994397	2014-07-21 21:59:57.886128	2014-07-21 21:59:57.890235	\N	94	79
2525	user_1405994448	2014-07-21 22:00:48.727987	2014-07-21 22:00:48.733219	\N	94	79
2526	user_1405994466	2014-07-21 22:01:05.998517	2014-07-21 22:01:06.003676	\N	94	79
2527	user_1405994479	2014-07-21 22:01:19.321517	2014-07-21 22:01:19.325866	\N	94	79
2528	user_1405994489	2014-07-21 22:01:29.446842	2014-07-21 22:01:29.451303	\N	94	79
2529	user_1405994489	2014-07-21 22:01:29.519598	2014-07-21 22:01:29.523565	\N	94	79
2530	user_1405994494	2014-07-21 22:01:34.951552	2014-07-21 22:01:34.95629	\N	94	79
2531	user_1405994544	2014-07-21 22:02:24.593779	2014-07-21 22:02:24.598476	\N	94	79
2532	user_1405994768	2014-07-21 22:06:08.490065	2014-07-21 22:06:08.496901	\N	94	79
2533	user_1405994825	2014-07-21 22:07:05.722245	2014-07-21 22:07:05.726747	\N	94	79
2534	user_1405994830	2014-07-21 22:07:10.964623	2014-07-21 22:07:10.969478	\N	94	79
2535	user_1405994851	2014-07-21 22:07:31.866578	2014-07-21 22:07:31.869591	\N	94	79
2536	user_1405994871	2014-07-21 22:07:51.286489	2014-07-21 22:07:51.29166	\N	94	79
2537	user_1405994886	2014-07-21 22:08:06.102235	2014-07-21 22:08:06.106784	\N	94	79
2538	user_1405994927	2014-07-21 22:08:47.728677	2014-07-21 22:08:47.732575	\N	94	79
2539	user_1405994942	2014-07-21 22:09:02.758336	2014-07-21 22:09:02.76172	\N	94	79
2540	user_1405994950	2014-07-21 22:09:10.062194	2014-07-21 22:09:10.067538	\N	94	79
2541	user_1405994953	2014-07-21 22:09:13.323804	2014-07-21 22:09:13.326496	\N	94	79
2542	user_1405995042	2014-07-21 22:10:42.35252	2014-07-21 22:10:42.357707	\N	94	79
2543	user_1405995061	2014-07-21 22:11:01.527715	2014-07-21 22:11:01.531059	\N	94	79
2544	user_1405995362	2014-07-21 22:16:02.560568	2014-07-21 22:16:02.569364	\N	94	79
2545	user_1405995363	2014-07-21 22:16:03.847997	2014-07-21 22:16:03.852805	\N	94	79
2546	user_1405995377	2014-07-21 22:16:17.087749	2014-07-21 22:16:17.091962	\N	94	79
2547	user_1405995476	2014-07-21 22:17:56.215988	2014-07-21 22:17:56.220547	\N	94	79
2548	user_1405995495	2014-07-21 22:18:15.04347	2014-07-21 22:18:15.046219	\N	94	79
2549	user_1405995745	2014-07-21 22:22:25.188134	2014-07-21 22:22:25.193098	\N	94	79
2550	user_1405995819	2014-07-21 22:23:39.686653	2014-07-21 22:23:39.691234	\N	94	79
2551	user_1405995846	2014-07-21 22:24:06.118319	2014-07-21 22:24:06.122766	\N	94	79
2552	user_1405996135	2014-07-21 22:28:55.053807	2014-07-21 22:28:55.061375	\N	94	79
2553	user_1405996155	2014-07-21 22:29:15.510515	2014-07-21 22:29:15.513623	\N	94	79
2554	user_1405996232	2014-07-21 22:30:32.814933	2014-07-21 22:30:32.822246	\N	94	79
2555	user_1405996317	2014-07-21 22:31:57.886148	2014-07-21 22:31:57.89094	\N	94	79
2556	user_1405996394	2014-07-21 22:33:14.916088	2014-07-21 22:33:14.91992	\N	94	79
2557	user_1405997308	2014-07-21 22:48:28.328169	2014-07-21 22:48:28.336231	\N	94	79
2558	user_1405997308	2014-07-21 22:48:28.663747	2014-07-21 22:48:28.669926	\N	94	79
2559	user_1405997314	2014-07-21 22:48:34.532043	2014-07-21 22:48:34.536053	\N	94	79
2560	user_1405997320	2014-07-21 22:48:40.852755	2014-07-21 22:48:40.855783	\N	94	79
2561	user_1405997323	2014-07-21 22:48:43.455357	2014-07-21 22:48:43.460098	\N	94	79
2723	user_1406046081	2014-07-22 12:21:21.785372	2014-07-22 12:21:21.790603	\N	94	70
2562	user_1405997325	2014-07-21 22:48:45.402959	2014-07-21 22:48:45.405821	\N	94	79
2563	user_1405997336	2014-07-21 22:48:56.11556	2014-07-21 22:48:56.118386	\N	94	79
2724	user_1406046128	2014-07-22 12:22:08.774621	2014-07-22 12:22:08.779854	\N	94	70
2564	user_1405997379	2014-07-21 22:49:39.47336	2014-07-21 22:49:39.477224	\N	94	79
2565	user_1405997403	2014-07-21 22:50:03.830684	2014-07-21 22:50:03.834036	\N	94	79
2566	user_1405997456	2014-07-21 22:50:56.866138	2014-07-21 22:50:56.87215	\N	94	79
2768	user_1406068921	2014-07-22 18:42:01.6052	2014-07-22 18:42:01.60887	\N	94	79
2567	user_1405997465	2014-07-21 22:51:05.601394	2014-07-21 22:51:05.604301	\N	94	79
2244	Therapist	2014-07-20 15:18:11.318154	2014-07-22 12:59:37.504363	\N	94	73
2568	user_1405997489	2014-07-21 22:51:29.357728	2014-07-21 22:51:29.360242	\N	94	79
382	Gene	2014-07-11 15:19:13.934389	2014-07-22 13:11:26.882683	Hawaii	89	73
2569	user_1405997512	2014-07-21 22:51:52.916578	2014-07-21 22:51:52.920311	\N	94	79
2729	client_1406054027	2014-07-22 14:33:48.001263	2014-07-22 14:33:48.001263	\N	102	82
2570	user_1405997516	2014-07-21 22:51:56.60123	2014-07-21 22:51:56.605448	\N	94	79
2730	therapist_1406054028	2014-07-22 14:33:48.004585	2014-07-22 14:33:48.004585	\N	103	82
2731	user_1406063621	2014-07-22 17:13:41.316056	2014-07-22 17:13:41.495772	\N	94	79
2732	user_1406063621	2014-07-22 17:13:41.740383	2014-07-22 17:13:41.74525	\N	94	79
2733	user_1406063657	2014-07-22 17:14:17.995445	2014-07-22 17:14:18.000371	\N	94	79
2734	user_1406063670	2014-07-22 17:14:30.529145	2014-07-22 17:14:30.532793	\N	94	79
2735	user_1406063707	2014-07-22 17:15:07.518865	2014-07-22 17:15:07.522507	\N	94	79
2736	user_1406063758	2014-07-22 17:15:58.241428	2014-07-22 17:15:58.244848	\N	94	79
2737	user_1406065514	2014-07-22 17:45:14.42713	2014-07-22 17:45:14.432227	\N	94	79
2738	user_1406065523	2014-07-22 17:45:23.917137	2014-07-22 17:45:23.922128	\N	94	79
2739	user_1406065629	2014-07-22 17:47:09.210305	2014-07-22 17:47:09.215647	\N	94	79
2740	user_1406065662	2014-07-22 17:47:42.541926	2014-07-22 17:47:42.546217	\N	94	79
2741	user_1406065663	2014-07-22 17:47:43.233969	2014-07-22 17:47:43.238383	\N	94	79
2742	user_1406065737	2014-07-22 17:48:57.257089	2014-07-22 17:48:57.262864	\N	94	79
2743	user_1406065830	2014-07-22 17:50:30.209153	2014-07-22 17:50:30.213438	\N	94	79
2744	user_1406065830	2014-07-22 17:50:30.873254	2014-07-22 17:50:30.877796	\N	94	79
2745	user_1406065879	2014-07-22 17:51:19.931522	2014-07-22 17:51:19.93536	\N	94	79
2746	user_1406065880	2014-07-22 17:51:20.66279	2014-07-22 17:51:20.667159	\N	94	79
2747	user_1406066473	2014-07-22 18:01:13.825091	2014-07-22 18:01:13.830677	\N	94	79
2748	user_1406066474	2014-07-22 18:01:14.361457	2014-07-22 18:01:14.365944	\N	94	79
2749	user_1406066560	2014-07-22 18:02:40.209365	2014-07-22 18:02:40.214715	\N	94	79
2750	user_1406066561	2014-07-22 18:02:41.806322	2014-07-22 18:02:41.810742	\N	94	79
2751	user_1406066826	2014-07-22 18:07:06.861728	2014-07-22 18:07:06.86768	\N	94	79
2752	user_1406066828	2014-07-22 18:07:08.123981	2014-07-22 18:07:08.128522	\N	94	79
2753	user_1406066905	2014-07-22 18:08:25.59113	2014-07-22 18:08:25.596331	\N	94	79
2754	user_1406066906	2014-07-22 18:08:26.393186	2014-07-22 18:08:26.397902	\N	94	79
2755	user_1406067076	2014-07-22 18:11:16.860945	2014-07-22 18:11:16.866678	\N	94	79
2756	user_1406067077	2014-07-22 18:11:17.723821	2014-07-22 18:11:17.728306	\N	94	79
2757	user_1406067157	2014-07-22 18:12:37.94596	2014-07-22 18:12:37.951314	\N	94	79
2758	user_1406067273	2014-07-22 18:14:33.325681	2014-07-22 18:14:33.331109	\N	94	79
2759	user_1406067273	2014-07-22 18:14:33.866785	2014-07-22 18:14:33.87108	\N	94	79
2760	user_1406067980	2014-07-22 18:26:20.314865	2014-07-22 18:26:20.320369	\N	94	79
2761	user_1406067986	2014-07-22 18:26:26.081582	2014-07-22 18:26:26.08532	\N	94	79
2762	user_1406067995	2014-07-22 18:26:35.67899	2014-07-22 18:26:35.683546	\N	94	79
2763	user_1406067980	2014-07-22 18:26:41.165269	2014-07-22 18:26:41.174102	\N	94	79
2764	user_1406068772	2014-07-22 18:39:32.932981	2014-07-22 18:39:33.086171	\N	94	79
2765	user_1406068773	2014-07-22 18:39:33.444632	2014-07-22 18:39:33.448748	\N	94	79
2766	user_1406068870	2014-07-22 18:41:10.574738	2014-07-22 18:41:10.579849	\N	94	79
2767	user_1406068884	2014-07-22 18:41:24.000464	2014-07-22 18:41:24.0047	\N	94	79
2769	user_1406068926	2014-07-22 18:42:06.890082	2014-07-22 18:42:06.894061	\N	94	79
2770	user_1406068967	2014-07-22 18:42:47.229704	2014-07-22 18:42:47.234385	\N	94	79
2771	user_1406069004	2014-07-22 18:43:24.581952	2014-07-22 18:43:24.586433	\N	94	79
2772	user_1406069038	2014-07-22 18:43:58.503884	2014-07-22 18:43:58.50953	\N	94	79
2773	user_1406069063	2014-07-22 18:44:23.268519	2014-07-22 18:44:23.271939	\N	94	79
2774	user_1406069085	2014-07-22 18:44:45.565669	2014-07-22 18:44:45.571129	\N	94	79
2775	user_1406069148	2014-07-22 18:45:48.141037	2014-07-22 18:45:48.147053	\N	94	79
2802	user_1406139699	2014-07-23 14:21:39.785213	2014-07-23 14:21:39.789358	\N	94	79
2803	user_1406139719	2014-07-23 14:21:59.516822	2014-07-23 14:21:59.521377	\N	94	79
2804	user_1406140685	2014-07-23 14:38:05.058595	2014-07-23 14:38:05.063853	\N	94	79
2805	user_1406140810	2014-07-23 14:40:10.609974	2014-07-23 14:40:10.615788	\N	94	79
2806	user_1406140839	2014-07-23 14:40:39.656146	2014-07-23 14:40:39.659999	\N	94	79
2807	user_1406140967	2014-07-23 14:42:47.834549	2014-07-23 14:42:47.838968	\N	94	79
2808	user_1406141590	2014-07-23 14:53:10.710205	2014-07-23 14:53:10.715	\N	94	79
2809	user_1406141600	2014-07-23 14:53:20.122206	2014-07-23 14:53:20.126333	\N	94	79
2810	user_1406141610	2014-07-23 14:53:30.890949	2014-07-23 14:53:30.893791	\N	94	79
2811	user_1406141632	2014-07-23 14:53:52.18321	2014-07-23 14:53:52.186918	\N	94	79
2812	user_1406141638	2014-07-23 14:53:58.749431	2014-07-23 14:53:58.75196	\N	94	79
2813	gene	2014-07-23 14:54:10.137101	2014-07-23 14:54:50.811068	\N	94	79
2814	user_1406141757	2014-07-23 14:55:57.005753	2014-07-23 14:55:57.010697	\N	94	79
2815	user_1406141776	2014-07-23 14:56:16.26871	2014-07-23 14:56:16.272816	\N	94	79
2816	user_1406142450	2014-07-23 15:07:30.985615	2014-07-23 15:07:30.99096	\N	94	79
2817	user_1406142461	2014-07-23 15:07:41.372152	2014-07-23 15:07:41.375133	\N	94	79
2818	user_1406142472	2014-07-23 15:07:52.84551	2014-07-23 15:07:52.850118	\N	94	79
2819	user_1406142524	2014-07-23 15:08:44.463613	2014-07-23 15:08:44.468754	\N	94	79
2820	user_1406156121	2014-07-23 18:55:21.647885	2014-07-23 18:55:21.651294	\N	94	79
2821	user_1406156172	2014-07-23 18:56:12.761478	2014-07-23 18:56:12.766378	\N	94	79
2822	user_1406156188	2014-07-23 18:56:28.279841	2014-07-23 18:56:28.284866	\N	94	79
2823	user_1406156194	2014-07-23 18:56:34.144213	2014-07-23 18:56:34.148249	\N	94	79
2824	user_1406156263	2014-07-23 18:57:43.560689	2014-07-23 18:57:43.565407	\N	94	79
2825	user_1406156264	2014-07-23 18:57:44.075903	2014-07-23 18:57:44.078843	\N	94	79
2826	user_1406156281	2014-07-23 18:58:01.959238	2014-07-23 18:58:01.964001	\N	94	79
2827	user_1406156282	2014-07-23 18:58:02.649094	2014-07-23 18:58:02.653203	\N	94	79
2828	user_1406156353	2014-07-23 18:59:13.457207	2014-07-23 18:59:13.460717	\N	94	79
2829	user_1406156354	2014-07-23 18:59:14.340547	2014-07-23 18:59:14.345127	\N	94	79
2830	user_1406156355	2014-07-23 18:59:15.901228	2014-07-23 18:59:15.905892	\N	94	79
2831	user_1406156378	2014-07-23 18:59:38.682827	2014-07-23 18:59:38.685548	\N	94	79
2832	user_1406156379	2014-07-23 18:59:39.247868	2014-07-23 18:59:39.250499	\N	94	79
2833	user_1406156418	2014-07-23 19:00:18.102956	2014-07-23 19:00:18.106189	\N	94	79
2834	user_1406156418	2014-07-23 19:00:18.926665	2014-07-23 19:00:18.931208	\N	94	79
2835	user_1406156455	2014-07-23 19:00:55.249766	2014-07-23 19:00:55.253134	\N	94	79
2836	user_1406156456	2014-07-23 19:00:56.121627	2014-07-23 19:00:56.125742	\N	94	79
2837	user_1406156502	2014-07-23 19:01:42.121799	2014-07-23 19:01:42.125716	\N	94	79
2838	user_1406156502	2014-07-23 19:01:42.934452	2014-07-23 19:01:42.937688	\N	94	79
2839	user_1406156510	2014-07-23 19:01:50.59225	2014-07-23 19:01:50.597134	\N	94	79
2840	user_1406156511	2014-07-23 19:01:51.294614	2014-07-23 19:01:51.297528	\N	94	79
2841	user_1406156558	2014-07-23 19:02:38.203664	2014-07-23 19:02:38.206325	\N	94	79
2842	user_1406156558	2014-07-23 19:02:38.812108	2014-07-23 19:02:38.817194	\N	94	79
2843	user_1406156591	2014-07-23 19:03:11.204276	2014-07-23 19:03:11.20703	\N	94	79
2844	user_1406156592	2014-07-23 19:03:12.422153	2014-07-23 19:03:12.425031	\N	94	79
2845	user_1406156592	2014-07-23 19:03:12.844907	2014-07-23 19:03:12.847779	\N	94	79
2846	user_1406156732	2014-07-23 19:05:32.205335	2014-07-23 19:05:32.210715	\N	94	79
2847	user_1406156733	2014-07-23 19:05:33.371857	2014-07-23 19:05:33.375719	\N	94	79
2848	user_1406156737	2014-07-23 19:05:37.065027	2014-07-23 19:05:37.068134	\N	94	79
2849	user_1406156738	2014-07-23 19:05:38.253912	2014-07-23 19:05:38.258016	\N	94	79
2850	user_1406156738	2014-07-23 19:05:38.752315	2014-07-23 19:05:38.75615	\N	94	79
2851	user_1406156746	2014-07-23 19:05:46.894042	2014-07-23 19:05:46.897645	\N	94	79
2852	user_1406156747	2014-07-23 19:05:47.599424	2014-07-23 19:05:47.603581	\N	94	79
2853	user_1406156785	2014-07-23 19:06:25.739353	2014-07-23 19:06:25.744424	\N	94	79
2854	user_1406156785	2014-07-23 19:06:25.870938	2014-07-23 19:06:25.874165	\N	94	79
2855	user_1406156859	2014-07-23 19:07:39.782545	2014-07-23 19:07:39.788026	\N	94	79
2856	user_1406156860	2014-07-23 19:07:40.317516	2014-07-23 19:07:40.322118	\N	94	79
2857	user_1406156878	2014-07-23 19:07:58.595704	2014-07-23 19:07:58.59898	\N	94	79
2858	user_1406156879	2014-07-23 19:07:59.712113	2014-07-23 19:07:59.716607	\N	94	79
2859	user_1406156889	2014-07-23 19:08:09.801951	2014-07-23 19:08:09.80457	\N	94	79
2860	user_1406156890	2014-07-23 19:08:10.489851	2014-07-23 19:08:10.493165	\N	94	79
2861	user_1406156905	2014-07-23 19:08:25.938703	2014-07-23 19:08:25.94153	\N	94	79
2862	user_1406156906	2014-07-23 19:08:26.57692	2014-07-23 19:08:26.581954	\N	94	79
2863	user_1406157012	2014-07-23 19:10:12.488991	2014-07-23 19:10:12.494119	\N	94	79
2864	user_1406157013	2014-07-23 19:10:13.009701	2014-07-23 19:10:13.014063	\N	94	79
2865	user_1406157053	2014-07-23 19:10:53.000373	2014-07-23 19:10:53.003937	\N	94	79
2866	user_1406157053	2014-07-23 19:10:53.555057	2014-07-23 19:10:53.559343	\N	94	79
2867	user_1406157064	2014-07-23 19:11:04.818757	2014-07-23 19:11:04.822557	\N	94	79
2868	user_1406157065	2014-07-23 19:11:05.390398	2014-07-23 19:11:05.394978	\N	94	79
2869	user_1406157073	2014-07-23 19:11:13.713066	2014-07-23 19:11:13.717783	\N	94	79
2870	user_1406157074	2014-07-23 19:11:14.410721	2014-07-23 19:11:14.415154	\N	94	79
2871	user_1406157203	2014-07-23 19:13:23.520886	2014-07-23 19:13:23.524488	\N	94	79
2872	user_1406157204	2014-07-23 19:13:24.145405	2014-07-23 19:13:24.148263	\N	94	79
2873	user_1406157217	2014-07-23 19:13:37.846259	2014-07-23 19:13:37.850613	\N	94	79
2874	user_1406157220	2014-07-23 19:13:40.495884	2014-07-23 19:13:40.500608	\N	94	79
2875	user_1406158269	2014-07-23 19:31:09.733783	2014-07-23 19:31:09.739285	\N	94	79
2876	user_1406158270	2014-07-23 19:31:10.325992	2014-07-23 19:31:10.328643	\N	94	79
2877	user_1406169234	2014-07-23 22:33:54.09027	2014-07-23 22:33:54.101605	\N	94	79
2878	user_1406169234	2014-07-23 22:33:54.90755	2014-07-23 22:33:54.911594	\N	94	79
2879	user_1406169292	2014-07-23 22:34:52.714813	2014-07-23 22:34:52.718342	\N	94	79
2880	user_1406169294	2014-07-23 22:34:54.01596	2014-07-23 22:34:54.019903	\N	94	79
2881	user_1406169468	2014-07-23 22:37:48.152492	2014-07-23 22:37:48.157164	\N	94	79
2882	user_1406169468	2014-07-23 22:37:48.893597	2014-07-23 22:37:48.89797	\N	94	79
2883	user_1406169553	2014-07-23 22:39:13.029179	2014-07-23 22:39:13.033128	\N	94	79
2884	user_1406169553	2014-07-23 22:39:13.619177	2014-07-23 22:39:13.623743	\N	94	79
2885	user_1406169570	2014-07-23 22:39:30.343531	2014-07-23 22:39:30.347223	\N	94	79
2886	user_1406169570	2014-07-23 22:39:30.927033	2014-07-23 22:39:30.931837	\N	94	79
2887	user_1406169681	2014-07-23 22:41:21.08467	2014-07-23 22:41:21.08992	\N	94	79
2888	user_1406169681	2014-07-23 22:41:21.662922	2014-07-23 22:41:21.667911	\N	94	79
2889	user_1406169755	2014-07-23 22:42:35.989034	2014-07-23 22:42:35.994796	\N	94	79
2890	user_1406169756	2014-07-23 22:42:36.695295	2014-07-23 22:42:36.699854	\N	94	79
2891	user_1406169804	2014-07-23 22:43:24.157714	2014-07-23 22:43:24.161653	\N	94	79
2892	user_1406169804	2014-07-23 22:43:24.8391	2014-07-23 22:43:24.844053	\N	94	79
2893	user_1406169819	2014-07-23 22:43:39.669084	2014-07-23 22:43:39.672417	\N	94	79
2894	user_1406169820	2014-07-23 22:43:40.359861	2014-07-23 22:43:40.364231	\N	94	79
2895	user_1406169848	2014-07-23 22:44:08.075755	2014-07-23 22:44:08.078988	\N	94	79
2896	user_1406169848	2014-07-23 22:44:08.616084	2014-07-23 22:44:08.620236	\N	94	79
2897	user_1406169874	2014-07-23 22:44:34.504735	2014-07-23 22:44:34.509539	\N	94	79
2898	user_1406169875	2014-07-23 22:44:35.055239	2014-07-23 22:44:35.060337	\N	94	79
2899	user_1406169875	2014-07-23 22:44:35.959999	2014-07-23 22:44:35.965223	\N	94	79
2900	user_1406169955	2014-07-23 22:45:55.116234	2014-07-23 22:45:55.122478	\N	94	79
2901	user_1406169955	2014-07-23 22:45:55.798966	2014-07-23 22:45:55.802832	\N	94	79
2902	user_1406169979	2014-07-23 22:46:19.49985	2014-07-23 22:46:19.504131	\N	94	79
2903	user_1406169980	2014-07-23 22:46:20.065505	2014-07-23 22:46:20.06999	\N	94	79
2904	user_1406170011	2014-07-23 22:46:51.412602	2014-07-23 22:46:51.417455	\N	94	79
2905	user_1406170012	2014-07-23 22:46:52.082489	2014-07-23 22:46:52.085931	\N	94	79
2906	user_1406170205	2014-07-23 22:50:05.667573	2014-07-23 22:50:05.672295	\N	94	79
2907	user_1406170206	2014-07-23 22:50:06.848268	2014-07-23 22:50:06.853161	\N	94	79
2908	user_1406170231	2014-07-23 22:50:31.877525	2014-07-23 22:50:31.882169	\N	94	79
2909	user_1406170233	2014-07-23 22:50:33.137131	2014-07-23 22:50:33.142782	\N	94	79
2910	user_1406170539	2014-07-23 22:55:39.875802	2014-07-23 22:55:39.881336	\N	94	79
2911	user_1406170579	2014-07-23 22:56:19.038062	2014-07-23 22:56:19.042842	\N	94	79
2912	user_1406170628	2014-07-23 22:57:08.770855	2014-07-23 22:57:08.776884	\N	94	79
2913	user_1406170661	2014-07-23 22:57:41.451425	2014-07-23 22:57:41.456283	\N	94	79
2914	user_1406170662	2014-07-23 22:57:42.204023	2014-07-23 22:57:42.208808	\N	94	79
2915	user_1406170786	2014-07-23 22:59:46.44729	2014-07-23 22:59:46.45218	\N	94	79
2916	user_1406170787	2014-07-23 22:59:47.065516	2014-07-23 22:59:47.069806	\N	94	79
2917	user_1406170818	2014-07-23 23:00:18.496331	2014-07-23 23:00:18.500427	\N	94	79
2918	user_1406170819	2014-07-23 23:00:19.19909	2014-07-23 23:00:19.201759	\N	94	79
2919	user_1406170819	2014-07-23 23:00:19.890462	2014-07-23 23:00:19.893403	\N	94	79
2920	user_1406170828	2014-07-23 23:00:28.456794	2014-07-23 23:00:28.459486	\N	94	79
2921	user_1406170829	2014-07-23 23:00:29.137816	2014-07-23 23:00:29.141802	\N	94	79
2922	user_1406170829	2014-07-23 23:00:29.92882	2014-07-23 23:00:29.932147	\N	94	79
2923	user_1406171159	2014-07-23 23:05:59.824665	2014-07-23 23:05:59.830755	\N	94	79
2924	user_1406171574	2014-07-23 23:12:54.836347	2014-07-23 23:12:54.839489	\N	94	79
2925	user_1406171586	2014-07-23 23:13:06.751166	2014-07-23 23:13:06.753729	\N	94	79
2926	user_1406171587	2014-07-23 23:13:07.229166	2014-07-23 23:13:07.232117	\N	94	79
2927	user_1406171588	2014-07-23 23:13:08.185125	2014-07-23 23:13:08.188941	\N	94	79
2928	user_1406171597	2014-07-23 23:13:17.55692	2014-07-23 23:13:17.562945	\N	94	79
2929	user_1406171598	2014-07-23 23:13:18.136861	2014-07-23 23:13:18.140922	\N	94	79
2930	user_1406171620	2014-07-23 23:13:40.789768	2014-07-23 23:13:40.793813	\N	94	79
2931	user_1406171621	2014-07-23 23:13:41.918291	2014-07-23 23:13:41.921825	\N	94	79
2932	user_1406171628	2014-07-23 23:13:48.15538	2014-07-23 23:13:48.160599	\N	94	79
2933	user_1406171629	2014-07-23 23:13:49.052291	2014-07-23 23:13:49.057283	\N	94	79
2934	user_1406171660	2014-07-23 23:14:20.226254	2014-07-23 23:14:20.231876	\N	94	79
2935	user_1406171661	2014-07-23 23:14:21.128156	2014-07-23 23:14:21.132582	\N	94	79
2936	user_1406171693	2014-07-23 23:14:53.694102	2014-07-23 23:14:53.697286	\N	94	79
2937	user_1406171694	2014-07-23 23:14:54.600857	2014-07-23 23:14:54.604306	\N	94	79
2938	user_1406171741	2014-07-23 23:15:41.759812	2014-07-23 23:15:41.766004	\N	94	79
2939	user_1406171743	2014-07-23 23:15:43.474703	2014-07-23 23:15:43.479126	\N	94	79
2940	user_1406172005	2014-07-23 23:20:05.120729	2014-07-23 23:20:05.126872	\N	94	79
2941	user_1406172113	2014-07-23 23:21:53.343438	2014-07-23 23:21:53.350064	\N	94	79
2942	user_1406172367	2014-07-23 23:26:07.230547	2014-07-23 23:26:07.235854	\N	94	79
2943	user_1406172448	2014-07-23 23:27:28.072964	2014-07-23 23:27:28.077735	\N	94	79
2944	user_1406172482	2014-07-23 23:28:02.379629	2014-07-23 23:28:02.385807	\N	94	79
2945	user_1406172489	2014-07-23 23:28:09.47603	2014-07-23 23:28:09.480747	\N	94	79
2946	user_1406172498	2014-07-23 23:28:18.589255	2014-07-23 23:28:18.592051	\N	94	79
2947	user_1406172519	2014-07-23 23:28:39.558946	2014-07-23 23:28:39.562105	\N	94	79
2948	user_1406172555	2014-07-23 23:29:15.154531	2014-07-23 23:29:15.15991	\N	94	79
2949	user_1406172573	2014-07-23 23:29:33.45396	2014-07-23 23:29:33.458554	\N	94	79
2950	user_1406172941	2014-07-23 23:35:41.561651	2014-07-23 23:35:41.56481	\N	94	79
2951	user_1406172982	2014-07-23 23:36:22.120801	2014-07-23 23:36:22.124517	\N	94	79
2952	user_1406173038	2014-07-23 23:37:18.170491	2014-07-23 23:37:18.176058	\N	94	79
2953	user_1406173081	2014-07-23 23:38:01.205141	2014-07-23 23:38:01.210611	\N	94	79
2954	user_1406173135	2014-07-23 23:38:55.463047	2014-07-23 23:38:55.467088	\N	94	79
2955	user_1406173136	2014-07-23 23:38:56.35736	2014-07-23 23:38:56.360802	\N	94	79
2956	user_1406173143	2014-07-23 23:39:03.981109	2014-07-23 23:39:03.985583	\N	94	79
2957	user_1406173152	2014-07-23 23:39:12.907867	2014-07-23 23:39:12.913199	\N	94	79
2958	user_1406173164	2014-07-23 23:39:24.207412	2014-07-23 23:39:24.212258	\N	94	79
2959	user_1406173202	2014-07-23 23:40:02.432533	2014-07-23 23:40:02.437979	\N	94	79
2960	user_1406173203	2014-07-23 23:40:03.086446	2014-07-23 23:40:03.09009	\N	94	79
2961	user_1406173217	2014-07-23 23:40:17.843173	2014-07-23 23:40:17.845821	\N	94	79
2962	user_1406173218	2014-07-23 23:40:18.971042	2014-07-23 23:40:18.975181	\N	94	79
2963	user_1406173229	2014-07-23 23:40:29.454167	2014-07-23 23:40:29.458944	\N	94	79
2964	user_1406173241	2014-07-23 23:40:41.201629	2014-07-23 23:40:41.205179	\N	94	79
2965	user_1406173241	2014-07-23 23:40:41.642107	2014-07-23 23:40:41.645048	\N	94	79
2966	user_1406173258	2014-07-23 23:40:58.885107	2014-07-23 23:40:58.889389	\N	94	79
2967	user_1406173259	2014-07-23 23:40:59.549716	2014-07-23 23:40:59.552827	\N	94	79
2968	user_1406173290	2014-07-23 23:41:30.889764	2014-07-23 23:41:30.8952	\N	94	79
2969	user_1406173291	2014-07-23 23:41:31.599998	2014-07-23 23:41:31.604285	\N	94	79
2970	user_1406173350	2014-07-23 23:42:30.158156	2014-07-23 23:42:30.163371	\N	94	79
2971	user_1406173351	2014-07-23 23:42:31.777979	2014-07-23 23:42:31.784948	\N	94	79
2972	user_1406175554	2014-07-24 00:19:14.25223	2014-07-24 00:19:14.257248	\N	94	79
2973	user_1406179463	2014-07-24 01:24:23.67049	2014-07-24 01:24:23.67401	\N	94	79
2974	user_1406220042	2014-07-24 12:40:42.255248	2014-07-24 12:40:42.259144	\N	105	83
2975	user_1406220417	2014-07-24 12:46:57.585484	2014-07-24 12:46:57.587973	\N	105	84
2976	\N	2014-07-24 13:02:57.619856	2014-07-24 13:02:57.619856	\N	104	\N
2977	user_1406221458	2014-07-24 13:04:18.447359	2014-07-24 13:04:18.450759	\N	104	87
2978	user_1406221600	2014-07-24 13:06:40.800232	2014-07-24 13:06:40.804459	\N	104	88
2979	user_1406221600	2014-07-24 13:06:40.813501	2014-07-24 13:06:40.816096	\N	106	88
2980	user_1406221995	2014-07-24 13:13:15.152964	2014-07-24 13:13:15.157483	\N	94	79
2981	user_1406222005	2014-07-24 13:13:25.360546	2014-07-24 13:13:25.365206	\N	94	79
2982	user_1406222042	2014-07-24 13:14:02.30568	2014-07-24 13:14:02.311255	\N	94	79
2983	user_1406222879	2014-07-24 13:27:59.0202	2014-07-24 13:27:59.028855	\N	94	79
2984	user_1406222914	2014-07-24 13:28:34.482037	2014-07-24 13:28:34.487283	\N	94	79
2985	user_1406232068	2014-07-24 16:01:08.946297	2014-07-24 16:01:08.952976	\N	94	70
2986	user_1406232069	2014-07-24 16:01:09.282975	2014-07-24 16:01:09.287466	\N	94	70
2987	user_1406232094	2014-07-24 16:01:34.963027	2014-07-24 16:01:34.967838	\N	94	70
2988	user_1406232097	2014-07-24 16:01:37.701116	2014-07-24 16:01:37.705265	\N	94	70
2989	user_1406232100	2014-07-24 16:01:40.054717	2014-07-24 16:01:40.059005	\N	94	70
2990	user_1406232102	2014-07-24 16:01:42.445695	2014-07-24 16:01:42.451464	\N	94	70
2991	user_1406232105	2014-07-24 16:01:45.616222	2014-07-24 16:01:45.620945	\N	94	70
2992	user_1406232132	2014-07-24 16:02:12.564918	2014-07-24 16:02:12.56952	\N	94	70
2993	user_1406232134	2014-07-24 16:02:14.739864	2014-07-24 16:02:14.743492	\N	94	70
2994	user_1406232204	2014-07-24 16:03:24.778949	2014-07-24 16:03:24.784622	\N	94	70
2995	user_1406232217	2014-07-24 16:03:37.183017	2014-07-24 16:03:37.186182	\N	94	70
2996	user_1406232219	2014-07-24 16:03:39.457659	2014-07-24 16:03:39.462119	\N	94	70
2997	user_1406232221	2014-07-24 16:03:41.652612	2014-07-24 16:03:41.657127	\N	94	70
2998	user_1406232243	2014-07-24 16:04:03.058429	2014-07-24 16:04:03.06159	\N	94	70
2999	user_1406232251	2014-07-24 16:04:11.423973	2014-07-24 16:04:11.4299	\N	94	70
3000	user_1406232258	2014-07-24 16:04:18.043955	2014-07-24 16:04:18.048847	\N	94	70
3001	user_1406232304	2014-07-24 16:05:04.768387	2014-07-24 16:05:04.772962	\N	94	70
3002	user_1406232311	2014-07-24 16:05:11.87123	2014-07-24 16:05:11.87515	\N	94	70
3003	user_1406232362	2014-07-24 16:06:02.474761	2014-07-24 16:06:02.479377	\N	94	70
3004	user_1406232406	2014-07-24 16:06:46.368584	2014-07-24 16:06:46.37352	\N	94	70
3005	user_1406232414	2014-07-24 16:06:54.005308	2014-07-24 16:06:54.010496	\N	94	70
3006	user_1406232696	2014-07-24 16:11:36.329156	2014-07-24 16:11:36.334796	\N	94	70
3007	user_1406233251	2014-07-24 16:20:51.741952	2014-07-24 16:20:51.746854	\N	94	70
3008	user_1406233489	2014-07-24 16:24:49.168695	2014-07-24 16:24:49.174515	\N	94	70
3009	user_1406233512	2014-07-24 16:25:12.050349	2014-07-24 16:25:12.053998	\N	94	70
3010	user_1406233871	2014-07-24 16:31:11.737898	2014-07-24 16:31:11.876552	\N	94	70
3011	user_1406234322	2014-07-24 16:38:42.078253	2014-07-24 16:38:42.083821	\N	94	70
3012	user_1406234373	2014-07-24 16:39:33.737207	2014-07-24 16:39:33.744144	\N	94	70
3013	user_1406234379	2014-07-24 16:39:39.622562	2014-07-24 16:39:39.626457	\N	94	70
3014	user_1406235941	2014-07-24 17:05:41.091719	2014-07-24 17:05:41.097169	\N	94	70
3015	user_1406236815	2014-07-24 17:20:15.496069	2014-07-24 17:20:15.50074	\N	104	89
3016	user_1406236815	2014-07-24 17:20:15.509416	2014-07-24 17:20:15.512439	\N	107	89
3017	user_1406237216	2014-07-24 17:26:56.855255	2014-07-24 17:26:56.861261	\N	104	90
3018	user_1406237216	2014-07-24 17:26:56.870808	2014-07-24 17:26:56.87378	\N	109	90
3019	user_1406237487	2014-07-24 17:31:27.096428	2014-07-24 17:31:27.101445	\N	104	91
3020	user_1406237487	2014-07-24 17:31:27.109989	2014-07-24 17:31:27.112511	\N	109	91
3021	user_1406241387	2014-07-24 18:36:27.834332	2014-07-24 18:36:27.837022	\N	104	92
3022	user_1406241387	2014-07-24 18:36:27.84232	2014-07-24 18:36:27.844514	\N	109	92
3023	user_1406242380	2014-07-24 18:53:00.109275	2014-07-24 18:53:00.112624	\N	104	93
3024	user_1406242380	2014-07-24 18:53:00.120673	2014-07-24 18:53:00.123108	\N	109	93
3025	user_1406242448	2014-07-24 18:54:08.712614	2014-07-24 18:54:08.715535	\N	104	94
3026	user_1406242448	2014-07-24 18:54:08.720958	2014-07-24 18:54:08.723293	\N	109	94
3027	user_1406242778	2014-07-24 18:59:38.094628	2014-07-24 18:59:38.09847	\N	104	95
3028	user_1406242778	2014-07-24 18:59:38.105726	2014-07-24 18:59:38.108956	\N	109	95
3029	user_1406243050	2014-07-24 19:04:10.38952	2014-07-24 19:04:10.395163	\N	94	79
3030	user_1406243051	2014-07-24 19:04:11.654682	2014-07-24 19:04:11.658363	\N	94	70
3031	user_1406243051	2014-07-24 19:04:11.865933	2014-07-24 19:04:11.870439	\N	94	70
3032	user_1406243364	2014-07-24 19:09:24.331802	2014-07-24 19:09:24.334284	\N	104	96
3033	user_1406243364	2014-07-24 19:09:24.339782	2014-07-24 19:09:24.342282	\N	106	96
3034	user_1406244121	2014-07-24 19:22:01.767638	2014-07-24 19:22:01.770296	\N	104	97
3035	user_1406244121	2014-07-24 19:22:01.7757	2014-07-24 19:22:01.777954	\N	106	97
3036	user_1406245704	2014-07-24 19:48:24.396968	2014-07-24 19:48:24.401587	\N	104	98
3037	user_1406245704	2014-07-24 19:48:24.411102	2014-07-24 19:48:24.413576	\N	106	98
3038	user_1406245834	2014-07-24 19:50:34.395431	2014-07-24 19:50:34.399071	\N	104	99
3039	user_1406245834	2014-07-24 19:50:34.407491	2014-07-24 19:50:34.410683	\N	106	99
3040	user_1406255424	2014-07-24 22:30:24.413973	2014-07-24 22:30:24.417474	\N	104	100
3041	user_1406255424	2014-07-24 22:30:24.424345	2014-07-24 22:30:24.426642	\N	106	100
3042	user_1406255595	2014-07-24 22:33:15.55526	2014-07-24 22:33:15.562016	\N	104	101
3043	user_1406255595	2014-07-24 22:33:15.569142	2014-07-24 22:33:15.571777	\N	106	101
3044	client_1406297574	2014-07-25 10:12:54.488338	2014-07-25 10:12:54.488338	\N	93	102
3045	therapist_1406297574	2014-07-25 10:12:54.492115	2014-07-25 10:12:54.492115	\N	104	102
3046	user_1406324341	2014-07-25 17:39:01.442034	2014-07-25 17:39:01.446997	\N	94	70
3047	user_1406324905	2014-07-25 17:48:25.880146	2014-07-25 17:48:25.884992	\N	94	79
3048	user_1406325139	2014-07-25 17:52:19.980045	2014-07-25 17:52:19.986981	\N	94	79
3049	user_1406326772	2014-07-25 18:19:32.623791	2014-07-25 18:19:32.630552	\N	94	70
3050	user_1406326807	2014-07-25 18:20:07.053533	2014-07-25 18:20:07.058727	\N	94	70
3051	user_1406345964	2014-07-25 23:39:24.018781	2014-07-25 23:39:24.026773	\N	94	79
3052	user_1406349982	2014-07-26 00:46:22.429109	2014-07-26 00:46:22.434861	\N	94	79
3053	user_1406350163	2014-07-26 00:49:23.783062	2014-07-26 00:49:23.788712	\N	94	70
3057	user_1406352338	2014-07-26 01:25:38.433059	2014-07-26 01:25:38.438292	\N	94	79
3058	user_1406685087	2014-07-29 18:51:27.762991	2014-07-29 18:51:27.770023	\N	94	79
3059	user_1406685227	2014-07-29 18:53:47.641408	2014-07-29 18:53:47.646468	\N	94	79
3060	user_1406695731	2014-07-29 21:48:51.28679	2014-07-29 21:48:51.291785	\N	94	79
3061	user_1406775395	2014-07-30 19:56:35.016991	2014-07-30 19:56:35.023454	\N	94	79
3063	user_1406775755	2014-07-30 20:02:35.298842	2014-07-30 20:02:35.304942	\N	104	103
3064	user_1406775755	2014-07-30 20:02:35.313684	2014-07-30 20:02:35.316291	\N	111	103
3054	user_1406350384	2014-07-26 00:53:04.501345	2014-07-26 00:53:04.508652	\N	94	79
3055	user_1406350438	2014-07-26 00:53:58.52014	2014-07-26 00:53:58.525604	\N	94	79
3056	user_1406350876	2014-07-26 01:01:16.354936	2014-07-26 01:01:16.421765	\N	94	79
3062	user_1406775397	2014-07-30 19:56:37.320722	2014-07-30 19:56:37.323533	\N	94	79
3065	user_1406776282	2014-07-30 20:11:22.084422	2014-07-30 20:11:22.089329	\N	104	104
3066	user_1406776282	2014-07-30 20:11:22.098227	2014-07-30 20:11:22.102061	\N	93	104
3067	user_1406776738	2014-07-30 20:18:58.56193	2014-07-30 20:18:58.565475	\N	104	105
3068	user_1406776738	2014-07-30 20:18:58.573247	2014-07-30 20:18:58.575894	\N	93	105
3069	user_1406932831	2014-08-01 22:40:31.173142	2014-08-01 22:40:31.1793	\N	104	106
3070	user_1406932831	2014-08-01 22:40:31.187287	2014-08-01 22:40:31.242342	\N	116	106
3071	user_1406932895	2014-08-01 22:41:35.88481	2014-08-01 22:41:35.888851	\N	104	107
3072	user_1406932895	2014-08-01 22:41:35.896719	2014-08-01 22:41:35.945712	\N	116	107
3073	user_1406933018	2014-08-01 22:43:38.217557	2014-08-01 22:43:38.221657	\N	104	108
3074	user_1406933018	2014-08-01 22:43:38.228539	2014-08-01 22:43:38.231274	\N	116	108
\.


--
-- Name: chat_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('chat_users_id_seq', 3074, true);


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY chats (id, owner, channel, created_at, updated_at, client_id, therapist_id, event_id, timer_time, timer_state) FROM stdin;
1	1	message_channel_1	2014-05-28 18:58:13.015567	2014-05-28 18:58:13.021609	\N	\N	\N	\N	\N
2	1	message_channel_2	2014-05-28 20:36:10.956722	2014-05-28 20:36:10.960994	\N	\N	\N	\N	\N
3	1	message_channel_3	2014-05-28 20:54:10.572311	2014-05-28 20:54:10.576098	\N	\N	\N	\N	\N
4	6	message_channel_4	2014-05-30 03:27:13.934068	2014-05-30 03:27:13.938219	\N	\N	\N	\N	\N
5	6	message_channel_5	2014-05-30 03:27:14.010167	2014-05-30 03:27:14.011881	\N	\N	\N	\N	\N
6	18	message_channel_6	2014-06-24 17:28:25.00269	2014-06-24 17:28:25.007369	\N	\N	\N	\N	\N
7	18	message_channel_7	2014-06-24 17:51:20.174728	2014-06-24 17:51:20.177074	\N	\N	\N	\N	\N
8	18	message_channel_8	2014-06-24 19:52:56.201845	2014-06-24 19:52:56.205516	\N	\N	\N	\N	\N
9	\N	message_channel_9	2014-06-27 04:45:21.427175	2014-06-27 04:45:21.433985	\N	\N	\N	\N	\N
10	\N	message_channel_10	2014-06-27 04:47:50.422078	2014-06-27 04:47:50.424127	\N	\N	\N	\N	\N
11	21	message_channel_11	2014-06-27 05:05:43.081547	2014-06-27 05:05:43.085477	\N	\N	\N	\N	\N
12	\N	\N	2014-06-27 05:13:45.080633	2014-06-27 05:13:45.080633	695	\N	\N	\N	\N
13	\N	\N	2014-06-27 05:14:11.551429	2014-06-27 05:14:11.551429	\N	25	\N	\N	\N
14	21	message_channel_14	2014-06-27 05:24:25.493272	2014-06-27 05:24:25.498864	669	21	\N	\N	\N
15	22	message_channel_15	2014-06-27 05:54:14.075924	2014-06-27 05:54:14.079771	699	22	\N	\N	\N
16	23	message_channel_16	2014-06-27 15:46:55.277081	2014-06-27 15:46:55.279161	703	21	\N	\N	\N
17	23	message_channel_17	2014-06-27 15:51:01.924049	2014-06-27 15:51:01.929456	703	21	\N	\N	\N
18	24	message_channel_18	2014-06-27 17:26:17.22197	2014-06-27 17:26:17.225673	711	21	\N	\N	\N
19	24	message_channel_19	2014-06-27 17:38:15.492364	2014-06-27 17:38:15.497996	711	21	\N	\N	\N
20	25	message_channel_20	2014-06-27 17:57:01.219008	2014-06-27 17:57:01.222633	715	21	\N	\N	\N
21	25	message_channel_21	2014-06-27 17:57:28.352369	2014-06-27 17:57:28.354062	715	21	\N	\N	\N
22	26	message_channel_22	2014-06-27 21:01:33.592782	2014-06-27 21:01:33.596934	718	26	\N	\N	\N
23	26	message_channel_23	2014-06-27 23:05:45.003232	2014-06-27 23:05:45.007697	718	26	352	\N	\N
24	26	message_channel_24	2014-06-27 23:08:57.390914	2014-06-27 23:08:57.393721	718	26	353	\N	\N
25	26	message_channel_25	2014-06-27 23:09:21.82058	2014-06-27 23:09:21.822596	718	26	354	\N	\N
26	26	message_channel_26	2014-06-28 22:43:30.608839	2014-06-28 22:43:30.614246	718	26	355	\N	\N
27	27	message_channel_27	2014-06-28 23:01:22.451438	2014-06-28 23:01:22.453058	739	26	357	\N	\N
28	26	message_channel_28	2014-06-29 01:41:26.823979	2014-06-29 01:41:26.828937	718	26	359	\N	\N
29	28	message_channel_29	2014-06-29 04:29:58.992474	2014-06-29 04:29:58.996261	753	26	362	\N	\N
30	28	message_channel_30	2014-06-29 14:54:56.244037	2014-06-29 14:54:56.248809	753	26	363	\N	\N
31	26	message_channel_	2014-06-29 15:52:54.192386	2014-06-29 15:58:14.036972	718	26	365	\N	\N
32	26	message_channel_	2014-06-29 15:58:42.993625	2014-06-29 15:59:34.197541	718	26	366	\N	\N
33	29	message_channel_33	2014-06-29 20:55:49.472196	2014-06-29 20:55:49.476809	779	26	383	\N	\N
34	26	message_channel_34	2014-06-29 22:20:40.489819	2014-06-29 22:20:40.493888	718	26	393	\N	\N
35	30	message_channel_35	2014-06-29 23:31:32.941359	2014-06-29 23:31:32.945268	790	26	402	\N	\N
36	30	message_channel_36	2014-06-29 23:32:24.366941	2014-06-29 23:32:24.369317	790	26	403	\N	\N
37	26	message_channel_37	2014-06-29 23:38:09.910729	2014-06-29 23:38:09.915945	718	26	405	\N	\N
38	30	message_channel_38	2014-06-29 23:39:40.170735	2014-06-29 23:39:40.17355	790	26	407	\N	\N
39	30	message_channel_39	2014-06-29 23:43:59.155756	2014-06-29 23:43:59.160572	790	26	408	\N	\N
40	30	message_channel_40	2014-06-29 23:57:03.219508	2014-06-29 23:57:03.224125	790	26	414	\N	\N
41	30	message_channel_41	2014-06-30 00:03:17.406233	2014-06-30 00:03:17.410561	790	26	415	\N	\N
42	30	message_channel_42	2014-06-30 00:05:46.231665	2014-06-30 00:05:46.23655	790	26	416	\N	\N
43	31	message_channel_43	2014-06-30 00:10:09.129445	2014-06-30 00:10:09.133235	806	26	418	\N	\N
44	32	message_channel_44	2014-06-30 00:51:21.232159	2014-06-30 00:51:21.23558	810	26	421	\N	\N
45	32	message_channel_45	2014-06-30 00:52:11.72611	2014-06-30 00:52:11.72794	810	26	422	\N	\N
46	34	message_channel_46	2014-06-30 01:12:01.999329	2014-06-30 01:12:02.001556	812	26	423	\N	\N
47	35	message_channel_47	2014-06-30 04:11:03.23276	2014-06-30 04:11:03.236607	835	26	430	\N	\N
48	36	message_channel_48	2014-06-30 04:25:36.726715	2014-06-30 04:25:36.730899	839	26	434	\N	\N
49	37	message_channel_49	2014-06-30 05:52:47.956045	2014-06-30 05:52:47.960387	853	26	447	\N	\N
50	38	message_channel_50	2014-06-30 06:45:36.104702	2014-06-30 06:45:36.109638	862	26	456	\N	\N
51	38	message_channel_51	2014-06-30 06:56:55.869961	2014-06-30 06:56:55.876451	862	26	460	\N	\N
52	38	message_channel_52	2014-06-30 06:58:19.070903	2014-06-30 06:58:19.072644	862	26	461	\N	\N
53	38	message_channel_53	2014-06-30 07:02:47.376149	2014-06-30 07:02:47.3809	862	26	462	\N	\N
54	38	message_channel_54	2014-06-30 07:11:39.051486	2014-06-30 07:11:39.055591	862	26	467	\N	\N
55	38	message_channel_55	2014-06-30 07:17:48.40467	2014-06-30 07:17:48.408359	862	26	468	\N	\N
56	38	message_channel_56	2014-06-30 07:18:59.77212	2014-06-30 07:18:59.773918	862	26	469	\N	\N
57	39	message_channel_57	2014-06-30 07:20:22.442337	2014-06-30 07:20:22.444075	874	26	471	\N	\N
60	26	message_channel_60	2014-06-30 20:52:35.57271	2014-06-30 20:52:35.576644	718	26	486	\N	\N
71	380	message_channel_71	2014-07-11 15:04:00.695093	2014-07-11 15:04:00.721233	718	75	513	\N	\N
62	26	message_channel_62	2014-06-30 21:14:15.609052	2014-06-30 21:14:15.611056	718	26	488	\N	\N
63	26	message_channel_63	2014-06-30 21:21:41.264756	2014-06-30 21:21:41.26727	718	26	489	\N	\N
64	38	message_channel_64	2014-06-30 21:30:58.980747	2014-06-30 21:30:58.982648	862	26	490	\N	\N
65	42	message_channel_65	2014-07-01 00:03:37.500484	2014-07-01 00:03:37.505271	907	26	500	\N	\N
66	42	message_channel_66	2014-07-01 00:13:50.106257	2014-07-01 00:13:50.108276	907	26	501	\N	\N
58	40	message_channel_58	2014-06-30 07:27:22.660688	2014-07-04 17:08:43.944079	875	26	473	-0m -7s	inactive
61	41	message_channel_61	2014-06-30 21:12:16.61354	2014-07-04 17:29:50.202592	894	26	487	-0m -0s	active
72	381	message_channel_72	2014-07-11 15:12:18.812758	2014-07-11 15:12:18.836103	718	75	515	\N	\N
67	26	message_channel_67	2014-07-06 22:19:52.067582	2014-07-06 22:19:52.073152	718	26	508	\N	\N
68	47	message_channel_68	2014-07-07 13:21:02.778053	2014-07-07 13:21:02.782791	\N	26	509	\N	\N
75	384	message_channel_75	2014-07-11 15:20:44.795135	2014-07-11 15:20:44.803119	1403	77	519	\N	\N
59	26	message_channel_59	2014-06-30 15:50:22.333069	2014-07-09 15:55:53.598034	718	26	474	-0m -10s	inactive
69	51	message_channel_69	2014-07-07 13:32:25.389629	2014-07-07 13:32:25.476347	718	26	510	\N	\N
74	383	message_channel_74	2014-07-11 15:19:59.625294	2014-07-11 15:19:59.633107	1398	77	518	\N	\N
77	386	message_channel_77	2014-07-11 15:40:44.308653	2014-07-11 15:40:44.399908	1405	77	521	\N	\N
76	385	message_channel_76	2014-07-11 15:23:57.011744	2014-07-11 15:23:57.106359	1403	77	520	\N	\N
70	\N	message_channel_test	2014-07-09 13:46:21.663479	2014-07-22 12:22:14.927434	\N	\N	\N	0	active
73	382	message_channel_73	2014-07-11 15:19:13.919278	2014-07-22 12:39:27.502472	1398	77	517	0	inactive
79	\N	message_channel_demo	2014-07-15 22:04:06.042492	2014-07-22 12:20:57.912609	\N	\N	\N	0	active
80	\N	message_channel_80	2014-07-22 14:24:24.785973	2014-07-22 14:24:24.791324	1678	80	525	\N	\N
81	\N	message_channel_81	2014-07-22 14:31:58.956629	2014-07-22 14:31:58.95832	1679	81	526	\N	\N
82	\N	message_channel_82	2014-07-22 14:33:47.98431	2014-07-22 14:33:47.987534	1680	82	527	\N	\N
78	387	message_channel_78	2014-07-11 15:44:17.469247	2014-07-22 15:18:21.780983	1408	77	522	0	active
83	2974	message_channel_83	2014-07-24 12:40:42.232968	2014-07-24 12:40:42.268628	1719	83	533	\N	\N
85	\N	\N	2014-07-24 13:02:36.738076	2014-07-24 13:02:57.558695	1722	1715	\N	\N	\N
86	\N	\N	2014-07-24 13:02:57.564307	2014-07-24 13:04:18.385011	1722	1715	\N	\N	\N
87	\N	\N	2014-07-24 13:04:18.390145	2014-07-24 13:06:40.738991	1722	1715	\N	\N	\N
88	\N	message_channel_88	2014-07-24 13:06:40.74394	2014-07-24 13:06:40.822827	1722	1715	535	\N	\N
89	\N	message_channel_89	2014-07-24 17:20:15.469852	2014-07-24 17:20:15.518792	1892	1715	536	\N	\N
90	\N	message_channel_90	2014-07-24 17:26:56.828352	2014-07-24 17:26:56.880911	1895	1715	538	\N	\N
91	\N	message_channel_91	2014-07-24 17:31:27.070197	2014-07-24 17:31:27.117751	1895	1715	539	\N	\N
92	\N	message_channel_92	2014-07-24 18:36:27.824387	2014-07-24 18:36:27.848458	1895	1715	540	\N	\N
93	\N	message_channel_93	2014-07-24 18:53:00.08701	2014-07-24 18:53:00.128097	1895	1715	541	\N	\N
94	\N	message_channel_94	2014-07-24 18:54:08.701054	2014-07-24 18:54:08.727084	1895	1715	542	\N	\N
95	\N	message_channel_95	2014-07-24 18:59:38.086387	2014-07-24 18:59:38.113193	1895	1715	543	\N	\N
96	\N	message_channel_96	2014-07-24 19:09:24.324277	2014-07-24 19:09:24.34606	1722	1715	544	\N	\N
97	\N	message_channel_97	2014-07-24 19:22:01.759705	2014-07-24 19:22:01.78145	1722	1715	545	\N	\N
98	\N	message_channel_98	2014-07-24 19:48:24.372927	2014-07-24 19:48:24.421121	1722	1715	546	\N	\N
99	\N	message_channel_99	2014-07-24 19:50:34.3743	2014-07-24 19:50:34.418051	1722	1715	547	\N	\N
100	\N	message_channel_100	2014-07-24 22:30:24.389133	2014-07-24 22:30:24.435246	1722	1715	549	\N	\N
101	\N	message_channel_101	2014-07-24 22:33:15.529948	2014-07-24 22:33:15.581638	1722	1715	550	\N	\N
102	\N	message_channel_102	2014-07-25 10:12:54.471153	2014-07-25 10:12:54.474154	1408	1715	552	\N	\N
103	\N	message_channel_103	2014-07-30 20:02:35.27153	2014-07-30 20:02:35.322611	2470	1715	563	\N	\N
104	\N	message_channel_104	2014-07-30 20:11:22.058831	2014-07-30 20:11:22.10878	1408	1715	564	\N	\N
105	\N	message_channel_105	2014-07-30 20:18:58.539916	2014-07-30 20:18:58.58193	1408	1715	565	\N	\N
106	\N	message_channel_106	2014-08-01 22:40:31.118093	2014-08-01 22:40:31.24942	2563	1715	571	\N	\N
107	\N	message_channel_107	2014-08-01 22:41:35.859004	2014-08-01 22:41:35.952106	2563	1715	572	\N	\N
108	\N	message_channel_108	2014-08-01 22:43:38.146085	2014-08-01 22:43:38.237175	2563	1715	573	\N	\N
\.


--
-- Name: chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('chats_id_seq', 108, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY clients (id, encrypted_name, encrypted_name_salt, encrypted_name_iv, encrypted_zipcode, encrypted_zipcode_salt, encrypted_zipcode_iv, encrypted_gender, encrypted_gender_salt, encrypted_gender_iv, encrypted_age, encrypted_age_salt, encrypted_age_iv, encrypted_insurance, encrypted_insurance_salt, encrypted_insurance_iv, responses, created_at, updated_at, current_therapist, current_therapist_name, stripe_token, phone, flag_therapist, therapist_id, description, time_zone) FROM stdin;
807	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 00:21:45.075765	2014-06-30 00:21:45.075765	\N	\N	\N	\N	\N	\N	\N	\N
719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 22:39:02.056877	2014-06-27 22:39:02.056877	\N	\N	\N	\N	\N	\N	\N	\N
720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 22:55:59.168891	2014-06-27 22:55:59.168891	\N	\N	\N	\N	\N	\N	\N	\N
808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 00:40:05.213326	2014-06-30 00:40:05.213326	\N	\N	\N	\N	\N	\N	\N	\N
721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 22:57:04.829988	2014-06-27 22:57:04.829988	\N	\N	\N	\N	\N	\N	\N	\N
809	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 00:40:25.886564	2014-06-30 00:40:25.886564	\N	\N	\N	\N	\N	\N	\N	\N
722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 23:00:04.85977	2014-06-27 23:00:04.85977	\N	\N	\N	\N	\N	\N	\N	\N
810	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 00:41:30.100012	2014-06-30 00:41:30.100012	\N	\N	\N	\N	\N	\N	\N	\N
723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 23:01:08.719644	2014-06-27 23:01:08.719644	\N	\N	\N	\N	\N	\N	\N	\N
811	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 00:51:36.409383	2014-06-30 00:51:36.409383	\N	\N	\N	\N	\N	\N	\N	\N
724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 23:02:02.891989	2014-06-27 23:02:02.891989	\N	\N	\N	\N	\N	\N	\N	\N
812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 01:11:17.932874	2014-06-30 01:11:17.932874	\N	\N	\N	\N	\N	\N	\N	\N
725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 23:05:29.78245	2014-06-27 23:05:29.78245	\N	\N	\N	\N	\N	\N	\N	\N
813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 01:12:25.479091	2014-06-30 01:12:25.479091	\N	\N	\N	\N	\N	\N	\N	\N
726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 23:08:41.650549	2014-06-27 23:08:41.650549	\N	\N	\N	\N	\N	\N	\N	\N
814	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 01:14:39.612795	2014-06-30 01:14:39.612795	\N	\N	\N	\N	\N	\N	\N	\N
727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 23:09:05.826436	2014-06-27 23:09:05.826436	\N	\N	\N	\N	\N	\N	\N	\N
815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 01:15:04.129857	2014-06-30 01:15:04.129857	\N	\N	\N	\N	\N	\N	\N	\N
728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 23:28:21.778269	2014-06-27 23:28:21.778269	\N	\N	\N	\N	\N	\N	\N	\N
729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 23:31:33.7903	2014-06-27 23:31:33.7903	\N	\N	\N	\N	\N	\N	\N	\N
730	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:26:12.816468	2014-06-28 22:26:12.816468	\N	\N	\N	\N	\N	\N	\N	\N
731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:26:46.462125	2014-06-28 22:26:46.462125	\N	\N	\N	\N	\N	\N	\N	\N
732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:27:38.12458	2014-06-28 22:27:38.12458	\N	\N	\N	\N	\N	\N	\N	\N
733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:27:50.274776	2014-06-28 22:27:50.274776	\N	\N	\N	\N	\N	\N	\N	\N
734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:41:00.651878	2014-06-28 22:41:00.651878	\N	\N	\N	\N	\N	\N	\N	\N
735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:41:08.774166	2014-06-28 22:41:08.774166	\N	\N	\N	\N	\N	\N	\N	\N
736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:42:37.250629	2014-06-28 22:42:37.250629	\N	\N	\N	\N	\N	\N	\N	\N
816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 01:15:24.558583	2014-06-30 01:15:24.558583	\N	\N	\N	\N	\N	\N	\N	\N
737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:44:33.202349	2014-06-28 22:44:33.202349	\N	\N	\N	\N	\N	\N	\N	\N
738	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:45:38.313677	2014-06-28 22:45:38.313677	\N	\N	\N	\N	\N	\N	\N	\N
739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 22:53:07.944528	2014-06-28 23:01:22.424712	\N	\N	tok_104J722k182tB9JIjSJ3YQrG	\N	\N	\N	\N	\N
740	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 23:02:45.785837	2014-06-28 23:02:45.785837	\N	\N	\N	\N	\N	\N	\N	\N
741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 23:20:31.065118	2014-06-28 23:20:31.065118	\N	\N	\N	\N	\N	\N	\N	\N
742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 23:20:34.344039	2014-06-28 23:20:34.344039	\N	\N	\N	\N	\N	\N	\N	\N
743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 23:20:57.772166	2014-06-28 23:20:57.772166	\N	\N	\N	\N	\N	\N	\N	\N
744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 23:23:07.821902	2014-06-28 23:23:07.821902	\N	\N	\N	\N	\N	\N	\N	\N
745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-28 23:28:58.730473	2014-06-28 23:28:58.730473	\N	\N	\N	\N	\N	\N	\N	\N
746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 01:38:29.490309	2014-06-29 01:38:29.490309	\N	\N	\N	\N	\N	\N	\N	\N
747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 01:41:04.376643	2014-06-29 01:41:04.376643	\N	\N	\N	\N	\N	\N	\N	\N
718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-27 21:01:09.489148	2014-06-29 01:41:26.77329	\N	\N	tok_104J9c2k182tB9JISpq3pgUC	\N	\N	\N	\N	\N
748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 02:56:53.081272	2014-06-29 02:56:53.081272	\N	\N	\N	\N	\N	\N	\N	\N
749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 03:06:42.604574	2014-06-29 03:06:42.604574	\N	\N	\N	\N	\N	\N	\N	\N
750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 03:07:49.638033	2014-06-29 03:07:49.638033	\N	\N	\N	\N	\N	\N	\N	\N
751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 03:10:23.08393	2014-06-29 03:10:23.08393	\N	\N	\N	\N	\N	\N	\N	\N
752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 03:11:15.222001	2014-06-29 03:11:15.222001	\N	\N	\N	\N	\N	\N	\N	\N
753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 03:12:12.796462	2014-06-29 04:29:58.942859	\N	\N	tok_104JCL2k182tB9JIJvJuU9kO	\N	\N	\N	\N	\N
754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 14:54:38.193925	2014-06-29 14:54:38.193925	\N	\N	\N	\N	\N	\N	\N	\N
755	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 15:43:44.487752	2014-06-29 15:43:44.487752	\N	\N	\N	\N	\N	\N	\N	\N
756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 15:49:14.312648	2014-06-29 15:49:14.312648	\N	\N	\N	\N	\N	\N	\N	\N
757	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 15:52:33.430056	2014-06-29 15:52:33.430056	\N	\N	\N	\N	\N	\N	\N	\N
758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 15:58:25.656181	2014-06-29 15:58:25.656181	\N	\N	\N	\N	\N	\N	\N	\N
759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 16:15:54.942743	2014-06-29 16:15:54.942743	\N	\N	\N	\N	\N	\N	\N	\N
760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 16:19:49.869655	2014-06-29 16:19:49.869655	\N	\N	\N	\N	\N	\N	\N	\N
761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 16:19:57.828629	2014-06-29 16:19:57.828629	\N	\N	\N	\N	\N	\N	\N	\N
762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:20:23.869653	2014-06-29 18:20:23.869653	\N	\N	\N	\N	\N	\N	\N	\N
763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:24:02.101708	2014-06-29 18:24:02.101708	\N	\N	\N	\N	\N	\N	\N	\N
764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:24:38.337326	2014-06-29 18:24:38.337326	\N	\N	\N	\N	\N	\N	\N	\N
765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:28:12.019221	2014-06-29 18:28:12.019221	\N	\N	\N	\N	\N	\N	\N	\N
766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:29:18.394701	2014-06-29 18:29:18.394701	\N	\N	\N	\N	\N	\N	\N	\N
767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:33:11.135961	2014-06-29 18:33:11.135961	\N	\N	\N	\N	\N	\N	\N	\N
768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:33:30.548725	2014-06-29 18:33:30.548725	\N	\N	\N	\N	\N	\N	\N	\N
769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:35:02.866741	2014-06-29 18:35:02.866741	\N	\N	\N	\N	\N	\N	\N	\N
770	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:35:21.266276	2014-06-29 18:35:21.266276	\N	\N	\N	\N	\N	\N	\N	\N
771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:43:59.903749	2014-06-29 18:43:59.903749	\N	\N	\N	\N	\N	\N	\N	\N
772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 18:44:56.921509	2014-06-29 18:44:56.921509	\N	\N	\N	\N	\N	\N	\N	\N
773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 19:02:13.876458	2014-06-29 19:02:13.876458	\N	\N	\N	\N	\N	\N	\N	\N
774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 19:13:50.079693	2014-06-29 19:13:50.079693	\N	\N	\N	\N	\N	\N	\N	\N
775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 19:27:28.648045	2014-06-29 19:27:28.648045	\N	\N	\N	\N	\N	\N	\N	\N
776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 20:36:20.904957	2014-06-29 20:36:20.904957	\N	\N	\N	\N	\N	\N	\N	\N
777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 20:50:42.701862	2014-06-29 20:50:42.701862	\N	\N	\N	\N	\N	\N	\N	\N
778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 20:50:54.074278	2014-06-29 20:50:54.074278	\N	\N	\N	\N	\N	\N	\N	\N
779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 20:53:41.018354	2014-06-29 20:53:41.018354	\N	\N	\N	\N	\N	\N	\N	\N
780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 22:14:32.53095	2014-06-29 22:14:32.53095	\N	\N	\N	\N	\N	\N	\N	\N
781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 22:14:40.900462	2014-06-29 22:14:40.900462	\N	\N	\N	\N	\N	\N	\N	\N
782	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 22:16:34.595924	2014-06-29 22:16:34.595924	\N	\N	\N	\N	\N	\N	\N	\N
783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 22:19:27.70792	2014-06-29 22:19:27.70792	\N	\N	\N	\N	\N	\N	\N	\N
784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 22:21:01.71289	2014-06-29 22:21:01.71289	\N	\N	\N	\N	\N	\N	\N	\N
785	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:15:45.87862	2014-06-29 23:15:45.87862	\N	\N	\N	\N	\N	\N	\N	\N
786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:16:54.17231	2014-06-29 23:16:54.17231	\N	\N	\N	\N	\N	\N	\N	\N
787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:21:37.6876	2014-06-29 23:21:37.6876	\N	\N	\N	\N	\N	\N	\N	\N
788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:24:52.393134	2014-06-29 23:24:52.393134	\N	\N	\N	\N	\N	\N	\N	\N
789	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:28:09.303224	2014-06-29 23:28:09.303224	\N	\N	\N	\N	\N	\N	\N	\N
790	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:30:06.721628	2014-06-29 23:30:06.721628	\N	\N	\N	\N	\N	\N	\N	\N
791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:31:45.448918	2014-06-29 23:31:45.448918	\N	\N	\N	\N	\N	\N	\N	\N
792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:36:47.059215	2014-06-29 23:36:47.059215	\N	\N	\N	\N	\N	\N	\N	\N
793	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:37:34.730902	2014-06-29 23:37:34.730902	\N	\N	\N	\N	\N	\N	\N	\N
794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:38:17.244076	2014-06-29 23:38:17.244076	\N	\N	\N	\N	\N	\N	\N	\N
795	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:39:05.012533	2014-06-29 23:39:05.012533	\N	\N	\N	\N	\N	\N	\N	\N
796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:39:52.133037	2014-06-29 23:39:52.133037	\N	\N	\N	\N	\N	\N	\N	\N
797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:45:19.291279	2014-06-29 23:45:19.291279	\N	\N	\N	\N	\N	\N	\N	\N
798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:47:57.085051	2014-06-29 23:47:57.085051	\N	\N	\N	\N	\N	\N	\N	\N
799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:52:00.557831	2014-06-29 23:52:00.557831	\N	\N	\N	\N	\N	\N	\N	\N
800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:53:43.360041	2014-06-29 23:53:43.360041	\N	\N	\N	\N	\N	\N	\N	\N
801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:56:26.771043	2014-06-29 23:56:26.771043	\N	\N	\N	\N	\N	\N	\N	\N
802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-29 23:59:07.170015	2014-06-29 23:59:07.170015	\N	\N	\N	\N	\N	\N	\N	\N
803	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 00:03:26.829925	2014-06-30 00:03:26.829925	\N	\N	\N	\N	\N	\N	\N	\N
804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 00:05:50.766058	2014-06-30 00:05:50.766058	\N	\N	\N	\N	\N	\N	\N	\N
805	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 00:06:04.746123	2014-06-30 00:06:04.746123	\N	\N	\N	\N	\N	\N	\N	\N
806	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 00:08:44.804382	2014-06-30 00:08:44.804382	\N	\N	\N	\N	\N	\N	\N	\N
817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 01:15:29.335474	2014-06-30 01:15:29.335474	\N	\N	\N	\N	\N	\N	\N	\N
818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 01:42:14.978228	2014-06-30 01:42:14.978228	\N	\N	\N	\N	\N	\N	\N	\N
819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 01:45:56.69931	2014-06-30 01:45:56.69931	\N	\N	\N	\N	\N	\N	\N	\N
820	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 02:10:32.555224	2014-06-30 02:10:32.555224	\N	\N	\N	\N	\N	\N	\N	\N
821	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 02:10:45.69255	2014-06-30 02:10:45.69255	\N	\N	\N	\N	\N	\N	\N	\N
823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 02:17:41.551247	2014-06-30 02:17:41.551247	\N	\N	\N	\N	\N	\N	\N	\N
824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 02:18:17.257836	2014-06-30 02:18:17.257836	\N	\N	\N	\N	\N	\N	\N	\N
825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 02:18:55.182861	2014-06-30 02:18:55.182861	\N	\N	\N	\N	\N	\N	\N	\N
826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 02:19:57.223646	2014-06-30 02:19:57.223646	\N	\N	\N	\N	\N	\N	\N	\N
827	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 02:22:24.83944	2014-06-30 02:22:24.83944	\N	\N	\N	\N	\N	\N	\N	\N
828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 02:23:35.064868	2014-06-30 02:23:35.064868	\N	\N	\N	\N	\N	\N	\N	\N
829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 02:26:27.680337	2014-06-30 02:26:27.680337	\N	\N	\N	\N	\N	\N	\N	\N
830	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:03:49.89412	2014-06-30 04:03:49.89412	\N	\N	\N	\N	\N	\N	\N	\N
831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:07:29.822471	2014-06-30 04:07:29.822471	\N	\N	\N	\N	\N	\N	\N	\N
832	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:07:36.375097	2014-06-30 04:07:36.375097	\N	\N	\N	\N	\N	\N	\N	\N
833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:08:46.530285	2014-06-30 04:08:46.530285	\N	\N	\N	\N	\N	\N	\N	\N
834	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:09:02.494135	2014-06-30 04:09:02.494135	\N	\N	\N	\N	\N	\N	\N	\N
835	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:10:17.58853	2014-06-30 04:10:17.58853	\N	\N	\N	\N	\N	\N	\N	\N
836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:11:54.862213	2014-06-30 04:11:54.862213	\N	\N	\N	\N	\N	\N	\N	\N
837	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:13:55.488292	2014-06-30 04:13:55.488292	\N	\N	\N	\N	\N	\N	\N	\N
838	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:13:59.63588	2014-06-30 04:13:59.63588	\N	\N	\N	\N	\N	\N	\N	\N
839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:23:49.140739	2014-06-30 04:23:49.140739	\N	\N	\N	\N	\N	\N	\N	\N
840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 04:27:25.659461	2014-06-30 04:27:25.659461	\N	\N	\N	\N	\N	\N	\N	\N
841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:14:30.04277	2014-06-30 05:14:30.04277	\N	\N	\N	\N	\N	\N	\N	\N
842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:35:26.189101	2014-06-30 05:35:26.189101	\N	\N	\N	\N	\N	\N	\N	\N
843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:37:23.407674	2014-06-30 05:37:23.407674	\N	\N	\N	\N	\N	\N	\N	\N
844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:38:59.343288	2014-06-30 05:38:59.343288	\N	\N	\N	\N	\N	\N	\N	\N
845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:39:10.061778	2014-06-30 05:39:10.061778	\N	\N	\N	\N	\N	\N	\N	\N
846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:40:52.879941	2014-06-30 05:40:52.879941	\N	\N	\N	\N	\N	\N	\N	\N
847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:41:27.802509	2014-06-30 05:41:27.802509	\N	\N	\N	\N	\N	\N	\N	\N
848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:44:11.890713	2014-06-30 05:44:11.890713	\N	\N	\N	\N	\N	\N	\N	\N
849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:44:29.71986	2014-06-30 05:44:29.71986	\N	\N	\N	\N	\N	\N	\N	\N
850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:45:51.251959	2014-06-30 05:45:51.251959	\N	\N	\N	\N	\N	\N	\N	\N
851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:47:07.874402	2014-06-30 05:47:07.874402	\N	\N	\N	\N	\N	\N	\N	\N
852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:48:10.849993	2014-06-30 05:48:10.849993	\N	\N	\N	\N	\N	\N	\N	\N
853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:51:18.222715	2014-06-30 05:51:18.222715	\N	\N	\N	\N	\N	\N	\N	\N
854	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:52:53.958405	2014-06-30 05:52:53.958405	\N	\N	\N	\N	\N	\N	\N	\N
855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:58:24.779699	2014-06-30 05:58:24.779699	\N	\N	\N	\N	\N	\N	\N	\N
856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 05:59:43.080812	2014-06-30 05:59:43.080812	\N	\N	\N	\N	\N	\N	\N	\N
857	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:21:13.834388	2014-06-30 06:21:13.834388	\N	\N	\N	\N	\N	\N	\N	\N
858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:24:16.762662	2014-06-30 06:24:16.762662	\N	\N	\N	\N	\N	\N	\N	\N
859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:29:51.140814	2014-06-30 06:29:51.140814	\N	\N	\N	\N	\N	\N	\N	\N
860	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:32:48.692604	2014-06-30 06:32:48.692604	\N	\N	\N	\N	\N	\N	\N	\N
861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:32:52.596219	2014-06-30 06:32:52.596219	\N	\N	\N	\N	\N	\N	\N	\N
862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:44:58.193721	2014-06-30 06:44:58.193721	\N	\N	\N	\N	\N	\N	\N	\N
863	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:45:46.958683	2014-06-30 06:45:46.958683	\N	\N	\N	\N	\N	\N	\N	\N
864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:47:53.506159	2014-06-30 06:47:53.506159	\N	\N	\N	\N	\N	\N	\N	\N
865	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:51:23.88822	2014-06-30 06:51:23.88822	\N	\N	\N	\N	\N	\N	\N	\N
866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:54:58.889236	2014-06-30 06:54:58.889236	\N	\N	\N	\N	\N	\N	\N	\N
867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 06:57:45.456255	2014-06-30 06:57:45.456255	\N	\N	\N	\N	\N	\N	\N	\N
868	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 07:02:14.732113	2014-06-30 07:02:14.732113	\N	\N	\N	\N	\N	\N	\N	\N
869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 07:05:08.291018	2014-06-30 07:05:08.291018	\N	\N	\N	\N	\N	\N	\N	\N
870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 07:08:11.700324	2014-06-30 07:08:11.700324	\N	\N	\N	\N	\N	\N	\N	\N
871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 07:11:04.126648	2014-06-30 07:11:04.126648	\N	\N	\N	\N	\N	\N	\N	\N
872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 07:17:15.649324	2014-06-30 07:17:15.649324	\N	\N	\N	\N	\N	\N	\N	\N
873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 07:18:32.359452	2014-06-30 07:18:32.359452	\N	\N	\N	\N	\N	\N	\N	\N
874	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 07:19:24.953722	2014-06-30 07:19:24.953722	\N	\N	\N	\N	\N	\N	\N	\N
875	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 07:26:45.410199	2014-06-30 07:26:45.410199	\N	\N	\N	\N	\N	\N	\N	\N
876	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 15:49:31.987514	2014-06-30 15:49:31.987514	\N	\N	\N	\N	\N	\N	\N	\N
877	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 15:49:50.729289	2014-06-30 15:49:50.729289	\N	\N	\N	\N	\N	\N	\N	\N
878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 18:53:10.519938	2014-06-30 18:53:10.519938	\N	\N	\N	\N	\N	\N	\N	\N
879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 18:57:20.748542	2014-06-30 18:57:20.748542	\N	\N	\N	\N	\N	\N	\N	\N
880	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 19:12:25.552161	2014-06-30 19:12:25.552161	\N	\N	\N	\N	\N	\N	\N	\N
881	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 19:18:43.483784	2014-06-30 19:18:43.483784	\N	\N	\N	\N	\N	\N	\N	\N
882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 19:18:56.519747	2014-06-30 19:18:56.519747	\N	\N	\N	\N	\N	\N	\N	\N
883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 19:19:12.881069	2014-06-30 19:19:12.881069	\N	\N	\N	\N	\N	\N	\N	\N
884	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 19:19:18.587256	2014-06-30 19:19:18.587256	\N	\N	\N	\N	\N	\N	\N	\N
885	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 19:19:22.248334	2014-06-30 19:19:22.248334	\N	\N	\N	\N	\N	\N	\N	\N
886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 19:19:50.013663	2014-06-30 19:19:50.013663	\N	\N	\N	\N	\N	\N	\N	\N
887	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 19:20:01.050461	2014-06-30 19:20:01.050461	\N	\N	\N	\N	\N	\N	\N	\N
888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 20:45:10.491007	2014-06-30 20:45:10.491007	\N	\N	\N	\N	\N	\N	\N	\N
889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 20:45:53.338414	2014-06-30 20:45:53.338414	\N	\N	\N	\N	\N	\N	\N	\N
890	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 20:47:02.701567	2014-06-30 20:47:02.701567	\N	\N	\N	\N	\N	\N	\N	\N
891	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 20:48:23.481143	2014-06-30 20:48:23.481143	\N	\N	\N	\N	\N	\N	\N	\N
892	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 20:50:30.997231	2014-06-30 20:50:30.997231	\N	\N	\N	\N	\N	\N	\N	\N
893	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 20:51:33.688101	2014-06-30 20:51:33.688101	\N	\N	\N	\N	\N	\N	\N	\N
894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 20:55:54.868557	2014-06-30 20:55:54.868557	\N	\N	\N	\N	\N	\N	\N	\N
895	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 21:13:47.452862	2014-06-30 21:13:47.452862	\N	\N	\N	\N	\N	\N	\N	\N
896	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 21:21:08.987966	2014-06-30 21:21:08.987966	\N	\N	\N	\N	\N	\N	\N	\N
897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 21:22:02.916244	2014-06-30 21:22:02.916244	\N	\N	\N	\N	\N	\N	\N	\N
898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 23:18:28.106938	2014-06-30 23:18:28.106938	\N	\N	\N	\N	\N	\N	\N	\N
899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 23:27:00.067937	2014-06-30 23:27:00.067937	\N	\N	\N	\N	\N	\N	\N	\N
900	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 23:27:31.871633	2014-06-30 23:27:31.871633	\N	\N	\N	\N	\N	\N	\N	\N
901	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 23:46:31.738695	2014-06-30 23:46:31.738695	\N	\N	\N	\N	\N	\N	\N	\N
902	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 23:49:14.626532	2014-06-30 23:49:14.626532	\N	\N	\N	\N	\N	\N	\N	\N
903	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 23:52:20.755693	2014-06-30 23:52:20.755693	\N	\N	\N	\N	\N	\N	\N	\N
904	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 23:54:01.538951	2014-06-30 23:54:01.538951	\N	\N	\N	\N	\N	\N	\N	\N
905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-06-30 23:54:22.360187	2014-06-30 23:54:22.360187	\N	\N	\N	\N	\N	\N	\N	\N
906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-01 00:02:41.511298	2014-07-01 00:02:41.511298	\N	\N	\N	\N	\N	\N	\N	\N
907	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-01 00:03:04.028148	2014-07-01 00:03:04.028148	\N	\N	\N	\N	\N	\N	\N	\N
908	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-01 00:03:05.719135	2014-07-01 00:03:05.719135	\N	\N	\N	\N	\N	\N	\N	\N
909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-01 00:13:19.511601	2014-07-01 00:13:19.511601	\N	\N	\N	\N	\N	\N	\N	\N
910	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-01 00:30:42.581009	2014-07-01 00:30:42.581009	\N	\N	\N	\N	\N	\N	\N	\N
911	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-03 03:59:40.524364	2014-07-03 03:59:40.524364	\N	\N	\N	\N	\N	\N	\N	\N
912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-03 04:00:12.425641	2014-07-03 04:00:12.425641	\N	\N	\N	\N	\N	\N	\N	\N
913	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-06 21:54:55.583571	2014-07-06 21:54:55.583571	\N	\N	\N	\N	\N	\N	\N	\N
914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-06 21:57:08.501589	2014-07-06 21:57:08.501589	\N	\N	\N	\N	\N	\N	\N	\N
915	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-06 21:58:42.191076	2014-07-06 21:58:42.191076	\N	\N	\N	\N	\N	\N	\N	\N
916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-06 22:14:42.362678	2014-07-06 22:14:42.362678	\N	\N	\N	\N	\N	\N	\N	\N
917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-06 22:16:09.778732	2014-07-06 22:16:09.778732	\N	\N	\N	\N	\N	\N	\N	\N
918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-06 22:19:10.099495	2014-07-06 22:19:10.099495	\N	\N	\N	\N	\N	\N	\N	\N
919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 13:19:44.860132	2014-07-07 13:19:44.860132	\N	\N	\N	\N	\N	\N	\N	\N
920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 13:20:31.472899	2014-07-07 13:20:31.472899	\N	\N	\N	\N	\N	\N	\N	\N
921	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 13:25:43.132256	2014-07-07 13:25:43.132256	\N	\N	\N	\N	\N	\N	\N	\N
922	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 17:02:54.245229	2014-07-07 17:02:54.245229	\N	\N	\N	\N	\N	\N	\N	\N
923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 17:58:20.406952	2014-07-07 17:58:20.406952	\N	\N	\N	\N	\N	\N	\N	\N
924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:28:16.512774	2014-07-07 18:28:16.512774	\N	\N	\N	\N	\N	\N	\N	\N
925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:30:36.950342	2014-07-07 18:30:36.950342	\N	\N	\N	\N	\N	\N	\N	\N
926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:31:18.084632	2014-07-07 18:31:18.084632	\N	\N	\N	\N	\N	\N	\N	\N
927	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:31:27.036947	2014-07-07 18:31:27.036947	\N	\N	\N	\N	\N	\N	\N	\N
928	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:31:45.947485	2014-07-07 18:31:45.947485	\N	\N	\N	\N	\N	\N	\N	\N
929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:31:54.004296	2014-07-07 18:31:54.004296	\N	\N	\N	\N	\N	\N	\N	\N
930	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:32:02.74137	2014-07-07 18:32:02.74137	\N	\N	\N	\N	\N	\N	\N	\N
931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:32:34.841629	2014-07-07 18:32:34.841629	\N	\N	\N	\N	\N	\N	\N	\N
932	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:33:17.117727	2014-07-07 18:33:17.117727	\N	\N	\N	\N	\N	\N	\N	\N
933	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:33:44.36223	2014-07-07 18:33:44.36223	\N	\N	\N	\N	\N	\N	\N	\N
934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:33:49.338804	2014-07-07 18:33:49.338804	\N	\N	\N	\N	\N	\N	\N	\N
935	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:33:59.602508	2014-07-07 18:33:59.602508	\N	\N	\N	\N	\N	\N	\N	\N
936	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:34:05.844075	2014-07-07 18:34:05.844075	\N	\N	\N	\N	\N	\N	\N	\N
937	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:34:10.161469	2014-07-07 18:34:10.161469	\N	\N	\N	\N	\N	\N	\N	\N
938	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:34:13.619626	2014-07-07 18:34:13.619626	\N	\N	\N	\N	\N	\N	\N	\N
939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:34:28.113129	2014-07-07 18:34:28.113129	\N	\N	\N	\N	\N	\N	\N	\N
940	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:34:55.244573	2014-07-07 18:34:55.244573	\N	\N	\N	\N	\N	\N	\N	\N
941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:35:06.132804	2014-07-07 18:35:06.132804	\N	\N	\N	\N	\N	\N	\N	\N
942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:36:30.961208	2014-07-07 18:36:30.961208	\N	\N	\N	\N	\N	\N	\N	\N
943	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:36:45.66945	2014-07-07 18:36:45.66945	\N	\N	\N	\N	\N	\N	\N	\N
944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:37:21.701336	2014-07-07 18:37:21.701336	\N	\N	\N	\N	\N	\N	\N	\N
945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:38:57.105143	2014-07-07 18:38:57.105143	\N	\N	\N	\N	\N	\N	\N	\N
946	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:39:37.676912	2014-07-07 18:39:37.676912	\N	\N	\N	\N	\N	\N	\N	\N
947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:39:43.053349	2014-07-07 18:39:43.053349	\N	\N	\N	\N	\N	\N	\N	\N
948	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:39:46.293965	2014-07-07 18:39:46.293965	\N	\N	\N	\N	\N	\N	\N	\N
949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 18:40:07.467646	2014-07-07 18:40:07.467646	\N	\N	\N	\N	\N	\N	\N	\N
950	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 20:20:14.731912	2014-07-07 20:20:14.731912	\N	\N	\N	\N	\N	\N	\N	\N
951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-07 20:22:29.694282	2014-07-07 20:22:29.694282	\N	\N	\N	\N	\N	\N	\N	\N
952	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-08 01:08:11.579617	2014-07-08 01:08:11.579617	\N	\N	\N	\N	\N	\N	\N	\N
953	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-08 01:17:13.692924	2014-07-08 01:17:13.692924	\N	\N	\N	\N	\N	\N	\N	\N
954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-08 01:17:52.522834	2014-07-08 01:17:52.522834	\N	\N	\N	\N	\N	\N	\N	\N
955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-08 23:07:06.94559	2014-07-08 23:07:06.94559	\N	\N	\N	\N	\N	\N	\N	\N
956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-09 00:33:15.05865	2014-07-09 00:33:15.05865	\N	\N	\N	\N	\N	\N	\N	\N
957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-09 11:24:22.334085	2014-07-09 11:24:22.334085	\N	\N	\N	\N	\N	\N	\N	\N
958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-09 11:39:47.703216	2014-07-09 11:39:47.703216	\N	\N	\N	\N	\N	\N	\N	\N
959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-09 13:58:25.577475	2014-07-09 13:58:25.577475	\N	\N	\N	\N	\N	\N	\N	\N
960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:23:21.224627	2014-07-10 12:23:21.224627	\N	\N	\N	\N	\N	\N	\N	\N
961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:25:58.809373	2014-07-10 12:25:58.809373	\N	\N	\N	\N	\N	\N	\N	\N
962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:26:05.00412	2014-07-10 12:26:05.00412	\N	\N	\N	\N	\N	\N	\N	\N
963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:27:23.518433	2014-07-10 12:27:23.518433	\N	\N	\N	\N	\N	\N	\N	\N
964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:27:43.012197	2014-07-10 12:27:43.012197	\N	\N	\N	\N	\N	\N	\N	\N
965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:27:49.111691	2014-07-10 12:27:49.111691	\N	\N	\N	\N	\N	\N	\N	\N
966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:30:34.432802	2014-07-10 12:30:34.432802	\N	\N	\N	\N	\N	\N	\N	\N
967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:30:44.622579	2014-07-10 12:30:44.622579	\N	\N	\N	\N	\N	\N	\N	\N
968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:35:16.806774	2014-07-10 12:35:16.806774	\N	\N	\N	\N	\N	\N	\N	\N
969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:35:24.322409	2014-07-10 12:35:24.322409	\N	\N	\N	\N	\N	\N	\N	\N
970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:35:28.3262	2014-07-10 12:35:28.3262	\N	\N	\N	\N	\N	\N	\N	\N
971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:35:34.887788	2014-07-10 12:35:34.887788	\N	\N	\N	\N	\N	\N	\N	\N
972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:36:19.911978	2014-07-10 12:36:19.911978	\N	\N	\N	\N	\N	\N	\N	\N
973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:36:50.423669	2014-07-10 12:36:50.423669	\N	\N	\N	\N	\N	\N	\N	\N
974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:37:08.061496	2014-07-10 12:37:08.061496	\N	\N	\N	\N	\N	\N	\N	\N
975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:45:30.675703	2014-07-10 12:45:30.675703	\N	\N	\N	\N	\N	\N	\N	\N
976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:45:48.016531	2014-07-10 12:45:48.016531	\N	\N	\N	\N	\N	\N	\N	\N
977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:46:14.279713	2014-07-10 12:46:14.279713	\N	\N	\N	\N	\N	\N	\N	\N
978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:48:01.765859	2014-07-10 12:48:01.765859	\N	\N	\N	\N	\N	\N	\N	\N
979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:48:43.59392	2014-07-10 12:48:43.59392	\N	\N	\N	\N	\N	\N	\N	\N
980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:49:12.571329	2014-07-10 12:49:12.571329	\N	\N	\N	\N	\N	\N	\N	\N
981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:49:20.505577	2014-07-10 12:49:20.505577	\N	\N	\N	\N	\N	\N	\N	\N
982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:49:57.098658	2014-07-10 12:49:57.098658	\N	\N	\N	\N	\N	\N	\N	\N
983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:50:25.419179	2014-07-10 12:50:25.419179	\N	\N	\N	\N	\N	\N	\N	\N
984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:50:33.30837	2014-07-10 12:50:33.30837	\N	\N	\N	\N	\N	\N	\N	\N
985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:53:26.009747	2014-07-10 12:53:26.009747	\N	\N	\N	\N	\N	\N	\N	\N
986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:54:03.976114	2014-07-10 12:54:03.976114	\N	\N	\N	\N	\N	\N	\N	\N
987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 12:59:56.264308	2014-07-10 12:59:56.264308	\N	\N	\N	\N	\N	\N	\N	\N
988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:00:09.797302	2014-07-10 13:00:09.797302	\N	\N	\N	\N	\N	\N	\N	\N
989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:01:38.865096	2014-07-10 13:01:38.865096	\N	\N	\N	\N	\N	\N	\N	\N
990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:01:53.384497	2014-07-10 13:01:53.384497	\N	\N	\N	\N	\N	\N	\N	\N
991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:06:11.508986	2014-07-10 13:06:11.508986	\N	\N	\N	\N	\N	\N	\N	\N
992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:07:43.958899	2014-07-10 13:07:43.958899	\N	\N	\N	\N	\N	\N	\N	\N
993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:08:43.10531	2014-07-10 13:08:43.10531	\N	\N	\N	\N	\N	\N	\N	\N
994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:08:54.9802	2014-07-10 13:08:54.9802	\N	\N	\N	\N	\N	\N	\N	\N
995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:09:11.717095	2014-07-10 13:09:11.717095	\N	\N	\N	\N	\N	\N	\N	\N
996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:15:00.379357	2014-07-10 13:15:00.379357	\N	\N	\N	\N	\N	\N	\N	\N
997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:15:03.340074	2014-07-10 13:15:03.340074	\N	\N	\N	\N	\N	\N	\N	\N
998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:15:07.791805	2014-07-10 13:15:07.791805	\N	\N	\N	\N	\N	\N	\N	\N
999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:15:09.815258	2014-07-10 13:15:09.815258	\N	\N	\N	\N	\N	\N	\N	\N
1000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:15:35.248751	2014-07-10 13:15:35.248751	\N	\N	\N	\N	\N	\N	\N	\N
1001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:15:47.839341	2014-07-10 13:15:47.839341	\N	\N	\N	\N	\N	\N	\N	\N
1002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:16:02.853272	2014-07-10 13:16:02.853272	\N	\N	\N	\N	\N	\N	\N	\N
1003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:16:52.987155	2014-07-10 13:16:52.987155	\N	\N	\N	\N	\N	\N	\N	\N
1004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:17:15.864179	2014-07-10 13:17:15.864179	\N	\N	\N	\N	\N	\N	\N	\N
1005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:19:51.618468	2014-07-10 13:19:51.618468	\N	\N	\N	\N	\N	\N	\N	\N
1006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:23:32.571495	2014-07-10 13:23:32.571495	\N	\N	\N	\N	\N	\N	\N	\N
1007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:24:11.522227	2014-07-10 13:24:11.522227	\N	\N	\N	\N	\N	\N	\N	\N
1008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:26:35.682688	2014-07-10 13:26:35.682688	\N	\N	\N	\N	\N	\N	\N	\N
1009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:27:24.670178	2014-07-10 13:27:24.670178	\N	\N	\N	\N	\N	\N	\N	\N
1010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:27:57.624439	2014-07-10 13:27:57.624439	\N	\N	\N	\N	\N	\N	\N	\N
1011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:28:13.541731	2014-07-10 13:28:13.541731	\N	\N	\N	\N	\N	\N	\N	\N
1012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:28:58.227968	2014-07-10 13:28:58.227968	\N	\N	\N	\N	\N	\N	\N	\N
1013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:33:40.154074	2014-07-10 13:33:40.154074	\N	\N	\N	\N	\N	\N	\N	\N
1014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:35:15.534568	2014-07-10 13:35:15.534568	\N	\N	\N	\N	\N	\N	\N	\N
1015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:37:06.096573	2014-07-10 13:37:06.096573	\N	\N	\N	\N	\N	\N	\N	\N
1016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 13:39:10.431524	2014-07-10 13:39:10.431524	\N	\N	\N	\N	\N	\N	\N	\N
1017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:47:09.674956	2014-07-10 14:47:09.674956	\N	\N	\N	\N	\N	\N	\N	\N
1018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:48:25.919305	2014-07-10 14:48:25.919305	\N	\N	\N	\N	\N	\N	\N	\N
1019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:49:59.066913	2014-07-10 14:49:59.066913	\N	\N	\N	\N	\N	\N	\N	\N
1020	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:50:17.072204	2014-07-10 14:50:17.072204	\N	\N	\N	\N	\N	\N	\N	\N
1021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:50:22.921908	2014-07-10 14:50:22.921908	\N	\N	\N	\N	\N	\N	\N	\N
1022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:50:33.63347	2014-07-10 14:50:33.63347	\N	\N	\N	\N	\N	\N	\N	\N
1023	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:56:54.242759	2014-07-10 14:56:54.242759	\N	\N	\N	\N	\N	\N	\N	\N
1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:58:12.178761	2014-07-10 14:58:12.178761	\N	\N	\N	\N	\N	\N	\N	\N
1025	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:58:17.447081	2014-07-10 14:58:17.447081	\N	\N	\N	\N	\N	\N	\N	\N
1026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:58:22.544617	2014-07-10 14:58:22.544617	\N	\N	\N	\N	\N	\N	\N	\N
1027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 14:58:41.886003	2014-07-10 14:58:41.886003	\N	\N	\N	\N	\N	\N	\N	\N
1028	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:03:42.195588	2014-07-10 15:03:42.195588	\N	\N	\N	\N	\N	\N	\N	\N
1029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:03:51.242977	2014-07-10 15:03:51.242977	\N	\N	\N	\N	\N	\N	\N	\N
1030	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:04:02.680094	2014-07-10 15:04:02.680094	\N	\N	\N	\N	\N	\N	\N	\N
1031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:04:12.247132	2014-07-10 15:04:12.247132	\N	\N	\N	\N	\N	\N	\N	\N
1032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:08:48.081906	2014-07-10 15:08:48.081906	\N	\N	\N	\N	\N	\N	\N	\N
1033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:09:51.52172	2014-07-10 15:09:51.52172	\N	\N	\N	\N	\N	\N	\N	\N
1034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:16:23.740867	2014-07-10 15:16:23.740867	\N	\N	\N	\N	\N	\N	\N	\N
1035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:18:14.996478	2014-07-10 15:18:14.996478	\N	\N	\N	\N	\N	\N	\N	\N
1036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:18:44.756663	2014-07-10 15:18:44.756663	\N	\N	\N	\N	\N	\N	\N	\N
1037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:19:39.861671	2014-07-10 15:19:39.861671	\N	\N	\N	\N	\N	\N	\N	\N
1038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:19:49.075079	2014-07-10 15:19:49.075079	\N	\N	\N	\N	\N	\N	\N	\N
1039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:20:12.219842	2014-07-10 15:20:12.219842	\N	\N	\N	\N	\N	\N	\N	\N
1040	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:21:31.184979	2014-07-10 15:21:31.184979	\N	\N	\N	\N	\N	\N	\N	\N
1041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:22:30.11914	2014-07-10 15:22:30.11914	\N	\N	\N	\N	\N	\N	\N	\N
1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:23:17.461703	2014-07-10 15:23:17.461703	\N	\N	\N	\N	\N	\N	\N	\N
1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:24:47.028931	2014-07-10 15:24:47.028931	\N	\N	\N	\N	\N	\N	\N	\N
1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:24:58.609804	2014-07-10 15:24:58.609804	\N	\N	\N	\N	\N	\N	\N	\N
1045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:25:29.727656	2014-07-10 15:25:29.727656	\N	\N	\N	\N	\N	\N	\N	\N
1046	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:26:03.193717	2014-07-10 15:26:03.193717	\N	\N	\N	\N	\N	\N	\N	\N
1047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:27:13.16948	2014-07-10 15:27:13.16948	\N	\N	\N	\N	\N	\N	\N	\N
1048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:27:20.952426	2014-07-10 15:27:20.952426	\N	\N	\N	\N	\N	\N	\N	\N
1049	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:27:25.806015	2014-07-10 15:27:25.806015	\N	\N	\N	\N	\N	\N	\N	\N
1050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:27:33.961911	2014-07-10 15:27:33.961911	\N	\N	\N	\N	\N	\N	\N	\N
1051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:28:07.28929	2014-07-10 15:28:07.28929	\N	\N	\N	\N	\N	\N	\N	\N
1052	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:28:28.27578	2014-07-10 15:28:28.27578	\N	\N	\N	\N	\N	\N	\N	\N
1053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:29:18.807187	2014-07-10 15:29:18.807187	\N	\N	\N	\N	\N	\N	\N	\N
1054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:30:05.471286	2014-07-10 15:30:05.471286	\N	\N	\N	\N	\N	\N	\N	\N
1055	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:31:57.571789	2014-07-10 15:31:57.571789	\N	\N	\N	\N	\N	\N	\N	\N
1056	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:34:06.424997	2014-07-10 15:34:06.424997	\N	\N	\N	\N	\N	\N	\N	\N
1057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:34:44.686755	2014-07-10 15:34:44.686755	\N	\N	\N	\N	\N	\N	\N	\N
1058	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:36:04.677194	2014-07-10 15:36:04.677194	\N	\N	\N	\N	\N	\N	\N	\N
1059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:36:21.531046	2014-07-10 15:36:21.531046	\N	\N	\N	\N	\N	\N	\N	\N
1060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:37:00.161931	2014-07-10 15:37:00.161931	\N	\N	\N	\N	\N	\N	\N	\N
1061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:38:49.552355	2014-07-10 15:38:49.552355	\N	\N	\N	\N	\N	\N	\N	\N
1062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:44:57.329452	2014-07-10 15:44:57.329452	\N	\N	\N	\N	\N	\N	\N	\N
1063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:46:28.233818	2014-07-10 15:46:28.233818	\N	\N	\N	\N	\N	\N	\N	\N
1064	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:46:46.834095	2014-07-10 15:46:46.834095	\N	\N	\N	\N	\N	\N	\N	\N
1065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:47:12.365142	2014-07-10 15:47:12.365142	\N	\N	\N	\N	\N	\N	\N	\N
1066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:51:05.848468	2014-07-10 15:51:05.848468	\N	\N	\N	\N	\N	\N	\N	\N
1067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:53:18.157983	2014-07-10 15:53:18.157983	\N	\N	\N	\N	\N	\N	\N	\N
1068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:54:00.675104	2014-07-10 15:54:00.675104	\N	\N	\N	\N	\N	\N	\N	\N
1069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:54:12.884958	2014-07-10 15:54:12.884958	\N	\N	\N	\N	\N	\N	\N	\N
1070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:54:36.334419	2014-07-10 15:54:36.334419	\N	\N	\N	\N	\N	\N	\N	\N
1071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:54:52.677788	2014-07-10 15:54:52.677788	\N	\N	\N	\N	\N	\N	\N	\N
1072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:54:57.556408	2014-07-10 15:54:57.556408	\N	\N	\N	\N	\N	\N	\N	\N
1073	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:55:06.851955	2014-07-10 15:55:06.851955	\N	\N	\N	\N	\N	\N	\N	\N
1074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:55:14.06883	2014-07-10 15:55:14.06883	\N	\N	\N	\N	\N	\N	\N	\N
1075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:55:18.149461	2014-07-10 15:55:18.149461	\N	\N	\N	\N	\N	\N	\N	\N
1076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:55:37.839358	2014-07-10 15:55:37.839358	\N	\N	\N	\N	\N	\N	\N	\N
1077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:56:19.789844	2014-07-10 15:56:19.789844	\N	\N	\N	\N	\N	\N	\N	\N
1078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:56:45.51169	2014-07-10 15:56:45.51169	\N	\N	\N	\N	\N	\N	\N	\N
1079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:56:51.611652	2014-07-10 15:56:51.611652	\N	\N	\N	\N	\N	\N	\N	\N
1080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:56:56.17567	2014-07-10 15:56:56.17567	\N	\N	\N	\N	\N	\N	\N	\N
1081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:57:10.558276	2014-07-10 15:57:10.558276	\N	\N	\N	\N	\N	\N	\N	\N
1082	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:57:39.581586	2014-07-10 15:57:39.581586	\N	\N	\N	\N	\N	\N	\N	\N
1083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:57:56.61084	2014-07-10 15:57:56.61084	\N	\N	\N	\N	\N	\N	\N	\N
1084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:58:22.814281	2014-07-10 15:58:22.814281	\N	\N	\N	\N	\N	\N	\N	\N
1085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:58:42.806446	2014-07-10 15:58:42.806446	\N	\N	\N	\N	\N	\N	\N	\N
1086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:58:49.71297	2014-07-10 15:58:49.71297	\N	\N	\N	\N	\N	\N	\N	\N
1087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:58:53.35196	2014-07-10 15:58:53.35196	\N	\N	\N	\N	\N	\N	\N	\N
1088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:58:57.173888	2014-07-10 15:58:57.173888	\N	\N	\N	\N	\N	\N	\N	\N
1089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:59:00.128384	2014-07-10 15:59:00.128384	\N	\N	\N	\N	\N	\N	\N	\N
1090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 15:59:33.399904	2014-07-10 15:59:33.399904	\N	\N	\N	\N	\N	\N	\N	\N
1091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:00:29.163128	2014-07-10 16:00:29.163128	\N	\N	\N	\N	\N	\N	\N	\N
1092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:01:26.629036	2014-07-10 16:01:26.629036	\N	\N	\N	\N	\N	\N	\N	\N
1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:01:33.507508	2014-07-10 16:01:33.507508	\N	\N	\N	\N	\N	\N	\N	\N
1094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:01:40.397286	2014-07-10 16:01:40.397286	\N	\N	\N	\N	\N	\N	\N	\N
1095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:01:55.819563	2014-07-10 16:01:55.819563	\N	\N	\N	\N	\N	\N	\N	\N
1096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:06:08.668292	2014-07-10 16:06:08.668292	\N	\N	\N	\N	\N	\N	\N	\N
1097	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:06:14.070616	2014-07-10 16:06:14.070616	\N	\N	\N	\N	\N	\N	\N	\N
1098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:06:16.319889	2014-07-10 16:06:16.319889	\N	\N	\N	\N	\N	\N	\N	\N
1099	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:06:53.862759	2014-07-10 16:06:53.862759	\N	\N	\N	\N	\N	\N	\N	\N
1100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:07:24.474017	2014-07-10 16:07:24.474017	\N	\N	\N	\N	\N	\N	\N	\N
1101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:09:00.521299	2014-07-10 16:09:00.521299	\N	\N	\N	\N	\N	\N	\N	\N
1102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:09:13.399965	2014-07-10 16:09:13.399965	\N	\N	\N	\N	\N	\N	\N	\N
1103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:09:41.953675	2014-07-10 16:09:41.953675	\N	\N	\N	\N	\N	\N	\N	\N
1104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:11:19.453229	2014-07-10 16:11:19.453229	\N	\N	\N	\N	\N	\N	\N	\N
1105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:11:28.552003	2014-07-10 16:11:28.552003	\N	\N	\N	\N	\N	\N	\N	\N
1106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:11:29.614792	2014-07-10 16:11:29.614792	\N	\N	\N	\N	\N	\N	\N	\N
1107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:11:35.063978	2014-07-10 16:11:35.063978	\N	\N	\N	\N	\N	\N	\N	\N
1108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:11:41.579055	2014-07-10 16:11:41.579055	\N	\N	\N	\N	\N	\N	\N	\N
1109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:12:02.347959	2014-07-10 16:12:02.347959	\N	\N	\N	\N	\N	\N	\N	\N
1110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:12:21.279776	2014-07-10 16:12:21.279776	\N	\N	\N	\N	\N	\N	\N	\N
1111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:12:35.071272	2014-07-10 16:12:35.071272	\N	\N	\N	\N	\N	\N	\N	\N
1112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:12:46.61508	2014-07-10 16:12:46.61508	\N	\N	\N	\N	\N	\N	\N	\N
1113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:12:49.862297	2014-07-10 16:12:49.862297	\N	\N	\N	\N	\N	\N	\N	\N
1114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:13:25.217766	2014-07-10 16:13:25.217766	\N	\N	\N	\N	\N	\N	\N	\N
1115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:13:32.904688	2014-07-10 16:13:32.904688	\N	\N	\N	\N	\N	\N	\N	\N
1116	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:14:05.362847	2014-07-10 16:14:05.362847	\N	\N	\N	\N	\N	\N	\N	\N
1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:14:33.029332	2014-07-10 16:14:33.029332	\N	\N	\N	\N	\N	\N	\N	\N
1118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:16:15.208279	2014-07-10 16:16:15.208279	\N	\N	\N	\N	\N	\N	\N	\N
1119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:16:43.609039	2014-07-10 16:16:43.609039	\N	\N	\N	\N	\N	\N	\N	\N
1120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:16:47.577013	2014-07-10 16:16:47.577013	\N	\N	\N	\N	\N	\N	\N	\N
1121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:16:52.191487	2014-07-10 16:16:52.191487	\N	\N	\N	\N	\N	\N	\N	\N
1122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:17:07.940439	2014-07-10 16:17:07.940439	\N	\N	\N	\N	\N	\N	\N	\N
1123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:17:25.296733	2014-07-10 16:17:25.296733	\N	\N	\N	\N	\N	\N	\N	\N
1124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:17:43.445816	2014-07-10 16:17:43.445816	\N	\N	\N	\N	\N	\N	\N	\N
1125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:17:51.825191	2014-07-10 16:17:51.825191	\N	\N	\N	\N	\N	\N	\N	\N
1126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:17:59.544182	2014-07-10 16:17:59.544182	\N	\N	\N	\N	\N	\N	\N	\N
1127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:18:17.338186	2014-07-10 16:18:17.338186	\N	\N	\N	\N	\N	\N	\N	\N
1128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:18:41.027177	2014-07-10 16:18:41.027177	\N	\N	\N	\N	\N	\N	\N	\N
1129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:19:25.007807	2014-07-10 16:19:25.007807	\N	\N	\N	\N	\N	\N	\N	\N
1130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:20:25.703596	2014-07-10 16:20:25.703596	\N	\N	\N	\N	\N	\N	\N	\N
1131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:20:41.167816	2014-07-10 16:20:41.167816	\N	\N	\N	\N	\N	\N	\N	\N
1132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:23:12.705331	2014-07-10 16:23:12.705331	\N	\N	\N	\N	\N	\N	\N	\N
1133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:23:19.109295	2014-07-10 16:23:19.109295	\N	\N	\N	\N	\N	\N	\N	\N
1134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:23:27.384694	2014-07-10 16:23:27.384694	\N	\N	\N	\N	\N	\N	\N	\N
1135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:23:49.344299	2014-07-10 16:23:49.344299	\N	\N	\N	\N	\N	\N	\N	\N
1136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:25:21.869568	2014-07-10 16:25:21.869568	\N	\N	\N	\N	\N	\N	\N	\N
1137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:25:38.624792	2014-07-10 16:25:38.624792	\N	\N	\N	\N	\N	\N	\N	\N
1138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:26:21.477638	2014-07-10 16:26:21.477638	\N	\N	\N	\N	\N	\N	\N	\N
1139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:26:43.216834	2014-07-10 16:26:43.216834	\N	\N	\N	\N	\N	\N	\N	\N
1140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:26:48.92901	2014-07-10 16:26:48.92901	\N	\N	\N	\N	\N	\N	\N	\N
1141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:26:59.079637	2014-07-10 16:26:59.079637	\N	\N	\N	\N	\N	\N	\N	\N
1142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:27:08.680413	2014-07-10 16:27:08.680413	\N	\N	\N	\N	\N	\N	\N	\N
1143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:27:14.707688	2014-07-10 16:27:14.707688	\N	\N	\N	\N	\N	\N	\N	\N
1144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:27:19.034008	2014-07-10 16:27:19.034008	\N	\N	\N	\N	\N	\N	\N	\N
1145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:27:24.33805	2014-07-10 16:27:24.33805	\N	\N	\N	\N	\N	\N	\N	\N
1146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:28:06.547282	2014-07-10 16:28:06.547282	\N	\N	\N	\N	\N	\N	\N	\N
1147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:28:12.485256	2014-07-10 16:28:12.485256	\N	\N	\N	\N	\N	\N	\N	\N
1148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:28:39.805478	2014-07-10 16:28:39.805478	\N	\N	\N	\N	\N	\N	\N	\N
1149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:29:03.965689	2014-07-10 16:29:03.965689	\N	\N	\N	\N	\N	\N	\N	\N
1150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:29:36.271352	2014-07-10 16:29:36.271352	\N	\N	\N	\N	\N	\N	\N	\N
1151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:30:21.803706	2014-07-10 16:30:21.803706	\N	\N	\N	\N	\N	\N	\N	\N
1152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:30:34.746664	2014-07-10 16:30:34.746664	\N	\N	\N	\N	\N	\N	\N	\N
1153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:31:02.632314	2014-07-10 16:31:02.632314	\N	\N	\N	\N	\N	\N	\N	\N
1154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:31:21.426953	2014-07-10 16:31:21.426953	\N	\N	\N	\N	\N	\N	\N	\N
1155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:31:52.545523	2014-07-10 16:31:52.545523	\N	\N	\N	\N	\N	\N	\N	\N
1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:32:15.841581	2014-07-10 16:32:15.841581	\N	\N	\N	\N	\N	\N	\N	\N
1157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:32:49.994432	2014-07-10 16:32:49.994432	\N	\N	\N	\N	\N	\N	\N	\N
1158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:32:59.021346	2014-07-10 16:32:59.021346	\N	\N	\N	\N	\N	\N	\N	\N
1159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:47:35.841888	2014-07-10 16:47:35.841888	\N	\N	\N	\N	\N	\N	\N	\N
1160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:48:28.0037	2014-07-10 16:48:28.0037	\N	\N	\N	\N	\N	\N	\N	\N
1161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:49:00.732683	2014-07-10 16:49:00.732683	\N	\N	\N	\N	\N	\N	\N	\N
1162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:50:01.762369	2014-07-10 16:50:01.762369	\N	\N	\N	\N	\N	\N	\N	\N
1163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:50:13.518258	2014-07-10 16:50:13.518258	\N	\N	\N	\N	\N	\N	\N	\N
1164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:50:56.063623	2014-07-10 16:50:56.063623	\N	\N	\N	\N	\N	\N	\N	\N
1165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:51:00.701834	2014-07-10 16:51:00.701834	\N	\N	\N	\N	\N	\N	\N	\N
1166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:51:30.726119	2014-07-10 16:51:30.726119	\N	\N	\N	\N	\N	\N	\N	\N
1167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:51:44.827988	2014-07-10 16:51:44.827988	\N	\N	\N	\N	\N	\N	\N	\N
1168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:51:51.700276	2014-07-10 16:51:51.700276	\N	\N	\N	\N	\N	\N	\N	\N
1169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:51:57.992137	2014-07-10 16:51:57.992137	\N	\N	\N	\N	\N	\N	\N	\N
1170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:52:02.372441	2014-07-10 16:52:02.372441	\N	\N	\N	\N	\N	\N	\N	\N
1171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:52:25.961982	2014-07-10 16:52:25.961982	\N	\N	\N	\N	\N	\N	\N	\N
1172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:52:32.498353	2014-07-10 16:52:32.498353	\N	\N	\N	\N	\N	\N	\N	\N
1173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:52:41.360236	2014-07-10 16:52:41.360236	\N	\N	\N	\N	\N	\N	\N	\N
1174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:52:58.401768	2014-07-10 16:52:58.401768	\N	\N	\N	\N	\N	\N	\N	\N
1175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:53:09.893212	2014-07-10 16:53:09.893212	\N	\N	\N	\N	\N	\N	\N	\N
1176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:53:16.077358	2014-07-10 16:53:16.077358	\N	\N	\N	\N	\N	\N	\N	\N
1177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:53:19.660523	2014-07-10 16:53:19.660523	\N	\N	\N	\N	\N	\N	\N	\N
1178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:53:22.477921	2014-07-10 16:53:22.477921	\N	\N	\N	\N	\N	\N	\N	\N
1179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:53:32.030092	2014-07-10 16:53:32.030092	\N	\N	\N	\N	\N	\N	\N	\N
1180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:53:37.849497	2014-07-10 16:53:37.849497	\N	\N	\N	\N	\N	\N	\N	\N
1181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:53:41.09196	2014-07-10 16:53:41.09196	\N	\N	\N	\N	\N	\N	\N	\N
1182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:54:10.70524	2014-07-10 16:54:10.70524	\N	\N	\N	\N	\N	\N	\N	\N
1183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:54:20.346036	2014-07-10 16:54:20.346036	\N	\N	\N	\N	\N	\N	\N	\N
1184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:55:31.164285	2014-07-10 16:55:31.164285	\N	\N	\N	\N	\N	\N	\N	\N
1185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:58:35.549022	2014-07-10 16:58:35.549022	\N	\N	\N	\N	\N	\N	\N	\N
1186	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 16:59:50.857254	2014-07-10 16:59:50.857254	\N	\N	\N	\N	\N	\N	\N	\N
1187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:00:01.747318	2014-07-10 17:00:01.747318	\N	\N	\N	\N	\N	\N	\N	\N
1188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:00:13.899776	2014-07-10 17:00:13.899776	\N	\N	\N	\N	\N	\N	\N	\N
1189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:00:31.368921	2014-07-10 17:00:31.368921	\N	\N	\N	\N	\N	\N	\N	\N
1190	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:01:54.640478	2014-07-10 17:01:54.640478	\N	\N	\N	\N	\N	\N	\N	\N
1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:02:20.145995	2014-07-10 17:02:20.145995	\N	\N	\N	\N	\N	\N	\N	\N
1192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:02:29.616383	2014-07-10 17:02:29.616383	\N	\N	\N	\N	\N	\N	\N	\N
1193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:05:40.670788	2014-07-10 17:05:40.670788	\N	\N	\N	\N	\N	\N	\N	\N
1194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:05:49.914589	2014-07-10 17:05:49.914589	\N	\N	\N	\N	\N	\N	\N	\N
1195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:06:00.153487	2014-07-10 17:06:00.153487	\N	\N	\N	\N	\N	\N	\N	\N
1196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:06:01.996879	2014-07-10 17:06:01.996879	\N	\N	\N	\N	\N	\N	\N	\N
1197	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:06:04.796554	2014-07-10 17:06:04.796554	\N	\N	\N	\N	\N	\N	\N	\N
1198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:06:08.417101	2014-07-10 17:06:08.417101	\N	\N	\N	\N	\N	\N	\N	\N
1199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:06:34.764286	2014-07-10 17:06:34.764286	\N	\N	\N	\N	\N	\N	\N	\N
1200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:06:37.274148	2014-07-10 17:06:37.274148	\N	\N	\N	\N	\N	\N	\N	\N
1201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:07:16.299484	2014-07-10 17:07:16.299484	\N	\N	\N	\N	\N	\N	\N	\N
1202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:07:34.496446	2014-07-10 17:07:34.496446	\N	\N	\N	\N	\N	\N	\N	\N
1203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:09:06.856783	2014-07-10 17:09:06.856783	\N	\N	\N	\N	\N	\N	\N	\N
1204	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:09:24.997638	2014-07-10 17:09:24.997638	\N	\N	\N	\N	\N	\N	\N	\N
1205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:09:35.872859	2014-07-10 17:09:35.872859	\N	\N	\N	\N	\N	\N	\N	\N
1206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:09:53.714341	2014-07-10 17:09:53.714341	\N	\N	\N	\N	\N	\N	\N	\N
1207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:10:20.841369	2014-07-10 17:10:20.841369	\N	\N	\N	\N	\N	\N	\N	\N
1208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:10:27.014279	2014-07-10 17:10:27.014279	\N	\N	\N	\N	\N	\N	\N	\N
1209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:10:37.339163	2014-07-10 17:10:37.339163	\N	\N	\N	\N	\N	\N	\N	\N
1210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:10:59.536458	2014-07-10 17:10:59.536458	\N	\N	\N	\N	\N	\N	\N	\N
1211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:11:28.009428	2014-07-10 17:11:28.009428	\N	\N	\N	\N	\N	\N	\N	\N
1212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:11:31.33903	2014-07-10 17:11:31.33903	\N	\N	\N	\N	\N	\N	\N	\N
1213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:12:17.381267	2014-07-10 17:12:17.381267	\N	\N	\N	\N	\N	\N	\N	\N
1214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:12:31.445536	2014-07-10 17:12:31.445536	\N	\N	\N	\N	\N	\N	\N	\N
1215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:12:43.621826	2014-07-10 17:12:43.621826	\N	\N	\N	\N	\N	\N	\N	\N
1216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:12:48.733557	2014-07-10 17:12:48.733557	\N	\N	\N	\N	\N	\N	\N	\N
1217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:13:01.814777	2014-07-10 17:13:01.814777	\N	\N	\N	\N	\N	\N	\N	\N
1218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:13:16.556373	2014-07-10 17:13:16.556373	\N	\N	\N	\N	\N	\N	\N	\N
1219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:13:30.416521	2014-07-10 17:13:30.416521	\N	\N	\N	\N	\N	\N	\N	\N
1220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:13:53.340617	2014-07-10 17:13:53.340617	\N	\N	\N	\N	\N	\N	\N	\N
1221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:14:05.024696	2014-07-10 17:14:05.024696	\N	\N	\N	\N	\N	\N	\N	\N
1222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:14:08.930975	2014-07-10 17:14:08.930975	\N	\N	\N	\N	\N	\N	\N	\N
1223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:15:00.552849	2014-07-10 17:15:00.552849	\N	\N	\N	\N	\N	\N	\N	\N
1224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:15:13.144168	2014-07-10 17:15:13.144168	\N	\N	\N	\N	\N	\N	\N	\N
1225	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:15:21.050569	2014-07-10 17:15:21.050569	\N	\N	\N	\N	\N	\N	\N	\N
1226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:16:56.111667	2014-07-10 17:16:56.111667	\N	\N	\N	\N	\N	\N	\N	\N
1227	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:17:26.400932	2014-07-10 17:17:26.400932	\N	\N	\N	\N	\N	\N	\N	\N
1228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:17:49.24185	2014-07-10 17:17:49.24185	\N	\N	\N	\N	\N	\N	\N	\N
1229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:18:00.00021	2014-07-10 17:18:00.00021	\N	\N	\N	\N	\N	\N	\N	\N
1230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:18:08.830664	2014-07-10 17:18:08.830664	\N	\N	\N	\N	\N	\N	\N	\N
1231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:18:51.815535	2014-07-10 17:18:51.815535	\N	\N	\N	\N	\N	\N	\N	\N
1232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:19:17.275302	2014-07-10 17:19:17.275302	\N	\N	\N	\N	\N	\N	\N	\N
1233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:19:56.161812	2014-07-10 17:19:56.161812	\N	\N	\N	\N	\N	\N	\N	\N
1234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:20:25.77265	2014-07-10 17:20:25.77265	\N	\N	\N	\N	\N	\N	\N	\N
1235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:20:35.97474	2014-07-10 17:20:35.97474	\N	\N	\N	\N	\N	\N	\N	\N
1236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:20:55.893857	2014-07-10 17:20:55.893857	\N	\N	\N	\N	\N	\N	\N	\N
1237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:21:39.732414	2014-07-10 17:21:39.732414	\N	\N	\N	\N	\N	\N	\N	\N
1238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:21:46.662729	2014-07-10 17:21:46.662729	\N	\N	\N	\N	\N	\N	\N	\N
1239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:21:57.705334	2014-07-10 17:21:57.705334	\N	\N	\N	\N	\N	\N	\N	\N
1240	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:22:03.944848	2014-07-10 17:22:03.944848	\N	\N	\N	\N	\N	\N	\N	\N
1241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:22:23.970151	2014-07-10 17:22:23.970151	\N	\N	\N	\N	\N	\N	\N	\N
1242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:22:33.437379	2014-07-10 17:22:33.437379	\N	\N	\N	\N	\N	\N	\N	\N
1243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:22:43.730764	2014-07-10 17:22:43.730764	\N	\N	\N	\N	\N	\N	\N	\N
1244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:22:52.926091	2014-07-10 17:22:52.926091	\N	\N	\N	\N	\N	\N	\N	\N
1245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:23:28.849571	2014-07-10 17:23:28.849571	\N	\N	\N	\N	\N	\N	\N	\N
1246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:23:34.477971	2014-07-10 17:23:34.477971	\N	\N	\N	\N	\N	\N	\N	\N
1247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:23:42.951993	2014-07-10 17:23:42.951993	\N	\N	\N	\N	\N	\N	\N	\N
1248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:23:51.469209	2014-07-10 17:23:51.469209	\N	\N	\N	\N	\N	\N	\N	\N
1249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:23:58.171373	2014-07-10 17:23:58.171373	\N	\N	\N	\N	\N	\N	\N	\N
1250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:24:22.279891	2014-07-10 17:24:22.279891	\N	\N	\N	\N	\N	\N	\N	\N
1251	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:24:35.222511	2014-07-10 17:24:35.222511	\N	\N	\N	\N	\N	\N	\N	\N
1252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:31:56.552877	2014-07-10 17:31:56.552877	\N	\N	\N	\N	\N	\N	\N	\N
1253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:32:06.008622	2014-07-10 17:32:06.008622	\N	\N	\N	\N	\N	\N	\N	\N
1254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:32:12.608008	2014-07-10 17:32:12.608008	\N	\N	\N	\N	\N	\N	\N	\N
1255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:32:35.808435	2014-07-10 17:32:35.808435	\N	\N	\N	\N	\N	\N	\N	\N
1256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:33:34.585895	2014-07-10 17:33:34.585895	\N	\N	\N	\N	\N	\N	\N	\N
1257	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:47:34.900016	2014-07-10 17:47:34.900016	\N	\N	\N	\N	\N	\N	\N	\N
1258	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:48:01.244018	2014-07-10 17:48:01.244018	\N	\N	\N	\N	\N	\N	\N	\N
1259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:48:18.988409	2014-07-10 17:48:18.988409	\N	\N	\N	\N	\N	\N	\N	\N
1260	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:49:27.565891	2014-07-10 17:49:27.565891	\N	\N	\N	\N	\N	\N	\N	\N
1261	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:51:42.56988	2014-07-10 17:51:42.56988	\N	\N	\N	\N	\N	\N	\N	\N
1262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:52:20.324986	2014-07-10 17:52:20.324986	\N	\N	\N	\N	\N	\N	\N	\N
1263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:52:26.66345	2014-07-10 17:52:26.66345	\N	\N	\N	\N	\N	\N	\N	\N
1264	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:53:39.370912	2014-07-10 17:53:39.370912	\N	\N	\N	\N	\N	\N	\N	\N
1265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:53:52.232903	2014-07-10 17:53:52.232903	\N	\N	\N	\N	\N	\N	\N	\N
1266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:54:50.415544	2014-07-10 17:54:50.415544	\N	\N	\N	\N	\N	\N	\N	\N
1267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:55:31.281982	2014-07-10 17:55:31.281982	\N	\N	\N	\N	\N	\N	\N	\N
1268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:55:40.736968	2014-07-10 17:55:40.736968	\N	\N	\N	\N	\N	\N	\N	\N
1269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:56:08.677929	2014-07-10 17:56:08.677929	\N	\N	\N	\N	\N	\N	\N	\N
1270	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:56:22.66855	2014-07-10 17:56:22.66855	\N	\N	\N	\N	\N	\N	\N	\N
1271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:56:50.158732	2014-07-10 17:56:50.158732	\N	\N	\N	\N	\N	\N	\N	\N
1272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:57:38.122797	2014-07-10 17:57:38.122797	\N	\N	\N	\N	\N	\N	\N	\N
1273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:57:47.787847	2014-07-10 17:57:47.787847	\N	\N	\N	\N	\N	\N	\N	\N
1274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:58:12.073858	2014-07-10 17:58:12.073858	\N	\N	\N	\N	\N	\N	\N	\N
1275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:58:22.677897	2014-07-10 17:58:22.677897	\N	\N	\N	\N	\N	\N	\N	\N
1276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:58:35.185635	2014-07-10 17:58:35.185635	\N	\N	\N	\N	\N	\N	\N	\N
1277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:58:39.79652	2014-07-10 17:58:39.79652	\N	\N	\N	\N	\N	\N	\N	\N
1278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:58:58.117097	2014-07-10 17:58:58.117097	\N	\N	\N	\N	\N	\N	\N	\N
1279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:59:21.37122	2014-07-10 17:59:21.37122	\N	\N	\N	\N	\N	\N	\N	\N
1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:59:51.346257	2014-07-10 17:59:51.346257	\N	\N	\N	\N	\N	\N	\N	\N
1281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 17:59:55.944994	2014-07-10 17:59:55.944994	\N	\N	\N	\N	\N	\N	\N	\N
1282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:00:28.265861	2014-07-10 18:00:28.265861	\N	\N	\N	\N	\N	\N	\N	\N
1283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:00:38.917041	2014-07-10 18:00:38.917041	\N	\N	\N	\N	\N	\N	\N	\N
1284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:00:45.001886	2014-07-10 18:00:45.001886	\N	\N	\N	\N	\N	\N	\N	\N
1285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:00:55.772332	2014-07-10 18:00:55.772332	\N	\N	\N	\N	\N	\N	\N	\N
1286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:00:58.080356	2014-07-10 18:00:58.080356	\N	\N	\N	\N	\N	\N	\N	\N
1287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:01:42.022352	2014-07-10 18:01:42.022352	\N	\N	\N	\N	\N	\N	\N	\N
1288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:02:28.919134	2014-07-10 18:02:28.919134	\N	\N	\N	\N	\N	\N	\N	\N
1289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:02:42.911988	2014-07-10 18:02:42.911988	\N	\N	\N	\N	\N	\N	\N	\N
1290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:03:15.91751	2014-07-10 18:03:15.91751	\N	\N	\N	\N	\N	\N	\N	\N
1291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:03:44.470717	2014-07-10 18:03:44.470717	\N	\N	\N	\N	\N	\N	\N	\N
1292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:04:07.868446	2014-07-10 18:04:07.868446	\N	\N	\N	\N	\N	\N	\N	\N
1293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:04:19.455665	2014-07-10 18:04:19.455665	\N	\N	\N	\N	\N	\N	\N	\N
1294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:04:31.02267	2014-07-10 18:04:31.02267	\N	\N	\N	\N	\N	\N	\N	\N
1295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:04:35.709993	2014-07-10 18:04:35.709993	\N	\N	\N	\N	\N	\N	\N	\N
1296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:04:52.802922	2014-07-10 18:04:52.802922	\N	\N	\N	\N	\N	\N	\N	\N
1297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:05:16.469569	2014-07-10 18:05:16.469569	\N	\N	\N	\N	\N	\N	\N	\N
1298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:05:34.147788	2014-07-10 18:05:34.147788	\N	\N	\N	\N	\N	\N	\N	\N
1299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:06:52.229351	2014-07-10 18:06:52.229351	\N	\N	\N	\N	\N	\N	\N	\N
1300	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:07:17.801328	2014-07-10 18:07:17.801328	\N	\N	\N	\N	\N	\N	\N	\N
1301	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:07:26.477101	2014-07-10 18:07:26.477101	\N	\N	\N	\N	\N	\N	\N	\N
1302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:07:33.895021	2014-07-10 18:07:33.895021	\N	\N	\N	\N	\N	\N	\N	\N
1303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:09:45.850243	2014-07-10 18:09:45.850243	\N	\N	\N	\N	\N	\N	\N	\N
1304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:11:46.025099	2014-07-10 18:11:46.025099	\N	\N	\N	\N	\N	\N	\N	\N
1305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:11:52.918829	2014-07-10 18:11:52.918829	\N	\N	\N	\N	\N	\N	\N	\N
1306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:13:22.305214	2014-07-10 18:13:22.305214	\N	\N	\N	\N	\N	\N	\N	\N
1307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:14:17.292175	2014-07-10 18:14:17.292175	\N	\N	\N	\N	\N	\N	\N	\N
1308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:15:39.427492	2014-07-10 18:15:39.427492	\N	\N	\N	\N	\N	\N	\N	\N
1309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:15:54.134711	2014-07-10 18:15:54.134711	\N	\N	\N	\N	\N	\N	\N	\N
1310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:18:26.061794	2014-07-10 18:18:26.061794	\N	\N	\N	\N	\N	\N	\N	\N
1311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:18:32.699415	2014-07-10 18:18:32.699415	\N	\N	\N	\N	\N	\N	\N	\N
1312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:20:13.627696	2014-07-10 18:20:13.627696	\N	\N	\N	\N	\N	\N	\N	\N
1313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:32:55.05142	2014-07-10 18:32:55.05142	\N	\N	\N	\N	\N	\N	\N	\N
1314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:34:28.069589	2014-07-10 18:34:28.069589	\N	\N	\N	\N	\N	\N	\N	\N
1315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:37:56.267822	2014-07-10 18:37:56.267822	\N	\N	\N	\N	\N	\N	\N	\N
1316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:39:55.258646	2014-07-10 18:39:55.258646	\N	\N	\N	\N	\N	\N	\N	\N
1317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:40:00.166045	2014-07-10 18:40:00.166045	\N	\N	\N	\N	\N	\N	\N	\N
1318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:41:00.479472	2014-07-10 18:41:00.479472	\N	\N	\N	\N	\N	\N	\N	\N
1319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:42:24.213719	2014-07-10 18:42:24.213719	\N	\N	\N	\N	\N	\N	\N	\N
1320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:42:26.181297	2014-07-10 18:42:26.181297	\N	\N	\N	\N	\N	\N	\N	\N
1321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:42:27.724758	2014-07-10 18:42:27.724758	\N	\N	\N	\N	\N	\N	\N	\N
1322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:42:29.726373	2014-07-10 18:42:29.726373	\N	\N	\N	\N	\N	\N	\N	\N
1323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:42:31.46204	2014-07-10 18:42:31.46204	\N	\N	\N	\N	\N	\N	\N	\N
1324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:42:44.429	2014-07-10 18:42:44.429	\N	\N	\N	\N	\N	\N	\N	\N
1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:42:46.446769	2014-07-10 18:42:46.446769	\N	\N	\N	\N	\N	\N	\N	\N
1326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:42:53.817107	2014-07-10 18:42:53.817107	\N	\N	\N	\N	\N	\N	\N	\N
1327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:42:57.320457	2014-07-10 18:42:57.320457	\N	\N	\N	\N	\N	\N	\N	\N
1328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:43:03.979377	2014-07-10 18:43:03.979377	\N	\N	\N	\N	\N	\N	\N	\N
1329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:43:08.887558	2014-07-10 18:43:08.887558	\N	\N	\N	\N	\N	\N	\N	\N
1330	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:43:15.615782	2014-07-10 18:43:15.615782	\N	\N	\N	\N	\N	\N	\N	\N
1331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:45:33.802473	2014-07-10 18:45:33.802473	\N	\N	\N	\N	\N	\N	\N	\N
1332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:45:52.915765	2014-07-10 18:45:52.915765	\N	\N	\N	\N	\N	\N	\N	\N
1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:46:25.539486	2014-07-10 18:46:25.539486	\N	\N	\N	\N	\N	\N	\N	\N
1334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:46:34.588388	2014-07-10 18:46:34.588388	\N	\N	\N	\N	\N	\N	\N	\N
1335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:46:43.382335	2014-07-10 18:46:43.382335	\N	\N	\N	\N	\N	\N	\N	\N
1336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:46:49.440016	2014-07-10 18:46:49.440016	\N	\N	\N	\N	\N	\N	\N	\N
1337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:46:54.589914	2014-07-10 18:46:54.589914	\N	\N	\N	\N	\N	\N	\N	\N
1338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:46:56.656039	2014-07-10 18:46:56.656039	\N	\N	\N	\N	\N	\N	\N	\N
1339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:47:13.230091	2014-07-10 18:47:13.230091	\N	\N	\N	\N	\N	\N	\N	\N
1340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:47:23.102247	2014-07-10 18:47:23.102247	\N	\N	\N	\N	\N	\N	\N	\N
1341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:47:46.939152	2014-07-10 18:47:46.939152	\N	\N	\N	\N	\N	\N	\N	\N
1342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:47:50.159186	2014-07-10 18:47:50.159186	\N	\N	\N	\N	\N	\N	\N	\N
1343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 18:47:59.21449	2014-07-10 18:47:59.21449	\N	\N	\N	\N	\N	\N	\N	\N
1344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 20:32:16.264597	2014-07-10 20:32:16.264597	\N	\N	\N	\N	\N	\N	\N	\N
1345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 20:32:32.268288	2014-07-10 20:32:32.268288	\N	\N	\N	\N	\N	\N	\N	\N
1346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 20:33:47.171835	2014-07-10 20:33:47.171835	\N	\N	\N	\N	\N	\N	\N	\N
1347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 20:33:57.083449	2014-07-10 20:33:57.083449	\N	\N	\N	\N	\N	\N	\N	\N
1348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:05:10.639334	2014-07-10 21:05:10.639334	\N	\N	\N	\N	\N	\N	\N	\N
1349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:05:36.570928	2014-07-10 21:05:36.570928	\N	\N	\N	\N	\N	\N	\N	\N
1350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:28:40.44018	2014-07-10 21:28:40.44018	\N	\N	\N	\N	\N	\N	\N	\N
1351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:28:46.552473	2014-07-10 21:28:46.552473	\N	\N	\N	\N	\N	\N	\N	\N
1352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:28:53.385191	2014-07-10 21:28:53.385191	\N	\N	\N	\N	\N	\N	\N	\N
1353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:28:58.401719	2014-07-10 21:28:58.401719	\N	\N	\N	\N	\N	\N	\N	\N
1354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:29:04.56637	2014-07-10 21:29:04.56637	\N	\N	\N	\N	\N	\N	\N	\N
1355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:29:06.494278	2014-07-10 21:29:06.494278	\N	\N	\N	\N	\N	\N	\N	\N
1356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:31:03.702646	2014-07-10 21:31:03.702646	\N	\N	\N	\N	\N	\N	\N	\N
1357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:31:06.075731	2014-07-10 21:31:06.075731	\N	\N	\N	\N	\N	\N	\N	\N
1358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:31:08.02087	2014-07-10 21:31:08.02087	\N	\N	\N	\N	\N	\N	\N	\N
1359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:31:11.167747	2014-07-10 21:31:11.167747	\N	\N	\N	\N	\N	\N	\N	\N
1360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:31:13.1692	2014-07-10 21:31:13.1692	\N	\N	\N	\N	\N	\N	\N	\N
1361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:31:15.259459	2014-07-10 21:31:15.259459	\N	\N	\N	\N	\N	\N	\N	\N
1362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-10 21:40:07.025316	2014-07-10 21:40:07.025316	\N	\N	\N	\N	\N	\N	\N	\N
1363	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 11:36:09.134368	2014-07-11 11:36:09.134368	\N	\N	\N	\N	\N	\N	\N	\N
1364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 11:36:25.646236	2014-07-11 11:36:25.646236	\N	\N	\N	\N	\N	\N	\N	\N
1365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 12:02:16.095938	2014-07-11 12:02:16.095938	\N	\N	\N	\N	\N	\N	\N	\N
1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 12:04:08.375278	2014-07-11 12:04:08.375278	\N	\N	\N	\N	\N	\N	\N	\N
1367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 12:25:13.325163	2014-07-11 12:25:13.325163	\N	\N	\N	\N	\N	\N	\N	\N
1368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:03:01.635858	2014-07-11 14:03:01.635858	\N	\N	\N	\N	\N	\N	\N	\N
1369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:03:23.173058	2014-07-11 14:03:23.173058	\N	\N	\N	\N	\N	\N	\N	\N
1370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:04:11.822643	2014-07-11 14:04:11.822643	\N	\N	\N	\N	\N	\N	\N	\N
1371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:04:21.532938	2014-07-11 14:04:21.532938	\N	\N	\N	\N	\N	\N	\N	\N
1372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:05:27.721313	2014-07-11 14:05:27.721313	\N	\N	\N	\N	\N	\N	\N	\N
1373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:06:26.300479	2014-07-11 14:06:26.300479	\N	\N	\N	\N	\N	\N	\N	\N
1374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:06:59.624273	2014-07-11 14:06:59.624273	\N	\N	\N	\N	\N	\N	\N	\N
1375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:07:41.435517	2014-07-11 14:07:41.435517	\N	\N	\N	\N	\N	\N	\N	\N
1376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:08:10.672072	2014-07-11 14:08:10.672072	\N	\N	\N	\N	\N	\N	\N	\N
1377	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:09:13.492653	2014-07-11 14:09:13.492653	\N	\N	\N	\N	\N	\N	\N	\N
1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:09:26.189435	2014-07-11 14:09:26.189435	\N	\N	\N	\N	\N	\N	\N	\N
1379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:11:23.127119	2014-07-11 14:11:23.127119	\N	\N	\N	\N	\N	\N	\N	\N
1380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:11:51.202063	2014-07-11 14:11:51.202063	\N	\N	\N	\N	\N	\N	\N	\N
1381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:12:19.827415	2014-07-11 14:12:19.827415	\N	\N	\N	\N	\N	\N	\N	\N
1382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:13:14.604117	2014-07-11 14:13:14.604117	\N	\N	\N	\N	\N	\N	\N	\N
1383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:14:02.93417	2014-07-11 14:14:02.93417	\N	\N	\N	\N	\N	\N	\N	\N
1384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:14:29.931363	2014-07-11 14:14:29.931363	\N	\N	\N	\N	\N	\N	\N	\N
1385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:45:36.555122	2014-07-11 14:45:36.555122	\N	\N	\N	\N	\N	\N	\N	\N
1386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:47:30.435457	2014-07-11 14:47:30.435457	\N	\N	\N	\N	\N	\N	\N	\N
1387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:47:32.812182	2014-07-11 14:47:32.812182	\N	\N	\N	\N	\N	\N	\N	\N
1388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:47:57.958209	2014-07-11 14:47:57.958209	\N	\N	\N	\N	\N	\N	\N	\N
1389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:52:23.952771	2014-07-11 14:52:23.952771	\N	\N	\N	\N	\N	\N	\N	\N
1390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:53:04.61992	2014-07-11 14:53:04.61992	\N	\N	\N	\N	\N	\N	\N	\N
1391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:53:16.393177	2014-07-11 14:53:16.393177	\N	\N	\N	\N	\N	\N	\N	\N
1392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:54:13.9094	2014-07-11 14:54:13.9094	\N	\N	\N	\N	\N	\N	\N	\N
1393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:54:22.555025	2014-07-11 14:54:22.555025	\N	\N	\N	\N	\N	\N	\N	\N
1394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 14:54:52.131344	2014-07-11 14:54:52.131344	\N	\N	\N	\N	\N	\N	\N	\N
1395	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:02:08.462354	2014-07-11 15:02:08.462354	\N	\N	\N	\N	\N	\N	\N	\N
1396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:08:00.081202	2014-07-11 15:08:00.081202	\N	\N	\N	\N	\N	\N	\N	\N
1397	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:09:24.604055	2014-07-11 15:09:24.604055	\N	\N	\N	\N	\N	\N	\N	\N
1398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:13:53.512811	2014-07-11 15:13:53.512811	\N	\N	\N	\N	\N	\N	\N	\N
1399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:14:45.972372	2014-07-11 15:14:45.972372	\N	\N	\N	\N	\N	\N	\N	\N
1400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:15:06.604531	2014-07-11 15:15:06.604531	\N	\N	\N	\N	\N	\N	\N	\N
1401	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:15:11.849557	2014-07-11 15:15:11.849557	\N	\N	\N	\N	\N	\N	\N	\N
1402	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:19:27.639553	2014-07-11 15:19:27.639553	\N	\N	\N	\N	\N	\N	\N	\N
1403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:20:06.146097	2014-07-11 15:20:06.146097	\N	\N	\N	\N	\N	\N	\N	\N
1404	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:23:12.14363	2014-07-11 15:23:12.14363	\N	\N	\N	\N	\N	\N	\N	\N
1405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:39:30.542619	2014-07-11 15:39:30.542619	\N	\N	\N	\N	\N	\N	\N	\N
1406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:41:00.866811	2014-07-11 15:41:00.866811	\N	\N	\N	\N	\N	\N	\N	\N
1407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:42:10.584441	2014-07-11 15:42:10.584441	\N	\N	\N	\N	\N	\N	\N	\N
1408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 15:43:36.137308	2014-07-11 15:43:36.137308	\N	\N	\N	\N	\N	\N	\N	\N
1409	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:37:35.267418	2014-07-11 16:37:35.267418	\N	\N	\N	\N	\N	\N	\N	\N
1410	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:38:15.516236	2014-07-11 16:38:15.516236	\N	\N	\N	\N	\N	\N	\N	\N
1411	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:38:29.667672	2014-07-11 16:38:29.667672	\N	\N	\N	\N	\N	\N	\N	\N
1412	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:41:48.092066	2014-07-11 16:41:48.092066	\N	\N	\N	\N	\N	\N	\N	\N
1413	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:42:42.392367	2014-07-11 16:42:42.392367	\N	\N	\N	\N	\N	\N	\N	\N
1414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:42:48.265661	2014-07-11 16:42:48.265661	\N	\N	\N	\N	\N	\N	\N	\N
1415	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:42:49.433328	2014-07-11 16:42:49.433328	\N	\N	\N	\N	\N	\N	\N	\N
1416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:42:49.75648	2014-07-11 16:42:49.75648	\N	\N	\N	\N	\N	\N	\N	\N
1417	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:42:50.037071	2014-07-11 16:42:50.037071	\N	\N	\N	\N	\N	\N	\N	\N
1418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:43:08.541861	2014-07-11 16:43:08.541861	\N	\N	\N	\N	\N	\N	\N	\N
1419	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-11 16:43:56.328289	2014-07-11 16:43:56.328289	\N	\N	\N	\N	\N	\N	\N	\N
1420	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:03:16.319811	2014-07-14 12:03:16.319811	\N	\N	\N	\N	\N	\N	\N	\N
1421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:14:11.229537	2014-07-14 12:14:11.229537	\N	\N	\N	\N	\N	\N	\N	\N
1422	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:15:03.614312	2014-07-14 12:15:03.614312	\N	\N	\N	\N	\N	\N	\N	\N
1423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:15:15.181803	2014-07-14 12:15:15.181803	\N	\N	\N	\N	\N	\N	\N	\N
1424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:26:23.593357	2014-07-14 12:26:23.593357	\N	\N	\N	\N	\N	\N	\N	\N
1425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:26:37.86316	2014-07-14 12:26:37.86316	\N	\N	\N	\N	\N	\N	\N	\N
1426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:27:16.885332	2014-07-14 12:27:16.885332	\N	\N	\N	\N	\N	\N	\N	\N
1427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:27:37.438204	2014-07-14 12:27:37.438204	\N	\N	\N	\N	\N	\N	\N	\N
1428	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:36:46.163924	2014-07-14 12:36:46.163924	\N	\N	\N	\N	\N	\N	\N	\N
1429	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:38:23.700739	2014-07-14 12:38:23.700739	\N	\N	\N	\N	\N	\N	\N	\N
1430	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:38:44.156128	2014-07-14 12:38:44.156128	\N	\N	\N	\N	\N	\N	\N	\N
1431	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:43:08.337614	2014-07-14 12:43:08.337614	\N	\N	\N	\N	\N	\N	\N	\N
1432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:43:45.720927	2014-07-14 12:43:45.720927	\N	\N	\N	\N	\N	\N	\N	\N
1433	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:43:49.750746	2014-07-14 12:43:49.750746	\N	\N	\N	\N	\N	\N	\N	\N
1434	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:44:16.332017	2014-07-14 12:44:16.332017	\N	\N	\N	\N	\N	\N	\N	\N
1435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:44:41.908514	2014-07-14 12:44:41.908514	\N	\N	\N	\N	\N	\N	\N	\N
1436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:44:52.541285	2014-07-14 12:44:52.541285	\N	\N	\N	\N	\N	\N	\N	\N
1437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:45:35.470131	2014-07-14 12:45:35.470131	\N	\N	\N	\N	\N	\N	\N	\N
1438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:46:04.41604	2014-07-14 12:46:04.41604	\N	\N	\N	\N	\N	\N	\N	\N
1439	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:46:38.189583	2014-07-14 12:46:38.189583	\N	\N	\N	\N	\N	\N	\N	\N
1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 12:48:04.704562	2014-07-14 12:48:04.704562	\N	\N	\N	\N	\N	\N	\N	\N
1441	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:23:17.424675	2014-07-14 13:23:17.424675	\N	\N	\N	\N	\N	\N	\N	\N
1442	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:23:24.895639	2014-07-14 13:23:24.895639	\N	\N	\N	\N	\N	\N	\N	\N
1443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:23:35.253283	2014-07-14 13:23:35.253283	\N	\N	\N	\N	\N	\N	\N	\N
1444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:24:09.569619	2014-07-14 13:24:09.569619	\N	\N	\N	\N	\N	\N	\N	\N
1445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:26:07.225175	2014-07-14 13:26:07.225175	\N	\N	\N	\N	\N	\N	\N	\N
1446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:26:15.597663	2014-07-14 13:26:15.597663	\N	\N	\N	\N	\N	\N	\N	\N
1447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:35:25.078865	2014-07-14 13:35:25.078865	\N	\N	\N	\N	\N	\N	\N	\N
1448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:36:27.50604	2014-07-14 13:36:27.50604	\N	\N	\N	\N	\N	\N	\N	\N
1449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:42:06.000196	2014-07-14 13:42:06.000196	\N	\N	\N	\N	\N	\N	\N	\N
1450	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:42:37.182342	2014-07-14 13:42:37.182342	\N	\N	\N	\N	\N	\N	\N	\N
1451	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:56:24.400754	2014-07-14 13:56:24.400754	\N	\N	\N	\N	\N	\N	\N	\N
1452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 13:57:14.785414	2014-07-14 13:57:14.785414	\N	\N	\N	\N	\N	\N	\N	\N
1453	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:01:03.196735	2014-07-14 14:01:03.196735	\N	\N	\N	\N	\N	\N	\N	\N
1454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:01:04.227053	2014-07-14 14:01:04.227053	\N	\N	\N	\N	\N	\N	\N	\N
1455	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:01:17.062076	2014-07-14 14:01:17.062076	\N	\N	\N	\N	\N	\N	\N	\N
1456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:02:15.58896	2014-07-14 14:02:15.58896	\N	\N	\N	\N	\N	\N	\N	\N
1457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:03:24.604221	2014-07-14 14:03:24.604221	\N	\N	\N	\N	\N	\N	\N	\N
1458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:05:09.053068	2014-07-14 14:05:09.053068	\N	\N	\N	\N	\N	\N	\N	\N
1459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:05:58.659536	2014-07-14 14:05:58.659536	\N	\N	\N	\N	\N	\N	\N	\N
1460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:07:22.988146	2014-07-14 14:07:22.988146	\N	\N	\N	\N	\N	\N	\N	\N
1461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:08:04.477171	2014-07-14 14:08:04.477171	\N	\N	\N	\N	\N	\N	\N	\N
1462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:08:19.619283	2014-07-14 14:08:19.619283	\N	\N	\N	\N	\N	\N	\N	\N
1463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:09:34.572407	2014-07-14 14:09:34.572407	\N	\N	\N	\N	\N	\N	\N	\N
1464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:09:57.822449	2014-07-14 14:09:57.822449	\N	\N	\N	\N	\N	\N	\N	\N
1465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 14:24:38.221797	2014-07-14 14:24:38.221797	\N	\N	\N	\N	\N	\N	\N	\N
1466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-15 00:25:07.45785	2014-07-15 00:25:07.45785	\N	\N	\N	\N	\N	\N	\N	\N
1467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-15 13:54:55.22684	2014-07-15 13:54:55.22684	\N	\N	\N	\N	\N	\N	\N	\N
1468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-15 13:55:02.373223	2014-07-15 13:55:02.373223	\N	\N	\N	\N	\N	\N	\N	\N
1469	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-15 13:55:05.794385	2014-07-15 13:55:05.794385	\N	\N	\N	\N	\N	\N	\N	\N
1470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-15 13:55:27.668114	2014-07-15 13:55:27.668114	\N	\N	\N	\N	\N	\N	\N	\N
1471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-15 13:55:35.441318	2014-07-15 13:55:35.441318	\N	\N	\N	\N	\N	\N	\N	\N
1472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-15 13:55:52.019557	2014-07-15 13:55:52.019557	\N	\N	\N	\N	\N	\N	\N	\N
1473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-15 13:56:41.555709	2014-07-15 13:56:41.555709	\N	\N	\N	\N	\N	\N	\N	\N
1474	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-16 12:08:36.673054	2014-07-16 12:08:36.673054	\N	\N	\N	\N	\N	\N	\N	\N
1475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-16 12:08:46.4913	2014-07-16 12:08:46.4913	\N	\N	\N	\N	\N	\N	\N	\N
1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-16 12:08:56.294537	2014-07-16 12:08:56.294537	\N	\N	\N	\N	\N	\N	\N	\N
1477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:15:03.241849	2014-07-18 16:15:03.241849	\N	\N	\N	\N	\N	\N	\N	\N
1478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:19:50.760975	2014-07-18 16:19:50.760975	\N	\N	\N	\N	\N	\N	\N	\N
1479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:26:47.264853	2014-07-18 16:26:47.264853	\N	\N	\N	\N	\N	\N	\N	\N
1480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:28:24.074881	2014-07-18 16:28:24.074881	\N	\N	\N	\N	\N	\N	\N	\N
1481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:28:24.139502	2014-07-18 16:28:24.139502	\N	\N	\N	\N	\N	\N	\N	\N
1482	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:29:33.625056	2014-07-18 16:29:33.625056	\N	\N	\N	\N	\N	\N	\N	\N
1483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:29:41.252125	2014-07-18 16:29:41.252125	\N	\N	\N	\N	\N	\N	\N	\N
1484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:33:28.220504	2014-07-18 16:33:28.220504	\N	\N	\N	\N	\N	\N	\N	\N
1485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:34:02.479053	2014-07-18 16:34:02.479053	\N	\N	\N	\N	\N	\N	\N	\N
1486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:34:26.298289	2014-07-18 16:34:26.298289	\N	\N	\N	\N	\N	\N	\N	\N
1487	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:34:42.670308	2014-07-18 16:34:42.670308	\N	\N	\N	\N	\N	\N	\N	\N
1488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:36:44.046378	2014-07-18 16:36:44.046378	\N	\N	\N	\N	\N	\N	\N	\N
1489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:37:59.822977	2014-07-18 16:37:59.822977	\N	\N	\N	\N	\N	\N	\N	\N
1490	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:38:12.723199	2014-07-18 16:38:12.723199	\N	\N	\N	\N	\N	\N	\N	\N
1491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:38:22.436917	2014-07-18 16:38:22.436917	\N	\N	\N	\N	\N	\N	\N	\N
1492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:38:32.316385	2014-07-18 16:38:32.316385	\N	\N	\N	\N	\N	\N	\N	\N
1493	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:40:18.817896	2014-07-18 16:40:18.817896	\N	\N	\N	\N	\N	\N	\N	\N
1494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:40:33.58621	2014-07-18 16:40:33.58621	\N	\N	\N	\N	\N	\N	\N	\N
1495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:40:54.31321	2014-07-18 16:40:54.31321	\N	\N	\N	\N	\N	\N	\N	\N
1496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:41:48.910116	2014-07-18 16:41:48.910116	\N	\N	\N	\N	\N	\N	\N	\N
1497	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:43:34.498582	2014-07-18 16:43:34.498582	\N	\N	\N	\N	\N	\N	\N	\N
1498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:43:54.610328	2014-07-18 16:43:54.610328	\N	\N	\N	\N	\N	\N	\N	\N
1499	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:45:19.52505	2014-07-18 16:45:19.52505	\N	\N	\N	\N	\N	\N	\N	\N
1500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:47:03.953461	2014-07-18 16:47:03.953461	\N	\N	\N	\N	\N	\N	\N	\N
1501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:50:42.395196	2014-07-18 16:50:42.395196	\N	\N	\N	\N	\N	\N	\N	\N
1502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:51:33.249696	2014-07-18 16:51:33.249696	\N	\N	\N	\N	\N	\N	\N	\N
1503	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:51:50.953775	2014-07-18 16:51:50.953775	\N	\N	\N	\N	\N	\N	\N	\N
1504	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:52:05.169646	2014-07-18 16:52:05.169646	\N	\N	\N	\N	\N	\N	\N	\N
1505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 16:52:59.165484	2014-07-18 16:52:59.165484	\N	\N	\N	\N	\N	\N	\N	\N
1506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-18 17:33:44.299245	2014-07-18 17:33:44.299245	\N	\N	\N	\N	\N	\N	\N	\N
1507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 21:29:27.811333	2014-07-20 21:29:27.811333	\N	\N	\N	\N	\N	\N	\N	\N
1508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 21:44:31.420876	2014-07-20 21:44:31.420876	\N	\N	\N	\N	\N	\N	\N	\N
1509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 21:59:35.015486	2014-07-20 21:59:35.015486	\N	\N	\N	\N	\N	\N	\N	\N
1510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 21:59:59.243141	2014-07-20 21:59:59.243141	\N	\N	\N	\N	\N	\N	\N	\N
1511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:01:05.465874	2014-07-20 22:01:05.465874	\N	\N	\N	\N	\N	\N	\N	\N
1512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:04:34.160979	2014-07-20 22:04:34.160979	\N	\N	\N	\N	\N	\N	\N	\N
1513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:05:16.644425	2014-07-20 22:05:16.644425	\N	\N	\N	\N	\N	\N	\N	\N
1514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:08:03.382442	2014-07-20 22:08:03.382442	\N	\N	\N	\N	\N	\N	\N	\N
1515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:08:39.780961	2014-07-20 22:08:39.780961	\N	\N	\N	\N	\N	\N	\N	\N
1516	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:08:48.727698	2014-07-20 22:08:48.727698	\N	\N	\N	\N	\N	\N	\N	\N
1517	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:08:58.965961	2014-07-20 22:08:58.965961	\N	\N	\N	\N	\N	\N	\N	\N
1518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:09:30.550224	2014-07-20 22:09:30.550224	\N	\N	\N	\N	\N	\N	\N	\N
1519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:10:46.143348	2014-07-20 22:10:46.143348	\N	\N	\N	\N	\N	\N	\N	\N
1520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:11:55.120736	2014-07-20 22:11:55.120736	\N	\N	\N	\N	\N	\N	\N	\N
1521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:12:12.572524	2014-07-20 22:12:12.572524	\N	\N	\N	\N	\N	\N	\N	\N
1522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:14:22.575737	2014-07-20 22:14:22.575737	\N	\N	\N	\N	\N	\N	\N	\N
1523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:14:26.376821	2014-07-20 22:14:26.376821	\N	\N	\N	\N	\N	\N	\N	\N
1524	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:15:04.341975	2014-07-20 22:15:04.341975	\N	\N	\N	\N	\N	\N	\N	\N
1525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:15:38.943884	2014-07-20 22:15:38.943884	\N	\N	\N	\N	\N	\N	\N	\N
1526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:16:02.01593	2014-07-20 22:16:02.01593	\N	\N	\N	\N	\N	\N	\N	\N
1527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:16:05.533837	2014-07-20 22:16:05.533837	\N	\N	\N	\N	\N	\N	\N	\N
1528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:17:31.986146	2014-07-20 22:17:31.986146	\N	\N	\N	\N	\N	\N	\N	\N
1529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:17:37.798738	2014-07-20 22:17:37.798738	\N	\N	\N	\N	\N	\N	\N	\N
1530	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:17:56.62692	2014-07-20 22:17:56.62692	\N	\N	\N	\N	\N	\N	\N	\N
1531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:17:59.904385	2014-07-20 22:17:59.904385	\N	\N	\N	\N	\N	\N	\N	\N
1532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:18:11.505813	2014-07-20 22:18:11.505813	\N	\N	\N	\N	\N	\N	\N	\N
1533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:18:15.585044	2014-07-20 22:18:15.585044	\N	\N	\N	\N	\N	\N	\N	\N
1534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:18:39.33744	2014-07-20 22:18:39.33744	\N	\N	\N	\N	\N	\N	\N	\N
1535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:18:42.40871	2014-07-20 22:18:42.40871	\N	\N	\N	\N	\N	\N	\N	\N
1536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:19:11.817406	2014-07-20 22:19:11.817406	\N	\N	\N	\N	\N	\N	\N	\N
1537	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:19:40.247828	2014-07-20 22:19:40.247828	\N	\N	\N	\N	\N	\N	\N	\N
1538	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:19:44.384275	2014-07-20 22:19:44.384275	\N	\N	\N	\N	\N	\N	\N	\N
1539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:20:24.231826	2014-07-20 22:20:24.231826	\N	\N	\N	\N	\N	\N	\N	\N
1540	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:20:27.960212	2014-07-20 22:20:27.960212	\N	\N	\N	\N	\N	\N	\N	\N
1541	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:20:39.110896	2014-07-20 22:20:39.110896	\N	\N	\N	\N	\N	\N	\N	\N
1542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:20:49.85662	2014-07-20 22:20:49.85662	\N	\N	\N	\N	\N	\N	\N	\N
1543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:20:55.53075	2014-07-20 22:20:55.53075	\N	\N	\N	\N	\N	\N	\N	\N
1544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:21:02.341653	2014-07-20 22:21:02.341653	\N	\N	\N	\N	\N	\N	\N	\N
1545	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:21:05.598414	2014-07-20 22:21:05.598414	\N	\N	\N	\N	\N	\N	\N	\N
1546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:21:19.918416	2014-07-20 22:21:19.918416	\N	\N	\N	\N	\N	\N	\N	\N
1547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:21:34.670853	2014-07-20 22:21:34.670853	\N	\N	\N	\N	\N	\N	\N	\N
1548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:21:37.949797	2014-07-20 22:21:37.949797	\N	\N	\N	\N	\N	\N	\N	\N
1549	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:23:20.499135	2014-07-20 22:23:20.499135	\N	\N	\N	\N	\N	\N	\N	\N
1550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:23:26.203535	2014-07-20 22:23:26.203535	\N	\N	\N	\N	\N	\N	\N	\N
1551	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:23:32.234667	2014-07-20 22:23:32.234667	\N	\N	\N	\N	\N	\N	\N	\N
1552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:24:03.904099	2014-07-20 22:24:03.904099	\N	\N	\N	\N	\N	\N	\N	\N
1553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:24:57.609416	2014-07-20 22:24:57.609416	\N	\N	\N	\N	\N	\N	\N	\N
1554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:25:13.141493	2014-07-20 22:25:13.141493	\N	\N	\N	\N	\N	\N	\N	\N
1555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:25:20.553615	2014-07-20 22:25:20.553615	\N	\N	\N	\N	\N	\N	\N	\N
1556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:25:25.136186	2014-07-20 22:25:25.136186	\N	\N	\N	\N	\N	\N	\N	\N
1557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:26:01.587428	2014-07-20 22:26:01.587428	\N	\N	\N	\N	\N	\N	\N	\N
1558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:26:04.753379	2014-07-20 22:26:04.753379	\N	\N	\N	\N	\N	\N	\N	\N
1559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:26:17.438056	2014-07-20 22:26:17.438056	\N	\N	\N	\N	\N	\N	\N	\N
1560	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:26:28.309932	2014-07-20 22:26:28.309932	\N	\N	\N	\N	\N	\N	\N	\N
1561	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:27:03.118928	2014-07-20 22:27:03.118928	\N	\N	\N	\N	\N	\N	\N	\N
1562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:27:05.63593	2014-07-20 22:27:05.63593	\N	\N	\N	\N	\N	\N	\N	\N
1563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:27:09.903691	2014-07-20 22:27:09.903691	\N	\N	\N	\N	\N	\N	\N	\N
1564	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:27:31.669408	2014-07-20 22:27:31.669408	\N	\N	\N	\N	\N	\N	\N	\N
1565	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:27:35.574354	2014-07-20 22:27:35.574354	\N	\N	\N	\N	\N	\N	\N	\N
1566	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:30:44.848049	2014-07-20 22:30:44.848049	\N	\N	\N	\N	\N	\N	\N	\N
1567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:30:53.289541	2014-07-20 22:30:53.289541	\N	\N	\N	\N	\N	\N	\N	\N
1568	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:31:04.004	2014-07-20 22:31:04.004	\N	\N	\N	\N	\N	\N	\N	\N
1569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:31:25.161767	2014-07-20 22:31:25.161767	\N	\N	\N	\N	\N	\N	\N	\N
1570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:31:29.456301	2014-07-20 22:31:29.456301	\N	\N	\N	\N	\N	\N	\N	\N
1571	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:31:32.549767	2014-07-20 22:31:32.549767	\N	\N	\N	\N	\N	\N	\N	\N
1572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:31:55.922969	2014-07-20 22:31:55.922969	\N	\N	\N	\N	\N	\N	\N	\N
1573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:32:01.125318	2014-07-20 22:32:01.125318	\N	\N	\N	\N	\N	\N	\N	\N
1574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:32:10.204942	2014-07-20 22:32:10.204942	\N	\N	\N	\N	\N	\N	\N	\N
1575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:32:43.446034	2014-07-20 22:32:43.446034	\N	\N	\N	\N	\N	\N	\N	\N
1576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:32:50.495938	2014-07-20 22:32:50.495938	\N	\N	\N	\N	\N	\N	\N	\N
1577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:32:59.800202	2014-07-20 22:32:59.800202	\N	\N	\N	\N	\N	\N	\N	\N
1578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:33:09.031318	2014-07-20 22:33:09.031318	\N	\N	\N	\N	\N	\N	\N	\N
1579	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:33:25.537661	2014-07-20 22:33:25.537661	\N	\N	\N	\N	\N	\N	\N	\N
1580	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:33:35.780331	2014-07-20 22:33:35.780331	\N	\N	\N	\N	\N	\N	\N	\N
1581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:33:39.81691	2014-07-20 22:33:39.81691	\N	\N	\N	\N	\N	\N	\N	\N
1582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:35:02.359651	2014-07-20 22:35:02.359651	\N	\N	\N	\N	\N	\N	\N	\N
1583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:35:06.625993	2014-07-20 22:35:06.625993	\N	\N	\N	\N	\N	\N	\N	\N
1584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:35:08.905818	2014-07-20 22:35:08.905818	\N	\N	\N	\N	\N	\N	\N	\N
1585	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:35:26.682179	2014-07-20 22:35:26.682179	\N	\N	\N	\N	\N	\N	\N	\N
1586	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:35:37.747608	2014-07-20 22:35:37.747608	\N	\N	\N	\N	\N	\N	\N	\N
1587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:35:46.710307	2014-07-20 22:35:46.710307	\N	\N	\N	\N	\N	\N	\N	\N
1588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:36:05.856437	2014-07-20 22:36:05.856437	\N	\N	\N	\N	\N	\N	\N	\N
1589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:36:24.400161	2014-07-20 22:36:24.400161	\N	\N	\N	\N	\N	\N	\N	\N
1590	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:36:28.916133	2014-07-20 22:36:28.916133	\N	\N	\N	\N	\N	\N	\N	\N
1591	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:37:18.199945	2014-07-20 22:37:18.199945	\N	\N	\N	\N	\N	\N	\N	\N
1592	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:37:21.52229	2014-07-20 22:37:21.52229	\N	\N	\N	\N	\N	\N	\N	\N
1593	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:39:08.219444	2014-07-20 22:39:08.219444	\N	\N	\N	\N	\N	\N	\N	\N
1594	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-20 22:39:11.374457	2014-07-20 22:39:11.374457	\N	\N	\N	\N	\N	\N	\N	\N
1595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:10:46.791505	2014-07-21 01:10:46.791505	\N	\N	\N	\N	\N	\N	\N	\N
1596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:11:04.196784	2014-07-21 01:11:04.196784	\N	\N	\N	\N	\N	\N	\N	\N
1597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:11:08.479073	2014-07-21 01:11:08.479073	\N	\N	\N	\N	\N	\N	\N	\N
1598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:11:12.168876	2014-07-21 01:11:12.168876	\N	\N	\N	\N	\N	\N	\N	\N
1599	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:11:20.639179	2014-07-21 01:11:20.639179	\N	\N	\N	\N	\N	\N	\N	\N
1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:11:23.809212	2014-07-21 01:11:23.809212	\N	\N	\N	\N	\N	\N	\N	\N
1601	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:11:26.703378	2014-07-21 01:11:26.703378	\N	\N	\N	\N	\N	\N	\N	\N
1602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:11:30.249885	2014-07-21 01:11:30.249885	\N	\N	\N	\N	\N	\N	\N	\N
1603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:11:39.838485	2014-07-21 01:11:39.838485	\N	\N	\N	\N	\N	\N	\N	\N
1604	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:11:53.305306	2014-07-21 01:11:53.305306	\N	\N	\N	\N	\N	\N	\N	\N
1605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:12:00.49007	2014-07-21 01:12:00.49007	\N	\N	\N	\N	\N	\N	\N	\N
1606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:12:10.854933	2014-07-21 01:12:10.854933	\N	\N	\N	\N	\N	\N	\N	\N
1607	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:12:13.745338	2014-07-21 01:12:13.745338	\N	\N	\N	\N	\N	\N	\N	\N
1608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:13:38.110401	2014-07-21 01:13:38.110401	\N	\N	\N	\N	\N	\N	\N	\N
1609	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:13:45.926945	2014-07-21 01:13:45.926945	\N	\N	\N	\N	\N	\N	\N	\N
1610	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:13:59.693711	2014-07-21 01:13:59.693711	\N	\N	\N	\N	\N	\N	\N	\N
1611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:14:31.209527	2014-07-21 01:14:31.209527	\N	\N	\N	\N	\N	\N	\N	\N
1612	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:14:45.243787	2014-07-21 01:14:45.243787	\N	\N	\N	\N	\N	\N	\N	\N
1613	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:16:22.097301	2014-07-21 01:16:22.097301	\N	\N	\N	\N	\N	\N	\N	\N
1614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:16:48.480096	2014-07-21 01:16:48.480096	\N	\N	\N	\N	\N	\N	\N	\N
1615	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:16:52.474337	2014-07-21 01:16:52.474337	\N	\N	\N	\N	\N	\N	\N	\N
1616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:16:56.186133	2014-07-21 01:16:56.186133	\N	\N	\N	\N	\N	\N	\N	\N
1617	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:18:16.189279	2014-07-21 01:18:16.189279	\N	\N	\N	\N	\N	\N	\N	\N
1618	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:18:48.080597	2014-07-21 01:18:48.080597	\N	\N	\N	\N	\N	\N	\N	\N
1619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:20:16.191731	2014-07-21 01:20:16.191731	\N	\N	\N	\N	\N	\N	\N	\N
1620	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:20:42.433167	2014-07-21 01:20:42.433167	\N	\N	\N	\N	\N	\N	\N	\N
1621	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:25:20.41093	2014-07-21 01:25:20.41093	\N	\N	\N	\N	\N	\N	\N	\N
1622	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:26:03.65029	2014-07-21 01:26:03.65029	\N	\N	\N	\N	\N	\N	\N	\N
1623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:26:07.147386	2014-07-21 01:26:07.147386	\N	\N	\N	\N	\N	\N	\N	\N
1624	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:26:34.364536	2014-07-21 01:26:34.364536	\N	\N	\N	\N	\N	\N	\N	\N
1625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:26:37.751136	2014-07-21 01:26:37.751136	\N	\N	\N	\N	\N	\N	\N	\N
1626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 01:53:20.101509	2014-07-21 01:53:20.101509	\N	\N	\N	\N	\N	\N	\N	\N
1627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:02:18.66661	2014-07-21 02:02:18.66661	\N	\N	\N	\N	\N	\N	\N	\N
1628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:13:06.358844	2014-07-21 02:13:06.358844	\N	\N	\N	\N	\N	\N	\N	\N
1629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:13:33.987454	2014-07-21 02:13:33.987454	\N	\N	\N	\N	\N	\N	\N	\N
1630	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:13:46.412454	2014-07-21 02:13:46.412454	\N	\N	\N	\N	\N	\N	\N	\N
1631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:13:54.946901	2014-07-21 02:13:54.946901	\N	\N	\N	\N	\N	\N	\N	\N
1632	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:13:58.853081	2014-07-21 02:13:58.853081	\N	\N	\N	\N	\N	\N	\N	\N
1633	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:15:22.585955	2014-07-21 02:15:22.585955	\N	\N	\N	\N	\N	\N	\N	\N
1634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:15:41.838617	2014-07-21 02:15:41.838617	\N	\N	\N	\N	\N	\N	\N	\N
1635	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:15:56.756837	2014-07-21 02:15:56.756837	\N	\N	\N	\N	\N	\N	\N	\N
1636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:17:32.075949	2014-07-21 02:17:32.075949	\N	\N	\N	\N	\N	\N	\N	\N
1637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:17:36.662743	2014-07-21 02:17:36.662743	\N	\N	\N	\N	\N	\N	\N	\N
1638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:34:18.271562	2014-07-21 02:34:18.271562	\N	\N	\N	\N	\N	\N	\N	\N
1639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:34:20.408934	2014-07-21 02:34:20.408934	\N	\N	\N	\N	\N	\N	\N	\N
1640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:34:33.165856	2014-07-21 02:34:33.165856	\N	\N	\N	\N	\N	\N	\N	\N
1641	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:36:21.446514	2014-07-21 02:36:21.446514	\N	\N	\N	\N	\N	\N	\N	\N
1642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:36:42.731325	2014-07-21 02:36:42.731325	\N	\N	\N	\N	\N	\N	\N	\N
1643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:36:53.15976	2014-07-21 02:36:53.15976	\N	\N	\N	\N	\N	\N	\N	\N
1644	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:36:54.501632	2014-07-21 02:36:54.501632	\N	\N	\N	\N	\N	\N	\N	\N
1645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:37:48.067924	2014-07-21 02:37:48.067924	\N	\N	\N	\N	\N	\N	\N	\N
1646	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:37:49.362358	2014-07-21 02:37:49.362358	\N	\N	\N	\N	\N	\N	\N	\N
1647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:51:10.799829	2014-07-21 02:51:10.799829	\N	\N	\N	\N	\N	\N	\N	\N
1648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:52:12.648761	2014-07-21 02:52:12.648761	\N	\N	\N	\N	\N	\N	\N	\N
1649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 02:52:53.548275	2014-07-21 02:52:53.548275	\N	\N	\N	\N	\N	\N	\N	\N
1650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 03:03:00.117976	2014-07-21 03:03:00.117976	\N	\N	\N	\N	\N	\N	\N	\N
1651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 03:03:04.535364	2014-07-21 03:03:04.535364	\N	\N	\N	\N	\N	\N	\N	\N
1652	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 03:03:11.203851	2014-07-21 03:03:11.203851	\N	\N	\N	\N	\N	\N	\N	\N
1653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 03:03:16.167291	2014-07-21 03:03:16.167291	\N	\N	\N	\N	\N	\N	\N	\N
1654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 03:03:20.782919	2014-07-21 03:03:20.782919	\N	\N	\N	\N	\N	\N	\N	\N
1655	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 03:05:24.7053	2014-07-21 03:05:24.7053	\N	\N	\N	\N	\N	\N	\N	\N
1656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 03:05:49.053127	2014-07-21 03:05:49.053127	\N	\N	\N	\N	\N	\N	\N	\N
1657	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:25:02.279265	2014-07-21 11:25:02.279265	\N	\N	\N	\N	\N	\N	\N	\N
1658	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:25:06.791825	2014-07-21 11:25:06.791825	\N	\N	\N	\N	\N	\N	\N	\N
1659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:25:40.111921	2014-07-21 11:25:40.111921	\N	\N	\N	\N	\N	\N	\N	\N
1660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:26:31.037881	2014-07-21 11:26:31.037881	\N	\N	\N	\N	\N	\N	\N	\N
1661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:26:54.068063	2014-07-21 11:26:54.068063	\N	\N	\N	\N	\N	\N	\N	\N
1662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:27:59.969499	2014-07-21 11:27:59.969499	\N	\N	\N	\N	\N	\N	\N	\N
1663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:28:18.711572	2014-07-21 11:28:18.711572	\N	\N	\N	\N	\N	\N	\N	\N
1664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:28:19.307749	2014-07-21 11:28:19.307749	\N	\N	\N	\N	\N	\N	\N	\N
1665	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:28:29.263216	2014-07-21 11:28:29.263216	\N	\N	\N	\N	\N	\N	\N	\N
1666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:28:30.602854	2014-07-21 11:28:30.602854	\N	\N	\N	\N	\N	\N	\N	\N
1667	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:28:31.227295	2014-07-21 11:28:31.227295	\N	\N	\N	\N	\N	\N	\N	\N
1668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:28:41.952353	2014-07-21 11:28:41.952353	\N	\N	\N	\N	\N	\N	\N	\N
1669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:28:42.643631	2014-07-21 11:28:42.643631	\N	\N	\N	\N	\N	\N	\N	\N
1670	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:29:33.424365	2014-07-21 11:29:33.424365	\N	\N	\N	\N	\N	\N	\N	\N
1671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:30:03.085609	2014-07-21 11:30:03.085609	\N	\N	\N	\N	\N	\N	\N	\N
1672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:30:05.562549	2014-07-21 11:30:05.562549	\N	\N	\N	\N	\N	\N	\N	\N
1673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:30:08.065604	2014-07-21 11:30:08.065604	\N	\N	\N	\N	\N	\N	\N	\N
1674	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:30:22.777136	2014-07-21 11:30:22.777136	\N	\N	\N	\N	\N	\N	\N	\N
1675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:30:48.211759	2014-07-21 11:30:48.211759	\N	\N	\N	\N	\N	\N	\N	\N
1676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:30:53.058435	2014-07-21 11:30:53.058435	\N	\N	\N	\N	\N	\N	\N	\N
1677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-21 11:30:55.473852	2014-07-21 11:30:55.473852	\N	\N	\N	\N	\N	\N	\N	\N
1678	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-22 14:24:24.587815	2014-07-22 14:24:24.587815	\N	\N	\N	\N	\N	\N	\N	\N
1679	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-22 14:31:58.880721	2014-07-22 14:31:58.880721	\N	\N	\N	\N	\N	\N	\N	\N
1680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-22 14:33:47.791771	2014-07-22 14:33:47.791771	\N	\N	\N	\N	\N	\N	\N	\N
1681	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 10:07:39.222295	2014-07-24 10:07:39.222295	\N	\N	\N	\N	\N	\N	\N	\N
1682	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 10:12:09.054998	2014-07-24 10:12:09.054998	\N	\N	\N	\N	\N	\N	\N	\N
1683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 10:33:34.369234	2014-07-24 10:33:34.369234	\N	\N	\N	\N	\N	\N	\N	\N
1684	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 10:39:13.792935	2014-07-24 10:39:13.792935	\N	\N	\N	\N	\N	\N	\N	\N
1685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 10:48:56.953568	2014-07-24 10:48:56.953568	\N	\N	\N	\N	\N	\N	\N	\N
1686	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:14:52.480591	2014-07-24 12:14:52.480591	\N	\N	\N	\N	\N	\N	\N	\N
1687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:14:52.976502	2014-07-24 12:14:52.976502	\N	\N	\N	\N	\N	\N	\N	\N
1688	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:15:04.848987	2014-07-24 12:15:04.848987	\N	\N	\N	\N	\N	\N	\N	\N
1689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:15:15.188334	2014-07-24 12:15:15.188334	\N	\N	\N	\N	\N	\N	\N	\N
1690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:15:42.602764	2014-07-24 12:15:42.602764	\N	\N	\N	\N	\N	\N	\N	\N
1691	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:15:57.775494	2014-07-24 12:15:57.775494	\N	\N	\N	\N	\N	\N	\N	\N
1692	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:17:11.893367	2014-07-24 12:17:11.893367	\N	\N	\N	\N	\N	\N	\N	\N
1693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:17:43.890349	2014-07-24 12:17:43.890349	\N	\N	\N	\N	\N	\N	\N	\N
1694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:17:46.638875	2014-07-24 12:17:46.638875	\N	\N	\N	\N	\N	\N	\N	\N
1695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:18:48.847071	2014-07-24 12:18:48.847071	\N	\N	\N	\N	\N	\N	\N	\N
1696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:19:08.961012	2014-07-24 12:19:08.961012	\N	\N	\N	\N	\N	\N	\N	\N
1697	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:19:59.789497	2014-07-24 12:19:59.789497	\N	\N	\N	\N	\N	\N	\N	\N
1698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:20:39.026528	2014-07-24 12:20:39.026528	\N	\N	\N	\N	\N	\N	\N	\N
1699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:20:50.2882	2014-07-24 12:20:50.2882	\N	\N	\N	\N	\N	\N	\N	\N
1700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:21:17.26853	2014-07-24 12:21:17.26853	\N	\N	\N	\N	\N	\N	\N	\N
1701	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:22:42.819579	2014-07-24 12:22:42.819579	\N	\N	\N	\N	\N	\N	\N	\N
1702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:23:06.710388	2014-07-24 12:23:06.710388	\N	\N	\N	\N	\N	\N	\N	\N
1703	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:24:22.97967	2014-07-24 12:24:22.97967	\N	\N	\N	\N	\N	\N	\N	\N
1704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:25:04.730058	2014-07-24 12:25:04.730058	\N	\N	\N	\N	\N	\N	\N	\N
1705	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:26:07.075849	2014-07-24 12:26:07.075849	\N	\N	\N	\N	\N	\N	\N	\N
1706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:26:47.555102	2014-07-24 12:26:47.555102	\N	\N	\N	\N	\N	\N	\N	\N
1707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:28:21.180439	2014-07-24 12:28:21.180439	\N	\N	\N	\N	\N	\N	\N	\N
1708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:28:35.014759	2014-07-24 12:28:35.014759	\N	\N	\N	\N	\N	\N	\N	\N
1709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:29:06.84987	2014-07-24 12:29:06.84987	\N	\N	\N	\N	\N	\N	\N	\N
1710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:29:30.767451	2014-07-24 12:29:30.767451	\N	\N	\N	\N	\N	\N	\N	\N
1711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:29:45.731477	2014-07-24 12:29:45.731477	\N	\N	\N	\N	\N	\N	\N	\N
1712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:30:16.126627	2014-07-24 12:30:16.126627	\N	\N	\N	\N	\N	\N	\N	\N
1713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:30:41.571373	2014-07-24 12:30:41.571373	\N	\N	\N	\N	\N	\N	\N	\N
1714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:30:57.165591	2014-07-24 12:30:57.165591	\N	\N	\N	\N	\N	\N	\N	\N
1715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:34:22.500567	2014-07-24 12:34:22.500567	\N	\N	\N	\N	\N	\N	\N	\N
1716	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:35:19.329985	2014-07-24 12:35:19.329985	\N	\N	\N	\N	\N	\N	\N	\N
1717	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:36:34.083743	2014-07-24 12:36:34.083743	\N	\N	\N	\N	\N	\N	\N	\N
1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:37:06.660878	2014-07-24 12:37:06.660878	\N	\N	\N	\N	\N	\N	\N	\N
1719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:37:29.057698	2014-07-24 12:37:29.057698	\N	\N	\N	\N	\N	\N	\N	\N
1720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 12:46:21.228806	2014-07-24 12:46:21.228806	\N	\N	\N	\N	\N	\N	\N	\N
1721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 13:00:24.896999	2014-07-24 13:00:24.896999	\N	\N	\N	\N	\N	\N	\N	\N
1722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 13:00:30.691711	2014-07-24 13:00:30.691711	\N	\N	\N	\N	\N	\N	\N	\N
1723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 14:03:01.935382	2014-07-24 14:03:01.935382	\N	\N	\N	\N	\N	\N	\N	\N
1724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 14:24:45.070421	2014-07-24 14:24:45.070421	\N	\N	\N	\N	\N	\N	\N	\N
1725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 14:26:54.306112	2014-07-24 14:26:54.306112	\N	\N	\N	\N	\N	\N	\N	\N
1726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 14:38:09.273066	2014-07-24 14:38:09.273066	\N	\N	\N	\N	\N	\N	\N	\N
1727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 14:38:09.661503	2014-07-24 14:38:09.661503	\N	\N	\N	\N	\N	\N	\N	\N
1728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 14:38:58.659366	2014-07-24 14:38:58.659366	\N	\N	\N	\N	\N	\N	\N	\N
1729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 14:39:12.256346	2014-07-24 14:39:12.256346	\N	\N	\N	\N	\N	\N	\N	\N
1730	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:01:11.449255	2014-07-24 15:01:11.449255	\N	\N	\N	\N	\N	\N	\N	\N
1731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:01:33.04764	2014-07-24 15:01:33.04764	\N	\N	\N	\N	\N	\N	\N	\N
1732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:01:47.626582	2014-07-24 15:01:47.626582	\N	\N	\N	\N	\N	\N	\N	\N
1733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:12:08.253442	2014-07-24 15:12:08.253442	\N	\N	\N	\N	\N	\N	\N	\N
1734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:14:09.526644	2014-07-24 15:14:09.526644	\N	\N	\N	\N	\N	\N	\N	\N
1735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:14:16.264445	2014-07-24 15:14:16.264445	\N	\N	\N	\N	\N	\N	\N	\N
1736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:14:23.087966	2014-07-24 15:14:23.087966	\N	\N	\N	\N	\N	\N	\N	\N
1737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:14:55.33471	2014-07-24 15:14:55.33471	\N	\N	\N	\N	\N	\N	\N	\N
1738	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:15:05.541988	2014-07-24 15:15:05.541988	\N	\N	\N	\N	\N	\N	\N	\N
1739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:15:18.314314	2014-07-24 15:15:18.314314	\N	\N	\N	\N	\N	\N	\N	\N
1740	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:15:31.052501	2014-07-24 15:15:31.052501	\N	\N	\N	\N	\N	\N	\N	\N
1741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:15:49.483555	2014-07-24 15:15:49.483555	\N	\N	\N	\N	\N	\N	\N	\N
1742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:16:08.129557	2014-07-24 15:16:08.129557	\N	\N	\N	\N	\N	\N	\N	\N
1743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:16:22.018492	2014-07-24 15:16:22.018492	\N	\N	\N	\N	\N	\N	\N	\N
1744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:17:01.19334	2014-07-24 15:17:01.19334	\N	\N	\N	\N	\N	\N	\N	\N
1745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:17:09.321801	2014-07-24 15:17:09.321801	\N	\N	\N	\N	\N	\N	\N	\N
1746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:17:48.899251	2014-07-24 15:17:48.899251	\N	\N	\N	\N	\N	\N	\N	\N
1747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:23:19.624795	2014-07-24 15:23:19.624795	\N	\N	\N	\N	\N	\N	\N	\N
1748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:23:23.054204	2014-07-24 15:23:23.054204	\N	\N	\N	\N	\N	\N	\N	\N
1749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:31:46.269012	2014-07-24 15:31:46.269012	\N	\N	\N	\N	\N	\N	\N	\N
1750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:33:44.134823	2014-07-24 15:33:44.134823	\N	\N	\N	\N	\N	\N	\N	\N
1751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:48:43.503967	2014-07-24 15:48:43.503967	\N	\N	\N	\N	\N	\N	\N	\N
1752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:48:54.911224	2014-07-24 15:48:54.911224	\N	\N	\N	\N	\N	\N	\N	\N
1753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:49:13.22302	2014-07-24 15:49:13.22302	\N	\N	\N	\N	\N	\N	\N	\N
1754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:49:29.912317	2014-07-24 15:49:29.912317	\N	\N	\N	\N	\N	\N	\N	\N
1755	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:49:38.664059	2014-07-24 15:49:38.664059	\N	\N	\N	\N	\N	\N	\N	\N
1756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:49:50.275218	2014-07-24 15:49:50.275218	\N	\N	\N	\N	\N	\N	\N	\N
1757	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:50:09.581957	2014-07-24 15:50:09.581957	\N	\N	\N	\N	\N	\N	\N	\N
1758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:50:11.965738	2014-07-24 15:50:11.965738	\N	\N	\N	\N	\N	\N	\N	\N
1759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:50:16.755393	2014-07-24 15:50:16.755393	\N	\N	\N	\N	\N	\N	\N	\N
1760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:50:19.494866	2014-07-24 15:50:19.494866	\N	\N	\N	\N	\N	\N	\N	\N
1761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:50:23.63561	2014-07-24 15:50:23.63561	\N	\N	\N	\N	\N	\N	\N	\N
1762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:50:27.113981	2014-07-24 15:50:27.113981	\N	\N	\N	\N	\N	\N	\N	\N
1763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:50:54.370144	2014-07-24 15:50:54.370144	\N	\N	\N	\N	\N	\N	\N	\N
1764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:50:56.589533	2014-07-24 15:50:56.589533	\N	\N	\N	\N	\N	\N	\N	\N
1765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:50:58.838628	2014-07-24 15:50:58.838628	\N	\N	\N	\N	\N	\N	\N	\N
1766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:06.059244	2014-07-24 15:52:06.059244	\N	\N	\N	\N	\N	\N	\N	\N
1767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:14.121313	2014-07-24 15:52:14.121313	\N	\N	\N	\N	\N	\N	\N	\N
1768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:27.28406	2014-07-24 15:52:27.28406	\N	\N	\N	\N	\N	\N	\N	\N
1769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:30.429229	2014-07-24 15:52:30.429229	\N	\N	\N	\N	\N	\N	\N	\N
1770	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:32.426964	2014-07-24 15:52:32.426964	\N	\N	\N	\N	\N	\N	\N	\N
1771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:34.483002	2014-07-24 15:52:34.483002	\N	\N	\N	\N	\N	\N	\N	\N
1772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:37.832766	2014-07-24 15:52:37.832766	\N	\N	\N	\N	\N	\N	\N	\N
1773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:43.005572	2014-07-24 15:52:43.005572	\N	\N	\N	\N	\N	\N	\N	\N
1774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:49.081457	2014-07-24 15:52:49.081457	\N	\N	\N	\N	\N	\N	\N	\N
1775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:52:53.065992	2014-07-24 15:52:53.065992	\N	\N	\N	\N	\N	\N	\N	\N
1776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:53:02.138203	2014-07-24 15:53:02.138203	\N	\N	\N	\N	\N	\N	\N	\N
1777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:53:10.809285	2014-07-24 15:53:10.809285	\N	\N	\N	\N	\N	\N	\N	\N
1778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:54:08.278644	2014-07-24 15:54:08.278644	\N	\N	\N	\N	\N	\N	\N	\N
1779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:54:13.987554	2014-07-24 15:54:13.987554	\N	\N	\N	\N	\N	\N	\N	\N
1780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:54:29.443848	2014-07-24 15:54:29.443848	\N	\N	\N	\N	\N	\N	\N	\N
1781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:54:33.322595	2014-07-24 15:54:33.322595	\N	\N	\N	\N	\N	\N	\N	\N
1782	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:55:10.719154	2014-07-24 15:55:10.719154	\N	\N	\N	\N	\N	\N	\N	\N
1783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:55:13.695986	2014-07-24 15:55:13.695986	\N	\N	\N	\N	\N	\N	\N	\N
1784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:55:18.220343	2014-07-24 15:55:18.220343	\N	\N	\N	\N	\N	\N	\N	\N
1785	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:59:14.983602	2014-07-24 15:59:14.983602	\N	\N	\N	\N	\N	\N	\N	\N
1786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 15:59:43.053492	2014-07-24 15:59:43.053492	\N	\N	\N	\N	\N	\N	\N	\N
1787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:00:15.381993	2014-07-24 16:00:15.381993	\N	\N	\N	\N	\N	\N	\N	\N
1788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:00:21.251852	2014-07-24 16:00:21.251852	\N	\N	\N	\N	\N	\N	\N	\N
1789	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:00:25.903718	2014-07-24 16:00:25.903718	\N	\N	\N	\N	\N	\N	\N	\N
1790	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:05:24.134451	2014-07-24 16:05:24.134451	\N	\N	\N	\N	\N	\N	\N	\N
1791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:05:45.128979	2014-07-24 16:05:45.128979	\N	\N	\N	\N	\N	\N	\N	\N
1792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:05:55.881131	2014-07-24 16:05:55.881131	\N	\N	\N	\N	\N	\N	\N	\N
1793	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:06:50.094642	2014-07-24 16:06:50.094642	\N	\N	\N	\N	\N	\N	\N	\N
1794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:07:13.296028	2014-07-24 16:07:13.296028	\N	\N	\N	\N	\N	\N	\N	\N
1795	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:07:24.902301	2014-07-24 16:07:24.902301	\N	\N	\N	\N	\N	\N	\N	\N
1796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:11:38.954406	2014-07-24 16:11:38.954406	\N	\N	\N	\N	\N	\N	\N	\N
1797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:11:43.465248	2014-07-24 16:11:43.465248	\N	\N	\N	\N	\N	\N	\N	\N
1798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:12:30.965674	2014-07-24 16:12:30.965674	\N	\N	\N	\N	\N	\N	\N	\N
1799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:12:38.974262	2014-07-24 16:12:38.974262	\N	\N	\N	\N	\N	\N	\N	\N
1800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:13:05.290408	2014-07-24 16:13:05.290408	\N	\N	\N	\N	\N	\N	\N	\N
1801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:13:23.263353	2014-07-24 16:13:23.263353	\N	\N	\N	\N	\N	\N	\N	\N
1802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:13:37.77456	2014-07-24 16:13:37.77456	\N	\N	\N	\N	\N	\N	\N	\N
1803	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:13:40.19021	2014-07-24 16:13:40.19021	\N	\N	\N	\N	\N	\N	\N	\N
1804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:14:31.573529	2014-07-24 16:14:31.573529	\N	\N	\N	\N	\N	\N	\N	\N
1805	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:14:33.807811	2014-07-24 16:14:33.807811	\N	\N	\N	\N	\N	\N	\N	\N
1806	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:15:09.843893	2014-07-24 16:15:09.843893	\N	\N	\N	\N	\N	\N	\N	\N
1807	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:15:36.812898	2014-07-24 16:15:36.812898	\N	\N	\N	\N	\N	\N	\N	\N
1808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:15:42.638238	2014-07-24 16:15:42.638238	\N	\N	\N	\N	\N	\N	\N	\N
1809	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:15:50.124526	2014-07-24 16:15:50.124526	\N	\N	\N	\N	\N	\N	\N	\N
1810	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:15:58.164242	2014-07-24 16:15:58.164242	\N	\N	\N	\N	\N	\N	\N	\N
1811	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:16:10.675053	2014-07-24 16:16:10.675053	\N	\N	\N	\N	\N	\N	\N	\N
1812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:16:16.95369	2014-07-24 16:16:16.95369	\N	\N	\N	\N	\N	\N	\N	\N
1813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:16:29.08012	2014-07-24 16:16:29.08012	\N	\N	\N	\N	\N	\N	\N	\N
1814	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:02.387788	2014-07-24 16:17:02.387788	\N	\N	\N	\N	\N	\N	\N	\N
1815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:06.075484	2014-07-24 16:17:06.075484	\N	\N	\N	\N	\N	\N	\N	\N
1816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:10.251914	2014-07-24 16:17:10.251914	\N	\N	\N	\N	\N	\N	\N	\N
1817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:13.593735	2014-07-24 16:17:13.593735	\N	\N	\N	\N	\N	\N	\N	\N
1818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:21.813695	2014-07-24 16:17:21.813695	\N	\N	\N	\N	\N	\N	\N	\N
1819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:32.483087	2014-07-24 16:17:32.483087	\N	\N	\N	\N	\N	\N	\N	\N
1820	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:37.314132	2014-07-24 16:17:37.314132	\N	\N	\N	\N	\N	\N	\N	\N
1821	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:46.150552	2014-07-24 16:17:46.150552	\N	\N	\N	\N	\N	\N	\N	\N
1822	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:46.408034	2014-07-24 16:17:46.408034	\N	\N	\N	\N	\N	\N	\N	\N
1823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:17:52.32063	2014-07-24 16:17:52.32063	\N	\N	\N	\N	\N	\N	\N	\N
1824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:18:31.646838	2014-07-24 16:18:31.646838	\N	\N	\N	\N	\N	\N	\N	\N
1825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:18:44.863964	2014-07-24 16:18:44.863964	\N	\N	\N	\N	\N	\N	\N	\N
1826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:18:51.662359	2014-07-24 16:18:51.662359	\N	\N	\N	\N	\N	\N	\N	\N
1827	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:18:54.733651	2014-07-24 16:18:54.733651	\N	\N	\N	\N	\N	\N	\N	\N
1828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:19:01.868909	2014-07-24 16:19:01.868909	\N	\N	\N	\N	\N	\N	\N	\N
1829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:19:07.653161	2014-07-24 16:19:07.653161	\N	\N	\N	\N	\N	\N	\N	\N
1830	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:19:13.090715	2014-07-24 16:19:13.090715	\N	\N	\N	\N	\N	\N	\N	\N
1831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:19:35.063326	2014-07-24 16:19:35.063326	\N	\N	\N	\N	\N	\N	\N	\N
1832	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:19:52.695096	2014-07-24 16:19:52.695096	\N	\N	\N	\N	\N	\N	\N	\N
1833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:20:05.556547	2014-07-24 16:20:05.556547	\N	\N	\N	\N	\N	\N	\N	\N
1834	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:20:17.137371	2014-07-24 16:20:17.137371	\N	\N	\N	\N	\N	\N	\N	\N
1835	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:20:27.641967	2014-07-24 16:20:27.641967	\N	\N	\N	\N	\N	\N	\N	\N
1836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:20:33.846997	2014-07-24 16:20:33.846997	\N	\N	\N	\N	\N	\N	\N	\N
1837	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:20:37.239597	2014-07-24 16:20:37.239597	\N	\N	\N	\N	\N	\N	\N	\N
1838	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:20:40.912122	2014-07-24 16:20:40.912122	\N	\N	\N	\N	\N	\N	\N	\N
1839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:20:46.903364	2014-07-24 16:20:46.903364	\N	\N	\N	\N	\N	\N	\N	\N
1840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:20:55.320428	2014-07-24 16:20:55.320428	\N	\N	\N	\N	\N	\N	\N	\N
1841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:21:09.449527	2014-07-24 16:21:09.449527	\N	\N	\N	\N	\N	\N	\N	\N
1842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:21:22.936426	2014-07-24 16:21:22.936426	\N	\N	\N	\N	\N	\N	\N	\N
1843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:24:51.090484	2014-07-24 16:24:51.090484	\N	\N	\N	\N	\N	\N	\N	\N
1844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:25:09.753472	2014-07-24 16:25:09.753472	\N	\N	\N	\N	\N	\N	\N	\N
1845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:25:45.157041	2014-07-24 16:25:45.157041	\N	\N	\N	\N	\N	\N	\N	\N
1846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:26:39.522203	2014-07-24 16:26:39.522203	\N	\N	\N	\N	\N	\N	\N	\N
1847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:27:40.712689	2014-07-24 16:27:40.712689	\N	\N	\N	\N	\N	\N	\N	\N
1848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:28:02.357105	2014-07-24 16:28:02.357105	\N	\N	\N	\N	\N	\N	\N	\N
1849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:30:10.296029	2014-07-24 16:30:10.296029	\N	\N	\N	\N	\N	\N	\N	\N
1850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:30:38.030521	2014-07-24 16:30:38.030521	\N	\N	\N	\N	\N	\N	\N	\N
1851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:30:48.969523	2014-07-24 16:30:48.969523	\N	\N	\N	\N	\N	\N	\N	\N
1852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:31:14.388383	2014-07-24 16:31:14.388383	\N	\N	\N	\N	\N	\N	\N	\N
1853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:31:30.863613	2014-07-24 16:31:30.863613	\N	\N	\N	\N	\N	\N	\N	\N
1854	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:32:49.303283	2014-07-24 16:32:49.303283	\N	\N	\N	\N	\N	\N	\N	\N
1855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:33:02.834638	2014-07-24 16:33:02.834638	\N	\N	\N	\N	\N	\N	\N	\N
1856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:33:12.58043	2014-07-24 16:33:12.58043	\N	\N	\N	\N	\N	\N	\N	\N
1857	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:33:30.575463	2014-07-24 16:33:30.575463	\N	\N	\N	\N	\N	\N	\N	\N
1858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:34:33.986966	2014-07-24 16:34:33.986966	\N	\N	\N	\N	\N	\N	\N	\N
1859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:34:41.74966	2014-07-24 16:34:41.74966	\N	\N	\N	\N	\N	\N	\N	\N
1860	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:34:57.551427	2014-07-24 16:34:57.551427	\N	\N	\N	\N	\N	\N	\N	\N
1861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:35:53.010571	2014-07-24 16:35:53.010571	\N	\N	\N	\N	\N	\N	\N	\N
1862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:36:11.280376	2014-07-24 16:36:11.280376	\N	\N	\N	\N	\N	\N	\N	\N
1863	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:36:42.94967	2014-07-24 16:36:42.94967	\N	\N	\N	\N	\N	\N	\N	\N
1864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:36:57.332007	2014-07-24 16:36:57.332007	\N	\N	\N	\N	\N	\N	\N	\N
1865	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:36:59.595828	2014-07-24 16:36:59.595828	\N	\N	\N	\N	\N	\N	\N	\N
1866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:37:14.998011	2014-07-24 16:37:14.998011	\N	\N	\N	\N	\N	\N	\N	\N
1867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:38:00.090287	2014-07-24 16:38:00.090287	\N	\N	\N	\N	\N	\N	\N	\N
1868	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:38:13.202048	2014-07-24 16:38:13.202048	\N	\N	\N	\N	\N	\N	\N	\N
1869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:38:22.044787	2014-07-24 16:38:22.044787	\N	\N	\N	\N	\N	\N	\N	\N
1870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:38:32.213465	2014-07-24 16:38:32.213465	\N	\N	\N	\N	\N	\N	\N	\N
1871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:39:36.735803	2014-07-24 16:39:36.735803	\N	\N	\N	\N	\N	\N	\N	\N
1872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:53:26.048862	2014-07-24 16:53:26.048862	\N	\N	\N	\N	\N	\N	\N	\N
1873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:53:40.066232	2014-07-24 16:53:40.066232	\N	\N	\N	\N	\N	\N	\N	\N
1874	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:53:58.566153	2014-07-24 16:53:58.566153	\N	\N	\N	\N	\N	\N	\N	\N
1875	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:54:39.430006	2014-07-24 16:54:39.430006	\N	\N	\N	\N	\N	\N	\N	\N
1876	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:54:52.541171	2014-07-24 16:54:52.541171	\N	\N	\N	\N	\N	\N	\N	\N
1877	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 16:55:05.946535	2014-07-24 16:55:05.946535	\N	\N	\N	\N	\N	\N	\N	\N
1878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:06:09.01728	2014-07-24 17:06:09.01728	\N	\N	\N	\N	\N	\N	\N	\N
1879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:06:29.270181	2014-07-24 17:06:29.270181	\N	\N	\N	\N	\N	\N	\N	\N
1880	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:07:14.079034	2014-07-24 17:07:14.079034	\N	\N	\N	\N	\N	\N	\N	\N
1881	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:07:26.931913	2014-07-24 17:07:26.931913	\N	\N	\N	\N	\N	\N	\N	\N
1882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:09:02.300948	2014-07-24 17:09:02.300948	\N	\N	\N	\N	\N	\N	\N	\N
1883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:10:30.138954	2014-07-24 17:10:30.138954	\N	\N	\N	\N	\N	\N	\N	\N
1884	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:13:01.127993	2014-07-24 17:13:01.127993	\N	\N	\N	\N	\N	\N	\N	\N
1885	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:13:28.629469	2014-07-24 17:13:28.629469	\N	\N	\N	\N	\N	\N	\N	\N
1886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:13:50.402809	2014-07-24 17:13:50.402809	\N	\N	\N	\N	\N	\N	\N	\N
1887	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:14:16.459838	2014-07-24 17:14:16.459838	\N	\N	\N	\N	\N	\N	\N	\N
1888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:16:22.661945	2014-07-24 17:16:22.661945	\N	\N	\N	\N	\N	\N	\N	\N
1889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:16:38.792974	2014-07-24 17:16:38.792974	\N	\N	\N	\N	\N	\N	\N	\N
1890	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:17:21.86415	2014-07-24 17:17:21.86415	\N	\N	\N	\N	\N	\N	\N	\N
1891	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:17:28.818464	2014-07-24 17:17:28.818464	\N	\N	\N	\N	\N	\N	\N	\N
1892	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:19:12.961902	2014-07-24 17:19:12.961902	\N	\N	\N	\N	\N	\N	\N	\N
1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:20:48.194183	2014-07-24 17:20:48.194183	\N	\N	\N	\N	\N	\N	\N	\N
1894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:20:54.432965	2014-07-24 17:20:54.432965	\N	\N	\N	\N	\N	\N	\N	\N
1895	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:26:21.759489	2014-07-24 17:26:21.759489	\N	\N	\N	\N	\N	\N	\N	\N
1896	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:28:20.623508	2014-07-24 17:28:20.623508	\N	\N	\N	\N	\N	\N	\N	\N
1897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:30:58.024475	2014-07-24 17:30:58.024475	\N	\N	\N	\N	\N	\N	\N	\N
1898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:31:37.115915	2014-07-24 17:31:37.115915	\N	\N	\N	\N	\N	\N	\N	\N
1899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:32:52.956665	2014-07-24 17:32:52.956665	\N	\N	\N	\N	\N	\N	\N	\N
1900	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:33:27.748814	2014-07-24 17:33:27.748814	\N	\N	\N	\N	\N	\N	\N	\N
1901	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:33:47.037569	2014-07-24 17:33:47.037569	\N	\N	\N	\N	\N	\N	\N	\N
1902	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:33:49.539952	2014-07-24 17:33:49.539952	\N	\N	\N	\N	\N	\N	\N	\N
1903	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:33:52.420591	2014-07-24 17:33:52.420591	\N	\N	\N	\N	\N	\N	\N	\N
1904	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:35:36.795906	2014-07-24 17:35:36.795906	\N	\N	\N	\N	\N	\N	\N	\N
1905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:35:41.412422	2014-07-24 17:35:41.412422	\N	\N	\N	\N	\N	\N	\N	\N
1906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:36:29.501694	2014-07-24 17:36:29.501694	\N	\N	\N	\N	\N	\N	\N	\N
1907	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:36:54.491164	2014-07-24 17:36:54.491164	\N	\N	\N	\N	\N	\N	\N	\N
1908	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:37:26.489228	2014-07-24 17:37:26.489228	\N	\N	\N	\N	\N	\N	\N	\N
1909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:37:35.705472	2014-07-24 17:37:35.705472	\N	\N	\N	\N	\N	\N	\N	\N
1910	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:37:40.842023	2014-07-24 17:37:40.842023	\N	\N	\N	\N	\N	\N	\N	\N
1911	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:37:47.327119	2014-07-24 17:37:47.327119	\N	\N	\N	\N	\N	\N	\N	\N
1912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:38:05.59861	2014-07-24 17:38:05.59861	\N	\N	\N	\N	\N	\N	\N	\N
1913	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:38:18.198495	2014-07-24 17:38:18.198495	\N	\N	\N	\N	\N	\N	\N	\N
1914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:39:43.189669	2014-07-24 17:39:43.189669	\N	\N	\N	\N	\N	\N	\N	\N
1915	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:39:57.952955	2014-07-24 17:39:57.952955	\N	\N	\N	\N	\N	\N	\N	\N
1916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:40:09.359985	2014-07-24 17:40:09.359985	\N	\N	\N	\N	\N	\N	\N	\N
1917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:40:34.547246	2014-07-24 17:40:34.547246	\N	\N	\N	\N	\N	\N	\N	\N
1918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:40:46.114922	2014-07-24 17:40:46.114922	\N	\N	\N	\N	\N	\N	\N	\N
1919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:41:06.204724	2014-07-24 17:41:06.204724	\N	\N	\N	\N	\N	\N	\N	\N
1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:41:20.6663	2014-07-24 17:41:20.6663	\N	\N	\N	\N	\N	\N	\N	\N
1921	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:41:32.162783	2014-07-24 17:41:32.162783	\N	\N	\N	\N	\N	\N	\N	\N
1922	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:41:41.368984	2014-07-24 17:41:41.368984	\N	\N	\N	\N	\N	\N	\N	\N
1923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:42:10.575423	2014-07-24 17:42:10.575423	\N	\N	\N	\N	\N	\N	\N	\N
1924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:43:12.065727	2014-07-24 17:43:12.065727	\N	\N	\N	\N	\N	\N	\N	\N
1925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:43:34.010883	2014-07-24 17:43:34.010883	\N	\N	\N	\N	\N	\N	\N	\N
1926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:43:43.549174	2014-07-24 17:43:43.549174	\N	\N	\N	\N	\N	\N	\N	\N
1927	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:44:11.276968	2014-07-24 17:44:11.276968	\N	\N	\N	\N	\N	\N	\N	\N
1928	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:44:17.135634	2014-07-24 17:44:17.135634	\N	\N	\N	\N	\N	\N	\N	\N
1929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 17:45:29.59604	2014-07-24 17:45:29.59604	\N	\N	\N	\N	\N	\N	\N	\N
1930	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 18:35:58.668661	2014-07-24 18:35:58.668661	\N	\N	\N	\N	\N	\N	\N	\N
1931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 18:39:35.874877	2014-07-24 18:39:35.874877	\N	\N	\N	\N	\N	\N	\N	\N
1932	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 18:40:27.903834	2014-07-24 18:40:27.903834	\N	\N	\N	\N	\N	\N	\N	\N
1933	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 18:52:31.877934	2014-07-24 18:52:31.877934	\N	\N	\N	\N	\N	\N	\N	\N
1934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 18:53:44.120162	2014-07-24 18:53:44.120162	\N	\N	\N	\N	\N	\N	\N	\N
1935	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 18:59:12.183448	2014-07-24 18:59:12.183448	\N	\N	\N	\N	\N	\N	\N	\N
1936	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 19:08:57.778561	2014-07-24 19:08:57.778561	\N	\N	\N	\N	\N	\N	\N	\N
1937	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 19:21:34.441715	2014-07-24 19:21:34.441715	\N	\N	\N	\N	\N	\N	\N	\N
1938	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 19:33:52.367518	2014-07-24 19:33:52.367518	\N	\N	\N	\N	\N	\N	\N	\N
1939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 19:33:52.632151	2014-07-24 19:33:52.632151	\N	\N	\N	\N	\N	\N	\N	\N
1940	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 19:47:59.721627	2014-07-24 19:47:59.721627	\N	\N	\N	\N	\N	\N	\N	\N
1941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 19:50:09.393757	2014-07-24 19:50:09.393757	\N	\N	\N	\N	\N	\N	\N	\N
1942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 19:55:41.097485	2014-07-24 19:55:41.097485	\N	\N	\N	\N	\N	\N	\N	\N
1943	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 22:29:33.300464	2014-07-24 22:29:33.300464	\N	\N	\N	\N	\N	\N	\N	\N
1944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 22:31:27.021348	2014-07-24 22:31:27.021348	\N	\N	\N	\N	\N	\N	\N	\N
1945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 22:32:48.73684	2014-07-24 22:32:48.73684	\N	\N	\N	\N	\N	\N	\N	\N
1946	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 22:35:58.233583	2014-07-24 22:35:58.233583	\N	\N	\N	\N	\N	\N	\N	\N
1947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 22:36:20.410726	2014-07-24 22:36:20.410726	\N	\N	\N	\N	\N	\N	\N	\N
1948	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-24 22:36:44.007361	2014-07-24 22:36:44.007361	\N	\N	\N	\N	\N	\N	\N	\N
1949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-25 16:39:22.088099	2014-07-25 16:39:22.088099	\N	\N	\N	\N	\N	\N	\N	\N
1950	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-25 18:19:39.859857	2014-07-25 18:19:39.859857	\N	\N	\N	\N	\N	\N	\N	\N
1951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-26 01:27:12.805612	2014-07-26 01:27:12.805612	\N	\N	\N	\N	\N	\N	\N	\N
1952	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:05:17.036801	2014-07-29 15:05:17.036801	\N	\N	\N	\N	\N	\N	\N	\N
1953	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:05:17.413067	2014-07-29 15:05:17.413067	\N	\N	\N	\N	\N	\N	\N	\N
1954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:05:57.544382	2014-07-29 15:05:57.544382	\N	\N	\N	\N	\N	\N	\N	\N
1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:06:25.806408	2014-07-29 15:06:25.806408	\N	\N	\N	\N	\N	\N	\N	\N
1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:31:43.992478	2014-07-29 15:31:43.992478	\N	\N	\N	\N	\N	\N	\N	\N
1957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:33:07.199164	2014-07-29 15:33:07.199164	\N	\N	\N	\N	\N	\N	\N	\N
1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:33:18.213554	2014-07-29 15:33:18.213554	\N	\N	\N	\N	\N	\N	\N	\N
1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:33:54.060608	2014-07-29 15:33:54.060608	\N	\N	\N	\N	\N	\N	\N	\N
1960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:33:57.860776	2014-07-29 15:33:57.860776	\N	\N	\N	\N	\N	\N	\N	\N
1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:34:03.756997	2014-07-29 15:34:03.756997	\N	\N	\N	\N	\N	\N	\N	\N
1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:38:18.833762	2014-07-29 15:38:18.833762	\N	\N	\N	\N	\N	\N	\N	\N
1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:38:31.222784	2014-07-29 15:38:31.222784	\N	\N	\N	\N	\N	\N	\N	\N
1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:38:40.495568	2014-07-29 15:38:40.495568	\N	\N	\N	\N	\N	\N	\N	\N
1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:44:25.244039	2014-07-29 15:44:25.244039	\N	\N	\N	\N	\N	\N	\N	\N
1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:44:57.994793	2014-07-29 15:44:57.994793	\N	\N	\N	\N	\N	\N	\N	\N
1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:45:24.097337	2014-07-29 15:45:24.097337	\N	\N	\N	\N	\N	\N	\N	\N
1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:48:07.476133	2014-07-29 15:48:07.476133	\N	\N	\N	\N	\N	\N	\N	\N
1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:49:49.794136	2014-07-29 15:49:49.794136	\N	\N	\N	\N	\N	\N	\N	\N
1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:50:27.86013	2014-07-29 15:50:27.86013	\N	\N	\N	\N	\N	\N	\N	\N
1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:50:38.690716	2014-07-29 15:50:38.690716	\N	\N	\N	\N	\N	\N	\N	\N
1972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:51:13.367475	2014-07-29 15:51:13.367475	\N	\N	\N	\N	\N	\N	\N	\N
1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:51:19.661587	2014-07-29 15:51:19.661587	\N	\N	\N	\N	\N	\N	\N	\N
1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:51:50.079967	2014-07-29 15:51:50.079967	\N	\N	\N	\N	\N	\N	\N	\N
1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:52:07.362129	2014-07-29 15:52:07.362129	\N	\N	\N	\N	\N	\N	\N	\N
1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:54:39.492598	2014-07-29 15:54:39.492598	\N	\N	\N	\N	\N	\N	\N	\N
1977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:54:45.731532	2014-07-29 15:54:45.731532	\N	\N	\N	\N	\N	\N	\N	\N
1978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:55:26.155714	2014-07-29 15:55:26.155714	\N	\N	\N	\N	\N	\N	\N	\N
1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:55:50.909471	2014-07-29 15:55:50.909471	\N	\N	\N	\N	\N	\N	\N	\N
1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:55:59.421593	2014-07-29 15:55:59.421593	\N	\N	\N	\N	\N	\N	\N	\N
1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 15:56:06.542481	2014-07-29 15:56:06.542481	\N	\N	\N	\N	\N	\N	\N	\N
1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:14:10.961964	2014-07-29 16:14:19.728804	\N	\N	\N	(213) 493-1586	\N	\N	\N	\N
1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:19:30.401726	2014-07-29 16:19:30.401726	\N	\N	\N	\N	\N	\N	\N	\N
1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:19:31.571616	2014-07-29 16:19:38.780353	\N	\N	\N	(213) 493-1586	\N	\N	\N	\N
1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:23:13.956266	2014-07-29 16:23:13.956266	\N	\N	\N	\N	\N	\N	\N	\N
1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:23:34.290631	2014-07-29 16:23:42.702225	\N	\N	\N	(213) 493-1586	\N	\N	\N	\N
1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:26:24.452893	2014-07-29 16:26:33.414439	\N	\N	\N	(213) 493-1586	\N	\N	\N	\N
1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:29:24.833706	2014-07-29 16:29:33.275093	\N	\N	\N	(213) 493-1586	\N	\N	\N	\N
1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:30:23.284419	2014-07-29 16:30:23.284419	\N	\N	\N	\N	\N	\N	\N	\N
1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:55:42.278453	2014-07-29 16:55:42.278453	\N	\N	\N	\N	\N	\N	\N	\N
1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:56:39.360146	2014-07-29 16:56:39.360146	\N	\N	\N	\N	\N	\N	\N	\N
1992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:56:43.544249	2014-07-29 16:56:43.544249	\N	\N	\N	\N	\N	\N	\N	\N
1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:56:55.563497	2014-07-29 16:56:55.563497	\N	\N	\N	\N	\N	\N	\N	\N
1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 16:58:14.746972	2014-07-29 16:58:14.746972	\N	\N	\N	\N	\N	\N	\N	\N
1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:00:03.381505	2014-07-29 17:00:03.381505	\N	\N	\N	\N	\N	\N	\N	\N
1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:00:18.173143	2014-07-29 17:00:18.173143	\N	\N	\N	\N	\N	\N	\N	\N
1997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:01:24.940021	2014-07-29 17:01:24.940021	\N	\N	\N	\N	\N	\N	\N	\N
1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:02:30.462035	2014-07-29 17:02:30.462035	\N	\N	\N	\N	\N	\N	\N	\N
1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:03:00.782092	2014-07-29 17:03:00.782092	\N	\N	\N	\N	\N	\N	\N	\N
2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:03:07.961051	2014-07-29 17:03:07.961051	\N	\N	\N	\N	\N	\N	\N	\N
2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:03:32.769034	2014-07-29 17:03:32.769034	\N	\N	\N	\N	\N	\N	\N	\N
2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:04:14.053627	2014-07-29 17:04:14.053627	\N	\N	\N	\N	\N	\N	\N	\N
2003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:04:51.772806	2014-07-29 17:04:51.772806	\N	\N	\N	\N	\N	\N	\N	\N
2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:04:58.617991	2014-07-29 17:04:58.617991	\N	\N	\N	\N	\N	\N	\N	\N
2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:05:09.312414	2014-07-29 17:05:09.312414	\N	\N	\N	\N	\N	\N	\N	\N
2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:05:16.39213	2014-07-29 17:05:16.39213	\N	\N	\N	\N	\N	\N	\N	\N
2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:05:19.649544	2014-07-29 17:05:19.649544	\N	\N	\N	\N	\N	\N	\N	\N
2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:05:27.480134	2014-07-29 17:05:27.480134	\N	\N	\N	\N	\N	\N	\N	\N
2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:06:07.736953	2014-07-29 17:06:07.736953	\N	\N	\N	\N	\N	\N	\N	\N
2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:06:35.739108	2014-07-29 17:06:35.739108	\N	\N	\N	\N	\N	\N	\N	\N
2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:06:43.722628	2014-07-29 17:06:43.722628	\N	\N	\N	\N	\N	\N	\N	\N
2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:06:53.573082	2014-07-29 17:06:53.573082	\N	\N	\N	\N	\N	\N	\N	\N
2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:07:05.688559	2014-07-29 17:07:05.688559	\N	\N	\N	\N	\N	\N	\N	\N
2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:08:11.045461	2014-07-29 17:08:11.045461	\N	\N	\N	\N	\N	\N	\N	\N
2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:11:32.585675	2014-07-29 17:11:32.585675	\N	\N	\N	\N	\N	\N	\N	\N
2016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:16:26.418324	2014-07-29 17:16:26.418324	\N	\N	\N	\N	\N	\N	\N	\N
2017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:16:37.853009	2014-07-29 17:16:37.853009	\N	\N	\N	\N	\N	\N	\N	\N
2018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:16:47.517382	2014-07-29 17:16:47.517382	\N	\N	\N	\N	\N	\N	\N	\N
2019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:17:32.631976	2014-07-29 17:17:32.631976	\N	\N	\N	\N	\N	\N	\N	\N
2020	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:17:49.404196	2014-07-29 17:17:49.404196	\N	\N	\N	\N	\N	\N	\N	\N
2021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:18:14.010743	2014-07-29 17:18:14.010743	\N	\N	\N	\N	\N	\N	\N	\N
2022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:18:22.914271	2014-07-29 17:18:22.914271	\N	\N	\N	\N	\N	\N	\N	\N
2023	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:18:45.24519	2014-07-29 17:18:45.24519	\N	\N	\N	\N	\N	\N	\N	\N
2024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:19:17.563293	2014-07-29 17:19:17.563293	\N	\N	\N	\N	\N	\N	\N	\N
2025	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:19:40.911507	2014-07-29 17:19:40.911507	\N	\N	\N	\N	\N	\N	\N	\N
2026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:20:00.177742	2014-07-29 17:20:00.177742	\N	\N	\N	\N	\N	\N	\N	\N
2027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:20:13.026686	2014-07-29 17:20:13.026686	\N	\N	\N	\N	\N	\N	\N	\N
2028	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:20:21.618337	2014-07-29 17:20:21.618337	\N	\N	\N	\N	\N	\N	\N	\N
2029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:20:31.957975	2014-07-29 17:20:31.957975	\N	\N	\N	\N	\N	\N	\N	\N
2031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:22:25.080662	2014-07-29 17:22:25.080662	\N	\N	\N	\N	\N	\N	\N	\N
2033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:24:15.604275	2014-07-29 17:24:15.604275	\N	\N	\N	\N	\N	\N	\N	\N
2035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:25:48.313716	2014-07-29 17:25:48.313716	\N	\N	\N	\N	\N	\N	\N	\N
2037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:27:17.28819	2014-07-29 17:27:17.28819	\N	\N	\N	\N	\N	\N	\N	\N
2038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:30:08.318378	2014-07-29 17:30:08.318378	\N	\N	\N	\N	\N	\N	\N	\N
2040	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:31:44.6082	2014-07-29 17:31:44.6082	\N	\N	\N	\N	\N	\N	\N	\N
2042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:32:04.354774	2014-07-29 17:32:04.354774	\N	\N	\N	\N	\N	\N	\N	\N
2044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:32:23.472661	2014-07-29 17:32:23.472661	\N	\N	\N	\N	\N	\N	\N	\N
2046	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:32:42.476309	2014-07-29 17:32:42.476309	\N	\N	\N	\N	\N	\N	\N	\N
2048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:33:21.16074	2014-07-29 17:33:21.16074	\N	\N	\N	\N	\N	\N	\N	\N
2050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:33:46.463811	2014-07-29 17:33:46.463811	\N	\N	\N	\N	\N	\N	\N	\N
2052	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:34:03.727773	2014-07-29 17:34:03.727773	\N	\N	\N	\N	\N	\N	\N	\N
2059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:17:08.115829	2014-07-29 18:17:08.115829	\N	\N	\N	\N	\N	\N	\N	\N
2061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:17:32.770605	2014-07-29 18:17:32.770605	\N	\N	\N	\N	\N	\N	\N	\N
2062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:18:07.319326	2014-07-29 18:18:07.319326	\N	\N	\N	\N	\N	\N	\N	\N
2063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:19:41.995965	2014-07-29 18:19:41.995965	\N	\N	\N	\N	\N	\N	\N	\N
2064	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:19:52.947738	2014-07-29 18:19:52.947738	\N	\N	\N	\N	\N	\N	\N	\N
2065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:20:00.331927	2014-07-29 18:20:00.331927	\N	\N	\N	\N	\N	\N	\N	\N
2066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:20:04.286513	2014-07-29 18:20:04.286513	\N	\N	\N	\N	\N	\N	\N	\N
2067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:20:10.165302	2014-07-29 18:20:10.165302	\N	\N	\N	\N	\N	\N	\N	\N
2068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:20:16.541796	2014-07-29 18:20:46.694813	\N	\N	\N	(213) 493-1586	\N	\N	\N	\N
2071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:54:15.88975	2014-07-29 18:54:15.88975	\N	\N	\N	\N	\N	\N	\N	\N
2075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:03:16.387094	2014-07-30 12:03:16.387094	\N	\N	\N	\N	\N	\N	\N	\N
2077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:05:00.389206	2014-07-30 12:05:00.389206	\N	\N	\N	\N	\N	\N	\N	\N
2079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:05:35.722196	2014-07-30 12:05:35.722196	\N	\N	\N	\N	\N	\N	\N	\N
2081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:07:43.521241	2014-07-30 12:07:43.521241	\N	\N	\N	\N	\N	\N	\N	\N
2083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:08:15.025987	2014-07-30 12:08:15.025987	\N	\N	\N	\N	\N	\N	\N	\N
2085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:09:21.806817	2014-07-30 12:09:21.806817	\N	\N	\N	\N	\N	\N	\N	\N
2087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:09:53.752269	2014-07-30 12:09:53.752269	\N	\N	\N	\N	\N	\N	\N	\N
2089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:29:42.354954	2014-07-30 13:29:42.354954	\N	\N	\N	\N	\N	\N	\N	\N
2090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:34:37.495504	2014-07-30 13:34:37.495504	\N	\N	\N	\N	\N	\N	\N	\N
2091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:36:10.648994	2014-07-30 13:36:10.648994	\N	\N	\N	\N	\N	\N	\N	\N
2092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:36:54.695528	2014-07-30 13:36:54.695528	\N	\N	\N	\N	\N	\N	\N	\N
2093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:37:42.978698	2014-07-30 13:37:42.978698	\N	\N	\N	\N	\N	\N	\N	\N
2094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:37:55.296254	2014-07-30 13:37:55.296254	\N	\N	\N	\N	\N	\N	\N	\N
2095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:38:04.415616	2014-07-30 13:38:04.415616	\N	\N	\N	\N	\N	\N	\N	\N
2096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:38:23.197322	2014-07-30 13:38:23.197322	\N	\N	\N	\N	\N	\N	\N	\N
2097	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:38:39.089777	2014-07-30 13:38:39.089777	\N	\N	\N	\N	\N	\N	\N	\N
2098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:41:06.965866	2014-07-30 13:41:06.965866	\N	\N	\N	\N	\N	\N	\N	\N
2099	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:41:14.934409	2014-07-30 13:41:14.934409	\N	\N	\N	\N	\N	\N	\N	\N
2100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 13:53:32.455897	2014-07-30 13:53:32.455897	\N	\N	\N	\N	\N	\N	\N	\N
2104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 14:29:17.788123	2014-07-30 14:29:17.788123	\N	\N	\N	\N	\N	\N	\N	\N
2106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 14:59:03.646209	2014-07-30 14:59:03.646209	\N	\N	\N	\N	\N	\N	\N	\N
2108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:04:03.236277	2014-07-30 15:04:03.236277	\N	\N	\N	\N	\N	\N	\N	\N
2110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:04:43.631802	2014-07-30 15:04:43.631802	\N	\N	\N	\N	\N	\N	\N	\N
2112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:04:56.604624	2014-07-30 15:04:56.604624	\N	\N	\N	\N	\N	\N	\N	\N
2114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:06:15.249307	2014-07-30 15:06:15.249307	\N	\N	\N	\N	\N	\N	\N	\N
2116	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:56:05.808926	2014-07-30 15:56:05.808926	\N	\N	\N	\N	\N	\N	\N	\N
2118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:57:50.606421	2014-07-30 15:57:50.606421	\N	\N	\N	\N	\N	\N	\N	\N
2120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:58:08.837123	2014-07-30 15:58:08.837123	\N	\N	\N	\N	\N	\N	\N	\N
2122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:58:30.032716	2014-07-30 15:58:30.032716	\N	\N	\N	\N	\N	\N	\N	\N
2124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:59:25.877094	2014-07-30 15:59:25.877094	\N	\N	\N	\N	\N	\N	\N	\N
2126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:59:45.079081	2014-07-30 15:59:45.079081	\N	\N	\N	\N	\N	\N	\N	\N
2128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:00:36.164409	2014-07-30 16:00:36.164409	\N	\N	\N	\N	\N	\N	\N	\N
2130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:02:42.597144	2014-07-30 16:02:42.597144	\N	\N	\N	\N	\N	\N	\N	\N
2132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:04:21.260639	2014-07-30 16:04:21.260639	\N	\N	\N	\N	\N	\N	\N	\N
2134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:05:32.074905	2014-07-30 16:05:32.074905	\N	\N	\N	\N	\N	\N	\N	\N
2136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:05:59.43725	2014-07-30 16:05:59.43725	\N	\N	\N	\N	\N	\N	\N	\N
2138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:06:36.024777	2014-07-30 16:06:36.024777	\N	\N	\N	\N	\N	\N	\N	\N
2140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:07:17.976758	2014-07-30 16:07:17.976758	\N	\N	\N	\N	\N	\N	\N	\N
2143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:24:52.752577	2014-07-30 16:24:52.752577	\N	\N	\N	\N	\N	\N	\N	\N
2145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:28:30.731863	2014-07-30 16:28:30.731863	\N	\N	\N	\N	\N	\N	\N	\N
2147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:29:32.225884	2014-07-30 16:29:32.225884	\N	\N	\N	\N	\N	\N	\N	\N
2149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:31:46.979561	2014-07-30 16:31:46.979561	\N	\N	\N	\N	\N	\N	\N	\N
2151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:32:59.17998	2014-07-30 16:32:59.17998	\N	\N	\N	\N	\N	\N	\N	\N
2030	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:21:39.321479	2014-07-29 17:21:39.321479	\N	\N	\N	\N	\N	\N	\N	\N
2032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:22:36.540827	2014-07-29 17:22:36.540827	\N	\N	\N	\N	\N	\N	\N	\N
2034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:24:32.784928	2014-07-29 17:24:32.784928	\N	\N	\N	\N	\N	\N	\N	\N
2036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:27:10.700062	2014-07-29 17:27:10.700062	\N	\N	\N	\N	\N	\N	\N	\N
2039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:31:06.68745	2014-07-29 17:31:06.68745	\N	\N	\N	\N	\N	\N	\N	\N
2041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:31:55.702727	2014-07-29 17:31:55.702727	\N	\N	\N	\N	\N	\N	\N	\N
2043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:32:16.392885	2014-07-29 17:32:16.392885	\N	\N	\N	\N	\N	\N	\N	\N
2045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:32:32.17501	2014-07-29 17:32:32.17501	\N	\N	\N	\N	\N	\N	\N	\N
2047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:32:51.234355	2014-07-29 17:32:51.234355	\N	\N	\N	\N	\N	\N	\N	\N
2049	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:33:35.569997	2014-07-29 17:33:35.569997	\N	\N	\N	\N	\N	\N	\N	\N
2051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:33:58.079008	2014-07-29 17:33:58.079008	\N	\N	\N	\N	\N	\N	\N	\N
2053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:34:20.907632	2014-07-29 17:34:20.907632	\N	\N	\N	\N	\N	\N	\N	\N
2054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:59:17.586519	2014-07-29 17:59:17.586519	\N	\N	\N	\N	\N	\N	\N	\N
2055	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 17:59:19.093309	2014-07-29 17:59:19.093309	\N	\N	\N	\N	\N	\N	\N	\N
2056	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:10:07.044398	2014-07-29 18:10:07.044398	\N	\N	\N	\N	\N	\N	\N	\N
2057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:13:14.656487	2014-07-29 18:13:14.656487	\N	\N	\N	\N	\N	\N	\N	\N
2058	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:16:35.574226	2014-07-29 18:16:35.574226	\N	\N	\N	\N	\N	\N	\N	\N
2060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:17:18.579309	2014-07-29 18:17:18.579309	\N	\N	\N	\N	\N	\N	\N	\N
2069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:21:31.530577	2014-07-29 18:21:31.530577	\N	\N	\N	\N	\N	\N	\N	\N
2070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 18:24:07.827055	2014-07-29 18:24:07.827055	\N	\N	\N	\N	\N	\N	\N	\N
2072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 21:48:58.109834	2014-07-29 21:48:58.109834	\N	\N	\N	\N	\N	\N	\N	\N
2073	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 22:03:43.239025	2014-07-29 22:03:43.239025	\N	\N	\N	\N	\N	\N	\N	\N
2074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-29 22:11:54.286938	2014-07-29 22:11:54.286938	\N	\N	\N	\N	\N	\N	\N	\N
2076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:04:46.645259	2014-07-30 12:04:46.645259	\N	\N	\N	\N	\N	\N	\N	\N
2078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:05:30.357289	2014-07-30 12:05:30.357289	\N	\N	\N	\N	\N	\N	\N	\N
2080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:06:03.082051	2014-07-30 12:06:03.082051	\N	\N	\N	\N	\N	\N	\N	\N
2082	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:07:55.880567	2014-07-30 12:07:55.880567	\N	\N	\N	\N	\N	\N	\N	\N
2084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:08:53.038962	2014-07-30 12:08:53.038962	\N	\N	\N	\N	\N	\N	\N	\N
2086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:09:35.410484	2014-07-30 12:09:35.410484	\N	\N	\N	\N	\N	\N	\N	\N
2088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 12:10:09.457244	2014-07-30 12:10:09.457244	\N	\N	\N	\N	\N	\N	\N	\N
2101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 14:07:45.507364	2014-07-30 14:07:45.507364	\N	\N	\N	\N	\N	\N	\N	\N
2102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 14:08:39.559651	2014-07-30 14:08:39.559651	\N	\N	\N	\N	\N	\N	\N	\N
2103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 14:28:09.313173	2014-07-30 14:28:09.313173	\N	\N	\N	\N	\N	\N	\N	\N
2105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 14:58:42.478443	2014-07-30 14:58:42.478443	\N	\N	\N	\N	\N	\N	\N	\N
2107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 14:59:40.474679	2014-07-30 14:59:40.474679	\N	\N	\N	\N	\N	\N	\N	\N
2109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:04:29.656384	2014-07-30 15:04:29.656384	\N	\N	\N	\N	\N	\N	\N	\N
2111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:04:48.997971	2014-07-30 15:04:48.997971	\N	\N	\N	\N	\N	\N	\N	\N
2113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:05:01.067914	2014-07-30 15:05:01.067914	\N	\N	\N	\N	\N	\N	\N	\N
2115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:55:12.970937	2014-07-30 15:55:12.970937	\N	\N	\N	\N	\N	\N	\N	\N
2117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:57:28.83213	2014-07-30 15:57:28.83213	\N	\N	\N	\N	\N	\N	\N	\N
2119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:58:04.116907	2014-07-30 15:58:04.116907	\N	\N	\N	\N	\N	\N	\N	\N
2121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:58:16.769906	2014-07-30 15:58:16.769906	\N	\N	\N	\N	\N	\N	\N	\N
2123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:58:46.583798	2014-07-30 15:58:46.583798	\N	\N	\N	\N	\N	\N	\N	\N
2125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 15:59:34.597131	2014-07-30 15:59:34.597131	\N	\N	\N	\N	\N	\N	\N	\N
2127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:00:00.884148	2014-07-30 16:00:00.884148	\N	\N	\N	\N	\N	\N	\N	\N
2129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:01:22.90167	2014-07-30 16:01:22.90167	\N	\N	\N	\N	\N	\N	\N	\N
2131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:03:44.229553	2014-07-30 16:03:44.229553	\N	\N	\N	\N	\N	\N	\N	\N
2133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:04:44.727956	2014-07-30 16:04:44.727956	\N	\N	\N	\N	\N	\N	\N	\N
2135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:05:44.09066	2014-07-30 16:05:44.09066	\N	\N	\N	\N	\N	\N	\N	\N
2137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:06:07.37918	2014-07-30 16:06:07.37918	\N	\N	\N	\N	\N	\N	\N	\N
2139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:07:06.347809	2014-07-30 16:07:06.347809	\N	\N	\N	\N	\N	\N	\N	\N
2141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:07:25.212338	2014-07-30 16:07:25.212338	\N	\N	\N	\N	\N	\N	\N	\N
2142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:24:42.367858	2014-07-30 16:24:42.367858	\N	\N	\N	\N	\N	\N	\N	\N
2144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:28:05.331266	2014-07-30 16:28:05.331266	\N	\N	\N	\N	\N	\N	\N	\N
2146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:29:12.739355	2014-07-30 16:29:12.739355	\N	\N	\N	\N	\N	\N	\N	\N
2148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:29:47.790452	2014-07-30 16:29:47.790452	\N	\N	\N	\N	\N	\N	\N	\N
2150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:32:26.310195	2014-07-30 16:32:26.310195	\N	\N	\N	\N	\N	\N	\N	\N
2152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:33:14.531712	2014-07-30 16:33:14.531712	\N	\N	\N	\N	\N	\N	\N	\N
2153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:34:39.393518	2014-07-30 16:34:39.393518	\N	\N	\N	\N	\N	\N	\N	\N
2154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:35:44.415005	2014-07-30 16:35:44.415005	\N	\N	\N	\N	\N	\N	\N	\N
2155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:35:57.383765	2014-07-30 16:35:57.383765	\N	\N	\N	\N	\N	\N	\N	\N
2156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:36:12.32309	2014-07-30 16:36:12.32309	\N	\N	\N	\N	\N	\N	\N	\N
2157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:36:37.78157	2014-07-30 16:36:37.78157	\N	\N	\N	\N	\N	\N	\N	\N
2158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:38:23.432834	2014-07-30 16:38:23.432834	\N	\N	\N	\N	\N	\N	\N	\N
2159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:38:32.069226	2014-07-30 16:38:32.069226	\N	\N	\N	\N	\N	\N	\N	\N
2160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:38:40.03641	2014-07-30 16:38:40.03641	\N	\N	\N	\N	\N	\N	\N	\N
2161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:39:18.417312	2014-07-30 16:39:18.417312	\N	\N	\N	\N	\N	\N	\N	\N
2162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:39:34.130101	2014-07-30 16:39:34.130101	\N	\N	\N	\N	\N	\N	\N	\N
2163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:39:49.176072	2014-07-30 16:39:49.176072	\N	\N	\N	\N	\N	\N	\N	\N
2164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:40:09.097098	2014-07-30 16:40:09.097098	\N	\N	\N	\N	\N	\N	\N	\N
2165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:41:34.047148	2014-07-30 16:41:34.047148	\N	\N	\N	\N	\N	\N	\N	\N
2166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:41:40.7298	2014-07-30 16:41:40.7298	\N	\N	\N	\N	\N	\N	\N	\N
2167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:42:34.226681	2014-07-30 16:42:34.226681	\N	\N	\N	\N	\N	\N	\N	\N
2168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:42:50.329172	2014-07-30 16:42:50.329172	\N	\N	\N	\N	\N	\N	\N	\N
2169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:43:43.965526	2014-07-30 16:43:43.965526	\N	\N	\N	\N	\N	\N	\N	\N
2170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:43:55.156262	2014-07-30 16:43:55.156262	\N	\N	\N	\N	\N	\N	\N	\N
2171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:44:01.412969	2014-07-30 16:44:01.412969	\N	\N	\N	\N	\N	\N	\N	\N
2172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:44:14.641341	2014-07-30 16:44:14.641341	\N	\N	\N	\N	\N	\N	\N	\N
2173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:44:28.506455	2014-07-30 16:44:28.506455	\N	\N	\N	\N	\N	\N	\N	\N
2174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:44:45.187335	2014-07-30 16:44:45.187335	\N	\N	\N	\N	\N	\N	\N	\N
2175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:45:14.680963	2014-07-30 16:45:14.680963	\N	\N	\N	\N	\N	\N	\N	\N
2176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:45:52.993573	2014-07-30 16:45:52.993573	\N	\N	\N	\N	\N	\N	\N	\N
2177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:46:42.370251	2014-07-30 16:46:42.370251	\N	\N	\N	\N	\N	\N	\N	\N
2178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:51:51.148686	2014-07-30 16:51:51.148686	\N	\N	\N	\N	\N	\N	\N	\N
2179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:51:56.516726	2014-07-30 16:51:56.516726	\N	\N	\N	\N	\N	\N	\N	\N
2180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:52:14.273272	2014-07-30 16:52:14.273272	\N	\N	\N	\N	\N	\N	\N	\N
2181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:52:30.051629	2014-07-30 16:52:30.051629	\N	\N	\N	\N	\N	\N	\N	\N
2182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:53:45.639418	2014-07-30 16:53:45.639418	\N	\N	\N	\N	\N	\N	\N	\N
2183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:54:32.833603	2014-07-30 16:54:32.833603	\N	\N	\N	\N	\N	\N	\N	\N
2184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:54:33.230799	2014-07-30 16:54:33.230799	\N	\N	\N	\N	\N	\N	\N	\N
2185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:54:50.769425	2014-07-30 16:54:50.769425	\N	\N	\N	\N	\N	\N	\N	\N
2186	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:55:06.051262	2014-07-30 16:55:06.051262	\N	\N	\N	\N	\N	\N	\N	\N
2187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:55:36.024077	2014-07-30 16:55:36.024077	\N	\N	\N	\N	\N	\N	\N	\N
2188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:55:54.50632	2014-07-30 16:55:54.50632	\N	\N	\N	\N	\N	\N	\N	\N
2189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:56:02.872299	2014-07-30 16:56:02.872299	\N	\N	\N	\N	\N	\N	\N	\N
2190	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:56:42.334933	2014-07-30 16:56:42.334933	\N	\N	\N	\N	\N	\N	\N	\N
2191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:57:39.81473	2014-07-30 16:57:39.81473	\N	\N	\N	\N	\N	\N	\N	\N
2192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:58:43.338097	2014-07-30 16:58:43.338097	\N	\N	\N	\N	\N	\N	\N	\N
2193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:58:56.189912	2014-07-30 16:58:56.189912	\N	\N	\N	\N	\N	\N	\N	\N
2194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:59:07.561722	2014-07-30 16:59:07.561722	\N	\N	\N	\N	\N	\N	\N	\N
2195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:59:19.291273	2014-07-30 16:59:19.291273	\N	\N	\N	\N	\N	\N	\N	\N
2196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:59:32.41724	2014-07-30 16:59:32.41724	\N	\N	\N	\N	\N	\N	\N	\N
2197	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:59:40.209353	2014-07-30 16:59:40.209353	\N	\N	\N	\N	\N	\N	\N	\N
2198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 16:59:44.705495	2014-07-30 16:59:44.705495	\N	\N	\N	\N	\N	\N	\N	\N
2199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:00:17.733746	2014-07-30 17:00:17.733746	\N	\N	\N	\N	\N	\N	\N	\N
2200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:00:35.225943	2014-07-30 17:00:35.225943	\N	\N	\N	\N	\N	\N	\N	\N
2201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:01:08.995092	2014-07-30 17:01:08.995092	\N	\N	\N	\N	\N	\N	\N	\N
2202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:01:40.214378	2014-07-30 17:01:40.214378	\N	\N	\N	\N	\N	\N	\N	\N
2203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:01:59.532411	2014-07-30 17:01:59.532411	\N	\N	\N	\N	\N	\N	\N	\N
2204	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:03:40.664972	2014-07-30 17:03:40.664972	\N	\N	\N	\N	\N	\N	\N	\N
2205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:04:48.699439	2014-07-30 17:04:48.699439	\N	\N	\N	\N	\N	\N	\N	\N
2206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:06:22.782018	2014-07-30 17:06:22.782018	\N	\N	\N	\N	\N	\N	\N	\N
2207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:06:34.881495	2014-07-30 17:06:34.881495	\N	\N	\N	\N	\N	\N	\N	\N
2208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:06:47.463759	2014-07-30 17:06:47.463759	\N	\N	\N	\N	\N	\N	\N	\N
2209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:06:53.402123	2014-07-30 17:06:53.402123	\N	\N	\N	\N	\N	\N	\N	\N
2210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:07:14.842141	2014-07-30 17:07:14.842141	\N	\N	\N	\N	\N	\N	\N	\N
2211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:07:23.598325	2014-07-30 17:07:23.598325	\N	\N	\N	\N	\N	\N	\N	\N
2212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:08:11.578933	2014-07-30 17:08:11.578933	\N	\N	\N	\N	\N	\N	\N	\N
2213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:08:53.158059	2014-07-30 17:08:53.158059	\N	\N	\N	\N	\N	\N	\N	\N
2214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:09:09.767836	2014-07-30 17:09:09.767836	\N	\N	\N	\N	\N	\N	\N	\N
2215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:10:06.993574	2014-07-30 17:10:06.993574	\N	\N	\N	\N	\N	\N	\N	\N
2221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:32:05.838624	2014-07-30 17:32:05.838624	\N	\N	\N	\N	\N	\N	\N	\N
2222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:32:13.113759	2014-07-30 17:32:13.113759	\N	\N	\N	\N	\N	\N	\N	\N
2223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:32:43.229791	2014-07-30 17:32:43.229791	\N	\N	\N	\N	\N	\N	\N	\N
2224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:37:42.423486	2014-07-30 17:37:42.423486	\N	\N	\N	\N	\N	\N	\N	\N
2226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:38:19.620067	2014-07-30 17:38:19.620067	\N	\N	\N	\N	\N	\N	\N	\N
2228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:38:28.797988	2014-07-30 17:38:28.797988	\N	\N	\N	\N	\N	\N	\N	\N
2231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:40:03.037483	2014-07-30 17:40:03.037483	\N	\N	\N	\N	\N	\N	\N	\N
2232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:40:20.353353	2014-07-30 17:40:20.353353	\N	\N	\N	\N	\N	\N	\N	\N
2233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:40:40.987471	2014-07-30 17:40:40.987471	\N	\N	\N	\N	\N	\N	\N	\N
2234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:40:48.015723	2014-07-30 17:40:48.015723	\N	\N	\N	\N	\N	\N	\N	\N
2235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:41:09.250294	2014-07-30 17:41:09.250294	\N	\N	\N	\N	\N	\N	\N	\N
2237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:41:41.432499	2014-07-30 17:41:41.432499	\N	\N	\N	\N	\N	\N	\N	\N
2239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:42:49.627949	2014-07-30 17:42:49.627949	\N	\N	\N	\N	\N	\N	\N	\N
2241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:43:11.70839	2014-07-30 17:43:11.70839	\N	\N	\N	\N	\N	\N	\N	\N
2243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:43:36.16959	2014-07-30 17:43:36.16959	\N	\N	\N	\N	\N	\N	\N	\N
2245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:44:57.294715	2014-07-30 17:44:57.294715	\N	\N	\N	\N	\N	\N	\N	\N
2247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:45:16.877385	2014-07-30 17:45:16.877385	\N	\N	\N	\N	\N	\N	\N	\N
2249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:46:03.977281	2014-07-30 17:46:03.977281	\N	\N	\N	\N	\N	\N	\N	\N
2250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:46:18.679741	2014-07-30 17:46:18.679741	\N	\N	\N	\N	\N	\N	\N	\N
2252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:48:25.362286	2014-07-30 17:48:25.362286	\N	\N	\N	\N	\N	\N	\N	\N
2254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:49:31.675099	2014-07-30 17:49:31.675099	\N	\N	\N	\N	\N	\N	\N	\N
2255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:49:41.717061	2014-07-30 17:49:41.717061	\N	\N	\N	\N	\N	\N	\N	\N
2259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:50:39.670882	2014-07-30 17:50:39.670882	\N	\N	\N	\N	\N	\N	\N	\N
2260	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:50:48.421394	2014-07-30 17:50:48.421394	\N	\N	\N	\N	\N	\N	\N	\N
2261	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:51:57.09147	2014-07-30 17:51:57.09147	\N	\N	\N	\N	\N	\N	\N	\N
2262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:52:42.773026	2014-07-30 17:52:42.773026	\N	\N	\N	\N	\N	\N	\N	\N
2263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:52:56.736791	2014-07-30 17:52:56.736791	\N	\N	\N	\N	\N	\N	\N	\N
2264	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:53:27.505416	2014-07-30 17:53:27.505416	\N	\N	\N	\N	\N	\N	\N	\N
2265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:54:08.159802	2014-07-30 17:54:08.159802	\N	\N	\N	\N	\N	\N	\N	\N
2266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:54:36.370896	2014-07-30 17:54:36.370896	\N	\N	\N	\N	\N	\N	\N	\N
2274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:58:30.938935	2014-07-30 17:58:30.938935	\N	\N	\N	\N	\N	\N	\N	\N
2275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:58:41.386795	2014-07-30 17:58:41.386795	\N	\N	\N	\N	\N	\N	\N	\N
2276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:58:47.344866	2014-07-30 17:58:47.344866	\N	\N	\N	\N	\N	\N	\N	\N
2278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:59:07.06453	2014-07-30 17:59:07.06453	\N	\N	\N	\N	\N	\N	\N	\N
2279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:59:16.865367	2014-07-30 17:59:16.865367	\N	\N	\N	\N	\N	\N	\N	\N
2282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:00:08.879516	2014-07-30 18:00:08.879516	\N	\N	\N	\N	\N	\N	\N	\N
2283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:01:14.053953	2014-07-30 18:01:14.053953	\N	\N	\N	\N	\N	\N	\N	\N
2287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:04:22.982352	2014-07-30 18:04:22.982352	\N	\N	\N	\N	\N	\N	\N	\N
2290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:08:16.597173	2014-07-30 18:08:16.597173	\N	\N	\N	\N	\N	\N	\N	\N
2292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:10:41.445313	2014-07-30 18:10:41.445313	\N	\N	\N	\N	\N	\N	\N	\N
2294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:11:57.808815	2014-07-30 18:11:57.808815	\N	\N	\N	\N	\N	\N	\N	\N
2296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:13:41.259548	2014-07-30 18:13:41.259548	\N	\N	\N	\N	\N	\N	\N	\N
2298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:14:53.024743	2014-07-30 18:14:53.024743	\N	\N	\N	\N	\N	\N	\N	\N
2300	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:20:58.382943	2014-07-30 18:20:58.382943	\N	\N	\N	\N	\N	\N	\N	\N
2328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:39:19.555494	2014-07-30 18:39:19.555494	\N	\N	\N	\N	\N	\N	\N	\N
2341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:51:45.875032	2014-07-30 18:51:45.875032	\N	\N	\N	\N	\N	\N	\N	\N
2216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:11:24.810136	2014-07-30 17:11:24.810136	\N	\N	\N	\N	\N	\N	\N	\N
2217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:11:44.513697	2014-07-30 17:11:44.513697	\N	\N	\N	\N	\N	\N	\N	\N
2218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:14:11.665145	2014-07-30 17:14:11.665145	\N	\N	\N	\N	\N	\N	\N	\N
2219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:21:04.138446	2014-07-30 17:21:04.138446	\N	\N	\N	\N	\N	\N	\N	\N
2220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:31:55.67251	2014-07-30 17:31:55.67251	\N	\N	\N	\N	\N	\N	\N	\N
2225	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:38:18.514491	2014-07-30 17:38:18.514491	\N	\N	\N	\N	\N	\N	\N	\N
2227	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:38:27.559891	2014-07-30 17:38:27.559891	\N	\N	\N	\N	\N	\N	\N	\N
2229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:38:33.394598	2014-07-30 17:38:33.394598	\N	\N	\N	\N	\N	\N	\N	\N
2230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:39:19.759749	2014-07-30 17:39:19.759749	\N	\N	\N	\N	\N	\N	\N	\N
2236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:41:12.887622	2014-07-30 17:41:12.887622	\N	\N	\N	\N	\N	\N	\N	\N
2238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:41:54.512668	2014-07-30 17:41:54.512668	\N	\N	\N	\N	\N	\N	\N	\N
2240	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:43:05.951083	2014-07-30 17:43:05.951083	\N	\N	\N	\N	\N	\N	\N	\N
2242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:43:23.193149	2014-07-30 17:43:23.193149	\N	\N	\N	\N	\N	\N	\N	\N
2244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:44:27.405423	2014-07-30 17:44:27.405423	\N	\N	\N	\N	\N	\N	\N	\N
2246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:45:08.455822	2014-07-30 17:45:08.455822	\N	\N	\N	\N	\N	\N	\N	\N
2248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:45:34.480625	2014-07-30 17:45:34.480625	\N	\N	\N	\N	\N	\N	\N	\N
2251	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:47:28.383297	2014-07-30 17:47:28.383297	\N	\N	\N	\N	\N	\N	\N	\N
2253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:48:36.490804	2014-07-30 17:48:36.490804	\N	\N	\N	\N	\N	\N	\N	\N
2256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:49:50.310078	2014-07-30 17:49:50.310078	\N	\N	\N	\N	\N	\N	\N	\N
2257	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:49:56.291981	2014-07-30 17:49:56.291981	\N	\N	\N	\N	\N	\N	\N	\N
2258	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:50:09.924811	2014-07-30 17:50:09.924811	\N	\N	\N	\N	\N	\N	\N	\N
2267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:54:48.388604	2014-07-30 17:54:48.388604	\N	\N	\N	\N	\N	\N	\N	\N
2268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:55:15.0824	2014-07-30 17:55:15.0824	\N	\N	\N	\N	\N	\N	\N	\N
2269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:56:11.479031	2014-07-30 17:56:11.479031	\N	\N	\N	\N	\N	\N	\N	\N
2270	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:56:18.934544	2014-07-30 17:56:18.934544	\N	\N	\N	\N	\N	\N	\N	\N
2271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:57:49.393352	2014-07-30 17:57:49.393352	\N	\N	\N	\N	\N	\N	\N	\N
2272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:58:02.749966	2014-07-30 17:58:02.749966	\N	\N	\N	\N	\N	\N	\N	\N
2273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:58:09.416877	2014-07-30 17:58:09.416877	\N	\N	\N	\N	\N	\N	\N	\N
2277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:58:58.40377	2014-07-30 17:58:58.40377	\N	\N	\N	\N	\N	\N	\N	\N
2280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:59:25.24403	2014-07-30 17:59:25.24403	\N	\N	\N	\N	\N	\N	\N	\N
2281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 17:59:46.154526	2014-07-30 17:59:46.154526	\N	\N	\N	\N	\N	\N	\N	\N
2284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:02:26.427417	2014-07-30 18:02:26.427417	\N	\N	\N	\N	\N	\N	\N	\N
2285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:02:45.565052	2014-07-30 18:02:45.565052	\N	\N	\N	\N	\N	\N	\N	\N
2286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:03:46.466189	2014-07-30 18:03:46.466189	\N	\N	\N	\N	\N	\N	\N	\N
2288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:04:32.990701	2014-07-30 18:04:32.990701	\N	\N	\N	\N	\N	\N	\N	\N
2289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:07:56.777246	2014-07-30 18:07:56.777246	\N	\N	\N	\N	\N	\N	\N	\N
2291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:08:57.963228	2014-07-30 18:08:57.963228	\N	\N	\N	\N	\N	\N	\N	\N
2293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:11:15.38021	2014-07-30 18:11:15.38021	\N	\N	\N	\N	\N	\N	\N	\N
2295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:12:18.756712	2014-07-30 18:12:18.756712	\N	\N	\N	\N	\N	\N	\N	\N
2297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:14:35.4818	2014-07-30 18:14:35.4818	\N	\N	\N	\N	\N	\N	\N	\N
2299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:15:02.799089	2014-07-30 18:15:02.799089	\N	\N	\N	\N	\N	\N	\N	\N
2301	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:23:58.783972	2014-07-30 18:23:58.783972	\N	\N	\N	\N	\N	\N	\N	\N
2302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:24:12.567476	2014-07-30 18:24:12.567476	\N	\N	\N	\N	\N	\N	\N	\N
2303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:24:39.619539	2014-07-30 18:24:39.619539	\N	\N	\N	\N	\N	\N	\N	\N
2304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:24:46.654718	2014-07-30 18:24:46.654718	\N	\N	\N	\N	\N	\N	\N	\N
2305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:25:31.870311	2014-07-30 18:25:31.870311	\N	\N	\N	\N	\N	\N	\N	\N
2306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:26:36.027204	2014-07-30 18:26:36.027204	\N	\N	\N	\N	\N	\N	\N	\N
2307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:27:01.317659	2014-07-30 18:27:01.317659	\N	\N	\N	\N	\N	\N	\N	\N
2308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:28:28.194683	2014-07-30 18:28:28.194683	\N	\N	\N	\N	\N	\N	\N	\N
2309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:29:03.344049	2014-07-30 18:29:03.344049	\N	\N	\N	\N	\N	\N	\N	\N
2310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:30:08.490786	2014-07-30 18:30:08.490786	\N	\N	\N	\N	\N	\N	\N	\N
2311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:30:46.840294	2014-07-30 18:30:46.840294	\N	\N	\N	\N	\N	\N	\N	\N
2312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:32:13.654931	2014-07-30 18:32:13.654931	\N	\N	\N	\N	\N	\N	\N	\N
2313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:32:59.405047	2014-07-30 18:32:59.405047	\N	\N	\N	\N	\N	\N	\N	\N
2314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:33:14.454127	2014-07-30 18:33:14.454127	\N	\N	\N	\N	\N	\N	\N	\N
2315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:33:40.652678	2014-07-30 18:33:40.652678	\N	\N	\N	\N	\N	\N	\N	\N
2316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:34:00.729803	2014-07-30 18:34:00.729803	\N	\N	\N	\N	\N	\N	\N	\N
2317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:34:09.935246	2014-07-30 18:34:09.935246	\N	\N	\N	\N	\N	\N	\N	\N
2318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:34:26.989741	2014-07-30 18:34:26.989741	\N	\N	\N	\N	\N	\N	\N	\N
2319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:34:49.157534	2014-07-30 18:34:49.157534	\N	\N	\N	\N	\N	\N	\N	\N
2320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:35:23.382095	2014-07-30 18:35:23.382095	\N	\N	\N	\N	\N	\N	\N	\N
2321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:35:45.457824	2014-07-30 18:35:45.457824	\N	\N	\N	\N	\N	\N	\N	\N
2322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:36:35.824406	2014-07-30 18:36:35.824406	\N	\N	\N	\N	\N	\N	\N	\N
2323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:36:46.908106	2014-07-30 18:36:46.908106	\N	\N	\N	\N	\N	\N	\N	\N
2324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:37:03.251028	2014-07-30 18:37:03.251028	\N	\N	\N	\N	\N	\N	\N	\N
2325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:37:58.741545	2014-07-30 18:37:58.741545	\N	\N	\N	\N	\N	\N	\N	\N
2326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:38:16.093705	2014-07-30 18:38:16.093705	\N	\N	\N	\N	\N	\N	\N	\N
2327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:38:59.018337	2014-07-30 18:38:59.018337	\N	\N	\N	\N	\N	\N	\N	\N
2329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:40:43.350835	2014-07-30 18:40:43.350835	\N	\N	\N	\N	\N	\N	\N	\N
2330	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:44:20.246723	2014-07-30 18:44:20.246723	\N	\N	\N	\N	\N	\N	\N	\N
2331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:44:53.553889	2014-07-30 18:44:53.553889	\N	\N	\N	\N	\N	\N	\N	\N
2332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:46:06.036088	2014-07-30 18:46:06.036088	\N	\N	\N	\N	\N	\N	\N	\N
2333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:46:32.608771	2014-07-30 18:46:32.608771	\N	\N	\N	\N	\N	\N	\N	\N
2334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:46:58.533685	2014-07-30 18:46:58.533685	\N	\N	\N	\N	\N	\N	\N	\N
2335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:47:28.939766	2014-07-30 18:47:28.939766	\N	\N	\N	\N	\N	\N	\N	\N
2336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:48:07.881506	2014-07-30 18:48:07.881506	\N	\N	\N	\N	\N	\N	\N	\N
2337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:49:04.526983	2014-07-30 18:49:04.526983	\N	\N	\N	\N	\N	\N	\N	\N
2338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:49:20.570302	2014-07-30 18:49:20.570302	\N	\N	\N	\N	\N	\N	\N	\N
2339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:50:32.604387	2014-07-30 18:50:32.604387	\N	\N	\N	\N	\N	\N	\N	\N
2340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:51:16.11906	2014-07-30 18:51:16.11906	\N	\N	\N	\N	\N	\N	\N	\N
2342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:52:16.791026	2014-07-30 18:52:16.791026	\N	\N	\N	\N	\N	\N	\N	\N
2343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:52:33.259145	2014-07-30 18:52:33.259145	\N	\N	\N	\N	\N	\N	\N	\N
2344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:54:32.835733	2014-07-30 18:54:32.835733	\N	\N	\N	\N	\N	\N	\N	\N
2345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:54:49.105972	2014-07-30 18:54:49.105972	\N	\N	\N	\N	\N	\N	\N	\N
2346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:55:39.281305	2014-07-30 18:55:39.281305	\N	\N	\N	\N	\N	\N	\N	\N
2347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 18:57:29.926972	2014-07-30 18:57:29.926972	\N	\N	\N	\N	\N	\N	\N	\N
2348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:01:12.104627	2014-07-30 19:01:12.104627	\N	\N	\N	\N	\N	\N	\N	\N
2349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:01:37.821285	2014-07-30 19:01:37.821285	\N	\N	\N	\N	\N	\N	\N	\N
2350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:02:29.435082	2014-07-30 19:02:29.435082	\N	\N	\N	\N	\N	\N	\N	\N
2351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:07:38.130781	2014-07-30 19:07:38.130781	\N	\N	\N	\N	\N	\N	\N	\N
2352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:07:52.821553	2014-07-30 19:07:52.821553	\N	\N	\N	\N	\N	\N	\N	\N
2353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:08:06.278477	2014-07-30 19:08:06.278477	\N	\N	\N	\N	\N	\N	\N	\N
2354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:08:13.886044	2014-07-30 19:08:13.886044	\N	\N	\N	\N	\N	\N	\N	\N
2355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:08:19.940606	2014-07-30 19:08:19.940606	\N	\N	\N	\N	\N	\N	\N	\N
2356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:08:35.356725	2014-07-30 19:08:35.356725	\N	\N	\N	\N	\N	\N	\N	\N
2357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:08:47.990573	2014-07-30 19:08:47.990573	\N	\N	\N	\N	\N	\N	\N	\N
2358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:09:13.107335	2014-07-30 19:09:13.107335	\N	\N	\N	\N	\N	\N	\N	\N
2359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:09:28.442789	2014-07-30 19:09:28.442789	\N	\N	\N	\N	\N	\N	\N	\N
2360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:09:40.693267	2014-07-30 19:09:40.693267	\N	\N	\N	\N	\N	\N	\N	\N
2361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:09:51.503336	2014-07-30 19:09:51.503336	\N	\N	\N	\N	\N	\N	\N	\N
2362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:10:50.210502	2014-07-30 19:10:50.210502	\N	\N	\N	\N	\N	\N	\N	\N
2363	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:11:02.229125	2014-07-30 19:11:02.229125	\N	\N	\N	\N	\N	\N	\N	\N
2364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:11:15.881486	2014-07-30 19:11:15.881486	\N	\N	\N	\N	\N	\N	\N	\N
2365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:12:43.387963	2014-07-30 19:12:43.387963	\N	\N	\N	\N	\N	\N	\N	\N
2366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:13:00.889676	2014-07-30 19:13:00.889676	\N	\N	\N	\N	\N	\N	\N	\N
2367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:13:10.881256	2014-07-30 19:13:10.881256	\N	\N	\N	\N	\N	\N	\N	\N
2368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:13:21.741719	2014-07-30 19:13:21.741719	\N	\N	\N	\N	\N	\N	\N	\N
2369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:13:41.43636	2014-07-30 19:13:41.43636	\N	\N	\N	\N	\N	\N	\N	\N
2370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:13:58.301404	2014-07-30 19:13:58.301404	\N	\N	\N	\N	\N	\N	\N	\N
2371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:14:08.26135	2014-07-30 19:14:08.26135	\N	\N	\N	\N	\N	\N	\N	\N
2372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:14:16.301829	2014-07-30 19:14:16.301829	\N	\N	\N	\N	\N	\N	\N	\N
2373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:15:18.433792	2014-07-30 19:15:18.433792	\N	\N	\N	\N	\N	\N	\N	\N
2374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:15:44.265763	2014-07-30 19:15:44.265763	\N	\N	\N	\N	\N	\N	\N	\N
2375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:16:13.837192	2014-07-30 19:16:13.837192	\N	\N	\N	\N	\N	\N	\N	\N
2376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:16:25.751006	2014-07-30 19:16:25.751006	\N	\N	\N	\N	\N	\N	\N	\N
2377	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:16:43.529074	2014-07-30 19:16:43.529074	\N	\N	\N	\N	\N	\N	\N	\N
2378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:20:27.65818	2014-07-30 19:20:27.65818	\N	\N	\N	\N	\N	\N	\N	\N
2379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:21:24.469274	2014-07-30 19:21:24.469274	\N	\N	\N	\N	\N	\N	\N	\N
2380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:21:34.853486	2014-07-30 19:21:34.853486	\N	\N	\N	\N	\N	\N	\N	\N
2381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:21:57.901369	2014-07-30 19:21:57.901369	\N	\N	\N	\N	\N	\N	\N	\N
2382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:22:01.148431	2014-07-30 19:22:01.148431	\N	\N	\N	\N	\N	\N	\N	\N
2384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:22:56.454411	2014-07-30 19:22:56.454411	\N	\N	\N	\N	\N	\N	\N	\N
2386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:23:18.641039	2014-07-30 19:23:18.641039	\N	\N	\N	\N	\N	\N	\N	\N
2388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:24:25.195992	2014-07-30 19:24:25.195992	\N	\N	\N	\N	\N	\N	\N	\N
2390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:24:53.497574	2014-07-30 19:24:53.497574	\N	\N	\N	\N	\N	\N	\N	\N
2391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:25:06.89674	2014-07-30 19:25:06.89674	\N	\N	\N	\N	\N	\N	\N	\N
2392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:25:14.831212	2014-07-30 19:25:14.831212	\N	\N	\N	\N	\N	\N	\N	\N
2395	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:26:20.446469	2014-07-30 19:26:20.446469	\N	\N	\N	\N	\N	\N	\N	\N
2398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:27:03.975811	2014-07-30 19:27:03.975811	\N	\N	\N	\N	\N	\N	\N	\N
2400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:27:30.19311	2014-07-30 19:27:30.19311	\N	\N	\N	\N	\N	\N	\N	\N
2401	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:27:58.341777	2014-07-30 19:27:58.341777	\N	\N	\N	\N	\N	\N	\N	\N
2403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:28:16.336437	2014-07-30 19:28:16.336437	\N	\N	\N	\N	\N	\N	\N	\N
2405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:28:33.346171	2014-07-30 19:28:33.346171	\N	\N	\N	\N	\N	\N	\N	\N
2407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:29:31.465686	2014-07-30 19:29:31.465686	\N	\N	\N	\N	\N	\N	\N	\N
2409	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:30:02.883346	2014-07-30 19:30:02.883346	\N	\N	\N	\N	\N	\N	\N	\N
2411	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:30:39.912296	2014-07-30 19:30:39.912296	\N	\N	\N	\N	\N	\N	\N	\N
2413	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:31:04.585392	2014-07-30 19:31:04.585392	\N	\N	\N	\N	\N	\N	\N	\N
2415	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:31:40.974018	2014-07-30 19:31:40.974018	\N	\N	\N	\N	\N	\N	\N	\N
2417	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:32:51.846205	2014-07-30 19:32:51.846205	\N	\N	\N	\N	\N	\N	\N	\N
2420	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:33:36.967737	2014-07-30 19:33:36.967737	\N	\N	\N	\N	\N	\N	\N	\N
2422	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:34:56.315882	2014-07-30 19:34:56.315882	\N	\N	\N	\N	\N	\N	\N	\N
2423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:35:13.090176	2014-07-30 19:35:13.090176	\N	\N	\N	\N	\N	\N	\N	\N
2430	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:38:07.10016	2014-07-30 19:38:07.10016	\N	\N	\N	\N	\N	\N	\N	\N
2432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:38:36.916138	2014-07-30 19:38:36.916138	\N	\N	\N	\N	\N	\N	\N	\N
2433	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:38:54.26779	2014-07-30 19:38:54.26779	\N	\N	\N	\N	\N	\N	\N	\N
2440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:40:31.245442	2014-07-30 19:40:31.245442	\N	\N	\N	\N	\N	\N	\N	\N
2444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:42:54.854407	2014-07-30 19:42:54.854407	\N	\N	\N	\N	\N	\N	\N	\N
2447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:43:26.784344	2014-07-30 19:43:26.784344	\N	\N	\N	\N	\N	\N	\N	\N
2448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:43:33.892665	2014-07-30 19:43:33.892665	\N	\N	\N	\N	\N	\N	\N	\N
2450	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:44:08.283323	2014-07-30 19:44:08.283323	\N	\N	\N	\N	\N	\N	\N	\N
2451	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:45:24.952544	2014-07-30 19:45:24.952544	\N	\N	\N	\N	\N	\N	\N	\N
2456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:48:04.237367	2014-07-30 19:48:04.237367	\N	\N	\N	\N	\N	\N	\N	\N
2459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:49:35.406993	2014-07-30 19:49:35.406993	\N	\N	\N	\N	\N	\N	\N	\N
2460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:50:23.849585	2014-07-30 19:50:23.849585	\N	\N	\N	\N	\N	\N	\N	\N
2462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:52:04.727807	2014-07-30 19:52:04.727807	\N	\N	\N	\N	\N	\N	\N	\N
2463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:56:06.742878	2014-07-30 19:56:06.742878	\N	\N	\N	\N	\N	\N	\N	\N
2465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:56:49.233926	2014-07-30 19:56:49.233926	\N	\N	\N	\N	\N	\N	\N	\N
2466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:58:42.96496	2014-07-30 19:58:42.96496	\N	\N	\N	\N	\N	\N	\N	\N
2467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:58:55.646902	2014-07-30 19:58:55.646902	\N	\N	\N	\N	\N	\N	\N	\N
2469	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:01:45.275222	2014-07-30 20:01:45.275222	\N	\N	\N	\N	\N	\N	\N	\N
2472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:05:25.04709	2014-07-30 20:05:25.04709	\N	\N	\N	\N	\N	\N	\N	\N
2474	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:05:55.525684	2014-07-30 20:05:55.525684	\N	\N	\N	\N	\N	\N	\N	\N
2476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:10:40.796453	2014-07-30 20:10:40.796453	\N	\N	\N	\N	\N	\N	\N	\N
2477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:15:46.78333	2014-07-30 20:15:46.78333	\N	\N	\N	\N	\N	\N	\N	\N
2479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:17:26.823393	2014-07-30 20:17:26.823393	\N	\N	\N	\N	\N	\N	\N	\N
2480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:18:19.848244	2014-07-30 20:18:19.848244	\N	\N	\N	\N	\N	\N	\N	\N
2485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 10:56:49.926502	2014-07-31 10:56:49.926502	\N	\N	\N	\N	\N	\N	\N	\N
2486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:17:01.525604	2014-07-31 12:17:01.525604	\N	\N	\N	\N	\N	\N	\N	\N
2488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:19:08.982364	2014-07-31 12:19:08.982364	\N	\N	\N	\N	\N	\N	\N	\N
2489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:20:10.21724	2014-07-31 12:20:10.21724	\N	\N	\N	\N	\N	\N	\N	\N
2490	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:20:52.818597	2014-07-31 12:20:52.818597	\N	\N	\N	\N	\N	\N	\N	\N
2491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:21:55.651933	2014-07-31 12:21:55.651933	\N	\N	\N	\N	\N	\N	\N	\N
2492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:22:34.218244	2014-07-31 12:22:34.218244	\N	\N	\N	\N	\N	\N	\N	\N
2493	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:24:07.650785	2014-07-31 12:24:07.650785	\N	\N	\N	\N	\N	\N	\N	\N
2494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:25:35.056498	2014-07-31 12:25:35.056498	\N	\N	\N	\N	\N	\N	\N	\N
2495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:26:55.406326	2014-07-31 12:26:55.406326	\N	\N	\N	\N	\N	\N	\N	\N
2496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:27:20.764792	2014-07-31 12:27:20.764792	\N	\N	\N	\N	\N	\N	\N	\N
2497	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:28:44.265728	2014-07-31 12:28:44.265728	\N	\N	\N	\N	\N	\N	\N	\N
2498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:29:15.320437	2014-07-31 12:29:15.320437	\N	\N	\N	\N	\N	\N	\N	\N
2499	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:29:30.435526	2014-07-31 12:29:30.435526	\N	\N	\N	\N	\N	\N	\N	\N
2500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:29:53.449721	2014-07-31 12:29:53.449721	\N	\N	\N	\N	\N	\N	\N	\N
2501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:30:36.984334	2014-07-31 12:30:36.984334	\N	\N	\N	\N	\N	\N	\N	\N
2502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:31:00.838839	2014-07-31 12:31:00.838839	\N	\N	\N	\N	\N	\N	\N	\N
2503	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:31:15.755858	2014-07-31 12:31:15.755858	\N	\N	\N	\N	\N	\N	\N	\N
2504	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:31:27.009164	2014-07-31 12:31:27.009164	\N	\N	\N	\N	\N	\N	\N	\N
2505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:32:43.504555	2014-07-31 12:32:43.504555	\N	\N	\N	\N	\N	\N	\N	\N
2506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:32:54.568005	2014-07-31 12:32:54.568005	\N	\N	\N	\N	\N	\N	\N	\N
2507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:33:59.674607	2014-07-31 12:33:59.674607	\N	\N	\N	\N	\N	\N	\N	\N
2508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:35:27.671158	2014-07-31 12:35:27.671158	\N	\N	\N	\N	\N	\N	\N	\N
2509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:36:01.862819	2014-07-31 12:36:01.862819	\N	\N	\N	\N	\N	\N	\N	\N
2510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:36:45.639024	2014-07-31 12:36:45.639024	\N	\N	\N	\N	\N	\N	\N	\N
2511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:36:57.976417	2014-07-31 12:36:57.976417	\N	\N	\N	\N	\N	\N	\N	\N
2512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:37:13.668145	2014-07-31 12:37:13.668145	\N	\N	\N	\N	\N	\N	\N	\N
2513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:37:17.793303	2014-07-31 12:37:17.793303	\N	\N	\N	\N	\N	\N	\N	\N
2514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:37:40.267334	2014-07-31 12:37:40.267334	\N	\N	\N	\N	\N	\N	\N	\N
2515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:42:02.988521	2014-07-31 12:42:02.988521	\N	\N	\N	\N	\N	\N	\N	\N
2518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:50:03.359274	2014-07-31 12:50:03.359274	\N	\N	\N	\N	\N	\N	\N	\N
2520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:50:24.675163	2014-07-31 12:50:24.675163	\N	\N	\N	\N	\N	\N	\N	\N
2522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:51:04.454178	2014-07-31 12:51:04.454178	\N	\N	\N	\N	\N	\N	\N	\N
2524	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:51:28.246042	2014-07-31 12:51:28.246042	\N	\N	\N	\N	\N	\N	\N	\N
2526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:52:10.324915	2014-07-31 12:52:10.324915	\N	\N	\N	\N	\N	\N	\N	\N
2528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:52:30.170338	2014-07-31 12:52:30.170338	\N	\N	\N	\N	\N	\N	\N	\N
2530	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 13:55:49.484211	2014-07-31 13:55:49.484211	\N	\N	\N	\N	\N	\N	\N	\N
2532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 13:59:23.586818	2014-07-31 13:59:23.586818	\N	\N	\N	\N	\N	\N	\N	\N
2383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:22:06.276054	2014-07-30 19:22:06.276054	\N	\N	\N	\N	\N	\N	\N	\N
2385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:23:08.95204	2014-07-30 19:23:08.95204	\N	\N	\N	\N	\N	\N	\N	\N
2387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:23:46.867262	2014-07-30 19:23:46.867262	\N	\N	\N	\N	\N	\N	\N	\N
2389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:24:35.739869	2014-07-30 19:24:35.739869	\N	\N	\N	\N	\N	\N	\N	\N
2393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:25:20.572474	2014-07-30 19:25:20.572474	\N	\N	\N	\N	\N	\N	\N	\N
2394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:25:48.636959	2014-07-30 19:25:48.636959	\N	\N	\N	\N	\N	\N	\N	\N
2396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:26:45.104791	2014-07-30 19:26:45.104791	\N	\N	\N	\N	\N	\N	\N	\N
2397	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:26:56.952173	2014-07-30 19:26:56.952173	\N	\N	\N	\N	\N	\N	\N	\N
2399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:27:10.00348	2014-07-30 19:27:10.00348	\N	\N	\N	\N	\N	\N	\N	\N
2402	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:28:14.327643	2014-07-30 19:28:14.327643	\N	\N	\N	\N	\N	\N	\N	\N
2404	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:28:24.550973	2014-07-30 19:28:24.550973	\N	\N	\N	\N	\N	\N	\N	\N
2406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:29:11.158298	2014-07-30 19:29:11.158298	\N	\N	\N	\N	\N	\N	\N	\N
2408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:29:50.766717	2014-07-30 19:29:50.766717	\N	\N	\N	\N	\N	\N	\N	\N
2410	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:30:12.926077	2014-07-30 19:30:12.926077	\N	\N	\N	\N	\N	\N	\N	\N
2412	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:30:52.995333	2014-07-30 19:30:52.995333	\N	\N	\N	\N	\N	\N	\N	\N
2414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:31:30.089371	2014-07-30 19:31:30.089371	\N	\N	\N	\N	\N	\N	\N	\N
2416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:32:19.962153	2014-07-30 19:32:19.962153	\N	\N	\N	\N	\N	\N	\N	\N
2418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:33:01.522291	2014-07-30 19:33:01.522291	\N	\N	\N	\N	\N	\N	\N	\N
2419	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:33:26.784639	2014-07-30 19:33:26.784639	\N	\N	\N	\N	\N	\N	\N	\N
2421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:34:35.259308	2014-07-30 19:34:35.259308	\N	\N	\N	\N	\N	\N	\N	\N
2424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:36:01.717817	2014-07-30 19:36:01.717817	\N	\N	\N	\N	\N	\N	\N	\N
2425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:36:22.650409	2014-07-30 19:36:22.650409	\N	\N	\N	\N	\N	\N	\N	\N
2426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:36:52.015197	2014-07-30 19:36:52.015197	\N	\N	\N	\N	\N	\N	\N	\N
2427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:37:01.818917	2014-07-30 19:37:01.818917	\N	\N	\N	\N	\N	\N	\N	\N
2428	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:37:12.444478	2014-07-30 19:37:12.444478	\N	\N	\N	\N	\N	\N	\N	\N
2429	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:37:56.25142	2014-07-30 19:37:56.25142	\N	\N	\N	\N	\N	\N	\N	\N
2431	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:38:28.480611	2014-07-30 19:38:28.480611	\N	\N	\N	\N	\N	\N	\N	\N
2434	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:39:10.36414	2014-07-30 19:39:10.36414	\N	\N	\N	\N	\N	\N	\N	\N
2435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:39:23.665466	2014-07-30 19:39:23.665466	\N	\N	\N	\N	\N	\N	\N	\N
2436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:39:28.877077	2014-07-30 19:39:28.877077	\N	\N	\N	\N	\N	\N	\N	\N
2437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:39:39.095777	2014-07-30 19:39:39.095777	\N	\N	\N	\N	\N	\N	\N	\N
2438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:40:11.722965	2014-07-30 19:40:11.722965	\N	\N	\N	\N	\N	\N	\N	\N
2439	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:40:19.042405	2014-07-30 19:40:19.042405	\N	\N	\N	\N	\N	\N	\N	\N
2441	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:41:07.000864	2014-07-30 19:41:07.000864	\N	\N	\N	\N	\N	\N	\N	\N
2442	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:41:14.292592	2014-07-30 19:41:14.292592	\N	\N	\N	\N	\N	\N	\N	\N
2443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:41:38.084502	2014-07-30 19:41:38.084502	\N	\N	\N	\N	\N	\N	\N	\N
2445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:43:04.75684	2014-07-30 19:43:04.75684	\N	\N	\N	\N	\N	\N	\N	\N
2446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:43:15.189209	2014-07-30 19:43:15.189209	\N	\N	\N	\N	\N	\N	\N	\N
2449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:43:56.572867	2014-07-30 19:43:56.572867	\N	\N	\N	\N	\N	\N	\N	\N
2452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:45:31.250796	2014-07-30 19:45:31.250796	\N	\N	\N	\N	\N	\N	\N	\N
2453	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:45:44.913947	2014-07-30 19:45:44.913947	\N	\N	\N	\N	\N	\N	\N	\N
2454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:47:16.945919	2014-07-30 19:47:16.945919	\N	\N	\N	\N	\N	\N	\N	\N
2455	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:47:52.531371	2014-07-30 19:47:52.531371	\N	\N	\N	\N	\N	\N	\N	\N
2457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:48:09.762667	2014-07-30 19:48:09.762667	\N	\N	\N	\N	\N	\N	\N	\N
2458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:48:45.423359	2014-07-30 19:48:45.423359	\N	\N	\N	\N	\N	\N	\N	\N
2461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:51:41.887729	2014-07-30 19:51:41.887729	\N	\N	\N	\N	\N	\N	\N	\N
2464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:56:13.750739	2014-07-30 19:56:13.750739	\N	\N	\N	\N	\N	\N	\N	\N
2468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 19:59:04.784917	2014-07-30 19:59:04.784917	\N	\N	\N	\N	\N	\N	\N	\N
2470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:01:54.633548	2014-07-30 20:01:54.633548	\N	\N	\N	\N	\N	\N	\N	\N
2471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:03:11.909902	2014-07-30 20:03:11.909902	\N	\N	\N	\N	\N	\N	\N	\N
2473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:05:50.036285	2014-07-30 20:05:50.036285	\N	\N	\N	\N	\N	\N	\N	\N
2475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:06:03.262141	2014-07-30 20:06:03.262141	\N	\N	\N	\N	\N	\N	\N	\N
2478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:15:55.225292	2014-07-30 20:15:55.225292	\N	\N	\N	\N	\N	\N	\N	\N
2481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:18:25.79013	2014-07-30 20:18:25.79013	\N	\N	\N	\N	\N	\N	\N	\N
2482	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:20:22.019199	2014-07-30 20:20:22.019199	\N	\N	\N	\N	\N	\N	\N	\N
2483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:24:02.959331	2014-07-30 20:24:02.959331	\N	\N	\N	\N	\N	\N	\N	\N
2484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-30 20:24:08.261819	2014-07-30 20:24:08.261819	\N	\N	\N	\N	\N	\N	\N	\N
2487	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:17:02.007035	2014-07-31 12:17:02.007035	\N	\N	\N	\N	\N	\N	\N	\N
2516	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:45:22.262009	2014-07-31 12:45:22.262009	\N	\N	\N	\N	\N	\N	\N	\N
2517	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:45:34.851024	2014-07-31 12:45:34.851024	\N	\N	\N	\N	\N	\N	\N	\N
2519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:50:16.146972	2014-07-31 12:50:16.146972	\N	\N	\N	\N	\N	\N	\N	\N
2521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:50:44.300716	2014-07-31 12:50:44.300716	\N	\N	\N	\N	\N	\N	\N	\N
2523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:51:19.583211	2014-07-31 12:51:19.583211	\N	\N	\N	\N	\N	\N	\N	\N
2525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:51:59.215906	2014-07-31 12:51:59.215906	\N	\N	\N	\N	\N	\N	\N	\N
2527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 12:52:18.96704	2014-07-31 12:52:18.96704	\N	\N	\N	\N	\N	\N	\N	\N
2529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 13:55:49.385933	2014-07-31 13:55:49.385933	\N	\N	\N	\N	\N	\N	\N	\N
2531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 13:56:23.834646	2014-07-31 13:56:23.834646	\N	\N	\N	\N	\N	\N	\N	\N
2533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 14:02:46.436521	2014-07-31 14:02:46.436521	\N	\N	\N	\N	\N	\N	\N	\N
2534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 14:03:51.012334	2014-07-31 14:03:51.012334	\N	\N	\N	\N	\N	\N	\N	\N
2535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 14:13:32.677789	2014-07-31 14:13:32.677789	\N	\N	\N	\N	\N	\N	\N	\N
2536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 17:45:34.512487	2014-07-31 17:45:34.512487	\N	\N	\N	\N	\N	\N	\N	\N
2537	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 17:55:07.661987	2014-07-31 17:55:07.661987	\N	\N	\N	\N	\N	\N	\N	\N
2538	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 18:10:44.694655	2014-07-31 18:10:44.694655	\N	\N	\N	\N	\N	\N	\N	\N
2539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 18:11:55.629613	2014-07-31 18:11:55.633942	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2540	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:10:47.79668	2014-07-31 23:10:47.809331	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2541	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:31:25.708425	2014-07-31 23:31:25.712763	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:32:05.999171	2014-07-31 23:32:06.002326	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:33:19.949773	2014-07-31 23:33:19.955325	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:33:29.996614	2014-07-31 23:33:30.001336	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2545	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:34:10.050332	2014-07-31 23:34:10.05313	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:36:25.109523	2014-07-31 23:36:25.114591	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:36:50.13531	2014-07-31 23:36:50.139639	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:38:01.985713	2014-07-31 23:38:01.992612	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2549	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:38:44.226583	2014-07-31 23:38:44.230235	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:39:11.679892	2014-07-31 23:39:11.683586	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2551	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:39:58.547109	2014-07-31 23:39:58.553244	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:40:11.728072	2014-07-31 23:40:11.731058	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:40:34.139866	2014-07-31 23:40:34.145597	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:41:02.646626	2014-07-31 23:41:02.651067	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:42:14.519214	2014-07-31 23:42:14.524826	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:42:46.303008	2014-07-31 23:42:46.309051	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-31 23:43:06.612031	2014-07-31 23:43:06.616912	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-01 01:33:33.891341	2014-08-01 01:33:33.90285	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-01 01:33:34.100007	2014-08-01 01:33:34.102875	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2560	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-01 15:08:19.190537	2014-08-01 15:08:19.190537	\N	\N	\N	\N	\N	\N	\N	\N
2561	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-01 15:29:19.574006	2014-08-01 15:29:19.574006	\N	\N	\N	\N	\N	\N	\N	\N
2562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-01 15:30:29.80339	2014-08-01 15:30:29.80339	\N	\N	\N	\N	\N	\N	\N	\N
2563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-01 22:33:50.474432	2014-08-01 22:33:50.474432	\N	\N	\N	\N	\N	\N	\N	\N
2564	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-01 22:39:58.557289	2014-08-01 22:39:58.564203	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2565	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-01 22:41:11.148045	2014-08-01 22:41:11.195539	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2566	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-01 22:43:13.716408	2014-08-01 22:43:13.726347	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-03 18:22:43.770995	2014-08-03 18:22:43.801652	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2568	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-03 18:22:44.061671	2014-08-03 18:22:44.064386	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-08-25 19:08:31.044793	2014-08-25 19:08:31.063348	\N	\N	\N	\N	\N	\N	\N	America/Santiago
2570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:30:19.212688	2014-09-18 16:30:19.231183	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2571	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:32:04.968838	2014-09-18 16:32:04.972297	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:32:16.35618	2014-09-18 16:32:16.359283	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:32:26.612765	2014-09-18 16:32:26.617466	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:32:35.249323	2014-09-18 16:32:35.253777	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:32:45.971293	2014-09-18 16:32:46.027334	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:35:29.159296	2014-09-18 16:35:29.162967	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:35:45.403608	2014-09-18 16:35:45.407327	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:35:54.224666	2014-09-18 16:35:54.22827	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2579	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:36:48.697684	2014-09-18 16:36:48.75907	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2580	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:36:54.922018	2014-09-18 16:36:54.925474	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:36:59.794249	2014-09-18 16:36:59.79968	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:37:23.284622	2014-09-18 16:37:23.287441	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:37:33.079512	2014-09-18 16:37:33.082253	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:37:43.927557	2014-09-18 16:37:43.931318	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2585	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-18 16:38:20.342777	2014-09-18 16:38:20.347843	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2586	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-19 04:20:49.903966	2014-09-19 04:20:49.986162	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-19 04:32:46.720224	2014-09-19 04:32:46.720224	\N	\N	\N	\N	\N	\N	\N	\N
2588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-19 04:33:01.851914	2014-09-19 04:33:01.859445	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-19 04:33:15.47256	2014-09-19 04:33:15.47256	\N	\N	\N	\N	\N	\N	\N	\N
2590	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-19 04:33:28.68519	2014-09-19 04:33:28.690297	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2591	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:14:57.173555	2014-09-25 05:14:57.190998	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2592	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:15:53.914222	2014-09-25 05:15:53.922513	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2593	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:20:13.765304	2014-09-25 05:20:13.770725	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2594	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:20:22.22172	2014-09-25 05:20:22.226428	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:20:29.791174	2014-09-25 05:20:29.795494	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:20:37.967594	2014-09-25 05:20:37.970546	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:20:45.671259	2014-09-25 05:20:45.676229	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:20:57.043905	2014-09-25 05:20:57.048183	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2599	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:21:06.67018	2014-09-25 05:21:06.674785	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:21:10.564745	2014-09-25 05:21:10.567564	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2601	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:21:17.92645	2014-09-25 05:21:17.929315	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:21:23.813809	2014-09-25 05:21:23.816734	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:21:51.204941	2014-09-25 05:21:51.27245	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2604	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:23:30.387369	2014-09-25 05:23:30.390731	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:24:30.383802	2014-09-25 05:24:30.389632	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:25:56.540054	2014-09-25 05:25:56.546465	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2607	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:26:11.496868	2014-09-25 05:26:11.50939	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:26:50.59214	2014-09-25 05:26:50.596092	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2609	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:27:11.530556	2014-09-25 05:27:11.536179	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2610	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:27:27.186931	2014-09-25 05:27:27.242363	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:27:42.60884	2014-09-25 05:27:42.613908	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2612	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:27:55.835707	2014-09-25 05:27:55.84076	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2613	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:28:07.415218	2014-09-25 05:28:07.417922	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:28:14.520935	2014-09-25 05:28:14.525544	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2615	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:29:15.160374	2014-09-25 05:29:15.165402	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:29:24.363994	2014-09-25 05:29:24.367369	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2617	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:29:30.041574	2014-09-25 05:29:30.044496	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2618	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:29:38.522897	2014-09-25 05:29:38.525774	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:29:45.740361	2014-09-25 05:29:45.743826	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2620	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:29:59.223611	2014-09-25 05:29:59.228037	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2621	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:30:15.050903	2014-09-25 05:30:15.056942	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2622	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:39:07.046779	2014-09-25 05:39:07.052783	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:39:17.308263	2014-09-25 05:39:17.311909	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2624	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:39:32.189115	2014-09-25 05:39:32.192181	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:40:17.503731	2014-09-25 05:40:17.507427	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:41:29.149143	2014-09-25 05:41:29.152738	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:42:04.989063	2014-09-25 05:42:04.992609	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:44:43.252372	2014-09-25 05:44:43.258337	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 05:45:15.962598	2014-09-25 05:45:15.96787	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2630	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:21:25.534384	2014-09-25 06:21:25.540794	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:23:26.417906	2014-09-25 06:23:26.422591	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2632	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:23:34.184361	2014-09-25 06:23:34.271081	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2633	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:23:47.776491	2014-09-25 06:23:47.779862	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:24:20.905416	2014-09-25 06:24:20.910646	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2635	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:24:50.456241	2014-09-25 06:24:50.45918	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:24:58.256367	2014-09-25 06:24:58.259161	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:25:05.741027	2014-09-25 06:25:05.743771	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:25:17.617867	2014-09-25 06:25:17.621285	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:25:24.765209	2014-09-25 06:25:24.768781	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:25:31.221119	2014-09-25 06:25:31.223725	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2641	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:25:41.612475	2014-09-25 06:25:41.61522	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:25:53.765627	2014-09-25 06:25:53.768515	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:26:03.311393	2014-09-25 06:26:03.315834	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2644	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:26:11.85188	2014-09-25 06:26:11.855263	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:26:20.303503	2014-09-25 06:26:20.306171	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2646	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:26:36.374522	2014-09-25 06:26:36.377194	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:26:50.229153	2014-09-25 06:26:50.231932	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:27:20.023998	2014-09-25 06:27:20.027406	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:27:31.505813	2014-09-25 06:27:31.508505	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:28:04.641652	2014-09-25 06:28:04.64517	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:28:09.788223	2014-09-25 06:28:09.791356	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2652	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:28:28.324683	2014-09-25 06:28:28.328239	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:28:32.937717	2014-09-25 06:28:32.942294	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:28:55.314529	2014-09-25 06:28:55.317719	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2655	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:29:15.099003	2014-09-25 06:29:15.102158	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:30:40.652528	2014-09-25 06:30:40.658619	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2657	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:30:56.96617	2014-09-25 06:30:56.968959	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2658	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:31:07.296212	2014-09-25 06:31:07.299077	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:31:37.96191	2014-09-25 06:31:37.966929	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:31:51.236033	2014-09-25 06:31:51.238735	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:32:31.201995	2014-09-25 06:32:31.20537	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:34:22.264495	2014-09-25 06:34:22.268669	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:36:00.515914	2014-09-25 06:36:00.521256	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:48:41.023897	2014-09-25 06:48:41.02911	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2665	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:48:43.859821	2014-09-25 06:48:43.863686	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 06:49:06.492899	2014-09-25 06:49:06.498232	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2667	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 07:23:48.960751	2014-09-25 07:23:48.966258	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 15:51:10.529806	2014-09-25 15:51:10.535782	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 15:51:21.428062	2014-09-25 15:51:21.43349	\N	\N	\N	\N	\N	\N	\N	America/New_York
2670	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 15:51:27.917719	2014-09-25 15:51:27.920822	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 15:51:49.19361	2014-09-25 15:51:49.198715	\N	\N	\N	\N	\N	\N	\N	America/New_York
2672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 15:55:58.979401	2014-09-25 15:55:58.984185	\N	\N	\N	\N	\N	\N	\N	America/New_York
2673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 15:56:36.756379	2014-09-25 15:56:36.761987	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2674	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 15:58:19.123819	2014-09-25 15:58:19.130658	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:09:23.441752	2014-09-25 16:09:23.500933	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:10:04.887045	2014-09-25 16:10:04.936223	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:10:21.692076	2014-09-25 16:10:21.695286	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2678	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:10:46.280604	2014-09-25 16:10:46.283751	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2679	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:10:48.644105	2014-09-25 16:10:48.65421	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:11:35.786486	2014-09-25 16:11:35.794316	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2681	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:11:36.880075	2014-09-25 16:11:36.884844	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2682	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:14:00.657039	2014-09-25 16:14:00.662769	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:14:02.880641	2014-09-25 16:14:02.884063	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2684	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:14:21.838973	2014-09-25 16:14:21.844438	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:14:23.357936	2014-09-25 16:14:23.362332	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2686	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:14:39.220655	2014-09-25 16:14:39.224864	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:15:22.242018	2014-09-25 16:15:22.24813	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2688	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:16:27.631807	2014-09-25 16:16:27.639733	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:16:39.851958	2014-09-25 16:16:39.857185	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:16:59.414492	2014-09-25 16:16:59.421459	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2691	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:17:07.36716	2014-09-25 16:17:07.37177	\N	\N	\N	\N	\N	\N	\N	America/New_York
2692	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:19:49.119978	2014-09-25 16:19:49.126805	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:20:32.920989	2014-09-25 16:20:32.926385	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:21:01.194997	2014-09-25 16:21:01.19788	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:21:09.482285	2014-09-25 16:21:09.4872	\N	\N	\N	\N	\N	\N	\N	America/New_York
2696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:21:16.199773	2014-09-25 16:21:16.204448	\N	\N	\N	\N	\N	\N	\N	America/New_York
2697	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:21:19.320333	2014-09-25 16:21:19.32562	\N	\N	\N	\N	\N	\N	\N	America/New_York
2698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:21:24.885224	2014-09-25 16:21:24.891038	\N	\N	\N	\N	\N	\N	\N	America/New_York
2699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:21:33.214555	2014-09-25 16:21:33.219565	\N	\N	\N	\N	\N	\N	\N	America/New_York
2700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:21:37.398097	2014-09-25 16:21:37.402872	\N	\N	\N	\N	\N	\N	\N	America/New_York
2701	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:22:25.740278	2014-09-25 16:22:25.746309	\N	\N	\N	\N	\N	\N	\N	America/New_York
2702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 16:26:43.691934	2014-09-25 16:26:43.697963	\N	\N	\N	\N	\N	\N	\N	America/New_York
2703	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:34:35.219798	2014-09-25 19:34:35.225279	\N	\N	\N	\N	\N	\N	\N	America/New_York
2704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:35:04.333507	2014-09-25 19:35:04.338734	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2705	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:43:31.498708	2014-09-25 19:43:31.506617	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:44:20.890699	2014-09-25 19:44:20.896117	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:45:09.871588	2014-09-25 19:45:09.877187	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:49:39.379508	2014-09-25 19:49:39.385727	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:49:46.60047	2014-09-25 19:49:46.634985	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:49:59.113882	2014-09-25 19:49:59.117254	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:50:10.964914	2014-09-25 19:50:10.968832	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:51:19.282671	2014-09-25 19:51:19.287551	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:51:31.970697	2014-09-25 19:51:31.974035	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:51:44.08646	2014-09-25 19:51:44.089335	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:51:59.16395	2014-09-25 19:51:59.168243	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2716	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:52:46.538721	2014-09-25 19:52:46.544373	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2717	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:54:50.986351	2014-09-25 19:54:50.992693	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:57:40.284373	2014-09-25 19:57:40.289839	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:59:09.196006	2014-09-25 19:59:09.201624	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 19:59:23.97327	2014-09-25 19:59:23.978256	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:01:10.038346	2014-09-25 20:01:10.043145	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:01:27.659644	2014-09-25 20:01:27.663067	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:01:58.795935	2014-09-25 20:01:58.798679	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:02:43.648148	2014-09-25 20:02:43.653949	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:02:53.158805	2014-09-25 20:02:53.162908	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:03:02.954983	2014-09-25 20:03:02.959381	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:03:19.201708	2014-09-25 20:03:19.205244	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:03:39.448991	2014-09-25 20:03:39.453423	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:09:44.490601	2014-09-25 20:09:44.495431	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2730	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:10:47.123614	2014-09-25 20:10:47.130077	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:12:05.901541	2014-09-25 20:12:05.905372	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:12:09.716486	2014-09-25 20:12:09.722255	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:12:27.206271	2014-09-25 20:12:27.209214	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:12:38.272213	2014-09-25 20:12:38.276508	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:12:43.686202	2014-09-25 20:12:43.690752	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:13:17.79256	2014-09-25 20:13:17.796256	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:13:37.564703	2014-09-25 20:13:37.567736	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2738	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:14:11.162849	2014-09-25 20:14:11.167701	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:14:17.196123	2014-09-25 20:14:17.199729	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2740	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:16:16.928344	2014-09-25 20:16:16.933466	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:17:11.86146	2014-09-25 20:17:11.865893	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:17:25.683496	2014-09-25 20:17:25.686466	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:17:36.839359	2014-09-25 20:17:36.844004	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:18:02.987637	2014-09-25 20:18:02.99161	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:18:21.8574	2014-09-25 20:18:21.861346	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:18:28.47776	2014-09-25 20:18:28.482703	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:19:11.898471	2014-09-25 20:19:11.902368	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:19:33.319572	2014-09-25 20:19:33.324614	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:20:25.892972	2014-09-25 20:20:25.898569	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:20:41.78914	2014-09-25 20:20:41.794019	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:21:04.722887	2014-09-25 20:21:04.727753	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:21:09.291325	2014-09-25 20:21:09.297402	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:21:20.173147	2014-09-25 20:21:20.177402	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:24:15.801982	2014-09-25 20:24:15.806298	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2755	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:24:23.404377	2014-09-25 20:24:23.409224	\N	\N	\N	\N	\N	\N	\N	America/New_York
2756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:27:35.647189	2014-09-25 20:27:35.652956	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2757	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:29:06.37221	2014-09-25 20:29:06.378053	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:33:51.471276	2014-09-25 20:33:51.476771	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:35:25.418351	2014-09-25 20:35:25.424196	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 20:36:57.104448	2014-09-25 20:36:57.196558	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 21:02:13.469169	2014-09-25 21:02:13.474289	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 21:03:13.479068	2014-09-25 21:03:13.484733	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 21:05:40.937823	2014-09-25 21:05:40.943541	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 21:05:54.74117	2014-09-25 21:05:54.744134	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 21:05:59.418042	2014-09-25 21:05:59.423348	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 21:07:58.384072	2014-09-25 21:07:58.389995	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 22:59:12.026651	2014-09-25 22:59:12.031312	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:02:14.35717	2014-09-25 23:02:14.362997	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:02:19.416688	2014-09-25 23:02:19.421128	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2770	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:02:34.795923	2014-09-25 23:02:34.798872	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:03:05.650579	2014-09-25 23:03:05.653641	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:03:06.473052	2014-09-25 23:03:06.476201	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:04:14.944236	2014-09-25 23:04:14.950084	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:04:41.999925	2014-09-25 23:04:42.002896	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:05:20.903184	2014-09-25 23:05:20.907237	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:05:44.348725	2014-09-25 23:05:44.351915	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:05:54.96601	2014-09-25 23:05:54.970989	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:07:16.642313	2014-09-25 23:07:16.64728	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:08:03.836303	2014-09-25 23:08:03.840747	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:15:35.546253	2014-09-25 23:15:35.551269	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:15:42.314667	2014-09-25 23:15:42.319794	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2782	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:21:11.831108	2014-09-25 23:21:11.834694	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:22:37.291328	2014-09-25 23:22:37.296517	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:22:46.296905	2014-09-25 23:22:46.300164	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2785	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:22:53.091586	2014-09-25 23:22:53.096232	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:23:21.964586	2014-09-25 23:23:21.968002	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:23:40.690606	2014-09-25 23:23:40.693277	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:42:14.151526	2014-09-25 23:42:14.156384	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2789	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:42:53.08309	2014-09-25 23:42:53.08589	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2790	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:43:23.474443	2014-09-25 23:43:23.477498	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:43:44.945188	2014-09-25 23:43:44.949334	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:44:26.625581	2014-09-25 23:44:26.628383	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2793	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:46:10.874396	2014-09-25 23:46:10.879298	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:46:22.569472	2014-09-25 23:46:22.574105	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2795	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:46:40.516655	2014-09-25 23:46:40.520643	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:47:11.132509	2014-09-25 23:47:11.137187	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:47:34.572695	2014-09-25 23:47:34.575829	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:47:42.921135	2014-09-25 23:47:42.924122	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:48:59.545524	2014-09-25 23:48:59.548583	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:49:21.675447	2014-09-25 23:49:21.933729	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:49:53.137854	2014-09-25 23:49:53.141964	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:49:56.713973	2014-09-25 23:49:56.718495	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2803	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:58:10.664297	2014-09-25 23:58:10.668243	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:58:31.18068	2014-09-25 23:58:31.185917	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2805	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:58:55.201948	2014-09-25 23:58:55.204815	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2806	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:59:05.175264	2014-09-25 23:59:05.179526	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2807	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:59:26.475719	2014-09-25 23:59:26.480439	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-25 23:59:47.028524	2014-09-25 23:59:47.032322	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2809	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:00:22.023732	2014-09-26 00:00:22.028995	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2810	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:00:44.688905	2014-09-26 00:00:44.691621	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2811	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:00:49.058437	2014-09-26 00:00:49.061255	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:01:00.993045	2014-09-26 00:01:00.995778	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:08:12.03429	2014-09-26 00:08:12.037606	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2814	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:08:18.147536	2014-09-26 00:08:18.152373	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:08:28.848711	2014-09-26 00:08:28.852738	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:09:05.904531	2014-09-26 00:09:05.908761	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:11:30.523714	2014-09-26 00:11:30.528777	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:12:27.997388	2014-09-26 00:12:28.001077	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:13:37.392624	2014-09-26 00:13:37.398028	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2820	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:13:46.20456	2014-09-26 00:13:46.208133	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2821	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:14:30.172949	2014-09-26 00:14:30.177517	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2822	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:15:13.026674	2014-09-26 00:15:13.029901	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:16:19.255699	2014-09-26 00:16:19.260706	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:16:26.699976	2014-09-26 00:16:26.703961	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:16:34.165053	2014-09-26 00:16:34.170116	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:16:42.354124	2014-09-26 00:16:42.358962	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2827	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:16:46.098974	2014-09-26 00:16:46.103743	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:17:44.419342	2014-09-26 00:17:44.424449	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:17:49.371181	2014-09-26 00:17:49.37486	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2830	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:17:58.681981	2014-09-26 00:17:58.686722	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:18:11.731724	2014-09-26 00:18:11.736671	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2832	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:18:21.600234	2014-09-26 00:18:21.604371	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:18:30.25212	2014-09-26 00:18:30.255214	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2834	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:18:57.251944	2014-09-26 00:18:57.255291	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2835	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:19:49.672592	2014-09-26 00:19:49.675787	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:19:53.731109	2014-09-26 00:19:53.735645	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2837	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:20:06.154437	2014-09-26 00:20:06.157222	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2838	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:20:19.972977	2014-09-26 00:20:19.978198	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:20:40.909745	2014-09-26 00:20:40.912545	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:21:01.89954	2014-09-26 00:21:01.902378	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:21:16.188879	2014-09-26 00:21:16.193656	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:21:50.931645	2014-09-26 00:21:50.935401	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:22:48.371586	2014-09-26 00:22:48.374424	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:22:55.3216	2014-09-26 00:22:55.326376	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:23:08.90453	2014-09-26 00:23:08.909853	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:23:30.061624	2014-09-26 00:23:30.066152	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:24:10.553963	2014-09-26 00:24:10.559356	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:25:07.26371	2014-09-26 00:25:07.268774	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:25:17.883715	2014-09-26 00:25:17.888275	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:25:20.34057	2014-09-26 00:25:20.344329	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:25:45.100013	2014-09-26 00:25:45.1038	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:26:22.834841	2014-09-26 00:26:22.838017	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:26:26.946744	2014-09-26 00:26:26.951406	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2854	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:26:30.685426	2014-09-26 00:26:30.688159	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:26:32.762119	2014-09-26 00:26:32.764653	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:27:18.804025	2014-09-26 00:27:18.807951	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2857	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:28:27.927182	2014-09-26 00:28:27.932739	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:28:40.820214	2014-09-26 00:28:40.824637	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:29:28.909214	2014-09-26 00:29:28.913294	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2860	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:30:19.17217	2014-09-26 00:30:19.175754	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:31:26.215821	2014-09-26 00:31:26.220118	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:31:42.515201	2014-09-26 00:31:42.519118	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2863	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:33:16.473371	2014-09-26 00:33:16.478376	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:33:30.501518	2014-09-26 00:33:30.504621	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2865	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:33:37.46478	2014-09-26 00:33:37.469215	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:34:14.30179	2014-09-26 00:34:14.307322	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:35:28.515229	2014-09-26 00:35:28.5199	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2868	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:35:43.948106	2014-09-26 00:35:43.952648	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:36:13.804749	2014-09-26 00:36:13.809763	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:40:47.43498	2014-09-26 00:40:47.440535	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:40:59.35295	2014-09-26 00:40:59.357731	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:41:49.19023	2014-09-26 00:41:49.195048	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:42:58.595397	2014-09-26 00:42:58.600022	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2874	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:43:10.870678	2014-09-26 00:43:10.874554	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2875	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:43:37.632697	2014-09-26 00:43:37.63581	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2876	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:44:15.178411	2014-09-26 00:44:15.181721	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2877	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:46:55.991298	2014-09-26 00:46:55.99633	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:47:51.717296	2014-09-26 00:47:51.723244	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:49:52.874427	2014-09-26 00:49:52.879708	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2880	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:49:57.057529	2014-09-26 00:49:57.061749	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2881	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:50:16.756961	2014-09-26 00:50:16.761584	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:50:58.067436	2014-09-26 00:50:58.070509	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:51:24.657206	2014-09-26 00:51:24.66106	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2884	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:51:45.028027	2014-09-26 00:51:45.032808	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2885	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:51:58.312513	2014-09-26 00:51:58.316926	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:52:14.032	2014-09-26 00:52:14.036503	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2887	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:52:28.609921	2014-09-26 00:52:28.613422	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:52:45.79072	2014-09-26 00:52:45.795274	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:52:52.808218	2014-09-26 00:52:52.812664	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2890	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:53:30.692366	2014-09-26 00:53:30.697238	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2891	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:53:41.106227	2014-09-26 00:53:41.108876	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2892	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:55:42.816161	2014-09-26 00:55:42.821208	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2893	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:56:04.036395	2014-09-26 00:56:04.040203	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:56:18.5391	2014-09-26 00:56:18.544458	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2895	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:57:49.830617	2014-09-26 00:57:49.835591	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2896	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:58:27.141818	2014-09-26 00:58:27.145261	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:58:52.605724	2014-09-26 00:58:52.609723	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 00:59:35.225499	2014-09-26 00:59:35.228959	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:00:12.05175	2014-09-26 01:00:12.057507	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2900	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:04:28.789129	2014-09-26 01:04:28.79471	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2901	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:05:14.824884	2014-09-26 01:05:14.829381	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2902	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:05:39.652915	2014-09-26 01:05:39.657178	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2903	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:05:46.026499	2014-09-26 01:05:46.031029	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2904	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:05:50.5803	2014-09-26 01:05:50.585531	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:18:22.061888	2014-09-26 01:18:22.066619	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:31:53.492514	2014-09-26 01:31:53.498357	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2907	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:32:35.433713	2014-09-26 01:32:35.4386	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2908	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:32:59.329003	2014-09-26 01:32:59.333372	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:33:17.968366	2014-09-26 01:33:17.971633	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2910	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:39:06.181661	2014-09-26 01:39:06.186016	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2911	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 01:39:09.200065	2014-09-26 01:39:09.203324	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:02:32.686453	2014-09-26 02:02:32.691577	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2913	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:44:51.893871	2014-09-26 02:44:51.899513	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:46:24.591482	2014-09-26 02:46:24.594731	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2915	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:46:31.98057	2014-09-26 02:46:31.983317	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:46:47.517625	2014-09-26 02:46:47.521765	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:47:34.217499	2014-09-26 02:47:34.2208	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:48:09.259268	2014-09-26 02:48:09.265285	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:51:29.965611	2014-09-26 02:51:29.971765	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:54:35.255843	2014-09-26 02:54:35.259366	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2921	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:55:24.342064	2014-09-26 02:55:24.345685	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2922	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:55:26.488203	2014-09-26 02:55:26.492344	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:55:30.583896	2014-09-26 02:55:30.586602	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:55:35.434059	2014-09-26 02:55:35.437609	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:55:47.285151	2014-09-26 02:55:47.32915	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:56:37.217503	2014-09-26 02:56:37.221629	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2927	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:57:07.225517	2014-09-26 02:57:07.275194	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2928	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:57:14.230225	2014-09-26 02:57:14.232912	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 02:58:26.447175	2014-09-26 02:58:26.501833	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2930	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:00:14.109433	2014-09-26 03:00:14.115619	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:01:23.160595	2014-09-26 03:01:23.164019	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2932	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:01:33.068879	2014-09-26 03:01:33.071938	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2933	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:02:04.323355	2014-09-26 03:02:04.328542	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:02:20.249065	2014-09-26 03:02:20.251935	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2935	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:02:41.895249	2014-09-26 03:02:41.898379	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2936	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:02:47.716386	2014-09-26 03:02:47.721366	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2937	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:02:53.81895	2014-09-26 03:02:53.821797	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2938	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:03:15.977303	2014-09-26 03:03:15.981435	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:03:31.024471	2014-09-26 03:03:31.02917	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2940	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:03:41.038387	2014-09-26 03:03:41.042455	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:04:00.189555	2014-09-26 03:04:00.193215	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:04:15.512386	2014-09-26 03:04:15.515361	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2943	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:04:31.261589	2014-09-26 03:04:31.264549	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:04:41.911615	2014-09-26 03:04:41.916187	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:04:56.749981	2014-09-26 03:04:56.753537	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2946	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:05:32.089413	2014-09-26 03:05:32.092477	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:05:54.424354	2014-09-26 03:05:54.427887	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2948	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:06:08.984679	2014-09-26 03:06:08.987456	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:06:46.998846	2014-09-26 03:06:47.004161	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2950	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:07:30.420793	2014-09-26 03:07:30.42473	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:07:42.030229	2014-09-26 03:07:42.034374	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2952	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:09:12.390959	2014-09-26 03:09:12.395165	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2953	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:09:30.945923	2014-09-26 03:09:30.948741	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:09:52.787417	2014-09-26 03:09:52.791209	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:10:30.378912	2014-09-26 03:10:30.381951	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:10:47.84887	2014-09-26 03:10:47.853076	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:11:39.099517	2014-09-26 03:11:39.103726	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:11:45.22601	2014-09-26 03:11:45.230858	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:11:53.904416	2014-09-26 03:11:53.908173	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:12:04.815539	2014-09-26 03:12:04.818367	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:14:00.584676	2014-09-26 03:14:00.590433	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:16:13.772837	2014-09-26 03:16:13.778791	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:24:29.219019	2014-09-26 03:24:29.22272	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:24:41.145946	2014-09-26 03:24:41.194558	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:25:02.89069	2014-09-26 03:25:02.894855	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:25:39.622747	2014-09-26 03:25:39.627448	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:25:49.199423	2014-09-26 03:25:49.2034	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:26:03.809745	2014-09-26 03:26:03.812425	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:27:04.005888	2014-09-26 03:27:04.011214	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:27:27.417866	2014-09-26 03:27:27.421272	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:27:27.986735	2014-09-26 03:27:27.991577	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:27:37.991106	2014-09-26 03:27:37.993934	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:28:15.938505	2014-09-26 03:28:15.944119	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:28:26.616331	2014-09-26 03:28:26.620505	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:28:46.883285	2014-09-26 03:28:46.889353	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:28:51.060026	2014-09-26 03:28:51.064655	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:42:02.406617	2014-09-26 03:42:02.411952	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:54:49.796993	2014-09-26 03:54:49.801692	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:55:19.645224	2014-09-26 03:55:19.648283	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 03:56:28.888774	2014-09-26 03:56:28.893296	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:00:14.768357	2014-09-26 04:00:14.77383	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:00:39.483576	2014-09-26 04:00:39.486672	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:00:55.315418	2014-09-26 04:00:55.318897	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:01:18.879038	2014-09-26 04:01:18.882015	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:01:35.134353	2014-09-26 04:01:35.137439	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:01:38.596537	2014-09-26 04:01:38.599239	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:01:54.748079	2014-09-26 04:01:54.753479	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:02:10.225742	2014-09-26 04:02:10.228836	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:02:15.963858	2014-09-26 04:02:15.966676	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:02:21.463478	2014-09-26 04:02:21.467477	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:02:26.954386	2014-09-26 04:02:26.957562	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:02:31.125544	2014-09-26 04:02:31.128584	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:02:52.786084	2014-09-26 04:02:52.790386	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:03:02.390893	2014-09-26 04:03:02.395703	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:03:18.714971	2014-09-26 04:03:18.719618	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:03:37.9984	2014-09-26 04:03:38.003164	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:03:48.027031	2014-09-26 04:03:48.031879	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:03:57.516207	2014-09-26 04:03:57.519226	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
2999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:04:07.034799	2014-09-26 04:04:07.038472	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:04:23.819386	2014-09-26 04:04:23.823169	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:04:34.90093	2014-09-26 04:04:34.905256	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:04:40.501992	2014-09-26 04:04:40.506119	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:04:47.131156	2014-09-26 04:04:47.135427	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:04:54.510804	2014-09-26 04:04:54.515819	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:05:43.789765	2014-09-26 04:05:43.792372	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:05:48.230588	2014-09-26 04:05:48.234207	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:06:01.507384	2014-09-26 04:06:01.510842	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:06:05.903189	2014-09-26 04:06:05.90729	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:06:13.477723	2014-09-26 04:06:13.482241	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:06:29.103798	2014-09-26 04:06:29.108377	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:06:39.295516	2014-09-26 04:06:39.298454	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:06:42.861556	2014-09-26 04:06:42.865998	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:07:08.919993	2014-09-26 04:07:08.923627	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:07:26.657955	2014-09-26 04:07:26.661466	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:09:12.880279	2014-09-26 04:09:12.884394	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:14:06.417291	2014-09-26 04:14:06.42273	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 04:33:47.736344	2014-09-26 04:33:47.746945	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 05:00:06.447071	2014-09-26 05:00:06.453211	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 05:15:37.583719	2014-09-26 05:15:37.589786	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3020	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 05:15:57.0944	2014-09-26 05:15:57.097512	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 06:17:40.956592	2014-09-26 06:17:40.961914	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:47:09.993153	2014-09-26 07:47:09.99641	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3023	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:47:50.674357	2014-09-26 07:47:50.677581	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:48:21.031381	2014-09-26 07:48:21.03472	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3025	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:48:26.533754	2014-09-26 07:48:26.537504	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:49:49.142842	2014-09-26 07:49:49.148915	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:50:18.987496	2014-09-26 07:50:18.992401	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3028	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:50:35.457702	2014-09-26 07:50:35.460682	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:51:16.684488	2014-09-26 07:51:16.687395	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3030	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:52:07.985986	2014-09-26 07:52:07.990299	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:53:05.183116	2014-09-26 07:53:05.186138	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:53:21.111247	2014-09-26 07:53:21.116823	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:53:29.963048	2014-09-26 07:53:29.966543	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:53:37.610583	2014-09-26 07:53:37.613635	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:53:45.980443	2014-09-26 07:53:45.984665	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:54:05.511733	2014-09-26 07:54:05.514792	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:54:17.562478	2014-09-26 07:54:17.56564	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:54:32.982329	2014-09-26 07:54:32.98531	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:54:58.690728	2014-09-26 07:54:58.695706	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3040	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:55:20.705173	2014-09-26 07:55:20.708103	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:55:35.366668	2014-09-26 07:55:35.370783	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:56:21.494201	2014-09-26 07:56:21.50366	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:56:33.481886	2014-09-26 07:56:33.48521	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:56:39.751064	2014-09-26 07:56:39.754481	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:56:45.418086	2014-09-26 07:56:45.422895	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3046	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:58:53.163293	2014-09-26 07:58:53.169065	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:59:13.873545	2014-09-26 07:59:13.876172	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 07:59:50.870693	2014-09-26 07:59:50.87576	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3049	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:00:08.313504	2014-09-26 08:00:08.316218	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:00:30.360072	2014-09-26 08:00:30.365783	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:00:42.998864	2014-09-26 08:00:43.001913	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3052	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:03:39.973414	2014-09-26 08:03:39.979551	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:03:46.136927	2014-09-26 08:03:46.141552	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:04:25.508563	2014-09-26 08:04:25.511693	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3055	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:04:35.457727	2014-09-26 08:04:35.460562	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3056	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:08:11.506198	2014-09-26 08:08:11.510313	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:08:40.496264	2014-09-26 08:08:40.501287	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3058	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:09:37.909854	2014-09-26 08:09:37.915073	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:09:58.840848	2014-09-26 08:09:58.845857	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:10:15.537848	2014-09-26 08:10:15.54125	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:10:50.447025	2014-09-26 08:10:50.450196	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:11:25.622646	2014-09-26 08:11:25.625743	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:12:53.060004	2014-09-26 08:12:53.064709	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3064	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:13:09.521027	2014-09-26 08:13:09.524601	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:13:34.752055	2014-09-26 08:13:34.757456	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:13:46.392998	2014-09-26 08:13:46.396072	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:13:58.112174	2014-09-26 08:13:58.11501	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:14:05.216073	2014-09-26 08:14:05.219345	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:14:14.159714	2014-09-26 08:14:14.16339	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:14:29.067058	2014-09-26 08:14:29.072081	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:14:35.375109	2014-09-26 08:14:35.379298	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:15:39.506957	2014-09-26 08:15:39.512705	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3073	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:16:11.090601	2014-09-26 08:16:11.094959	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:16:24.22891	2014-09-26 08:16:24.233584	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:23:18.730197	2014-09-26 08:23:18.735518	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:24:44.806356	2014-09-26 08:24:44.812825	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:25:15.296871	2014-09-26 08:25:15.300278	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:25:48.984236	2014-09-26 08:25:48.987331	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:26:28.959119	2014-09-26 08:26:28.964934	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:26:48.0233	2014-09-26 08:26:48.028194	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:27:43.532298	2014-09-26 08:27:43.535703	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3082	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:28:20.747739	2014-09-26 08:28:20.752583	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:28:43.054595	2014-09-26 08:28:43.059908	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:29:55.630924	2014-09-26 08:29:55.635832	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:30:23.767093	2014-09-26 08:30:23.772138	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:31:49.391232	2014-09-26 08:31:49.396182	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:32:28.488965	2014-09-26 08:32:28.493972	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:32:44.198482	2014-09-26 08:32:44.203048	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:33:05.495057	2014-09-26 08:33:05.497866	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:33:52.273163	2014-09-26 08:33:52.276844	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:34:07.57485	2014-09-26 08:34:07.578419	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:35:30.871974	2014-09-26 08:35:30.877536	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:36:36.047589	2014-09-26 08:36:36.05263	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:37:36.197824	2014-09-26 08:37:36.201142	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:38:57.9977	2014-09-26 08:38:58.003142	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:39:14.676297	2014-09-26 08:39:14.679212	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3097	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:39:25.374045	2014-09-26 08:39:25.378566	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:39:46.388047	2014-09-26 08:39:46.392782	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3099	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:40:34.211151	2014-09-26 08:40:34.214291	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:40:39.149776	2014-09-26 08:40:39.15452	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:41:12.904631	2014-09-26 08:41:12.907525	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:41:30.138127	2014-09-26 08:41:30.141162	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:42:12.500578	2014-09-26 08:42:12.503747	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:43:05.36293	2014-09-26 08:43:05.366758	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:43:42.810073	2014-09-26 08:43:42.813996	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:44:04.53185	2014-09-26 08:44:04.536447	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:44:21.630712	2014-09-26 08:44:21.633834	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:46:33.542137	2014-09-26 08:46:33.54571	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:47:55.358568	2014-09-26 08:47:55.363554	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 08:57:03.980253	2014-09-26 08:57:03.986293	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:20:24.775402	2014-09-26 19:20:24.778881	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:21:53.809585	2014-09-26 19:21:53.812907	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:22:55.096969	2014-09-26 19:22:55.100088	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:23:02.239029	2014-09-26 19:23:02.243778	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:23:08.417944	2014-09-26 19:23:08.4236	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3116	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:23:39.310225	2014-09-26 19:23:39.314969	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:23:47.679253	2014-09-26 19:23:47.682585	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:24:13.328135	2014-09-26 19:24:13.332408	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:24:37.112489	2014-09-26 19:24:37.115922	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:25:30.896227	2014-09-26 19:25:30.900044	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:25:39.965591	2014-09-26 19:25:39.970105	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:33:54.52102	2014-09-26 19:33:54.527273	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:34:17.656485	2014-09-26 19:34:17.659609	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:45:27.383186	2014-09-26 19:45:27.388125	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:46:57.633798	2014-09-26 19:46:57.6385	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:48:26.843149	2014-09-26 19:48:26.848094	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:50:34.855358	2014-09-26 19:50:34.86192	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:52:11.233379	2014-09-26 19:52:11.239267	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:52:22.409542	2014-09-26 19:52:22.414448	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:52:27.311295	2014-09-26 19:52:27.316226	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:52:31.172373	2014-09-26 19:52:31.177133	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 19:52:56.646148	2014-09-26 19:52:56.649058	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 20:23:45.859584	2014-09-26 20:23:45.863861	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-09-26 20:52:03.343101	2014-09-26 20:52:03.348281	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-01 17:18:41.663206	2014-10-01 17:18:41.689662	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 22:53:07.040407	2014-10-07 22:53:07.055861	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:02:04.325585	2014-10-07 23:02:04.331387	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:02:24.070647	2014-10-07 23:02:24.075738	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:02:59.335327	2014-10-07 23:02:59.339011	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:03:15.608543	2014-10-07 23:03:15.613016	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:03:20.063095	2014-10-07 23:03:20.06576	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:03:48.699989	2014-10-07 23:03:48.703766	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:04:05.151905	2014-10-07 23:04:05.157676	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:04:14.371845	2014-10-07 23:04:14.374492	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:04:24.940098	2014-10-07 23:04:24.942948	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:04:46.813346	2014-10-07 23:04:46.816281	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:04:49.978996	2014-10-07 23:04:49.984573	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:05:15.520336	2014-10-07 23:05:15.525349	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:05:21.958588	2014-10-07 23:05:21.962883	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:05:32.092229	2014-10-07 23:05:32.095406	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:05:43.531506	2014-10-07 23:05:43.536242	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:06:50.230781	2014-10-07 23:06:50.235172	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:06:55.671998	2014-10-07 23:06:55.676762	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:07:02.574789	2014-10-07 23:07:02.578837	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:07:14.423633	2014-10-07 23:07:14.428524	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:07:20.678164	2014-10-07 23:07:20.681979	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:08:17.73542	2014-10-07 23:08:17.74083	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:08:46.990127	2014-10-07 23:08:46.994051	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:09:37.146608	2014-10-07 23:09:37.150884	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:12:46.813387	2014-10-07 23:12:46.817152	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:13:02.785538	2014-10-07 23:13:02.790759	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:13:11.815763	2014-10-07 23:13:11.818848	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:14:08.137478	2014-10-07 23:14:08.143059	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:16:57.018057	2014-10-07 23:16:57.024253	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:17:08.517571	2014-10-07 23:17:08.52119	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:17:52.000189	2014-10-07 23:17:52.006075	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:18:10.569123	2014-10-07 23:18:10.573578	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:18:34.260204	2014-10-07 23:18:34.264968	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:18:40.215205	2014-10-07 23:18:40.219204	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:18:49.855788	2014-10-07 23:18:49.859481	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:19:38.478462	2014-10-07 23:19:38.481128	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:20:40.470228	2014-10-07 23:20:40.474293	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:21:49.862305	2014-10-07 23:21:49.868117	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:22:36.09558	2014-10-07 23:22:36.099976	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:22:53.242878	2014-10-07 23:22:53.248518	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:23:00.035196	2014-10-07 23:23:00.040157	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:23:05.198198	2014-10-07 23:23:05.203177	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:23:10.878958	2014-10-07 23:23:10.882199	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:23:16.203076	2014-10-07 23:23:16.206658	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:24:44.405011	2014-10-07 23:24:44.409837	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:25:03.485314	2014-10-07 23:25:03.488704	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:28:52.35193	2014-10-07 23:28:52.358098	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:29:57.197789	2014-10-07 23:29:57.202852	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:30:07.200282	2014-10-07 23:30:07.203451	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:30:21.136923	2014-10-07 23:30:21.141478	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3186	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:30:40.82703	2014-10-07 23:30:40.831649	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:32:36.087079	2014-10-07 23:32:36.092142	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:32:46.523478	2014-10-07 23:32:46.530519	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:34:13.746604	2014-10-07 23:34:13.752026	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3190	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:34:45.706882	2014-10-07 23:34:45.711801	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:36:30.191247	2014-10-07 23:36:30.197626	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:37:10.046913	2014-10-07 23:37:10.051605	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:39:24.570871	2014-10-07 23:39:24.575613	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:40:06.223496	2014-10-07 23:40:06.227229	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:41:31.889729	2014-10-07 23:41:31.895816	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:42:11.409927	2014-10-07 23:42:11.413379	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3197	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-07 23:42:34.070941	2014-10-07 23:42:34.075384	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:03:55.987096	2014-10-08 00:03:55.992328	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:04:03.122083	2014-10-08 00:04:03.127669	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:04:04.105593	2014-10-08 00:04:04.110096	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:04:07.63782	2014-10-08 00:04:07.640591	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:05:10.28569	2014-10-08 00:05:10.290566	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:05:52.747329	2014-10-08 00:05:52.751012	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3204	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:06:18.112893	2014-10-08 00:06:18.11574	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:06:25.784002	2014-10-08 00:06:25.788503	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:07:14.021256	2014-10-08 00:07:14.025275	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:07:20.250631	2014-10-08 00:07:20.255259	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:07:29.319136	2014-10-08 00:07:29.323225	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:08:06.184875	2014-10-08 00:08:06.191871	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:08:18.130467	2014-10-08 00:08:18.135209	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:08:26.452249	2014-10-08 00:08:26.456401	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:09:19.858891	2014-10-08 00:09:19.864638	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:09:27.650375	2014-10-08 00:09:27.655109	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:09:31.095196	2014-10-08 00:09:31.099624	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:10:37.794657	2014-10-08 00:10:37.799277	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:15:06.171676	2014-10-08 00:15:06.176596	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:15:19.533138	2014-10-08 00:15:19.536731	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:15:25.146026	2014-10-08 00:15:25.148883	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:15:30.398234	2014-10-08 00:15:30.402217	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:15:41.44481	2014-10-08 00:15:41.449255	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:17:03.536882	2014-10-08 00:17:03.540698	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:17:27.83886	2014-10-08 00:17:27.843103	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:17:55.114154	2014-10-08 00:17:55.118419	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:19:02.373707	2014-10-08 00:19:02.379409	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3225	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:20:42.826601	2014-10-08 00:20:42.831104	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:20:58.422153	2014-10-08 00:20:58.427532	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3227	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:21:18.16267	2014-10-08 00:21:18.165445	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:21:24.146903	2014-10-08 00:21:24.151566	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:21:31.741405	2014-10-08 00:21:31.746923	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:21:36.968299	2014-10-08 00:21:36.970954	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:21:42.653733	2014-10-08 00:21:42.658177	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:21:49.200473	2014-10-08 00:21:49.205225	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:22:03.903033	2014-10-08 00:22:03.907096	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:22:25.185887	2014-10-08 00:22:25.189038	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:22:40.071443	2014-10-08 00:22:40.076559	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:22:48.071124	2014-10-08 00:22:48.073892	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:22:54.86425	2014-10-08 00:22:54.867246	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:23:01.72677	2014-10-08 00:23:01.731501	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:23:05.651037	2014-10-08 00:23:05.655724	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3240	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:23:16.275882	2014-10-08 00:23:16.279643	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:23:23.57851	2014-10-08 00:23:23.582386	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:23:28.098793	2014-10-08 00:23:28.102875	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:23:35.500835	2014-10-08 00:23:35.503543	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:23:52.627372	2014-10-08 00:23:52.632287	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:26:53.162074	2014-10-08 00:26:53.167576	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:27:01.254481	2014-10-08 00:27:01.258643	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:27:22.773801	2014-10-08 00:27:22.778132	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:27:29.53336	2014-10-08 00:27:29.535898	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:27:34.471405	2014-10-08 00:27:34.476024	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:27:42.822244	2014-10-08 00:27:42.826462	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3251	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:27:54.192727	2014-10-08 00:27:54.196491	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:28:00.73103	2014-10-08 00:28:00.735512	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:28:05.715801	2014-10-08 00:28:05.72019	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:28:22.658993	2014-10-08 00:28:22.662571	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:28:45.178354	2014-10-08 00:28:45.180921	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:29:16.703751	2014-10-08 00:29:16.707258	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3257	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:29:37.44609	2014-10-08 00:29:37.450586	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3258	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:29:48.205012	2014-10-08 00:29:48.210115	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:30:29.208362	2014-10-08 00:30:29.21288	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3260	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:32:47.790387	2014-10-08 00:32:47.794095	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3261	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:32:58.912785	2014-10-08 00:32:58.91751	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:33:21.120304	2014-10-08 00:33:21.124405	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:33:42.765044	2014-10-08 00:33:42.769563	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3264	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:33:45.075612	2014-10-08 00:33:45.080265	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:34:31.2099	2014-10-08 00:34:31.212812	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:35:45.181796	2014-10-08 00:35:45.18714	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:35:52.039725	2014-10-08 00:35:52.044716	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:35:59.09858	2014-10-08 00:35:59.103317	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:36:02.512199	2014-10-08 00:36:02.516849	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3270	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:36:57.688528	2014-10-08 00:36:57.692039	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:37:10.398409	2014-10-08 00:37:10.40252	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:37:24.901313	2014-10-08 00:37:24.905533	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:37:57.592895	2014-10-08 00:37:57.598366	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:38:11.901204	2014-10-08 00:38:11.90416	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:38:28.674092	2014-10-08 00:38:28.678792	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:38:38.576604	2014-10-08 00:38:38.580858	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:38:54.303084	2014-10-08 00:38:54.307523	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:39:14.934408	2014-10-08 00:39:14.939746	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:39:49.682766	2014-10-08 00:39:49.687786	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:39:57.346998	2014-10-08 00:39:57.350504	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:40:11.547178	2014-10-08 00:40:11.55019	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:40:24.236943	2014-10-08 00:40:24.239679	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:40:39.284674	2014-10-08 00:40:39.287579	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:40:47.914009	2014-10-08 00:40:47.916706	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:41:55.116817	2014-10-08 00:41:55.121622	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:43:03.658077	2014-10-08 00:43:03.663418	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:44:02.73447	2014-10-08 00:44:02.737652	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:44:07.297674	2014-10-08 00:44:07.302155	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:44:21.970972	2014-10-08 00:44:21.973675	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:44:53.700075	2014-10-08 00:44:53.706884	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:56:13.080482	2014-10-08 00:56:13.086403	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:56:14.234494	2014-10-08 00:56:14.24015	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:56:15.506435	2014-10-08 00:56:15.511044	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:57:38.377247	2014-10-08 00:57:38.382204	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:57:57.077903	2014-10-08 00:57:57.081857	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:58:34.334516	2014-10-08 00:58:34.338717	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:58:41.729436	2014-10-08 00:58:41.734105	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:58:59.220291	2014-10-08 00:58:59.224685	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:59:03.831941	2014-10-08 00:59:03.837445	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3300	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:59:14.887292	2014-10-08 00:59:14.89246	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3301	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:59:37.930496	2014-10-08 00:59:37.935023	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:59:41.926164	2014-10-08 00:59:41.928842	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:59:45.914006	2014-10-08 00:59:45.91672	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 00:59:50.524563	2014-10-08 00:59:50.529761	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:00:02.202871	2014-10-08 01:00:02.208036	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:00:06.027348	2014-10-08 01:00:06.032392	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:00:22.828405	2014-10-08 01:00:22.832816	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:01:08.341602	2014-10-08 01:01:08.347224	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:01:15.361744	2014-10-08 01:01:15.364708	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:01:19.825789	2014-10-08 01:01:19.828669	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:01:24.25497	2014-10-08 01:01:24.258094	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:01:31.10786	2014-10-08 01:01:31.112549	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:02:04.752245	2014-10-08 01:02:04.75651	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:02:08.267888	2014-10-08 01:02:08.271573	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:02:15.628843	2014-10-08 01:02:15.633343	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:02:45.306715	2014-10-08 01:02:45.313635	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:02:51.638522	2014-10-08 01:02:51.643549	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:03:15.569775	2014-10-08 01:03:15.57505	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:03:22.926109	2014-10-08 01:03:22.928931	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:03:26.635464	2014-10-08 01:03:26.638253	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:03:31.095999	2014-10-08 01:03:31.10047	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:03:50.781856	2014-10-08 01:03:50.785376	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:04:52.802435	2014-10-08 01:04:52.805972	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:05:00.963428	2014-10-08 01:05:00.968128	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:05:08.824027	2014-10-08 01:05:08.827059	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:05:38.679434	2014-10-08 01:05:38.682521	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:05:50.572646	2014-10-08 01:05:50.576051	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:05:57.74706	2014-10-08 01:05:57.751613	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:06:05.934313	2014-10-08 01:06:05.939849	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3330	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:06:12.891956	2014-10-08 01:06:12.896204	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:06:31.295686	2014-10-08 01:06:31.30003	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:06:36.452269	2014-10-08 01:06:36.457634	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:06:50.78196	2014-10-08 01:06:50.786959	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:06:55.391057	2014-10-08 01:06:55.395609	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:07:03.378381	2014-10-08 01:07:03.38326	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:09:09.554934	2014-10-08 01:09:09.561039	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:09:15.455794	2014-10-08 01:09:15.460584	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:09:27.730558	2014-10-08 01:09:27.735489	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:09:39.576916	2014-10-08 01:09:39.579651	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:10:16.680074	2014-10-08 01:10:16.685087	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:10:26.387718	2014-10-08 01:10:26.390473	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:10:35.300326	2014-10-08 01:10:35.303163	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:12:33.980362	2014-10-08 01:12:33.985543	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:12:48.33477	2014-10-08 01:12:48.339724	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:12:54.79754	2014-10-08 01:12:54.802075	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:12:59.680585	2014-10-08 01:12:59.684856	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:13:44.106997	2014-10-08 01:13:44.111552	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:14:11.761485	2014-10-08 01:14:11.766016	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:14:21.186596	2014-10-08 01:14:21.189319	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:14:35.782099	2014-10-08 01:14:35.785011	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:14:44.296711	2014-10-08 01:14:44.300186	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:14:56.888556	2014-10-08 01:14:56.893057	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:15:06.053151	2014-10-08 01:15:06.055865	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:16:29.07163	2014-10-08 01:16:29.077137	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:21:30.76952	2014-10-08 01:21:30.775548	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:22:06.264329	2014-10-08 01:22:06.269849	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:22:26.894246	2014-10-08 01:22:26.8972	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:22:37.761072	2014-10-08 01:22:37.766124	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:22:44.885785	2014-10-08 01:22:44.88897	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:22:56.092338	2014-10-08 01:22:56.095597	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:23:02.471027	2014-10-08 01:23:02.475587	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:23:08.115573	2014-10-08 01:23:08.120335	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3363	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:23:32.688015	2014-10-08 01:23:32.693195	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:23:39.131436	2014-10-08 01:23:39.13673	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:25:32.155032	2014-10-08 01:25:32.160779	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:32:03.173854	2014-10-08 01:32:03.179698	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:32:31.688323	2014-10-08 01:32:31.693027	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:37:33.822375	2014-10-08 01:37:33.828123	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:37:39.583786	2014-10-08 01:37:39.58888	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:38:17.560155	2014-10-08 01:38:17.565574	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:38:31.658425	2014-10-08 01:38:31.66283	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:38:36.369236	2014-10-08 01:38:36.373801	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:39:10.650596	2014-10-08 01:39:10.656272	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:39:25.629413	2014-10-08 01:39:25.634691	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:39:31.22837	2014-10-08 01:39:31.233095	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 01:39:35.351776	2014-10-08 01:39:35.356676	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3377	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 04:35:20.914159	2014-10-08 04:35:20.919175	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 04:35:28.460005	2014-10-08 04:35:28.46464	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 04:35:51.402753	2014-10-08 04:35:51.409343	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 04:37:00.18161	2014-10-08 04:37:00.184936	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 04:38:05.449197	2014-10-08 04:38:05.453487	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 04:39:24.16286	2014-10-08 04:39:24.167406	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:25:48.162356	2014-10-08 05:25:48.168682	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:26:24.251578	2014-10-08 05:26:24.25638	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:26:30.663095	2014-10-08 05:26:30.668087	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:27:14.923162	2014-10-08 05:27:14.927266	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:27:39.774709	2014-10-08 05:27:39.777701	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:28:04.104316	2014-10-08 05:28:04.107697	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:28:12.475724	2014-10-08 05:28:12.478774	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:28:20.37308	2014-10-08 05:28:20.376196	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:28:28.191578	2014-10-08 05:28:28.195087	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:28:46.091118	2014-10-08 05:28:46.095461	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:29:24.949002	2014-10-08 05:29:24.953306	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:29:59.836894	2014-10-08 05:29:59.840301	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3395	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:30:25.779124	2014-10-08 05:30:25.782298	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:31:18.171725	2014-10-08 05:31:18.175483	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3397	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:31:53.046517	2014-10-08 05:31:53.051526	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:32:00.97737	2014-10-08 05:32:00.980435	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:32:05.711125	2014-10-08 05:32:05.713915	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:32:21.465534	2014-10-08 05:32:21.471237	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3401	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:33:18.114489	2014-10-08 05:33:18.120007	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3402	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:33:33.641473	2014-10-08 05:33:33.646357	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:33:40.334685	2014-10-08 05:33:40.33933	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3404	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:35:31.898642	2014-10-08 05:35:31.903635	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:36:25.655731	2014-10-08 05:36:25.660187	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:36:46.00637	2014-10-08 05:36:46.01078	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:37:15.808335	2014-10-08 05:37:15.812828	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:37:25.61016	2014-10-08 05:37:25.614357	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3409	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:38:51.690278	2014-10-08 05:38:51.695236	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3410	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:39:46.029391	2014-10-08 05:39:46.034058	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3411	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:40:30.755905	2014-10-08 05:40:30.760889	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3412	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:42:17.273227	2014-10-08 05:42:17.278406	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3413	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:43:07.78391	2014-10-08 05:43:07.788911	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:44:34.997063	2014-10-08 05:44:35.001993	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3415	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:46:39.675177	2014-10-08 05:46:39.679536	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:47:39.508117	2014-10-08 05:47:39.513022	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3417	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 05:49:20.748693	2014-10-08 05:49:20.754069	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:42:01.359048	2014-10-08 19:42:01.380365	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3419	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:42:23.448257	2014-10-08 19:42:23.451445	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3420	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:44:50.401426	2014-10-08 19:44:50.408798	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:45:22.609408	2014-10-08 19:45:22.61418	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3422	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:45:42.765307	2014-10-08 19:45:42.768052	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:46:22.990083	2014-10-08 19:46:22.993909	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:46:36.302086	2014-10-08 19:46:36.305004	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:46:44.828897	2014-10-08 19:46:44.833137	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:46:47.71293	2014-10-08 19:46:47.772146	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:46:54.885949	2014-10-08 19:46:54.942828	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3428	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:47:01.752567	2014-10-08 19:47:01.756731	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3429	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:47:15.274839	2014-10-08 19:47:15.278452	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3430	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:47:21.888551	2014-10-08 19:47:21.892232	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3431	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:47:31.077086	2014-10-08 19:47:31.080157	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:47:44.229009	2014-10-08 19:47:44.232766	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3433	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:47:50.409559	2014-10-08 19:47:50.464258	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3434	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:47:59.297905	2014-10-08 19:47:59.301187	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:48:09.20746	2014-10-08 19:48:09.212	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:48:16.275189	2014-10-08 19:48:16.280138	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:48:35.444839	2014-10-08 19:48:35.449025	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:48:44.069944	2014-10-08 19:48:44.074609	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3439	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:49:05.873948	2014-10-08 19:49:05.876738	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:51:26.956737	2014-10-08 19:51:26.960718	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3441	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:51:29.568207	2014-10-08 19:51:29.572543	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3442	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:51:31.696227	2014-10-08 19:51:31.699833	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:51:33.750399	2014-10-08 19:51:33.753259	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:51:42.462067	2014-10-08 19:51:42.466312	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:52:04.300889	2014-10-08 19:52:04.303668	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:52:06.582835	2014-10-08 19:52:06.586494	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:52:08.854259	2014-10-08 19:52:08.858502	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:52:23.482126	2014-10-08 19:52:23.487178	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:52:32.477075	2014-10-08 19:52:32.481429	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3450	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:55:11.819488	2014-10-08 19:55:11.824309	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3451	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:59:21.80499	2014-10-08 19:59:21.810232	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:59:44.092619	2014-10-08 19:59:44.097281	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3453	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 19:59:58.071737	2014-10-08 19:59:58.075141	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:00:58.824391	2014-10-08 20:00:58.829703	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3455	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:01:04.107512	2014-10-08 20:01:04.111835	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:04:48.766652	2014-10-08 20:04:48.771316	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:05:44.780844	2014-10-08 20:05:44.786409	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:06:03.246312	2014-10-08 20:06:03.250351	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:06:44.576187	2014-10-08 20:06:44.581306	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:34:33.817402	2014-10-08 20:34:33.821724	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:35:02.700224	2014-10-08 20:35:02.792077	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:35:08.796379	2014-10-08 20:35:08.801168	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:35:14.505324	2014-10-08 20:35:14.510209	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:35:40.879157	2014-10-08 20:35:40.882109	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:35:49.525323	2014-10-08 20:35:49.528406	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:36:03.247038	2014-10-08 20:36:03.249807	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:36:39.314244	2014-10-08 20:36:39.318694	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:36:51.755053	2014-10-08 20:36:51.758001	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3469	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:36:59.881521	2014-10-08 20:36:59.886432	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:37:06.151949	2014-10-08 20:37:06.154594	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:37:10.939161	2014-10-08 20:37:10.943841	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:38:28.992142	2014-10-08 20:38:28.995632	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:38:36.552927	2014-10-08 20:38:36.555644	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3474	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:38:45.863968	2014-10-08 20:38:45.866716	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:39:05.811968	2014-10-08 20:39:05.816875	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:39:09.441352	2014-10-08 20:39:09.445591	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:39:34.851493	2014-10-08 20:39:34.855975	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:39:48.663284	2014-10-08 20:39:48.667647	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:39:54.177615	2014-10-08 20:39:54.180459	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:40:19.592804	2014-10-08 20:40:19.59642	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:40:53.800297	2014-10-08 20:40:53.803206	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3482	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:54:39.247879	2014-10-08 20:54:39.251583	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:54:56.37734	2014-10-08 20:54:56.381431	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:55:03.777577	2014-10-08 20:55:03.780358	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:55:13.123325	2014-10-08 20:55:13.126713	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:55:30.569779	2014-10-08 20:55:30.572527	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3487	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:55:45.258144	2014-10-08 20:55:45.2617	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:55:52.576616	2014-10-08 20:55:52.580948	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:56:00.97767	2014-10-08 20:56:00.982048	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3490	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:56:15.810243	2014-10-08 20:56:15.813807	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:56:24.206595	2014-10-08 20:56:24.211124	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:56:33.632045	2014-10-08 20:56:33.722107	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3493	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:58:58.926759	2014-10-08 20:58:58.930277	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:59:11.047921	2014-10-08 20:59:11.053314	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:59:19.505135	2014-10-08 20:59:19.507859	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:59:33.952702	2014-10-08 20:59:33.958029	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3497	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 20:59:56.661162	2014-10-08 20:59:56.664074	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:01:14.205687	2014-10-08 21:01:14.210838	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3499	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:04:12.883117	2014-10-08 21:04:12.888486	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:04:39.111494	2014-10-08 21:04:39.116076	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:04:59.048217	2014-10-08 21:04:59.051537	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:06:09.519589	2014-10-08 21:06:09.523019	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3503	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:07:07.846051	2014-10-08 21:07:07.849217	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3504	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:07:23.878736	2014-10-08 21:07:23.882239	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:08:11.918037	2014-10-08 21:08:11.920973	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:08:25.514864	2014-10-08 21:08:25.520579	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:08:41.765369	2014-10-08 21:08:41.769691	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:08:58.831971	2014-10-08 21:08:58.83462	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:09:11.717875	2014-10-08 21:09:11.723501	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:09:26.77775	2014-10-08 21:09:26.780942	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:10:07.315753	2014-10-08 21:10:07.320248	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:10:28.077958	2014-10-08 21:10:28.082895	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:10:44.19796	2014-10-08 21:10:44.202023	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:10:58.988258	2014-10-08 21:10:58.992792	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:11:35.329078	2014-10-08 21:11:35.373845	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3516	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:11:55.878363	2014-10-08 21:11:55.883284	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3517	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:12:05.496353	2014-10-08 21:12:05.501156	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:12:13.839272	2014-10-08 21:12:13.843833	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:13:13.889344	2014-10-08 21:13:13.892834	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:13:16.647161	2014-10-08 21:13:16.651661	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:13:25.785037	2014-10-08 21:13:25.789769	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:13:28.437708	2014-10-08 21:13:28.440945	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:13:33.560612	2014-10-08 21:13:33.564577	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3524	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:13:48.686802	2014-10-08 21:13:48.68956	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:13:51.667417	2014-10-08 21:13:51.671971	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:14:06.680777	2014-10-08 21:14:06.683565	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:14:21.989317	2014-10-08 21:14:21.993001	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:15:54.145719	2014-10-08 21:15:54.150373	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:16:27.33213	2014-10-08 21:16:27.33771	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3530	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:16:45.396711	2014-10-08 21:16:45.399848	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:17:08.479794	2014-10-08 21:17:08.482661	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:17:19.724754	2014-10-08 21:17:19.727376	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:17:28.290014	2014-10-08 21:17:28.293404	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:17:37.007479	2014-10-08 21:17:37.011695	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:17:54.125957	2014-10-08 21:17:54.129368	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:18:08.953799	2014-10-08 21:18:08.956548	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3537	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:18:21.274831	2014-10-08 21:18:21.277987	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3538	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:18:25.550801	2014-10-08 21:18:25.555277	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:19:27.678585	2014-10-08 21:19:27.68256	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3540	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:19:38.949469	2014-10-08 21:19:38.952756	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3541	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:20:15.833057	2014-10-08 21:20:15.835825	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:22:16.733169	2014-10-08 21:22:16.736893	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:22:30.730252	2014-10-08 21:22:30.73435	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:26:14.569652	2014-10-08 21:26:14.575281	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3545	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:53:34.954133	2014-10-08 21:53:34.959745	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:54:11.162971	2014-10-08 21:54:11.169092	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:54:34.444111	2014-10-08 21:54:34.447923	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:54:51.654972	2014-10-08 21:54:51.660091	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3549	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:55:18.201559	2014-10-08 21:55:18.20585	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:56:04.338997	2014-10-08 21:56:04.343657	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3551	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:56:39.982882	2014-10-08 21:56:39.988451	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-08 21:57:09.082916	2014-10-08 21:57:09.085631	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:20:40.869004	2014-10-09 00:20:40.875399	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:21:35.242972	2014-10-09 00:21:35.246697	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:21:36.210944	2014-10-09 00:21:36.215688	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:21:40.816034	2014-10-09 00:21:40.820011	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:24:04.560315	2014-10-09 00:24:04.565725	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:25:15.361014	2014-10-09 00:25:15.367394	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:26:04.131231	2014-10-09 00:26:04.137489	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3560	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:26:29.492165	2014-10-09 00:26:29.497568	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3561	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:26:59.823864	2014-10-09 00:26:59.831915	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:27:25.761649	2014-10-09 00:27:25.767393	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:27:32.791718	2014-10-09 00:27:32.796802	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3564	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:27:47.064326	2014-10-09 00:27:47.069912	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3565	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:28:07.211474	2014-10-09 00:28:07.217257	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3566	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:29:28.052199	2014-10-09 00:29:28.057545	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:29:52.560762	2014-10-09 00:29:52.567041	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3568	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:30:41.937563	2014-10-09 00:30:41.943646	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:30:50.883664	2014-10-09 00:30:50.973535	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:31:27.108027	2014-10-09 00:31:27.113036	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3571	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:31:32.688001	2014-10-09 00:31:32.696852	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:31:38.315686	2014-10-09 00:31:38.321418	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:31:42.308169	2014-10-09 00:31:42.312155	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:31:52.657073	2014-10-09 00:31:52.662465	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:31:58.945751	2014-10-09 00:31:58.950626	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:32:19.676837	2014-10-09 00:32:19.687776	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:33:23.709157	2014-10-09 00:33:23.715291	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:33:34.679107	2014-10-09 00:33:34.684883	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3579	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:33:40.254051	2014-10-09 00:33:40.260762	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3580	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:35:04.296791	2014-10-09 00:35:04.303013	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:35:12.769144	2014-10-09 00:35:12.773863	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:36:49.259304	2014-10-09 00:36:49.264835	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:36:58.312738	2014-10-09 00:36:58.31724	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:39:49.85042	2014-10-09 00:39:49.855903	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3585	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 00:51:01.603532	2014-10-09 00:51:01.610689	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3586	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 02:31:56.360411	2014-10-09 02:31:56.366284	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 02:32:06.370906	2014-10-09 02:32:06.375368	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 02:40:49.189405	2014-10-09 02:40:49.194734	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 02:45:54.981401	2014-10-09 02:45:54.986978	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3590	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 02:47:43.410786	2014-10-09 02:47:43.415945	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3591	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 02:57:45.375421	2014-10-09 02:57:45.381934	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3592	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:13:17.164216	2014-10-09 03:13:17.169989	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3593	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:13:45.502825	2014-10-09 03:13:45.505479	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3594	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:15:05.470785	2014-10-09 03:15:05.475441	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:15:48.332805	2014-10-09 03:15:48.338178	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:16:13.727225	2014-10-09 03:16:13.729908	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:19:13.688867	2014-10-09 03:19:13.694419	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:19:19.471717	2014-10-09 03:19:19.476325	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3599	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:20:03.238668	2014-10-09 03:20:03.243356	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:23:08.091572	2014-10-09 03:23:08.096475	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3601	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:25:49.593293	2014-10-09 03:25:49.599278	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:26:31.408875	2014-10-09 03:26:31.412241	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:28:56.435835	2014-10-09 03:28:56.440572	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3604	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:33:12.818253	2014-10-09 03:33:12.822844	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:34:15.80632	2014-10-09 03:34:15.809725	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:34:34.307149	2014-10-09 03:34:34.311597	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3607	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:34:56.32189	2014-10-09 03:34:56.326028	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:35:05.606893	2014-10-09 03:35:05.611532	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3609	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:35:23.256391	2014-10-09 03:35:23.260969	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3610	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:35:57.753829	2014-10-09 03:35:57.757949	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:36:06.341889	2014-10-09 03:36:06.344584	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3612	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:36:10.912319	2014-10-09 03:36:10.984576	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3613	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:37:55.887167	2014-10-09 03:37:55.892914	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:38:17.381218	2014-10-09 03:38:17.38504	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3615	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:38:23.413385	2014-10-09 03:38:23.417571	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:42:18.551463	2014-10-09 03:42:18.55705	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3617	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:42:29.571146	2014-10-09 03:42:29.573947	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3618	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:42:55.679796	2014-10-09 03:42:55.682424	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:43:08.52642	2014-10-09 03:43:08.530476	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3620	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:43:46.721714	2014-10-09 03:43:46.725504	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3621	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:44:09.69131	2014-10-09 03:44:09.694247	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3622	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:44:17.836376	2014-10-09 03:44:17.840099	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:44:26.219958	2014-10-09 03:44:26.224974	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3624	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:44:40.035329	2014-10-09 03:44:40.039827	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:44:48.325246	2014-10-09 03:44:48.329275	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:44:54.420771	2014-10-09 03:44:54.425439	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:46:01.128491	2014-10-09 03:46:01.13268	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:46:07.680427	2014-10-09 03:46:07.683228	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:46:49.520253	2014-10-09 03:46:49.52418	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3630	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:47:03.675614	2014-10-09 03:47:03.679136	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:47:17.019035	2014-10-09 03:47:17.022499	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3632	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:47:24.708092	2014-10-09 03:47:24.711499	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3633	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:47:38.829191	2014-10-09 03:47:38.833874	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:47:46.300833	2014-10-09 03:47:46.30377	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3635	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:48:00.793387	2014-10-09 03:48:00.797324	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:52:18.841942	2014-10-09 03:52:18.845711	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:52:26.034685	2014-10-09 03:52:26.037564	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:52:53.615168	2014-10-09 03:52:53.617844	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:53:26.269743	2014-10-09 03:53:26.274975	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:55:25.328865	2014-10-09 03:55:25.334261	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3641	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 03:55:34.424948	2014-10-09 03:55:34.42956	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:10:47.223746	2014-10-09 04:10:47.229523	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:11:06.220773	2014-10-09 04:11:06.22367	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3644	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:11:31.23459	2014-10-09 04:11:31.238647	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:12:04.192993	2014-10-09 04:12:04.197584	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3646	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:16:12.993969	2014-10-09 04:16:12.99818	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:16:54.00653	2014-10-09 04:16:54.010972	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:17:13.003291	2014-10-09 04:17:13.007448	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:17:56.337107	2014-10-09 04:17:56.342925	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:19:08.227428	2014-10-09 04:19:08.2325	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:22:11.12423	2014-10-09 04:22:11.130098	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3652	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:28:55.068438	2014-10-09 04:28:55.07357	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:29:02.600726	2014-10-09 04:29:02.60353	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:29:18.055146	2014-10-09 04:29:18.05919	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3655	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:29:39.872187	2014-10-09 04:29:39.876602	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:32:02.586117	2014-10-09 04:32:02.592747	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3657	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:35:32.646169	2014-10-09 04:35:32.651933	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3658	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:37:11.490779	2014-10-09 04:37:11.496238	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:38:09.00866	2014-10-09 04:38:09.01358	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:38:20.199971	2014-10-09 04:38:20.204628	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:41:53.19244	2014-10-09 04:41:53.196064	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:42:11.071024	2014-10-09 04:42:11.074303	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:42:18.128441	2014-10-09 04:42:18.132126	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:42:47.376644	2014-10-09 04:42:47.381032	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3665	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:43:11.505236	2014-10-09 04:43:11.508649	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:43:35.888298	2014-10-09 04:43:35.892389	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3667	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:43:47.516478	2014-10-09 04:43:47.5211	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:44:03.999526	2014-10-09 04:44:04.002873	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:44:21.730658	2014-10-09 04:44:21.73468	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3670	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:45:03.052516	2014-10-09 04:45:03.057051	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:45:49.856327	2014-10-09 04:45:49.862604	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:46:25.796147	2014-10-09 04:46:25.799569	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:46:31.89787	2014-10-09 04:46:31.900573	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3674	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:46:42.47496	2014-10-09 04:46:42.478923	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:46:49.800917	2014-10-09 04:46:49.803577	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:47:14.772619	2014-10-09 04:47:14.775291	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:48:08.222002	2014-10-09 04:48:08.224813	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3678	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:48:20.287482	2014-10-09 04:48:20.291869	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3679	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:48:27.377682	2014-10-09 04:48:27.380367	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:48:56.901082	2014-10-09 04:48:56.903638	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3681	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:49:20.248532	2014-10-09 04:49:20.25292	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3682	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:49:32.811275	2014-10-09 04:49:32.815845	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:49:58.786442	2014-10-09 04:49:58.789769	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3684	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:50:13.402443	2014-10-09 04:50:13.405438	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:50:21.156395	2014-10-09 04:50:21.162055	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3686	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:50:31.085153	2014-10-09 04:50:31.087863	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:50:41.018855	2014-10-09 04:50:41.021522	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3688	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:50:46.711259	2014-10-09 04:50:46.716004	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:50:56.467581	2014-10-09 04:50:56.47232	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:51:06.568706	2014-10-09 04:51:06.572311	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3691	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:51:12.249184	2014-10-09 04:51:12.253665	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3692	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:51:20.935357	2014-10-09 04:51:20.940337	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:51:50.844004	2014-10-09 04:51:50.848589	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:52:00.068886	2014-10-09 04:52:00.14216	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:53:06.721416	2014-10-09 04:53:06.725379	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:53:12.517129	2014-10-09 04:53:12.521641	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3697	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:53:26.725835	2014-10-09 04:53:26.729855	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:53:49.754426	2014-10-09 04:53:49.757926	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:55:04.194653	2014-10-09 04:55:04.201057	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:55:14.127337	2014-10-09 04:55:14.131944	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3701	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:55:24.358762	2014-10-09 04:55:24.362494	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:55:35.755031	2014-10-09 04:55:35.757803	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3703	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:55:56.240399	2014-10-09 04:55:56.243251	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:56:02.123341	2014-10-09 04:56:02.126195	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3705	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:56:39.849035	2014-10-09 04:56:39.852521	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:57:48.150284	2014-10-09 04:57:48.156288	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:59:09.891893	2014-10-09 04:59:09.896107	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:59:20.814594	2014-10-09 04:59:20.818816	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:59:33.86156	2014-10-09 04:59:33.865821	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:59:46.98444	2014-10-09 04:59:46.987357	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 04:59:58.617364	2014-10-09 04:59:58.620351	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:00:10.025509	2014-10-09 05:00:10.02817	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:00:15.165917	2014-10-09 05:00:15.169242	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:00:22.200585	2014-10-09 05:00:22.20394	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:10:11.886553	2014-10-09 05:10:11.892813	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3716	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:10:23.888583	2014-10-09 05:10:23.892185	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3717	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:10:29.834106	2014-10-09 05:10:29.839169	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:11:35.036432	2014-10-09 05:11:35.04223	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:24:16.536388	2014-10-09 05:24:16.540871	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:24:26.183717	2014-10-09 05:24:26.186362	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:24:36.81031	2014-10-09 05:24:36.813312	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:28:15.233067	2014-10-09 05:28:15.237231	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:36:28.591499	2014-10-09 05:36:28.596551	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:37:17.538726	2014-10-09 05:37:17.543343	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:37:25.271181	2014-10-09 05:37:25.273896	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:37:29.280982	2014-10-09 05:37:29.284637	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:37:37.740416	2014-10-09 05:37:37.744726	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:37:46.402561	2014-10-09 05:37:46.407245	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:38:11.82864	2014-10-09 05:38:11.83315	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3730	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:38:27.56651	2014-10-09 05:38:27.571971	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:38:44.87936	2014-10-09 05:38:44.883929	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:38:57.35642	2014-10-09 05:38:57.362476	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:39:09.721096	2014-10-09 05:39:09.724294	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:39:43.758169	2014-10-09 05:39:43.764147	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:40:00.790151	2014-10-09 05:40:00.793293	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:40:59.313894	2014-10-09 05:40:59.317508	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:42:03.416886	2014-10-09 05:42:03.421711	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3738	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:42:15.329047	2014-10-09 05:42:15.332567	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:42:22.293482	2014-10-09 05:42:22.298334	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3740	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:42:36.605978	2014-10-09 05:42:36.610422	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:43:04.519553	2014-10-09 05:43:04.523215	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:43:27.072371	2014-10-09 05:43:27.076467	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:43:35.239447	2014-10-09 05:43:35.242121	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:43:41.87949	2014-10-09 05:43:41.882496	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:43:55.051348	2014-10-09 05:43:55.054147	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:44:09.350938	2014-10-09 05:44:09.355009	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:44:44.909147	2014-10-09 05:44:44.914918	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:45:05.467554	2014-10-09 05:45:05.470301	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:45:11.799931	2014-10-09 05:45:11.80467	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:45:21.310124	2014-10-09 05:45:21.315788	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:45:31.242596	2014-10-09 05:45:31.247072	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:46:09.498696	2014-10-09 05:46:09.503305	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:46:28.712673	2014-10-09 05:46:28.716148	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:46:36.699881	2014-10-09 05:46:36.702858	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3755	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:56:44.305132	2014-10-09 05:56:44.310559	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:57:11.284293	2014-10-09 05:57:11.286974	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3757	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:57:21.792202	2014-10-09 05:57:21.795556	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:58:03.577981	2014-10-09 05:58:03.581489	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:58:12.252637	2014-10-09 05:58:12.255805	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:58:21.647093	2014-10-09 05:58:21.652394	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:58:46.120876	2014-10-09 05:58:46.123635	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:59:04.022312	2014-10-09 05:59:04.02533	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:59:29.762607	2014-10-09 05:59:29.767697	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:59:40.197741	2014-10-09 05:59:40.200868	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 05:59:52.416674	2014-10-09 05:59:52.419504	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:00:25.640724	2014-10-09 06:00:25.644131	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:00:38.096219	2014-10-09 06:00:38.099198	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:00:48.83946	2014-10-09 06:00:48.844243	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:01:38.108098	2014-10-09 06:01:38.111651	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3770	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:01:44.91787	2014-10-09 06:01:44.921284	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:01:49.568991	2014-10-09 06:01:49.572039	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:02:48.007172	2014-10-09 06:02:48.011292	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:03:34.403649	2014-10-09 06:03:34.408101	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:03:43.463662	2014-10-09 06:03:43.467578	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:04:05.828539	2014-10-09 06:04:05.831254	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:05:04.717699	2014-10-09 06:05:04.722279	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:05:12.147406	2014-10-09 06:05:12.151615	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:05:25.605324	2014-10-09 06:05:25.611196	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:05:34.737096	2014-10-09 06:05:34.739848	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:06:07.072021	2014-10-09 06:06:07.074863	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:06:19.638514	2014-10-09 06:06:19.642935	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3782	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:06:43.79692	2014-10-09 06:06:43.799806	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:06:55.521521	2014-10-09 06:06:55.524573	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:07:55.268131	2014-10-09 06:07:55.271931	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3785	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:08:08.104912	2014-10-09 06:08:08.107666	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:25:40.521189	2014-10-09 06:25:40.527246	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:26:00.187698	2014-10-09 06:26:00.192253	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:26:16.910791	2014-10-09 06:26:16.915845	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3789	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:26:43.633617	2014-10-09 06:26:43.636246	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3790	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:26:56.79919	2014-10-09 06:26:56.802321	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:27:06.257016	2014-10-09 06:27:06.259989	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:28:16.969919	2014-10-09 06:28:16.975488	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3793	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:28:27.305089	2014-10-09 06:28:27.307852	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:28:44.685595	2014-10-09 06:28:44.688513	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3795	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:29:10.923193	2014-10-09 06:29:10.926961	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:29:35.805725	2014-10-09 06:29:35.809319	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:29:55.774155	2014-10-09 06:29:55.77706	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:30:24.445242	2014-10-09 06:30:24.449867	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:30:58.168968	2014-10-09 06:30:58.173092	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:31:11.777777	2014-10-09 06:31:11.781634	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:32:19.362972	2014-10-09 06:32:19.366648	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:32:36.890513	2014-10-09 06:32:36.8936	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3803	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:32:46.066169	2014-10-09 06:32:46.070212	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:34:19.552055	2014-10-09 06:34:19.557481	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3805	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:35:01.237631	2014-10-09 06:35:01.24073	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3806	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:36:06.881735	2014-10-09 06:36:06.885258	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3807	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:36:17.10069	2014-10-09 06:36:17.106035	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:36:25.193023	2014-10-09 06:36:25.197575	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3809	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:36:34.114731	2014-10-09 06:36:34.118905	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3810	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:38:24.409247	2014-10-09 06:38:24.412317	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3811	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:38:49.66169	2014-10-09 06:38:49.666961	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:38:52.692539	2014-10-09 06:38:52.696572	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:39:11.813302	2014-10-09 06:39:11.816066	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3814	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:39:30.104872	2014-10-09 06:39:30.108751	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:40:13.706214	2014-10-09 06:40:13.710807	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:41:48.389822	2014-10-09 06:41:48.396101	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:42:03.373698	2014-10-09 06:42:03.376372	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:50:53.230222	2014-10-09 06:50:53.235809	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:51:39.156599	2014-10-09 06:51:39.161245	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3820	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:51:48.666628	2014-10-09 06:51:48.669673	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3821	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:52:18.682942	2014-10-09 06:52:18.686237	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3822	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:52:32.451408	2014-10-09 06:52:32.454558	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:52:47.438135	2014-10-09 06:52:47.441054	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:53:26.267061	2014-10-09 06:53:26.270796	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:53:35.730578	2014-10-09 06:53:35.734833	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:53:48.470192	2014-10-09 06:53:48.472866	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3827	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:53:50.549159	2014-10-09 06:53:50.55359	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:54:01.170053	2014-10-09 06:54:01.174892	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:54:42.938478	2014-10-09 06:54:42.943572	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3830	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 06:59:52.392042	2014-10-09 06:59:52.397355	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:00:47.56536	2014-10-09 07:00:47.570815	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3832	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:00:55.340982	2014-10-09 07:00:55.343621	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:00:59.070211	2014-10-09 07:00:59.073163	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3834	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:01:07.960965	2014-10-09 07:01:07.964036	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3835	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:01:16.379981	2014-10-09 07:01:16.384319	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:01:38.476843	2014-10-09 07:01:38.479836	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3837	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:01:44.163963	2014-10-09 07:01:44.166756	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3838	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:02:47.95077	2014-10-09 07:02:47.954074	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:02:57.817041	2014-10-09 07:02:57.819894	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:06:04.304156	2014-10-09 07:06:04.304156	\N	\N	\N	\N	\N	\N	\N	\N
3841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:06:26.580825	2014-10-09 07:06:26.585962	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:06:46.382874	2014-10-09 07:06:46.386181	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:08:42.307464	2014-10-09 07:08:42.313462	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:08:48.860061	2014-10-09 07:08:48.863102	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:08:52.701549	2014-10-09 07:08:52.706209	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:09:02.693765	2014-10-09 07:09:02.698998	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:09:38.306283	2014-10-09 07:09:38.309499	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:09:43.453094	2014-10-09 07:09:43.458803	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:10:08.028751	2014-10-09 07:10:08.032774	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:10:15.194792	2014-10-09 07:10:15.200085	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:10:40.896677	2014-10-09 07:10:40.90154	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:10:46.157655	2014-10-09 07:10:46.160897	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:12:24.031802	2014-10-09 07:12:24.038015	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3854	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:15:34.246478	2014-10-09 07:15:34.252462	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 07:18:03.586287	2014-10-09 07:18:03.586287	\N	\N	\N	\N	\N	\N	\N	\N
3856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 16:50:30.100194	2014-10-09 16:50:30.130717	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3857	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-09 22:53:40.59874	2014-10-09 22:53:40.634272	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 03:50:56.991519	2014-10-10 03:50:57.018211	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 05:32:43.854766	2014-10-10 05:32:43.884893	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3860	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:15:17.766134	2014-10-10 06:15:17.771972	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:16:46.243736	2014-10-10 06:16:46.248587	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:16:51.384162	2014-10-10 06:16:51.38876	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3863	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:16:57.560774	2014-10-10 06:16:57.563791	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:17:26.243711	2014-10-10 06:17:26.251531	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3865	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:17:34.591545	2014-10-10 06:17:34.594204	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:17:46.020908	2014-10-10 06:17:46.025246	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:17:53.565022	2014-10-10 06:17:53.56792	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3868	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:18:03.990224	2014-10-10 06:18:03.99274	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:18:11.666554	2014-10-10 06:18:11.669447	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:18:21.893736	2014-10-10 06:18:21.897877	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:18:32.136476	2014-10-10 06:18:32.141248	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:18:43.307834	2014-10-10 06:18:43.310624	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:19:17.844444	2014-10-10 06:19:17.849742	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3874	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:19:26.622716	2014-10-10 06:19:26.626824	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3875	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:20:20.394862	2014-10-10 06:20:20.398534	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3876	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:20:31.286846	2014-10-10 06:20:31.289822	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3877	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:20:44.225005	2014-10-10 06:20:44.229504	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:23:58.185753	2014-10-10 06:23:58.191832	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:24:01.819626	2014-10-10 06:24:01.823823	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3880	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:24:19.905891	2014-10-10 06:24:19.911411	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3881	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:24:23.880898	2014-10-10 06:24:23.885211	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:24:26.994959	2014-10-10 06:24:26.999453	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:28:06.223977	2014-10-10 06:28:06.229046	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3884	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:28:20.487492	2014-10-10 06:28:20.493022	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3885	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:28:30.889145	2014-10-10 06:28:30.891866	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:29:14.87371	2014-10-10 06:29:14.878438	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3887	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:29:19.14161	2014-10-10 06:29:19.147473	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:30:02.172382	2014-10-10 06:30:02.176638	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:30:03.363606	2014-10-10 06:30:03.367652	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3890	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:30:04.004336	2014-10-10 06:30:04.008351	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3891	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:30:16.935911	2014-10-10 06:30:16.941179	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3892	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:30:18.091443	2014-10-10 06:30:18.095775	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3893	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:30:19.642702	2014-10-10 06:30:19.647295	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:30:32.881493	2014-10-10 06:30:32.884255	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3895	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:30:34.24405	2014-10-10 06:30:34.248452	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3896	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:31:30.871131	2014-10-10 06:31:30.87754	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:31:54.105477	2014-10-10 06:31:54.108648	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:32:32.397938	2014-10-10 06:32:32.403155	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:33:11.048754	2014-10-10 06:33:11.052238	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3900	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 06:34:46.984324	2014-10-10 06:34:46.989715	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3901	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 07:43:20.852227	2014-10-10 07:43:20.856309	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3902	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 07:49:02.574292	2014-10-10 07:49:02.579872	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3903	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:15:19.312171	2014-10-10 16:15:19.343181	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3904	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:15:23.861017	2014-10-10 16:15:23.864385	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:15:45.252002	2014-10-10 16:15:45.254834	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:29:18.401769	2014-10-10 16:29:18.40924	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3907	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:30:50.152882	2014-10-10 16:30:50.158014	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3908	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:31:37.001325	2014-10-10 16:31:37.007132	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:34:00.285693	2014-10-10 16:34:00.292872	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3910	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:34:36.501364	2014-10-10 16:34:36.506503	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3911	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:36:26.189161	2014-10-10 16:36:26.194711	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:36:37.296851	2014-10-10 16:36:37.30022	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3913	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:36:46.948225	2014-10-10 16:36:46.951135	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:36:53.462974	2014-10-10 16:36:53.465883	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3915	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:36:59.030244	2014-10-10 16:36:59.034191	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:37:41.65245	2014-10-10 16:37:41.658116	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:37:47.937664	2014-10-10 16:37:47.94226	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:37:52.33467	2014-10-10 16:37:52.340027	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:38:17.729294	2014-10-10 16:38:17.734767	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:38:46.075256	2014-10-10 16:38:46.080075	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3921	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:40:06.983122	2014-10-10 16:40:06.990511	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3922	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:40:29.657097	2014-10-10 16:40:29.661184	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:48:22.065282	2014-10-10 16:48:22.065282	\N	\N	\N	\N	\N	\N	\N	\N
3924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:48:22.368862	2014-10-10 16:48:22.368862	\N	\N	\N	\N	\N	\N	\N	\N
3925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:48:37.525069	2014-10-10 16:48:37.525069	\N	\N	\N	\N	\N	\N	\N	\N
3926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:49:06.643676	2014-10-10 16:49:06.648855	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3927	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:49:15.84752	2014-10-10 16:49:15.852024	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3928	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:53:45.712542	2014-10-10 16:53:45.716321	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:53:46.282485	2014-10-10 16:53:46.28697	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3930	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:55:06.544994	2014-10-10 16:55:06.549857	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 16:55:15.888126	2014-10-10 16:55:15.891275	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3932	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:00:34.140694	2014-10-10 17:00:34.146343	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3933	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:00:44.720301	2014-10-10 17:00:44.724045	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:01:33.286426	2014-10-10 17:01:33.29212	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3935	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:02:28.806983	2014-10-10 17:02:28.813966	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3936	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:04:15.839807	2014-10-10 17:04:15.844995	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3937	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:04:42.251414	2014-10-10 17:04:42.255972	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3938	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:05:10.688708	2014-10-10 17:05:10.693281	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:05:49.662845	2014-10-10 17:05:49.66789	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3940	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:19:22.889817	2014-10-10 17:19:22.895794	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:22:44.502694	2014-10-10 17:22:44.506836	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:25:18.67838	2014-10-10 17:25:18.684598	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3943	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:27:14.282953	2014-10-10 17:27:14.286888	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:35:07.198097	2014-10-10 17:35:07.206566	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:42:45.768784	2014-10-10 17:42:45.772647	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3946	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:42:58.055111	2014-10-10 17:42:58.058035	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:42:59.234527	2014-10-10 17:42:59.239206	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3948	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:43:47.524704	2014-10-10 17:43:47.530849	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:44:27.745738	2014-10-10 17:44:27.751516	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3950	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:51:17.710221	2014-10-10 17:51:17.714228	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:51:38.509327	2014-10-10 17:51:38.512081	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3952	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:51:42.868763	2014-10-10 17:51:42.872122	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3953	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:53:01.510257	2014-10-10 17:53:01.51536	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:53:28.280653	2014-10-10 17:53:28.284921	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:54:04.87757	2014-10-10 17:54:04.880408	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:54:11.582478	2014-10-10 17:54:11.585095	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:54:12.460005	2014-10-10 17:54:12.464464	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:54:16.049312	2014-10-10 17:54:16.052325	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:54:25.673746	2014-10-10 17:54:25.678731	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:54:34.838209	2014-10-10 17:54:34.84137	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:54:41.081784	2014-10-10 17:54:41.084759	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:54:46.830134	2014-10-10 17:54:46.834894	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:54:54.557365	2014-10-10 17:54:54.560683	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:56:01.308308	2014-10-10 17:56:01.313728	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:56:38.767497	2014-10-10 17:56:38.771459	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:56:47.057925	2014-10-10 17:56:47.06088	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:56:50.873053	2014-10-10 17:56:50.876033	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:58:47.908582	2014-10-10 17:58:47.914124	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 17:59:55.677826	2014-10-10 17:59:55.681801	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:02:17.339503	2014-10-10 18:02:17.345689	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:03:00.301771	2014-10-10 18:03:00.305866	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:04:01.458567	2014-10-10 18:04:01.463719	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:04:55.306287	2014-10-10 18:04:55.311309	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:06:29.118443	2014-10-10 18:06:29.123717	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:08:00.255144	2014-10-10 18:08:00.363719	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:08:54.547956	2014-10-10 18:08:54.553466	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:10:40.419968	2014-10-10 18:10:40.425086	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:12:17.100877	2014-10-10 18:12:17.10644	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:12:21.235791	2014-10-10 18:12:21.239068	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:12:26.022177	2014-10-10 18:12:26.025687	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:12:38.638508	2014-10-10 18:12:38.642263	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:12:44.916404	2014-10-10 18:12:44.918987	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:12:55.683081	2014-10-10 18:12:55.685761	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:13:28.438448	2014-10-10 18:13:28.442578	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:13:40.227306	2014-10-10 18:13:40.231408	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:15:40.533762	2014-10-10 18:15:40.539252	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:45:55.267935	2014-10-10 18:45:55.271795	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:47:37.147442	2014-10-10 18:47:37.154819	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:47:46.185193	2014-10-10 18:47:46.189184	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:48:24.551866	2014-10-10 18:48:24.558698	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 18:59:41.501038	2014-10-10 18:59:41.507902	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:07:22.647752	2014-10-10 19:07:22.653707	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:11:33.695947	2014-10-10 19:11:33.700689	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:11:35.253715	2014-10-10 19:11:35.257712	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:13:47.850015	2014-10-10 19:13:47.85644	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:14:12.587331	2014-10-10 19:14:12.590889	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:14:47.639283	2014-10-10 19:14:47.643581	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:15:14.269299	2014-10-10 19:15:14.273181	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
3999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:19:51.823832	2014-10-10 19:19:51.829222	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:20:13.184716	2014-10-10 19:20:13.189812	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:20:30.344732	2014-10-10 19:20:30.349743	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:20:58.656447	2014-10-10 19:20:58.660673	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:24:02.651302	2014-10-10 19:24:02.656201	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:24:32.210871	2014-10-10 19:24:32.216903	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:24:45.991423	2014-10-10 19:24:45.99463	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:25:15.081645	2014-10-10 19:25:15.085943	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:29:04.518534	2014-10-10 19:29:04.523388	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:29:53.711546	2014-10-10 19:29:53.718131	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:30:08.941677	2014-10-10 19:30:08.944468	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:30:14.521052	2014-10-10 19:30:14.525576	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:30:32.972303	2014-10-10 19:30:32.977959	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:35:34.238161	2014-10-10 19:35:34.241571	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:36:53.203587	2014-10-10 19:36:53.20942	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:36:55.136878	2014-10-10 19:36:55.140921	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:39:08.357934	2014-10-10 19:39:08.361297	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:42:31.223734	2014-10-10 19:42:31.229694	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:42:39.469205	2014-10-10 19:42:39.472006	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:42:47.608574	2014-10-10 19:42:47.611778	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:44:11.819627	2014-10-10 19:44:11.82446	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4020	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:44:23.563496	2014-10-10 19:44:23.5687	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 19:53:21.733085	2014-10-10 19:53:21.739507	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:03:46.186227	2014-10-10 20:03:46.192075	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4023	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:06:23.27097	2014-10-10 20:06:23.276136	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:06:59.898994	2014-10-10 20:06:59.903476	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4025	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:07:45.842206	2014-10-10 20:07:45.845917	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:07:52.882193	2014-10-10 20:07:52.885194	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:08:07.663799	2014-10-10 20:08:07.66678	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4028	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:08:19.593203	2014-10-10 20:08:19.597512	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:08:26.464181	2014-10-10 20:08:26.467496	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4030	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:09:03.610404	2014-10-10 20:09:03.613338	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:09:13.178231	2014-10-10 20:09:13.180951	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:09:46.925575	2014-10-10 20:09:46.930195	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:09:55.980466	2014-10-10 20:09:55.983334	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:10:55.005524	2014-10-10 20:10:55.009309	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:11:08.56664	2014-10-10 20:11:08.569587	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:11:34.691794	2014-10-10 20:11:34.696864	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:11:41.384959	2014-10-10 20:11:41.387803	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:12:13.537663	2014-10-10 20:12:13.54094	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:12:22.670605	2014-10-10 20:12:22.673605	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4040	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:12:32.187855	2014-10-10 20:12:32.19055	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:13:46.656606	2014-10-10 20:13:46.662219	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:13:58.022164	2014-10-10 20:13:58.025204	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:14:07.045361	2014-10-10 20:14:07.047983	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:14:41.014634	2014-10-10 20:14:41.018732	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:14:45.835069	2014-10-10 20:14:45.837612	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4046	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:15:03.543535	2014-10-10 20:15:03.547117	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:15:18.209207	2014-10-10 20:15:18.213852	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:15:52.877533	2014-10-10 20:15:52.880363	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4049	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:16:03.037174	2014-10-10 20:16:03.040234	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:16:28.893255	2014-10-10 20:16:28.898718	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:17:30.072577	2014-10-10 20:17:30.07592	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4052	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:17:36.771295	2014-10-10 20:17:36.776113	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:17:49.045832	2014-10-10 20:17:49.049288	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:26:11.60137	2014-10-10 20:26:11.606719	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4055	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:27:25.793186	2014-10-10 20:27:25.797436	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4056	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:28:35.262368	2014-10-10 20:28:35.268884	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:28:54.424438	2014-10-10 20:28:54.427236	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4058	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:31:12.77462	2014-10-10 20:31:12.780049	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:31:47.964555	2014-10-10 20:31:47.970345	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:32:05.948958	2014-10-10 20:32:05.951645	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:32:11.135445	2014-10-10 20:32:11.138698	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:32:59.988152	2014-10-10 20:32:59.994001	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:33:11.657584	2014-10-10 20:33:11.660679	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4064	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:33:47.025008	2014-10-10 20:33:47.02918	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:33:56.04583	2014-10-10 20:33:56.05034	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:44:31.315341	2014-10-10 20:44:31.320803	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:44:52.06031	2014-10-10 20:44:52.06031	\N	\N	\N	\N	\N	\N	\N	\N
4068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:46:12.692837	2014-10-10 20:46:12.698749	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:49:07.316451	2014-10-10 20:49:07.32181	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 20:49:30.44882	2014-10-10 20:49:30.454633	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 21:50:20.17791	2014-10-10 21:50:20.183715	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:40:18.333669	2014-10-10 22:40:18.337865	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4073	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:41:02.094282	2014-10-10 22:41:02.098116	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:41:12.113892	2014-10-10 22:41:12.116875	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:41:22.790646	2014-10-10 22:41:22.79588	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:41:29.954694	2014-10-10 22:41:29.957424	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:41:34.556031	2014-10-10 22:41:34.55856	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:42:07.284522	2014-10-10 22:42:07.288998	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:42:10.815397	2014-10-10 22:42:10.819621	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:42:26.583416	2014-10-10 22:42:26.587389	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:42:35.647117	2014-10-10 22:42:35.651667	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4082	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:43:37.113349	2014-10-10 22:43:37.116867	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:44:35.284115	2014-10-10 22:44:35.288174	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:45:34.539983	2014-10-10 22:45:34.54506	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:45:41.055326	2014-10-10 22:45:41.060096	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:45:53.949205	2014-10-10 22:45:53.952496	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:46:03.634259	2014-10-10 22:46:03.638636	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:46:09.990934	2014-10-10 22:46:09.993908	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:46:17.818575	2014-10-10 22:46:17.823978	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:46:25.885743	2014-10-10 22:46:25.89046	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:49:26.503621	2014-10-10 22:49:26.508961	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:49:36.937835	2014-10-10 22:49:36.941337	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:50:15.582202	2014-10-10 22:50:15.585019	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:50:41.202116	2014-10-10 22:50:41.205455	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:50:55.032372	2014-10-10 22:50:55.035787	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:51:32.311171	2014-10-10 22:51:32.318454	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4097	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:51:54.086526	2014-10-10 22:51:54.089472	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:52:32.777578	2014-10-10 22:52:32.782413	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4099	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:53:26.935825	2014-10-10 22:53:26.9424	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:53:39.497091	2014-10-10 22:53:39.500533	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:53:50.060198	2014-10-10 22:53:50.06278	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:54:22.01622	2014-10-10 22:54:22.020637	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:54:33.618852	2014-10-10 22:54:33.621687	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:54:40.954073	2014-10-10 22:54:40.95868	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:55:01.915383	2014-10-10 22:55:01.920026	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:55:21.874697	2014-10-10 22:55:21.878975	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:55:33.472145	2014-10-10 22:55:33.475471	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:55:51.672241	2014-10-10 22:55:51.676729	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:56:06.694794	2014-10-10 22:56:06.697717	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:56:16.084949	2014-10-10 22:56:16.089094	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:57:17.610318	2014-10-10 22:57:17.616886	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:58:31.265012	2014-10-10 22:58:31.27063	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:58:46.015341	2014-10-10 22:58:46.018341	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 22:59:23.71841	2014-10-10 22:59:23.723368	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:01:19.49459	2014-10-10 23:01:19.49975	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4116	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:08:11.426731	2014-10-10 23:08:11.431992	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:12:27.462215	2014-10-10 23:12:27.467167	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:16:53.536138	2014-10-10 23:16:53.541232	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:17:25.12378	2014-10-10 23:17:25.127887	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:18:07.846874	2014-10-10 23:18:07.852649	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:18:32.137907	2014-10-10 23:18:32.141189	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:18:40.189223	2014-10-10 23:18:40.193976	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:19:32.899558	2014-10-10 23:19:32.904784	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:19:57.691296	2014-10-10 23:19:57.694855	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:20:21.520549	2014-10-10 23:20:21.524935	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:20:28.030839	2014-10-10 23:20:28.136958	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:20:34.854903	2014-10-10 23:20:34.859287	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:21:09.466668	2014-10-10 23:21:09.469852	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:21:55.530239	2014-10-10 23:21:55.534255	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:22:20.972755	2014-10-10 23:22:20.977678	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:22:42.613833	2014-10-10 23:22:42.617174	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:23:06.18542	2014-10-10 23:23:06.189924	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:23:17.900456	2014-10-10 23:23:17.906666	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:23:48.856892	2014-10-10 23:23:48.860437	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:24:01.354644	2014-10-10 23:24:01.35834	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:24:23.626462	2014-10-10 23:24:23.631236	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:24:56.426052	2014-10-10 23:24:56.429435	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:25:30.610445	2014-10-10 23:25:30.615733	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:25:58.195661	2014-10-10 23:25:58.198971	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:26:01.002697	2014-10-10 23:26:01.005511	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:26:07.895415	2014-10-10 23:26:07.898284	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:27:14.616575	2014-10-10 23:27:14.622011	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:27:26.301829	2014-10-10 23:27:26.305621	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:28:49.740188	2014-10-10 23:28:49.745742	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:37:57.309465	2014-10-10 23:37:57.315621	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:38:21.585917	2014-10-10 23:38:21.589805	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:38:39.634491	2014-10-10 23:38:39.639086	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:38:51.943199	2014-10-10 23:38:51.947536	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:39:02.022314	2014-10-10 23:39:02.024923	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:39:29.273826	2014-10-10 23:39:29.278626	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:39:56.608821	2014-10-10 23:39:56.614506	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:40:16.054343	2014-10-10 23:40:16.059208	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:40:50.328085	2014-10-10 23:40:50.333269	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:41:18.079042	2014-10-10 23:41:18.082793	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:41:32.790428	2014-10-10 23:41:32.794428	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:41:51.366305	2014-10-10 23:41:51.369092	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:42:24.678057	2014-10-10 23:42:24.681987	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:42:42.622912	2014-10-10 23:42:42.627713	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:43:00.433558	2014-10-10 23:43:00.437965	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:43:11.308126	2014-10-10 23:43:11.311451	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:43:22.267052	2014-10-10 23:43:22.270865	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-10 23:43:38.661008	2014-10-10 23:43:38.664094	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-11 00:07:29.758949	2014-10-11 00:07:29.765263	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-13 19:40:46.19581	2014-10-13 19:40:46.19581	\N	\N	\N	\N	\N	\N	\N	\N
4165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-13 19:42:01.793763	2014-10-13 19:42:01.799468	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-13 19:46:14.782091	2014-10-13 19:46:14.786738	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-13 19:47:11.269576	2014-10-13 19:47:11.273513	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-13 19:50:33.1602	2014-10-13 19:50:33.166023	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-13 19:50:41.529934	2014-10-13 19:50:41.53452	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-13 19:50:48.53117	2014-10-13 19:50:48.534263	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
4171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-10-13 19:50:53.260232	2014-10-13 19:50:53.264882	\N	\N	\N	\N	\N	\N	\N	America/Los_Angeles
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('clients_id_seq', 4171, true);


--
-- Data for Name: email_boxes; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY email_boxes (id, email, created_at, updated_at, landing) FROM stdin;
1	\N	2014-06-26 21:03:48.042027	2014-06-26 21:03:48.042027	\N
2	\N	2014-06-26 21:04:21.298854	2014-06-26 21:04:21.298854	\N
3	\N	2014-06-26 21:06:26.396722	2014-06-26 21:06:26.396722	\N
4	\N	2014-06-26 21:06:28.463785	2014-06-26 21:06:28.463785	\N
5	\N	2014-06-26 21:06:35.816684	2014-06-26 21:06:35.816684	\N
6	\N	2014-06-26 21:06:36.918473	2014-06-26 21:06:36.918473	\N
7	\N	2014-06-26 21:06:53.775263	2014-06-26 21:06:53.775263	\N
8	\N	2014-06-26 21:15:25.060007	2014-06-26 21:15:25.060007	\N
9	\N	2014-06-26 21:17:25.648788	2014-06-26 21:17:25.648788	\N
10	\N	2014-06-26 21:17:31.412323	2014-06-26 21:17:31.412323	\N
11	\N	2014-06-26 21:17:39.199036	2014-06-26 21:17:39.199036	\N
12	\N	2014-06-26 21:21:42.818221	2014-06-26 21:21:42.818221	\N
13	\N	2014-06-26 21:21:51.607807	2014-06-26 21:21:51.607807	\N
14	\N	2014-06-26 21:21:58.961273	2014-06-26 21:21:58.961273	\N
15	\N	2014-06-26 21:22:34.565519	2014-06-26 21:22:34.565519	\N
16	\N	2014-06-26 21:30:33.417516	2014-06-26 21:30:33.417516	\N
17	\N	2014-06-26 21:30:42.448498	2014-06-26 21:30:42.448498	\N
18	\N	2014-06-26 21:31:21.100797	2014-06-26 21:31:21.100797	\N
19	\N	2014-06-26 21:31:32.733639	2014-06-26 21:31:32.733639	\N
20	\N	2014-06-26 21:32:40.080546	2014-06-26 21:32:40.080546	\N
21	\N	2014-06-26 21:42:58.275443	2014-06-26 21:42:58.275443	\N
22	\N	2014-06-26 21:45:00.045334	2014-06-26 21:45:00.045334	\N
23	\N	2014-06-26 21:52:27.123686	2014-06-26 21:52:27.123686	\N
24	\N	2014-06-26 21:52:42.985909	2014-06-26 21:52:42.985909	\N
25	\N	2014-06-26 21:55:03.616463	2014-06-26 21:55:03.616463	\N
26	\N	2014-06-26 21:59:43.524914	2014-06-26 21:59:43.524914	\N
27	\N	2014-06-26 21:59:51.210318	2014-06-26 21:59:51.210318	\N
28	\N	2014-06-26 22:00:22.245619	2014-06-26 22:00:22.245619	\N
29	\N	2014-06-26 22:00:27.663693	2014-06-26 22:00:27.663693	\N
30	\N	2014-06-26 22:06:00.920606	2014-06-26 22:06:00.920606	\N
31	\N	2014-06-26 22:06:06.866164	2014-06-26 22:06:06.866164	\N
32	\N	2014-06-26 22:07:34.770718	2014-06-26 22:07:34.770718	\N
33	\N	2014-06-26 22:07:43.254824	2014-06-26 22:07:43.254824	\N
34	\N	2014-06-26 22:10:36.409144	2014-06-26 22:10:36.409144	\N
35	\N	2014-06-26 22:11:03.900263	2014-06-26 22:11:03.900263	\N
36	\N	2014-06-26 22:11:28.750465	2014-06-26 22:11:28.750465	\N
37	\N	2014-06-26 22:16:37.120725	2014-06-26 22:16:37.120725	\N
38	\N	2014-06-26 22:19:08.472449	2014-06-26 22:19:08.472449	\N
39	\N	2014-06-26 22:19:32.173144	2014-06-26 22:19:32.173144	\N
40	\N	2014-06-26 22:20:15.229211	2014-06-26 22:20:15.229211	\N
41	\N	2014-06-26 22:22:09.404086	2014-06-26 22:22:09.404086	\N
42	\N	2014-06-26 22:24:14.928511	2014-06-26 22:24:14.928511	\N
43	\N	2014-06-26 22:55:52.60216	2014-06-26 22:55:52.60216	\N
44	\N	2014-06-26 22:56:07.905831	2014-06-26 22:56:07.905831	\N
45	\N	2014-06-26 22:56:26.243656	2014-06-26 22:56:26.243656	\N
46	\N	2014-06-26 22:56:48.134765	2014-06-26 22:56:48.134765	\N
47	\N	2014-06-26 22:58:19.153626	2014-06-26 22:58:19.153626	\N
48	\N	2014-06-26 23:02:46.002785	2014-06-26 23:02:46.002785	\N
49	\N	2014-06-26 23:04:05.758431	2014-06-26 23:04:05.758431	\N
50	\N	2014-06-26 23:05:26.857568	2014-06-26 23:05:26.857568	\N
51	\N	2014-06-26 23:08:19.131567	2014-06-26 23:08:19.131567	\N
52	\N	2014-06-26 23:12:23.194608	2014-06-26 23:12:23.194608	\N
53	\N	2014-06-26 23:14:41.84255	2014-06-26 23:14:41.84255	\N
54	\N	2014-06-26 23:22:41.037633	2014-06-26 23:22:41.037633	\N
55	\N	2014-06-26 23:22:52.891326	2014-06-26 23:22:52.891326	\N
56	\N	2014-06-26 23:23:25.880901	2014-06-26 23:23:25.880901	\N
57	\N	2014-06-26 23:25:53.387844	2014-06-26 23:25:53.387844	\N
58	\N	2014-06-26 23:27:17.051016	2014-06-26 23:27:17.051016	\N
59	\N	2014-06-26 23:27:46.003619	2014-06-26 23:27:46.003619	\N
60	\N	2014-06-27 00:53:45.530498	2014-06-27 00:53:45.530498	\N
61	\N	2014-06-27 00:54:35.010261	2014-06-27 00:54:35.010261	\N
62	\N	2014-06-27 00:57:21.113136	2014-06-27 00:57:21.113136	\N
63	\N	2014-06-27 00:58:24.026648	2014-06-27 00:58:24.026648	\N
64	\N	2014-06-27 00:59:44.213981	2014-06-27 00:59:44.213981	\N
65	\N	2014-06-27 01:01:11.950248	2014-06-27 01:01:11.950248	\N
66	\N	2014-06-27 01:01:22.373897	2014-06-27 01:01:22.373897	\N
67	\N	2014-06-27 01:14:56.796789	2014-06-27 01:14:56.796789	\N
68	\N	2014-06-27 01:16:52.143854	2014-06-27 01:16:52.143854	\N
69	\N	2014-06-27 01:17:47.55374	2014-06-27 01:17:47.55374	\N
70	\N	2014-06-27 01:18:27.406132	2014-06-27 01:18:27.406132	\N
71	\N	2014-06-27 01:21:50.793562	2014-06-27 01:21:50.793562	\N
72	\N	2014-06-27 01:21:52.10992	2014-06-27 01:21:52.10992	\N
73	\N	2014-06-27 01:21:59.327063	2014-06-27 01:21:59.327063	\N
74	\N	2014-06-27 01:24:58.072932	2014-06-27 01:24:58.072932	\N
75	\N	2014-06-27 01:26:52.137159	2014-06-27 01:26:52.137159	\N
76	\N	2014-06-27 01:28:42.717947	2014-06-27 01:28:42.717947	\N
77	\N	2014-06-27 01:31:03.896049	2014-06-27 01:31:03.896049	\N
78	\N	2014-06-27 03:18:15.083854	2014-06-27 03:18:15.083854	\N
79	\N	2014-06-27 03:20:20.830167	2014-06-27 03:20:20.830167	\N
80	\N	2014-06-27 03:21:26.81198	2014-06-27 03:21:26.81198	\N
81	\N	2014-06-27 03:27:07.4582	2014-06-27 03:27:07.4582	\N
82	\N	2014-06-27 03:30:42.288465	2014-06-27 03:30:42.288465	\N
83	\N	2014-06-27 03:32:26.410503	2014-06-27 03:32:26.410503	\N
84	\N	2014-06-27 03:34:40.833932	2014-06-27 03:34:40.833932	\N
85	\N	2014-06-27 03:36:23.771435	2014-06-27 03:36:23.771435	\N
86	\N	2014-06-27 03:37:42.172485	2014-06-27 03:37:42.172485	\N
87	\N	2014-06-27 03:41:31.98511	2014-06-27 03:41:31.98511	\N
88	\N	2014-06-27 03:42:28.834389	2014-06-27 03:42:28.834389	\N
89	\N	2014-06-27 03:43:33.337754	2014-06-27 03:43:33.337754	\N
90	\N	2014-06-27 03:43:40.184113	2014-06-27 03:43:40.184113	\N
91	\N	2014-06-27 03:44:35.68653	2014-06-27 03:44:35.68653	\N
92	\N	2014-06-27 03:44:46.057579	2014-06-27 03:44:46.057579	\N
93	\N	2014-06-27 03:45:09.746717	2014-06-27 03:45:09.746717	\N
94	\N	2014-06-27 03:46:30.76269	2014-06-27 03:46:30.76269	\N
95	\N	2014-06-27 03:48:28.083936	2014-06-27 03:48:28.083936	\N
96	\N	2014-06-27 03:50:30.277264	2014-06-27 03:50:30.277264	\N
97	\N	2014-06-27 03:51:08.949832	2014-06-27 03:51:08.949832	\N
98	\N	2014-06-27 03:52:13.894003	2014-06-27 03:52:13.894003	\N
99	\N	2014-06-27 03:52:49.334094	2014-06-27 03:52:49.334094	\N
100	\N	2014-06-27 03:59:08.606592	2014-06-27 03:59:08.606592	\N
101	\N	2014-06-27 03:59:37.68377	2014-06-27 03:59:37.68377	\N
102	\N	2014-06-27 04:26:07.851263	2014-06-27 04:26:07.851263	\N
103	\N	2014-06-27 04:28:00.428931	2014-06-27 04:28:00.428931	\N
104	\N	2014-06-27 04:29:19.270057	2014-06-27 04:29:19.270057	\N
105	\N	2014-06-27 04:33:16.501933	2014-06-27 04:33:16.501933	\N
106	\N	2014-06-27 04:34:16.096494	2014-06-27 04:34:16.096494	\N
107	\N	2014-06-27 04:42:42.57564	2014-06-27 04:42:42.57564	\N
108	\N	2014-06-27 04:47:33.806845	2014-06-27 04:47:33.806845	\N
109	\N	2014-06-27 05:05:04.412828	2014-06-27 05:05:04.412828	\N
110	\N	2014-06-27 05:24:09.401026	2014-06-27 05:24:09.401026	\N
111	\N	2014-06-27 05:53:39.15787	2014-06-27 05:53:39.15787	\N
112	\N	2014-06-27 05:53:44.895284	2014-06-27 05:53:44.895284	\N
113	\N	2014-06-27 15:46:07.984483	2014-06-27 15:46:07.984483	\N
114	\N	2014-06-27 15:46:18.438332	2014-06-27 15:46:18.438332	\N
115	\N	2014-06-27 15:46:33.671156	2014-06-27 15:46:33.671156	\N
116	\N	2014-06-27 15:50:43.194402	2014-06-27 15:50:43.194402	\N
117	\N	2014-06-27 17:05:49.569517	2014-06-27 17:05:49.569517	\N
118	\N	2014-06-27 17:15:55.51201	2014-06-27 17:15:55.51201	\N
119	\N	2014-06-27 17:17:05.33514	2014-06-27 17:17:05.33514	\N
120	\N	2014-06-27 17:18:21.168633	2014-06-27 17:18:21.168633	\N
121	\N	2014-06-27 17:25:46.171426	2014-06-27 17:25:46.171426	\N
122	\N	2014-06-27 17:25:52.750519	2014-06-27 17:25:52.750519	\N
123	\N	2014-06-27 17:25:57.506829	2014-06-27 17:25:57.506829	\N
124	\N	2014-06-27 17:34:22.515876	2014-06-27 17:34:22.515876	\N
125	\N	2014-06-27 17:35:13.69929	2014-06-27 17:35:13.69929	\N
126	\N	2014-06-27 17:37:54.948689	2014-06-27 17:37:54.948689	\N
127	\N	2014-06-27 17:56:36.407984	2014-06-27 17:56:36.407984	\N
128	\N	2014-06-27 17:57:07.884316	2014-06-27 17:57:07.884316	\N
129	\N	2014-06-27 18:14:55.906964	2014-06-27 18:14:55.906964	\N
130	\N	2014-06-27 21:01:09.478718	2014-06-27 21:01:09.478718	\N
131	\N	2014-06-27 22:39:02.052317	2014-06-27 22:39:02.052317	\N
132	\N	2014-06-27 22:55:59.131801	2014-06-27 22:55:59.131801	\N
133	\N	2014-06-27 22:57:04.824302	2014-06-27 22:57:04.824302	\N
134	\N	2014-06-27 23:00:04.85071	2014-06-27 23:00:04.85071	\N
135	\N	2014-06-27 23:01:08.675466	2014-06-27 23:01:08.675466	\N
136	\N	2014-06-27 23:02:02.881998	2014-06-27 23:02:02.881998	\N
137	\N	2014-06-27 23:05:29.769819	2014-06-27 23:05:29.769819	\N
138	\N	2014-06-27 23:08:41.645422	2014-06-27 23:08:41.645422	\N
139	\N	2014-06-27 23:09:05.823009	2014-06-27 23:09:05.823009	\N
140	\N	2014-06-27 23:28:21.77485	2014-06-27 23:28:21.77485	\N
141	\N	2014-06-27 23:31:33.786744	2014-06-27 23:31:33.786744	\N
142	\N	2014-06-28 22:26:12.809948	2014-06-28 22:26:12.809948	\N
143	\N	2014-06-28 22:26:46.458095	2014-06-28 22:26:46.458095	\N
144	\N	2014-06-28 22:27:38.120728	2014-06-28 22:27:38.120728	\N
145	\N	2014-06-28 22:27:50.272414	2014-06-28 22:27:50.272414	\N
146	\N	2014-06-28 22:41:00.647468	2014-06-28 22:41:00.647468	\N
147	\N	2014-06-28 22:41:08.770021	2014-06-28 22:41:08.770021	\N
148	\N	2014-06-28 22:42:37.197236	2014-06-28 22:42:37.197236	\N
149	\N	2014-06-28 22:44:33.19734	2014-06-28 22:44:33.19734	\N
150	\N	2014-06-28 22:45:38.310164	2014-06-28 22:45:38.310164	\N
151	\N	2014-06-28 22:53:07.940831	2014-06-28 22:53:07.940831	\N
152	\N	2014-06-28 23:02:45.783682	2014-06-28 23:02:45.783682	\N
153	\N	2014-06-28 23:20:31.061534	2014-06-28 23:20:31.061534	\N
154	\N	2014-06-28 23:20:34.339679	2014-06-28 23:20:34.339679	\N
155	\N	2014-06-28 23:20:57.768568	2014-06-28 23:20:57.768568	\N
156	\N	2014-06-28 23:23:07.818144	2014-06-28 23:23:07.818144	\N
157	\N	2014-06-28 23:28:58.725851	2014-06-28 23:28:58.725851	\N
158	\N	2014-06-29 01:38:29.439531	2014-06-29 01:38:29.439531	\N
159	\N	2014-06-29 01:41:04.366433	2014-06-29 01:41:04.366433	\N
160	\N	2014-06-29 02:56:53.076137	2014-06-29 02:56:53.076137	\N
161	\N	2014-06-29 03:06:42.601162	2014-06-29 03:06:42.601162	\N
162	\N	2014-06-29 03:07:49.633974	2014-06-29 03:07:49.633974	\N
163	\N	2014-06-29 03:10:23.079689	2014-06-29 03:10:23.079689	\N
164	\N	2014-06-29 03:11:15.217756	2014-06-29 03:11:15.217756	\N
165	\N	2014-06-29 03:12:12.785759	2014-06-29 03:12:12.785759	\N
166	\N	2014-06-29 14:54:38.190505	2014-06-29 14:54:38.190505	\N
167	\N	2014-06-29 15:43:44.48273	2014-06-29 15:43:44.48273	\N
168	\N	2014-06-29 15:49:14.309451	2014-06-29 15:49:14.309451	\N
169	\N	2014-06-29 15:52:33.42388	2014-06-29 15:52:33.42388	\N
170	\N	2014-06-29 15:58:25.652425	2014-06-29 15:58:25.652425	\N
171	\N	2014-06-29 16:15:54.938063	2014-06-29 16:15:54.938063	\N
172	\N	2014-06-29 16:19:49.866213	2014-06-29 16:19:49.866213	\N
173	\N	2014-06-29 16:19:57.824707	2014-06-29 16:19:57.824707	\N
174	\N	2014-06-29 18:20:23.859209	2014-06-29 18:20:23.859209	\N
175	\N	2014-06-29 18:24:02.021566	2014-06-29 18:24:02.021566	\N
176	\N	2014-06-29 18:24:38.332438	2014-06-29 18:24:38.332438	\N
177	\N	2014-06-29 18:28:11.956972	2014-06-29 18:28:11.956972	\N
178	\N	2014-06-29 18:29:18.383629	2014-06-29 18:29:18.383629	\N
179	\N	2014-06-29 18:33:11.12609	2014-06-29 18:33:11.12609	\N
180	\N	2014-06-29 18:33:30.544555	2014-06-29 18:33:30.544555	\N
181	\N	2014-06-29 18:35:02.856399	2014-06-29 18:35:02.856399	\N
182	\N	2014-06-29 18:35:21.262537	2014-06-29 18:35:21.262537	\N
183	\N	2014-06-29 18:43:59.893461	2014-06-29 18:43:59.893461	\N
184	\N	2014-06-29 18:44:56.911219	2014-06-29 18:44:56.911219	\N
185	\N	2014-06-29 19:02:13.86577	2014-06-29 19:02:13.86577	\N
186	\N	2014-06-29 19:13:50.068238	2014-06-29 19:13:50.068238	\N
187	\N	2014-06-29 19:27:28.644842	2014-06-29 19:27:28.644842	\N
188	\N	2014-06-29 20:36:20.864865	2014-06-29 20:36:20.864865	\N
189	\N	2014-06-29 20:50:42.664864	2014-06-29 20:50:42.664864	\N
190	\N	2014-06-29 20:50:54.070803	2014-06-29 20:50:54.070803	\N
191	\N	2014-06-29 20:53:41.007616	2014-06-29 20:53:41.007616	\N
192	\N	2014-06-29 22:14:32.521599	2014-06-29 22:14:32.521599	\N
193	\N	2014-06-29 22:14:40.897364	2014-06-29 22:14:40.897364	\N
194	\N	2014-06-29 22:16:34.58597	2014-06-29 22:16:34.58597	\N
195	\N	2014-06-29 22:19:27.703923	2014-06-29 22:19:27.703923	\N
196	\N	2014-06-29 22:21:01.6519	2014-06-29 22:21:01.6519	\N
197	\N	2014-06-29 23:15:45.874755	2014-06-29 23:15:45.874755	\N
198	\N	2014-06-29 23:16:54.169227	2014-06-29 23:16:54.169227	\N
199	\N	2014-06-29 23:21:37.683805	2014-06-29 23:21:37.683805	\N
200	\N	2014-06-29 23:24:52.382382	2014-06-29 23:24:52.382382	\N
201	\N	2014-06-29 23:28:09.29869	2014-06-29 23:28:09.29869	\N
202	\N	2014-06-29 23:30:06.716017	2014-06-29 23:30:06.716017	\N
203	\N	2014-06-29 23:31:45.444753	2014-06-29 23:31:45.444753	\N
204	\N	2014-06-29 23:36:47.047669	2014-06-29 23:36:47.047669	\N
205	\N	2014-06-29 23:37:34.728923	2014-06-29 23:37:34.728923	\N
206	\N	2014-06-29 23:38:17.240002	2014-06-29 23:38:17.240002	\N
207	\N	2014-06-29 23:39:05.008991	2014-06-29 23:39:05.008991	\N
208	\N	2014-06-29 23:39:52.129621	2014-06-29 23:39:52.129621	\N
209	\N	2014-06-29 23:45:19.286719	2014-06-29 23:45:19.286719	\N
210	\N	2014-06-29 23:47:57.072365	2014-06-29 23:47:57.072365	\N
211	\N	2014-06-29 23:52:00.553141	2014-06-29 23:52:00.553141	\N
212	\N	2014-06-29 23:53:43.273907	2014-06-29 23:53:43.273907	\N
213	\N	2014-06-29 23:56:26.731172	2014-06-29 23:56:26.731172	\N
214	\N	2014-06-29 23:59:07.125083	2014-06-29 23:59:07.125083	\N
215	\N	2014-06-30 00:03:26.825279	2014-06-30 00:03:26.825279	\N
216	\N	2014-06-30 00:05:50.760867	2014-06-30 00:05:50.760867	\N
217	\N	2014-06-30 00:06:04.74254	2014-06-30 00:06:04.74254	\N
218	\N	2014-06-30 00:08:44.793939	2014-06-30 00:08:44.793939	\N
219	\N	2014-06-30 00:21:45.07185	2014-06-30 00:21:45.07185	\N
220	\N	2014-06-30 00:40:05.208095	2014-06-30 00:40:05.208095	\N
221	\N	2014-06-30 00:40:25.883099	2014-06-30 00:40:25.883099	\N
222	\N	2014-06-30 00:41:30.096892	2014-06-30 00:41:30.096892	\N
223	\N	2014-06-30 00:51:36.405323	2014-06-30 00:51:36.405323	\N
224	\N	2014-06-30 01:11:17.928378	2014-06-30 01:11:17.928378	\N
225	\N	2014-06-30 01:12:25.475567	2014-06-30 01:12:25.475567	\N
226	\N	2014-06-30 01:14:39.606726	2014-06-30 01:14:39.606726	\N
227	\N	2014-06-30 01:15:04.126747	2014-06-30 01:15:04.126747	\N
228	\N	2014-06-30 01:15:24.554689	2014-06-30 01:15:24.554689	\N
229	\N	2014-06-30 01:15:29.331812	2014-06-30 01:15:29.331812	\N
230	\N	2014-06-30 02:10:32.548928	2014-06-30 02:10:32.548928	\N
231	\N	2014-06-30 02:17:41.540493	2014-06-30 02:17:41.540493	\N
232	\N	2014-06-30 02:18:17.139975	2014-06-30 02:18:17.139975	\N
233	\N	2014-06-30 02:18:55.178967	2014-06-30 02:18:55.178967	\N
234	\N	2014-06-30 02:19:57.176579	2014-06-30 02:19:57.176579	\N
235	\N	2014-06-30 02:22:24.801643	2014-06-30 02:22:24.801643	\N
236	\N	2014-06-30 02:23:24.69647	2014-06-30 02:23:24.69647	\N
237	\N	2014-06-30 02:23:25.892176	2014-06-30 02:23:25.892176	\N
238	\N	2014-06-30 02:23:35.016106	2014-06-30 02:23:35.016106	\N
239	\N	2014-06-30 02:26:27.643386	2014-06-30 02:26:27.643386	\N
240	\N	2014-06-30 04:03:49.847132	2014-06-30 04:03:49.847132	\N
241	\N	2014-06-30 04:07:29.815372	2014-06-30 04:07:29.815372	\N
242	\N	2014-06-30 04:07:36.371873	2014-06-30 04:07:36.371873	\N
243	\N	2014-06-30 04:08:46.526431	2014-06-30 04:08:46.526431	\N
244	\N	2014-06-30 04:09:02.490413	2014-06-30 04:09:02.490413	\N
245	\N	2014-06-30 04:10:17.585461	2014-06-30 04:10:17.585461	\N
246	\N	2014-06-30 04:11:54.858802	2014-06-30 04:11:54.858802	\N
247	\N	2014-06-30 04:13:55.477889	2014-06-30 04:13:55.477889	\N
248	\N	2014-06-30 04:13:59.632659	2014-06-30 04:13:59.632659	\N
249	\N	2014-06-30 04:23:49.130609	2014-06-30 04:23:49.130609	\N
250	\N	2014-06-30 04:27:25.655752	2014-06-30 04:27:25.655752	\N
251	\N	2014-06-30 05:14:30.032702	2014-06-30 05:14:30.032702	\N
252	\N	2014-06-30 05:35:26.178695	2014-06-30 05:35:26.178695	\N
253	\N	2014-06-30 05:37:23.400626	2014-06-30 05:37:23.400626	\N
254	\N	2014-06-30 05:38:59.333935	2014-06-30 05:38:59.333935	\N
255	\N	2014-06-30 05:39:10.011839	2014-06-30 05:39:10.011839	\N
256	\N	2014-06-30 05:40:52.836571	2014-06-30 05:40:52.836571	\N
257	\N	2014-06-30 05:41:27.760203	2014-06-30 05:41:27.760203	\N
258	\N	2014-06-30 05:44:11.854004	2014-06-30 05:44:11.854004	\N
259	\N	2014-06-30 05:44:29.680199	2014-06-30 05:44:29.680199	\N
260	\N	2014-06-30 05:45:51.207441	2014-06-30 05:45:51.207441	\N
261	\N	2014-06-30 05:47:07.839567	2014-06-30 05:47:07.839567	\N
262	\N	2014-06-30 05:48:10.815544	2014-06-30 05:48:10.815544	\N
263	\N	2014-06-30 05:51:18.217021	2014-06-30 05:51:18.217021	\N
264	\N	2014-06-30 05:52:53.954486	2014-06-30 05:52:53.954486	\N
265	\N	2014-06-30 05:58:24.770148	2014-06-30 05:58:24.770148	\N
266	\N	2014-06-30 05:59:43.076013	2014-06-30 05:59:43.076013	\N
267	\N	2014-06-30 06:21:13.796391	2014-06-30 06:21:13.796391	\N
268	\N	2014-06-30 06:24:16.750736	2014-06-30 06:24:16.750736	\N
269	\N	2014-06-30 06:29:51.134555	2014-06-30 06:29:51.134555	\N
270	\N	2014-06-30 06:32:48.68647	2014-06-30 06:32:48.68647	\N
271	\N	2014-06-30 06:32:52.592692	2014-06-30 06:32:52.592692	\N
272	\N	2014-06-30 06:44:58.184091	2014-06-30 06:44:58.184091	\N
273	\N	2014-06-30 06:45:46.955081	2014-06-30 06:45:46.955081	\N
274	\N	2014-06-30 06:47:53.500754	2014-06-30 06:47:53.500754	\N
275	\N	2014-06-30 06:51:23.877857	2014-06-30 06:51:23.877857	\N
276	\N	2014-06-30 06:54:58.881968	2014-06-30 06:54:58.881968	\N
277	\N	2014-06-30 06:57:45.450713	2014-06-30 06:57:45.450713	\N
278	\N	2014-06-30 07:02:14.721492	2014-06-30 07:02:14.721492	\N
279	\N	2014-06-30 07:05:08.280588	2014-06-30 07:05:08.280588	\N
280	\N	2014-06-30 07:08:11.695529	2014-06-30 07:08:11.695529	\N
281	\N	2014-06-30 07:11:04.117192	2014-06-30 07:11:04.117192	\N
282	\N	2014-06-30 07:17:15.644465	2014-06-30 07:17:15.644465	\N
283	\N	2014-06-30 07:18:32.355965	2014-06-30 07:18:32.355965	\N
284	\N	2014-06-30 07:19:24.949747	2014-06-30 07:19:24.949747	\N
285	\N	2014-06-30 07:26:45.40672	2014-06-30 07:26:45.40672	\N
286	\N	2014-06-30 15:49:31.983879	2014-06-30 15:49:31.983879	\N
287	\N	2014-06-30 15:49:50.72695	2014-06-30 15:49:50.72695	\N
288	\N	2014-06-30 18:53:10.515822	2014-06-30 18:53:10.515822	\N
289	\N	2014-06-30 18:57:20.744253	2014-06-30 18:57:20.744253	\N
290	\N	2014-06-30 19:12:25.405652	2014-06-30 19:12:25.405652	\N
291	\N	2014-06-30 19:18:43.335153	2014-06-30 19:18:43.335153	\N
292	\N	2014-06-30 19:18:56.51248	2014-06-30 19:18:56.51248	\N
293	\N	2014-06-30 19:19:12.874453	2014-06-30 19:19:12.874453	\N
294	\N	2014-06-30 19:19:18.581777	2014-06-30 19:19:18.581777	\N
295	\N	2014-06-30 19:19:22.245214	2014-06-30 19:19:22.245214	\N
296	\N	2014-06-30 19:19:50.00863	2014-06-30 19:19:50.00863	\N
297	\N	2014-06-30 19:20:00.907632	2014-06-30 19:20:00.907632	\N
298	\N	2014-06-30 20:45:10.480813	2014-06-30 20:45:10.480813	\N
299	\N	2014-06-30 20:45:53.297952	2014-06-30 20:45:53.297952	\N
300	\N	2014-06-30 20:47:02.577766	2014-06-30 20:47:02.577766	\N
301	\N	2014-06-30 20:48:23.477989	2014-06-30 20:48:23.477989	\N
302	\N	2014-06-30 20:50:30.957901	2014-06-30 20:50:30.957901	\N
303	\N	2014-06-30 20:51:33.677409	2014-06-30 20:51:33.677409	\N
304	\N	2014-06-30 20:55:54.858255	2014-06-30 20:55:54.858255	\N
305	\N	2014-06-30 21:13:47.448822	2014-06-30 21:13:47.448822	\N
306	\N	2014-06-30 21:21:08.983267	2014-06-30 21:21:08.983267	\N
307	\N	2014-06-30 21:22:02.912485	2014-06-30 21:22:02.912485	\N
308	\N	2014-07-01 00:03:05.715843	2014-07-01 00:03:05.715843	\N
309	\N	2014-07-01 00:13:19.507627	2014-07-01 00:13:19.507627	\N
310	\N	2014-07-03 03:59:40.517997	2014-07-03 03:59:40.517997	\N
311	\N	2014-07-03 04:00:12.421462	2014-07-03 04:00:12.421462	\N
312	\N	2014-07-06 21:54:55.579138	2014-07-06 21:54:55.579138	\N
313	\N	2014-07-06 21:57:08.495808	2014-07-06 21:57:08.495808	\N
314	\N	2014-07-06 21:58:42.187778	2014-07-06 21:58:42.187778	\N
315	\N	2014-07-06 22:14:42.357091	2014-07-06 22:14:42.357091	\N
316	\N	2014-07-06 22:16:09.77035	2014-07-06 22:16:09.77035	\N
317	\N	2014-07-06 22:19:10.09403	2014-07-06 22:19:10.09403	\N
319	\N	2014-07-07 13:20:31.468579	2014-07-07 13:20:31.468579	\N
324	\N	2014-07-07 18:30:36.946361	2014-07-07 18:30:36.946361	\N
325	\N	2014-07-07 18:31:18.08221	2014-07-07 18:31:18.08221	\N
326	\N	2014-07-07 18:31:27.033641	2014-07-07 18:31:27.033641	\N
341	\N	2014-07-07 18:36:30.956997	2014-07-07 18:36:30.956997	\N
342	\N	2014-07-07 18:36:45.665962	2014-07-07 18:36:45.665962	\N
343	\N	2014-07-07 18:37:21.697247	2014-07-07 18:37:21.697247	\N
344	\N	2014-07-07 18:38:57.101632	2014-07-07 18:38:57.101632	\N
345	\N	2014-07-07 18:39:37.674381	2014-07-07 18:39:37.674381	\N
346	\N	2014-07-07 18:39:43.049602	2014-07-07 18:39:43.049602	\N
347	\N	2014-07-07 18:39:46.290022	2014-07-07 18:39:46.290022	\N
350	\N	2014-07-07 20:22:29.690745	2014-07-07 20:22:29.690745	\N
352	\N	2014-07-08 01:17:13.688628	2014-07-08 01:17:13.688628	\N
318	\N	2014-07-07 13:19:44.855054	2014-07-07 13:19:44.855054	\N
320	\N	2014-07-07 13:25:43.120985	2014-07-07 13:25:43.120985	\N
321	\N	2014-07-07 17:02:54.240664	2014-07-07 17:02:54.240664	\N
322	\N	2014-07-07 17:58:20.403292	2014-07-07 17:58:20.403292	\N
323	\N	2014-07-07 18:28:16.509285	2014-07-07 18:28:16.509285	\N
327	\N	2014-07-07 18:31:45.945009	2014-07-07 18:31:45.945009	\N
328	\N	2014-07-07 18:31:54.000822	2014-07-07 18:31:54.000822	\N
329	\N	2014-07-07 18:32:02.737238	2014-07-07 18:32:02.737238	\N
330	\N	2014-07-07 18:32:34.837978	2014-07-07 18:32:34.837978	\N
331	\N	2014-07-07 18:33:17.11576	2014-07-07 18:33:17.11576	\N
332	\N	2014-07-07 18:33:44.360083	2014-07-07 18:33:44.360083	\N
333	\N	2014-07-07 18:33:49.336406	2014-07-07 18:33:49.336406	\N
334	\N	2014-07-07 18:33:59.600116	2014-07-07 18:33:59.600116	\N
335	\N	2014-07-07 18:34:05.841574	2014-07-07 18:34:05.841574	\N
336	\N	2014-07-07 18:34:10.159534	2014-07-07 18:34:10.159534	\N
337	\N	2014-07-07 18:34:13.615953	2014-07-07 18:34:13.615953	\N
338	\N	2014-07-07 18:34:28.111137	2014-07-07 18:34:28.111137	\N
339	\N	2014-07-07 18:34:55.241182	2014-07-07 18:34:55.241182	\N
340	\N	2014-07-07 18:35:06.129109	2014-07-07 18:35:06.129109	\N
348	\N	2014-07-07 18:40:07.464299	2014-07-07 18:40:07.464299	\N
349	\N	2014-07-07 20:20:14.72629	2014-07-07 20:20:14.72629	\N
351	\N	2014-07-08 01:08:11.574859	2014-07-08 01:08:11.574859	\N
353	\N	2014-07-08 01:17:52.519333	2014-07-08 01:17:52.519333	\N
354	\N	2014-07-08 23:07:06.937754	2014-07-08 23:07:06.937754	\N
355	\N	2014-07-09 00:33:15.047541	2014-07-09 00:33:15.047541	\N
356	\N	2014-07-09 11:24:22.330211	2014-07-09 11:24:22.330211	\N
357	\N	2014-07-09 11:39:47.699041	2014-07-09 11:39:47.699041	\N
358	\N	2014-07-10 12:23:21.218895	2014-07-10 12:23:21.218895	\N
359	\N	2014-07-10 12:25:58.805906	2014-07-10 12:25:58.805906	\N
360	\N	2014-07-10 12:26:05.001767	2014-07-10 12:26:05.001767	\N
361	\N	2014-07-10 12:27:23.514774	2014-07-10 12:27:23.514774	\N
362	\N	2014-07-10 12:27:43.010192	2014-07-10 12:27:43.010192	\N
363	\N	2014-07-10 12:27:49.109548	2014-07-10 12:27:49.109548	\N
364	\N	2014-07-10 12:30:34.429663	2014-07-10 12:30:34.429663	\N
365	\N	2014-07-10 12:30:44.619753	2014-07-10 12:30:44.619753	\N
366	\N	2014-07-10 12:35:16.803718	2014-07-10 12:35:16.803718	\N
367	\N	2014-07-10 12:35:24.317725	2014-07-10 12:35:24.317725	\N
368	\N	2014-07-10 12:35:28.322657	2014-07-10 12:35:28.322657	\N
369	\N	2014-07-10 12:35:34.883865	2014-07-10 12:35:34.883865	\N
370	\N	2014-07-10 12:36:19.910048	2014-07-10 12:36:19.910048	\N
371	\N	2014-07-10 12:36:50.420135	2014-07-10 12:36:50.420135	\N
372	\N	2014-07-10 12:37:08.057761	2014-07-10 12:37:08.057761	\N
373	\N	2014-07-10 12:45:30.670966	2014-07-10 12:45:30.670966	\N
374	\N	2014-07-10 12:45:48.011831	2014-07-10 12:45:48.011831	\N
375	\N	2014-07-10 12:46:14.275909	2014-07-10 12:46:14.275909	\N
376	\N	2014-07-10 12:48:01.762363	2014-07-10 12:48:01.762363	\N
377	\N	2014-07-10 12:48:43.591937	2014-07-10 12:48:43.591937	\N
378	\N	2014-07-10 12:49:12.567097	2014-07-10 12:49:12.567097	\N
379	\N	2014-07-10 12:49:20.50188	2014-07-10 12:49:20.50188	\N
380	\N	2014-07-10 12:49:57.094914	2014-07-10 12:49:57.094914	\N
381	\N	2014-07-10 12:50:25.416223	2014-07-10 12:50:25.416223	\N
382	\N	2014-07-10 12:50:33.304797	2014-07-10 12:50:33.304797	\N
383	\N	2014-07-10 12:53:26.004936	2014-07-10 12:53:26.004936	\N
384	\N	2014-07-10 12:54:03.974066	2014-07-10 12:54:03.974066	\N
385	\N	2014-07-10 12:59:56.260552	2014-07-10 12:59:56.260552	\N
386	\N	2014-07-10 13:00:09.795221	2014-07-10 13:00:09.795221	\N
387	\N	2014-07-10 13:01:38.861176	2014-07-10 13:01:38.861176	\N
388	\N	2014-07-10 13:01:53.380898	2014-07-10 13:01:53.380898	\N
389	\N	2014-07-10 13:06:11.506706	2014-07-10 13:06:11.506706	\N
390	\N	2014-07-10 13:07:43.956703	2014-07-10 13:07:43.956703	\N
391	\N	2014-07-10 13:08:43.101426	2014-07-10 13:08:43.101426	\N
392	\N	2014-07-10 13:08:54.977876	2014-07-10 13:08:54.977876	\N
393	\N	2014-07-10 13:09:11.713588	2014-07-10 13:09:11.713588	\N
394	\N	2014-07-10 13:15:00.375339	2014-07-10 13:15:00.375339	\N
395	\N	2014-07-10 13:15:03.336822	2014-07-10 13:15:03.336822	\N
396	\N	2014-07-10 13:15:07.789836	2014-07-10 13:15:07.789836	\N
397	\N	2014-07-10 13:15:09.811867	2014-07-10 13:15:09.811867	\N
398	\N	2014-07-10 13:15:35.243761	2014-07-10 13:15:35.243761	\N
399	\N	2014-07-10 13:15:47.835509	2014-07-10 13:15:47.835509	\N
400	\N	2014-07-10 13:16:02.851412	2014-07-10 13:16:02.851412	\N
401	\N	2014-07-10 13:16:52.982773	2014-07-10 13:16:52.982773	\N
402	\N	2014-07-10 13:17:15.862115	2014-07-10 13:17:15.862115	\N
403	\N	2014-07-10 13:19:51.614596	2014-07-10 13:19:51.614596	\N
404	\N	2014-07-10 13:23:32.566901	2014-07-10 13:23:32.566901	\N
405	\N	2014-07-10 13:24:11.518054	2014-07-10 13:24:11.518054	\N
406	\N	2014-07-10 13:26:35.678641	2014-07-10 13:26:35.678641	\N
407	\N	2014-07-10 13:27:24.668294	2014-07-10 13:27:24.668294	\N
408	\N	2014-07-10 13:27:57.617866	2014-07-10 13:27:57.617866	\N
409	\N	2014-07-10 13:28:13.538567	2014-07-10 13:28:13.538567	\N
410	\N	2014-07-10 13:28:58.225432	2014-07-10 13:28:58.225432	\N
411	\N	2014-07-10 13:33:40.150601	2014-07-10 13:33:40.150601	\N
412	\N	2014-07-10 13:35:15.531029	2014-07-10 13:35:15.531029	\N
413	\N	2014-07-10 13:37:06.09353	2014-07-10 13:37:06.09353	\N
414	\N	2014-07-10 13:39:10.427727	2014-07-10 13:39:10.427727	\N
415	\N	2014-07-10 14:47:09.572147	2014-07-10 14:47:09.572147	\N
416	\N	2014-07-10 14:48:25.915688	2014-07-10 14:48:25.915688	\N
417	\N	2014-07-10 14:49:59.058983	2014-07-10 14:49:59.058983	\N
418	\N	2014-07-10 14:50:17.066132	2014-07-10 14:50:17.066132	\N
419	\N	2014-07-10 14:50:22.918096	2014-07-10 14:50:22.918096	\N
420	\N	2014-07-10 14:50:33.627318	2014-07-10 14:50:33.627318	\N
421	\N	2014-07-10 14:56:54.23745	2014-07-10 14:56:54.23745	\N
422	\N	2014-07-10 14:58:12.176265	2014-07-10 14:58:12.176265	\N
423	\N	2014-07-10 14:58:17.443543	2014-07-10 14:58:17.443543	\N
424	\N	2014-07-10 14:58:22.541664	2014-07-10 14:58:22.541664	\N
425	\N	2014-07-10 14:58:41.881617	2014-07-10 14:58:41.881617	\N
426	\N	2014-07-10 15:03:42.190828	2014-07-10 15:03:42.190828	\N
427	\N	2014-07-10 15:03:51.238741	2014-07-10 15:03:51.238741	\N
428	\N	2014-07-10 15:04:02.677881	2014-07-10 15:04:02.677881	\N
429	\N	2014-07-10 15:04:12.209342	2014-07-10 15:04:12.209342	\N
430	\N	2014-07-10 15:08:48.077384	2014-07-10 15:08:48.077384	\N
431	\N	2014-07-10 15:09:51.517562	2014-07-10 15:09:51.517562	\N
432	\N	2014-07-10 15:16:23.733164	2014-07-10 15:16:23.733164	\N
433	\N	2014-07-10 15:18:14.993081	2014-07-10 15:18:14.993081	\N
434	\N	2014-07-10 15:18:44.748437	2014-07-10 15:18:44.748437	\N
435	\N	2014-07-10 15:19:39.857592	2014-07-10 15:19:39.857592	\N
436	\N	2014-07-10 15:19:49.069446	2014-07-10 15:19:49.069446	\N
437	\N	2014-07-10 15:20:12.216104	2014-07-10 15:20:12.216104	\N
438	\N	2014-07-10 15:21:31.181038	2014-07-10 15:21:31.181038	\N
439	\N	2014-07-10 15:22:30.115037	2014-07-10 15:22:30.115037	\N
440	\N	2014-07-10 15:23:17.459388	2014-07-10 15:23:17.459388	\N
441	\N	2014-07-10 15:24:47.020184	2014-07-10 15:24:47.020184	\N
442	\N	2014-07-10 15:24:58.60586	2014-07-10 15:24:58.60586	\N
443	\N	2014-07-10 15:25:29.725164	2014-07-10 15:25:29.725164	\N
444	\N	2014-07-10 15:26:03.190893	2014-07-10 15:26:03.190893	\N
445	\N	2014-07-10 15:27:13.166895	2014-07-10 15:27:13.166895	\N
446	\N	2014-07-10 15:27:20.948405	2014-07-10 15:27:20.948405	\N
447	\N	2014-07-10 15:27:25.803778	2014-07-10 15:27:25.803778	\N
448	\N	2014-07-10 15:27:33.957986	2014-07-10 15:27:33.957986	\N
449	\N	2014-07-10 15:28:07.286963	2014-07-10 15:28:07.286963	\N
450	\N	2014-07-10 15:28:28.273673	2014-07-10 15:28:28.273673	\N
451	\N	2014-07-10 15:29:18.803436	2014-07-10 15:29:18.803436	\N
452	\N	2014-07-10 15:30:05.467223	2014-07-10 15:30:05.467223	\N
453	\N	2014-07-10 15:31:57.56741	2014-07-10 15:31:57.56741	\N
454	\N	2014-07-10 15:34:06.420771	2014-07-10 15:34:06.420771	\N
455	\N	2014-07-10 15:34:44.682585	2014-07-10 15:34:44.682585	\N
456	\N	2014-07-10 15:36:04.668761	2014-07-10 15:36:04.668761	\N
457	\N	2014-07-10 15:36:21.528057	2014-07-10 15:36:21.528057	\N
458	\N	2014-07-10 15:37:00.157124	2014-07-10 15:37:00.157124	\N
459	\N	2014-07-10 15:38:49.54831	2014-07-10 15:38:49.54831	\N
460	\N	2014-07-10 15:44:57.325453	2014-07-10 15:44:57.325453	\N
461	\N	2014-07-10 15:46:28.229958	2014-07-10 15:46:28.229958	\N
462	\N	2014-07-10 15:46:46.831983	2014-07-10 15:46:46.831983	\N
463	\N	2014-07-10 15:47:12.314758	2014-07-10 15:47:12.314758	\N
464	\N	2014-07-10 15:51:05.846163	2014-07-10 15:51:05.846163	\N
465	\N	2014-07-10 15:53:18.154181	2014-07-10 15:53:18.154181	\N
466	\N	2014-07-10 15:54:00.671451	2014-07-10 15:54:00.671451	\N
467	\N	2014-07-10 15:54:12.882744	2014-07-10 15:54:12.882744	\N
468	\N	2014-07-10 15:54:36.330346	2014-07-10 15:54:36.330346	\N
469	\N	2014-07-10 15:54:52.675406	2014-07-10 15:54:52.675406	\N
470	\N	2014-07-10 15:54:57.554174	2014-07-10 15:54:57.554174	\N
471	\N	2014-07-10 15:55:06.849664	2014-07-10 15:55:06.849664	\N
472	\N	2014-07-10 15:55:14.066612	2014-07-10 15:55:14.066612	\N
473	\N	2014-07-10 15:55:18.146219	2014-07-10 15:55:18.146219	\N
474	\N	2014-07-10 15:55:37.835246	2014-07-10 15:55:37.835246	\N
475	\N	2014-07-10 15:56:19.787343	2014-07-10 15:56:19.787343	\N
476	\N	2014-07-10 15:56:45.509152	2014-07-10 15:56:45.509152	\N
477	\N	2014-07-10 15:56:51.607871	2014-07-10 15:56:51.607871	\N
478	\N	2014-07-10 15:56:56.171694	2014-07-10 15:56:56.171694	\N
479	\N	2014-07-10 15:57:10.556168	2014-07-10 15:57:10.556168	\N
480	\N	2014-07-10 15:57:39.577018	2014-07-10 15:57:39.577018	\N
481	\N	2014-07-10 15:57:56.608647	2014-07-10 15:57:56.608647	\N
482	\N	2014-07-10 15:58:22.812074	2014-07-10 15:58:22.812074	\N
483	\N	2014-07-10 15:58:42.803998	2014-07-10 15:58:42.803998	\N
484	\N	2014-07-10 15:58:49.709014	2014-07-10 15:58:49.709014	\N
485	\N	2014-07-10 15:58:53.349351	2014-07-10 15:58:53.349351	\N
486	\N	2014-07-10 15:58:57.170043	2014-07-10 15:58:57.170043	\N
487	\N	2014-07-10 15:59:00.124642	2014-07-10 15:59:00.124642	\N
488	\N	2014-07-10 15:59:33.397321	2014-07-10 15:59:33.397321	\N
489	\N	2014-07-10 16:00:29.158866	2014-07-10 16:00:29.158866	\N
490	\N	2014-07-10 16:01:26.624961	2014-07-10 16:01:26.624961	\N
491	\N	2014-07-10 16:01:33.503532	2014-07-10 16:01:33.503532	\N
492	\N	2014-07-10 16:01:40.393444	2014-07-10 16:01:40.393444	\N
493	\N	2014-07-10 16:01:55.8159	2014-07-10 16:01:55.8159	\N
494	\N	2014-07-10 16:06:08.666236	2014-07-10 16:06:08.666236	\N
495	\N	2014-07-10 16:06:14.067207	2014-07-10 16:06:14.067207	\N
496	\N	2014-07-10 16:06:16.31589	2014-07-10 16:06:16.31589	\N
497	\N	2014-07-10 16:06:53.858821	2014-07-10 16:06:53.858821	\N
498	\N	2014-07-10 16:07:24.470912	2014-07-10 16:07:24.470912	\N
499	\N	2014-07-10 16:09:00.517239	2014-07-10 16:09:00.517239	\N
500	\N	2014-07-10 16:09:13.395428	2014-07-10 16:09:13.395428	\N
501	\N	2014-07-10 16:09:41.949558	2014-07-10 16:09:41.949558	\N
502	\N	2014-07-10 16:11:19.45082	2014-07-10 16:11:19.45082	\N
503	\N	2014-07-10 16:11:28.549585	2014-07-10 16:11:28.549585	\N
504	\N	2014-07-10 16:11:29.610751	2014-07-10 16:11:29.610751	\N
505	\N	2014-07-10 16:11:35.061555	2014-07-10 16:11:35.061555	\N
506	\N	2014-07-10 16:11:41.574992	2014-07-10 16:11:41.574992	\N
507	\N	2014-07-10 16:12:02.345806	2014-07-10 16:12:02.345806	\N
508	\N	2014-07-10 16:12:21.27757	2014-07-10 16:12:21.27757	\N
509	\N	2014-07-10 16:12:35.068546	2014-07-10 16:12:35.068546	\N
510	\N	2014-07-10 16:12:46.611173	2014-07-10 16:12:46.611173	\N
511	\N	2014-07-10 16:12:49.859074	2014-07-10 16:12:49.859074	\N
512	\N	2014-07-10 16:13:25.213623	2014-07-10 16:13:25.213623	\N
513	\N	2014-07-10 16:13:32.902425	2014-07-10 16:13:32.902425	\N
514	\N	2014-07-10 16:14:05.35884	2014-07-10 16:14:05.35884	\N
515	\N	2014-07-10 16:14:33.026848	2014-07-10 16:14:33.026848	\N
516	\N	2014-07-10 16:16:15.204322	2014-07-10 16:16:15.204322	\N
517	\N	2014-07-10 16:16:43.606489	2014-07-10 16:16:43.606489	\N
518	\N	2014-07-10 16:16:47.573007	2014-07-10 16:16:47.573007	\N
519	\N	2014-07-10 16:16:52.189215	2014-07-10 16:16:52.189215	\N
520	\N	2014-07-10 16:17:07.937171	2014-07-10 16:17:07.937171	\N
521	\N	2014-07-10 16:17:25.292792	2014-07-10 16:17:25.292792	\N
522	\N	2014-07-10 16:17:43.443661	2014-07-10 16:17:43.443661	\N
523	\N	2014-07-10 16:17:51.822796	2014-07-10 16:17:51.822796	\N
524	\N	2014-07-10 16:17:59.541906	2014-07-10 16:17:59.541906	\N
525	\N	2014-07-10 16:18:17.334568	2014-07-10 16:18:17.334568	\N
526	\N	2014-07-10 16:18:41.023393	2014-07-10 16:18:41.023393	\N
527	\N	2014-07-10 16:19:25.005679	2014-07-10 16:19:25.005679	\N
528	\N	2014-07-10 16:20:25.701074	2014-07-10 16:20:25.701074	\N
529	\N	2014-07-10 16:20:41.16494	2014-07-10 16:20:41.16494	\N
530	\N	2014-07-10 16:23:12.70082	2014-07-10 16:23:12.70082	\N
531	\N	2014-07-10 16:23:19.105307	2014-07-10 16:23:19.105307	\N
532	\N	2014-07-10 16:23:27.382399	2014-07-10 16:23:27.382399	\N
533	\N	2014-07-10 16:23:49.340819	2014-07-10 16:23:49.340819	\N
534	\N	2014-07-10 16:25:21.866516	2014-07-10 16:25:21.866516	\N
535	\N	2014-07-10 16:25:38.621512	2014-07-10 16:25:38.621512	\N
536	\N	2014-07-10 16:26:21.473621	2014-07-10 16:26:21.473621	\N
537	\N	2014-07-10 16:26:43.212687	2014-07-10 16:26:43.212687	\N
538	\N	2014-07-10 16:26:48.926797	2014-07-10 16:26:48.926797	\N
539	\N	2014-07-10 16:26:59.077412	2014-07-10 16:26:59.077412	\N
540	\N	2014-07-10 16:27:08.676031	2014-07-10 16:27:08.676031	\N
541	\N	2014-07-10 16:27:14.703737	2014-07-10 16:27:14.703737	\N
542	\N	2014-07-10 16:27:19.031648	2014-07-10 16:27:19.031648	\N
543	\N	2014-07-10 16:27:24.334045	2014-07-10 16:27:24.334045	\N
544	\N	2014-07-10 16:28:06.545113	2014-07-10 16:28:06.545113	\N
545	\N	2014-07-10 16:28:12.483029	2014-07-10 16:28:12.483029	\N
546	\N	2014-07-10 16:28:39.803087	2014-07-10 16:28:39.803087	\N
547	\N	2014-07-10 16:29:03.96324	2014-07-10 16:29:03.96324	\N
548	\N	2014-07-10 16:29:36.269029	2014-07-10 16:29:36.269029	\N
549	\N	2014-07-10 16:30:21.801194	2014-07-10 16:30:21.801194	\N
550	\N	2014-07-10 16:30:34.744455	2014-07-10 16:30:34.744455	\N
551	\N	2014-07-10 16:31:02.629813	2014-07-10 16:31:02.629813	\N
552	\N	2014-07-10 16:31:21.422965	2014-07-10 16:31:21.422965	\N
553	\N	2014-07-10 16:31:52.543011	2014-07-10 16:31:52.543011	\N
554	\N	2014-07-10 16:32:15.837432	2014-07-10 16:32:15.837432	\N
555	\N	2014-07-10 16:32:49.990704	2014-07-10 16:32:49.990704	\N
556	\N	2014-07-10 16:32:59.016811	2014-07-10 16:32:59.016811	\N
557	\N	2014-07-10 16:47:35.833906	2014-07-10 16:47:35.833906	\N
558	\N	2014-07-10 16:48:28.001191	2014-07-10 16:48:28.001191	\N
559	\N	2014-07-10 16:49:00.728176	2014-07-10 16:49:00.728176	\N
560	\N	2014-07-10 16:50:01.76008	2014-07-10 16:50:01.76008	\N
561	\N	2014-07-10 16:50:13.51577	2014-07-10 16:50:13.51577	\N
562	\N	2014-07-10 16:50:56.061073	2014-07-10 16:50:56.061073	\N
563	\N	2014-07-10 16:51:00.699712	2014-07-10 16:51:00.699712	\N
564	\N	2014-07-10 16:51:30.722206	2014-07-10 16:51:30.722206	\N
565	\N	2014-07-10 16:51:44.825798	2014-07-10 16:51:44.825798	\N
566	\N	2014-07-10 16:51:51.698174	2014-07-10 16:51:51.698174	\N
567	\N	2014-07-10 16:51:57.98805	2014-07-10 16:51:57.98805	\N
568	\N	2014-07-10 16:52:02.370273	2014-07-10 16:52:02.370273	\N
569	\N	2014-07-10 16:52:25.959705	2014-07-10 16:52:25.959705	\N
570	\N	2014-07-10 16:52:32.496038	2014-07-10 16:52:32.496038	\N
571	\N	2014-07-10 16:52:41.358225	2014-07-10 16:52:41.358225	\N
572	\N	2014-07-10 16:52:58.399621	2014-07-10 16:52:58.399621	\N
573	\N	2014-07-10 16:53:09.889312	2014-07-10 16:53:09.889312	\N
574	\N	2014-07-10 16:53:16.075055	2014-07-10 16:53:16.075055	\N
575	\N	2014-07-10 16:53:19.651201	2014-07-10 16:53:19.651201	\N
576	\N	2014-07-10 16:53:22.474137	2014-07-10 16:53:22.474137	\N
577	\N	2014-07-10 16:53:32.027718	2014-07-10 16:53:32.027718	\N
578	\N	2014-07-10 16:53:37.846695	2014-07-10 16:53:37.846695	\N
579	\N	2014-07-10 16:53:41.089691	2014-07-10 16:53:41.089691	\N
580	\N	2014-07-10 16:54:10.70273	2014-07-10 16:54:10.70273	\N
581	\N	2014-07-10 16:54:20.343557	2014-07-10 16:54:20.343557	\N
582	\N	2014-07-10 16:55:31.160941	2014-07-10 16:55:31.160941	\N
583	\N	2014-07-10 16:58:35.545376	2014-07-10 16:58:35.545376	\N
584	\N	2014-07-10 16:59:50.852317	2014-07-10 16:59:50.852317	\N
585	\N	2014-07-10 17:00:01.74408	2014-07-10 17:00:01.74408	\N
586	\N	2014-07-10 17:00:13.89756	2014-07-10 17:00:13.89756	\N
587	\N	2014-07-10 17:00:31.364728	2014-07-10 17:00:31.364728	\N
588	\N	2014-07-10 17:01:54.63789	2014-07-10 17:01:54.63789	\N
589	\N	2014-07-10 17:02:20.14126	2014-07-10 17:02:20.14126	\N
590	\N	2014-07-10 17:02:29.612835	2014-07-10 17:02:29.612835	\N
591	\N	2014-07-10 17:05:40.667088	2014-07-10 17:05:40.667088	\N
592	\N	2014-07-10 17:05:49.910839	2014-07-10 17:05:49.910839	\N
593	\N	2014-07-10 17:06:00.150897	2014-07-10 17:06:00.150897	\N
594	\N	2014-07-10 17:06:01.994852	2014-07-10 17:06:01.994852	\N
595	\N	2014-07-10 17:06:04.792506	2014-07-10 17:06:04.792506	\N
596	\N	2014-07-10 17:06:08.412405	2014-07-10 17:06:08.412405	\N
597	\N	2014-07-10 17:06:34.760454	2014-07-10 17:06:34.760454	\N
598	\N	2014-07-10 17:06:37.270513	2014-07-10 17:06:37.270513	\N
599	\N	2014-07-10 17:07:16.294954	2014-07-10 17:07:16.294954	\N
600	\N	2014-07-10 17:07:34.494042	2014-07-10 17:07:34.494042	\N
601	\N	2014-07-10 17:09:06.853129	2014-07-10 17:09:06.853129	\N
602	\N	2014-07-10 17:09:24.993641	2014-07-10 17:09:24.993641	\N
603	\N	2014-07-10 17:09:35.868715	2014-07-10 17:09:35.868715	\N
604	\N	2014-07-10 17:09:53.712039	2014-07-10 17:09:53.712039	\N
605	\N	2014-07-10 17:10:20.836691	2014-07-10 17:10:20.836691	\N
606	\N	2014-07-10 17:10:27.010254	2014-07-10 17:10:27.010254	\N
607	\N	2014-07-10 17:10:37.335234	2014-07-10 17:10:37.335234	\N
608	\N	2014-07-10 17:10:59.534075	2014-07-10 17:10:59.534075	\N
609	\N	2014-07-10 17:11:28.005383	2014-07-10 17:11:28.005383	\N
610	\N	2014-07-10 17:11:31.334623	2014-07-10 17:11:31.334623	\N
611	\N	2014-07-10 17:12:17.377535	2014-07-10 17:12:17.377535	\N
612	\N	2014-07-10 17:12:31.442822	2014-07-10 17:12:31.442822	\N
613	\N	2014-07-10 17:12:43.61871	2014-07-10 17:12:43.61871	\N
614	\N	2014-07-10 17:12:48.731361	2014-07-10 17:12:48.731361	\N
615	\N	2014-07-10 17:13:01.810964	2014-07-10 17:13:01.810964	\N
616	\N	2014-07-10 17:13:16.554186	2014-07-10 17:13:16.554186	\N
617	\N	2014-07-10 17:13:30.412008	2014-07-10 17:13:30.412008	\N
618	\N	2014-07-10 17:13:53.330793	2014-07-10 17:13:53.330793	\N
619	\N	2014-07-10 17:14:05.020451	2014-07-10 17:14:05.020451	\N
620	\N	2014-07-10 17:14:08.926579	2014-07-10 17:14:08.926579	\N
621	\N	2014-07-10 17:15:00.549267	2014-07-10 17:15:00.549267	\N
622	\N	2014-07-10 17:15:13.142053	2014-07-10 17:15:13.142053	\N
623	\N	2014-07-10 17:15:21.046449	2014-07-10 17:15:21.046449	\N
624	\N	2014-07-10 17:16:56.107573	2014-07-10 17:16:56.107573	\N
625	\N	2014-07-10 17:17:26.398453	2014-07-10 17:17:26.398453	\N
626	\N	2014-07-10 17:17:49.23787	2014-07-10 17:17:49.23787	\N
627	\N	2014-07-10 17:17:59.995622	2014-07-10 17:17:59.995622	\N
628	\N	2014-07-10 17:18:08.828301	2014-07-10 17:18:08.828301	\N
629	\N	2014-07-10 17:18:51.811235	2014-07-10 17:18:51.811235	\N
630	\N	2014-07-10 17:19:17.273146	2014-07-10 17:19:17.273146	\N
631	\N	2014-07-10 17:19:56.159199	2014-07-10 17:19:56.159199	\N
632	\N	2014-07-10 17:20:25.770111	2014-07-10 17:20:25.770111	\N
633	\N	2014-07-10 17:20:35.970616	2014-07-10 17:20:35.970616	\N
634	\N	2014-07-10 17:20:55.891792	2014-07-10 17:20:55.891792	\N
635	\N	2014-07-10 17:21:39.730292	2014-07-10 17:21:39.730292	\N
636	\N	2014-07-10 17:21:46.658214	2014-07-10 17:21:46.658214	\N
637	\N	2014-07-10 17:21:57.70187	2014-07-10 17:21:57.70187	\N
638	\N	2014-07-10 17:22:03.942719	2014-07-10 17:22:03.942719	\N
639	\N	2014-07-10 17:22:23.967358	2014-07-10 17:22:23.967358	\N
640	\N	2014-07-10 17:22:33.433137	2014-07-10 17:22:33.433137	\N
641	\N	2014-07-10 17:22:43.726601	2014-07-10 17:22:43.726601	\N
642	\N	2014-07-10 17:22:52.923643	2014-07-10 17:22:52.923643	\N
643	\N	2014-07-10 17:23:28.847377	2014-07-10 17:23:28.847377	\N
644	\N	2014-07-10 17:23:34.475466	2014-07-10 17:23:34.475466	\N
645	\N	2014-07-10 17:23:42.948084	2014-07-10 17:23:42.948084	\N
646	\N	2014-07-10 17:23:51.465594	2014-07-10 17:23:51.465594	\N
647	\N	2014-07-10 17:23:58.167458	2014-07-10 17:23:58.167458	\N
648	\N	2014-07-10 17:24:22.275667	2014-07-10 17:24:22.275667	\N
649	\N	2014-07-10 17:24:35.2202	2014-07-10 17:24:35.2202	\N
650	\N	2014-07-10 17:31:56.548722	2014-07-10 17:31:56.548722	\N
651	\N	2014-07-10 17:32:06.004974	2014-07-10 17:32:06.004974	\N
652	\N	2014-07-10 17:32:12.605775	2014-07-10 17:32:12.605775	\N
653	\N	2014-07-10 17:32:35.80425	2014-07-10 17:32:35.80425	\N
654	\N	2014-07-10 17:33:34.581926	2014-07-10 17:33:34.581926	\N
655	\N	2014-07-10 17:47:34.896484	2014-07-10 17:47:34.896484	\N
656	\N	2014-07-10 17:48:01.241935	2014-07-10 17:48:01.241935	\N
657	\N	2014-07-10 17:48:18.984966	2014-07-10 17:48:18.984966	\N
658	\N	2014-07-10 17:49:27.561872	2014-07-10 17:49:27.561872	\N
659	\N	2014-07-10 17:51:42.565662	2014-07-10 17:51:42.565662	\N
660	\N	2014-07-10 17:52:20.322625	2014-07-10 17:52:20.322625	\N
661	\N	2014-07-10 17:52:26.658954	2014-07-10 17:52:26.658954	\N
662	\N	2014-07-10 17:53:39.367152	2014-07-10 17:53:39.367152	\N
663	\N	2014-07-10 17:53:52.228716	2014-07-10 17:53:52.228716	\N
664	\N	2014-07-10 17:54:50.413043	2014-07-10 17:54:50.413043	\N
665	\N	2014-07-10 17:55:31.278122	2014-07-10 17:55:31.278122	\N
666	\N	2014-07-10 17:55:40.734542	2014-07-10 17:55:40.734542	\N
667	\N	2014-07-10 17:56:08.675009	2014-07-10 17:56:08.675009	\N
668	\N	2014-07-10 17:56:22.664447	2014-07-10 17:56:22.664447	\N
669	\N	2014-07-10 17:56:50.156563	2014-07-10 17:56:50.156563	\N
670	\N	2014-07-10 17:57:38.118776	2014-07-10 17:57:38.118776	\N
671	\N	2014-07-10 17:57:47.783708	2014-07-10 17:57:47.783708	\N
672	\N	2014-07-10 17:58:12.071377	2014-07-10 17:58:12.071377	\N
673	\N	2014-07-10 17:58:22.673306	2014-07-10 17:58:22.673306	\N
674	\N	2014-07-10 17:58:35.183386	2014-07-10 17:58:35.183386	\N
675	\N	2014-07-10 17:58:39.792744	2014-07-10 17:58:39.792744	\N
676	\N	2014-07-10 17:58:58.112986	2014-07-10 17:58:58.112986	\N
677	\N	2014-07-10 17:59:21.367177	2014-07-10 17:59:21.367177	\N
678	\N	2014-07-10 17:59:51.34399	2014-07-10 17:59:51.34399	\N
679	\N	2014-07-10 17:59:55.942585	2014-07-10 17:59:55.942585	\N
680	\N	2014-07-10 18:00:28.261923	2014-07-10 18:00:28.261923	\N
681	\N	2014-07-10 18:00:38.913319	2014-07-10 18:00:38.913319	\N
682	\N	2014-07-10 18:00:44.997588	2014-07-10 18:00:44.997588	\N
683	\N	2014-07-10 18:00:55.768246	2014-07-10 18:00:55.768246	\N
684	\N	2014-07-10 18:00:58.076638	2014-07-10 18:00:58.076638	\N
685	\N	2014-07-10 18:01:42.020099	2014-07-10 18:01:42.020099	\N
686	\N	2014-07-10 18:02:28.915219	2014-07-10 18:02:28.915219	\N
687	\N	2014-07-10 18:02:42.908942	2014-07-10 18:02:42.908942	\N
688	\N	2014-07-10 18:03:15.915222	2014-07-10 18:03:15.915222	\N
689	\N	2014-07-10 18:03:44.466664	2014-07-10 18:03:44.466664	\N
690	\N	2014-07-10 18:04:07.866099	2014-07-10 18:04:07.866099	\N
691	\N	2014-07-10 18:04:19.451087	2014-07-10 18:04:19.451087	\N
692	\N	2014-07-10 18:04:31.020334	2014-07-10 18:04:31.020334	\N
693	\N	2014-07-10 18:04:35.70746	2014-07-10 18:04:35.70746	\N
694	\N	2014-07-10 18:04:52.800325	2014-07-10 18:04:52.800325	\N
695	\N	2014-07-10 18:05:16.467452	2014-07-10 18:05:16.467452	\N
696	\N	2014-07-10 18:05:34.145594	2014-07-10 18:05:34.145594	\N
697	\N	2014-07-10 18:06:52.227164	2014-07-10 18:06:52.227164	\N
698	\N	2014-07-10 18:07:17.799251	2014-07-10 18:07:17.799251	\N
699	\N	2014-07-10 18:07:26.474812	2014-07-10 18:07:26.474812	\N
700	\N	2014-07-10 18:07:33.890596	2014-07-10 18:07:33.890596	\N
701	\N	2014-07-10 18:09:45.841339	2014-07-10 18:09:45.841339	\N
702	\N	2014-07-10 18:11:46.02289	2014-07-10 18:11:46.02289	\N
703	\N	2014-07-10 18:11:52.914885	2014-07-10 18:11:52.914885	\N
704	\N	2014-07-10 18:13:22.301799	2014-07-10 18:13:22.301799	\N
705	\N	2014-07-10 18:14:17.288411	2014-07-10 18:14:17.288411	\N
706	\N	2014-07-10 18:15:39.422954	2014-07-10 18:15:39.422954	\N
707	\N	2014-07-10 18:15:54.132178	2014-07-10 18:15:54.132178	\N
708	\N	2014-07-10 18:18:26.057186	2014-07-10 18:18:26.057186	\N
709	\N	2014-07-10 18:18:32.694095	2014-07-10 18:18:32.694095	\N
710	\N	2014-07-10 18:20:13.622679	2014-07-10 18:20:13.622679	\N
711	\N	2014-07-10 18:32:55.047801	2014-07-10 18:32:55.047801	\N
712	\N	2014-07-10 18:34:28.065981	2014-07-10 18:34:28.065981	\N
713	\N	2014-07-10 18:37:56.263491	2014-07-10 18:37:56.263491	\N
714	\N	2014-07-10 18:39:55.254859	2014-07-10 18:39:55.254859	\N
715	\N	2014-07-10 18:40:00.161552	2014-07-10 18:40:00.161552	\N
716	\N	2014-07-10 18:41:00.475094	2014-07-10 18:41:00.475094	\N
717	\N	2014-07-10 18:42:24.210262	2014-07-10 18:42:24.210262	\N
718	\N	2014-07-10 18:42:26.177294	2014-07-10 18:42:26.177294	\N
719	\N	2014-07-10 18:42:27.721234	2014-07-10 18:42:27.721234	\N
720	\N	2014-07-10 18:42:29.72266	2014-07-10 18:42:29.72266	\N
721	\N	2014-07-10 18:42:31.457568	2014-07-10 18:42:31.457568	\N
722	\N	2014-07-10 18:42:44.425284	2014-07-10 18:42:44.425284	\N
723	\N	2014-07-10 18:42:46.443486	2014-07-10 18:42:46.443486	\N
724	\N	2014-07-10 18:42:53.81185	2014-07-10 18:42:53.81185	\N
725	\N	2014-07-10 18:42:57.316986	2014-07-10 18:42:57.316986	\N
726	\N	2014-07-10 18:43:03.97538	2014-07-10 18:43:03.97538	\N
727	\N	2014-07-10 18:43:08.884113	2014-07-10 18:43:08.884113	\N
728	\N	2014-07-10 18:43:15.612772	2014-07-10 18:43:15.612772	\N
729	\N	2014-07-10 18:45:33.79856	2014-07-10 18:45:33.79856	\N
730	\N	2014-07-10 18:45:52.912271	2014-07-10 18:45:52.912271	\N
731	\N	2014-07-10 18:46:25.536506	2014-07-10 18:46:25.536506	\N
732	\N	2014-07-10 18:46:34.584587	2014-07-10 18:46:34.584587	\N
733	\N	2014-07-10 18:46:43.379982	2014-07-10 18:46:43.379982	\N
734	\N	2014-07-10 18:46:49.436088	2014-07-10 18:46:49.436088	\N
735	\N	2014-07-10 18:46:54.580633	2014-07-10 18:46:54.580633	\N
736	\N	2014-07-10 18:46:56.650962	2014-07-10 18:46:56.650962	\N
737	\N	2014-07-10 18:47:13.227964	2014-07-10 18:47:13.227964	\N
738	\N	2014-07-10 18:47:23.099867	2014-07-10 18:47:23.099867	\N
739	\N	2014-07-10 18:47:46.93669	2014-07-10 18:47:46.93669	\N
740	\N	2014-07-10 18:47:50.155103	2014-07-10 18:47:50.155103	\N
741	\N	2014-07-10 18:47:59.210751	2014-07-10 18:47:59.210751	\N
742	\N	2014-07-10 20:32:16.246931	2014-07-10 20:32:16.246931	\N
743	\N	2014-07-10 20:32:32.264581	2014-07-10 20:32:32.264581	\N
744	\N	2014-07-10 20:33:47.165843	2014-07-10 20:33:47.165843	\N
745	\N	2014-07-10 20:33:57.079419	2014-07-10 20:33:57.079419	\N
746	\N	2014-07-10 21:05:10.635541	2014-07-10 21:05:10.635541	\N
747	\N	2014-07-10 21:05:36.565822	2014-07-10 21:05:36.565822	\N
748	\N	2014-07-10 21:28:40.43497	2014-07-10 21:28:40.43497	\N
749	\N	2014-07-10 21:28:46.546084	2014-07-10 21:28:46.546084	\N
750	\N	2014-07-10 21:28:53.381549	2014-07-10 21:28:53.381549	\N
751	\N	2014-07-10 21:28:58.397803	2014-07-10 21:28:58.397803	\N
752	\N	2014-07-10 21:29:04.562956	2014-07-10 21:29:04.562956	\N
753	\N	2014-07-10 21:29:06.491096	2014-07-10 21:29:06.491096	\N
754	\N	2014-07-10 21:31:03.698833	2014-07-10 21:31:03.698833	\N
755	\N	2014-07-10 21:31:06.072091	2014-07-10 21:31:06.072091	\N
756	\N	2014-07-10 21:31:08.017117	2014-07-10 21:31:08.017117	\N
757	\N	2014-07-10 21:31:11.163756	2014-07-10 21:31:11.163756	\N
758	\N	2014-07-10 21:31:13.165788	2014-07-10 21:31:13.165788	\N
759	\N	2014-07-10 21:31:15.257165	2014-07-10 21:31:15.257165	\N
760	\N	2014-07-10 21:40:07.02145	2014-07-10 21:40:07.02145	\N
761	\N	2014-07-11 11:36:09.12974	2014-07-11 11:36:09.12974	\N
762	\N	2014-07-11 11:36:25.6431	2014-07-11 11:36:25.6431	\N
763	\N	2014-07-11 12:02:16.088706	2014-07-11 12:02:16.088706	\N
764	\N	2014-07-11 12:04:08.369918	2014-07-11 12:04:08.369918	\N
765	\N	2014-07-11 12:25:13.318849	2014-07-11 12:25:13.318849	\N
766	\N	2014-07-11 14:03:01.631593	2014-07-11 14:03:01.631593	\N
767	\N	2014-07-11 14:03:23.170048	2014-07-11 14:03:23.170048	\N
768	\N	2014-07-11 14:04:11.820387	2014-07-11 14:04:11.820387	\N
769	\N	2014-07-11 14:04:21.530781	2014-07-11 14:04:21.530781	\N
770	\N	2014-07-11 14:05:27.716652	2014-07-11 14:05:27.716652	\N
771	\N	2014-07-11 14:06:26.295888	2014-07-11 14:06:26.295888	\N
772	\N	2014-07-11 14:06:59.621549	2014-07-11 14:06:59.621549	\N
773	\N	2014-07-11 14:07:41.433012	2014-07-11 14:07:41.433012	\N
774	\N	2014-07-11 14:08:10.669358	2014-07-11 14:08:10.669358	\N
775	\N	2014-07-11 14:09:13.490183	2014-07-11 14:09:13.490183	\N
776	\N	2014-07-11 14:09:26.187213	2014-07-11 14:09:26.187213	\N
777	\N	2014-07-11 14:11:23.122628	2014-07-11 14:11:23.122628	\N
778	\N	2014-07-11 14:11:51.198466	2014-07-11 14:11:51.198466	\N
779	\N	2014-07-11 14:12:19.82307	2014-07-11 14:12:19.82307	\N
780	\N	2014-07-11 14:13:14.600023	2014-07-11 14:13:14.600023	\N
781	\N	2014-07-11 14:14:02.929923	2014-07-11 14:14:02.929923	\N
782	\N	2014-07-11 14:14:29.928318	2014-07-11 14:14:29.928318	\N
783	\N	2014-07-11 14:45:36.551061	2014-07-11 14:45:36.551061	\N
784	\N	2014-07-11 14:47:30.352049	2014-07-11 14:47:30.352049	\N
785	\N	2014-07-11 14:47:32.808546	2014-07-11 14:47:32.808546	\N
786	\N	2014-07-11 14:47:57.956077	2014-07-11 14:47:57.956077	\N
787	\N	2014-07-11 14:52:23.948991	2014-07-11 14:52:23.948991	\N
788	\N	2014-07-11 14:53:04.615641	2014-07-11 14:53:04.615641	\N
789	\N	2014-07-11 14:53:16.390971	2014-07-11 14:53:16.390971	\N
790	\N	2014-07-11 14:54:13.907151	2014-07-11 14:54:13.907151	\N
791	\N	2014-07-11 14:54:22.552465	2014-07-11 14:54:22.552465	\N
792	\N	2014-07-11 14:54:52.129106	2014-07-11 14:54:52.129106	\N
793	\N	2014-07-11 15:02:08.423493	2014-07-11 15:02:08.423493	\N
794	\N	2014-07-11 15:08:00.076764	2014-07-11 15:08:00.076764	\N
795	\N	2014-07-11 15:09:24.550512	2014-07-11 15:09:24.550512	\N
796	\N	2014-07-11 15:14:45.967583	2014-07-11 15:14:45.967583	\N
797	\N	2014-07-11 15:15:06.601035	2014-07-11 15:15:06.601035	\N
798	\N	2014-07-11 15:15:11.844569	2014-07-11 15:15:11.844569	\N
799	\N	2014-07-11 15:19:27.63494	2014-07-11 15:19:27.63494	\N
800	\N	2014-07-11 15:20:06.142048	2014-07-11 15:20:06.142048	\N
801	\N	2014-07-11 15:23:12.073389	2014-07-11 15:23:12.073389	\N
802	\N	2014-07-11 15:39:30.53218	2014-07-11 15:39:30.53218	\N
803	\N	2014-07-11 15:41:00.862448	2014-07-11 15:41:00.862448	\N
804	\N	2014-07-11 15:42:10.582047	2014-07-11 15:42:10.582047	\N
805	\N	2014-07-11 15:43:36.13277	2014-07-11 15:43:36.13277	\N
806	\N	2014-07-11 16:37:35.25684	2014-07-11 16:37:35.25684	\N
807	\N	2014-07-11 16:38:15.513949	2014-07-11 16:38:15.513949	\N
808	\N	2014-07-11 16:38:29.664348	2014-07-11 16:38:29.664348	\N
809	\N	2014-07-11 16:41:48.088251	2014-07-11 16:41:48.088251	\N
810	\N	2014-07-11 16:42:42.390182	2014-07-11 16:42:42.390182	\N
811	\N	2014-07-11 16:42:48.263015	2014-07-11 16:42:48.263015	\N
812	\N	2014-07-11 16:42:49.431155	2014-07-11 16:42:49.431155	\N
813	\N	2014-07-11 16:42:49.752218	2014-07-11 16:42:49.752218	\N
814	\N	2014-07-11 16:42:50.031496	2014-07-11 16:42:50.031496	\N
815	\N	2014-07-11 16:43:08.538048	2014-07-11 16:43:08.538048	\N
816	\N	2014-07-11 16:43:56.326197	2014-07-11 16:43:56.326197	\N
817	\N	2014-07-14 12:03:16.317287	2014-07-14 12:03:16.317287	\N
818	\N	2014-07-14 12:14:11.225018	2014-07-14 12:14:11.225018	\N
819	\N	2014-07-14 12:15:03.6122	2014-07-14 12:15:03.6122	\N
820	\N	2014-07-14 12:15:15.179782	2014-07-14 12:15:15.179782	\N
821	\N	2014-07-14 12:26:23.589559	2014-07-14 12:26:23.589559	\N
822	\N	2014-07-14 12:26:37.859146	2014-07-14 12:26:37.859146	\N
823	\N	2014-07-14 12:27:16.882809	2014-07-14 12:27:16.882809	\N
824	\N	2014-07-14 12:27:37.43629	2014-07-14 12:27:37.43629	\N
825	\N	2014-07-14 12:36:46.159575	2014-07-14 12:36:46.159575	\N
826	\N	2014-07-14 12:38:23.696724	2014-07-14 12:38:23.696724	\N
827	\N	2014-07-14 12:38:44.15242	2014-07-14 12:38:44.15242	\N
828	\N	2014-07-14 12:43:08.265035	2014-07-14 12:43:08.265035	\N
829	\N	2014-07-14 12:43:45.717528	2014-07-14 12:43:45.717528	\N
830	\N	2014-07-14 12:43:49.746529	2014-07-14 12:43:49.746529	\N
831	\N	2014-07-14 12:44:16.329899	2014-07-14 12:44:16.329899	\N
832	\N	2014-07-14 12:44:41.906594	2014-07-14 12:44:41.906594	\N
833	\N	2014-07-14 12:44:52.537481	2014-07-14 12:44:52.537481	\N
834	\N	2014-07-14 12:45:35.468003	2014-07-14 12:45:35.468003	\N
835	\N	2014-07-14 12:46:04.412508	2014-07-14 12:46:04.412508	\N
836	\N	2014-07-14 12:46:38.187221	2014-07-14 12:46:38.187221	\N
837	\N	2014-07-14 12:48:04.70229	2014-07-14 12:48:04.70229	\N
838	\N	2014-07-14 13:23:17.422565	2014-07-14 13:23:17.422565	\N
839	\N	2014-07-14 13:23:24.893758	2014-07-14 13:23:24.893758	\N
840	\N	2014-07-14 13:23:35.251255	2014-07-14 13:23:35.251255	\N
841	\N	2014-07-14 13:24:09.565758	2014-07-14 13:24:09.565758	\N
842	\N	2014-07-14 13:26:07.22226	2014-07-14 13:26:07.22226	\N
843	\N	2014-07-14 13:26:15.594313	2014-07-14 13:26:15.594313	\N
844	\N	2014-07-14 13:35:25.07557	2014-07-14 13:35:25.07557	\N
845	\N	2014-07-14 13:36:27.502437	2014-07-14 13:36:27.502437	\N
846	\N	2014-07-14 13:42:05.997733	2014-07-14 13:42:05.997733	\N
847	\N	2014-07-14 13:42:37.178967	2014-07-14 13:42:37.178967	\N
848	\N	2014-07-14 13:56:24.298568	2014-07-14 13:56:24.298568	\N
849	\N	2014-07-14 13:57:14.744538	2014-07-14 13:57:14.744538	\N
850	\N	2014-07-14 14:01:03.149277	2014-07-14 14:01:03.149277	\N
851	\N	2014-07-14 14:01:04.223472	2014-07-14 14:01:04.223472	\N
852	\N	2014-07-14 14:01:17.059713	2014-07-14 14:01:17.059713	\N
853	\N	2014-07-14 14:02:31.399696	2014-07-14 14:02:31.399696	\N
854	\N	2014-07-14 14:04:13.798465	2014-07-14 14:04:13.798465	\N
855	\N	2014-07-14 14:05:14.633952	2014-07-14 14:05:14.633952	\N
856	\N	2014-07-14 14:05:29.682568	2014-07-14 14:05:29.682568	\N
857	\N	2014-07-14 14:05:36.951741	2014-07-14 14:05:36.951741	\N
858	\N	2014-07-14 14:06:04.1083	2014-07-14 14:06:04.1083	\N
859	\N	2014-07-14 14:08:19.57068	2014-07-14 14:08:19.57068	\N
860	b;lah	2014-07-14 14:09:39.448497	2014-07-14 14:09:39.450753	\N
861	genejaelee@gmail.com	2014-07-24 17:31:44.138665	2014-07-24 17:31:44.14673	\N
862	test@gmail.com	2014-07-26 01:20:41.936393	2014-07-26 01:20:41.943666	\N
863	test@gmail.com	2014-07-26 01:23:31.453879	2014-07-26 01:23:31.457668	\N
864	genejaelee@gmail.com	2014-07-26 03:15:36.79635	2014-07-26 03:15:36.857861	\N
865	genejaelee@gmail.com	2014-07-26 03:17:10.266819	2014-07-26 03:17:10.271157	\N
866	test@gmail.com	2014-07-26 03:19:22.702678	2014-07-26 03:19:22.706457	\N
867	test2@gmail.com	2014-07-26 03:21:19.155351	2014-07-26 03:21:19.160103	t
868	test@gmail.com	2014-07-26 03:32:58.341903	2014-07-26 03:32:58.34607	t
869	test@gmail.com	2014-07-26 03:35:26.755	2014-07-26 03:35:26.758669	t
870	test@gmail.com	2014-07-26 03:35:49.685731	2014-07-26 03:35:49.689118	t
871	test@gmail.com	2014-07-26 03:37:06.949816	2014-07-26 03:37:06.953531	t
872	test@gmail.com	2014-07-26 03:37:44.355941	2014-07-26 03:37:44.359272	t
873	test@gmail.com	2014-07-26 03:38:56.487239	2014-07-26 03:38:56.491687	t
874	genejaelee@gmail.com	2014-07-26 03:41:27.80849	2014-07-26 03:41:27.812022	t
875	genejaelee@gmail.com	2014-07-26 03:43:27.705197	2014-07-26 03:43:27.708923	t
876	genejaelee@gmail.com	2014-07-26 03:43:55.907239	2014-07-26 03:43:55.909959	t
877	test@gmail.com	2014-07-26 03:49:36.004511	2014-07-26 03:49:36.008484	t
878	genejaelee@gmail.com	2014-07-26 03:50:40.039411	2014-07-26 03:50:40.044052	t
879	test	2014-07-26 03:51:17.012036	2014-07-26 03:51:17.019299	t
880	est	2014-07-26 03:53:30.720724	2014-07-26 03:53:30.725289	t
\.


--
-- Name: email_boxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('email_boxes_id_seq', 880, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY events (id, title, description, created_at, updated_at, therapist_id, client_id, suggested_times, user_id, suggested_time, email, phone) FROM stdin;
541	\N	hello	2014-07-24 18:52:45.291621	2014-07-24 18:52:48.424875	1715	1895	{"2014-07-25 03:00","2014-07-26 02:00"}	109	\N	\N	\N
520	\N	\N	2014-07-11 15:23:29.526256	2014-07-11 15:23:44.735426	77	1403	{"2014-07-24 04:00","2014-07-17 04:00","2014-07-27 05:00"}	91	\N	\N	\N
521	\N	\N	2014-07-11 15:39:44.872681	2014-07-11 15:40:31.206806	77	1405	{"2014-07-16 06:00","2014-07-26 05:00","2014-07-16 10:00"}	92	\N	\N	\N
579	\N	\N	2014-10-10 20:33:03.910545	2014-10-10 20:33:03.910545	79	\N	{}	\N		genejaelee@gmail.com	\N
522	\N	\N	2014-07-11 15:43:54.088098	2014-07-11 15:44:04.752888	77	1408	{"2014-07-22 05:00","2014-07-18 01:00","2014-07-23 02:00"}	93	\N	\N	\N
525	\N	\N	2014-07-22 14:24:24.753774	2014-07-22 14:24:24.753774	80	1678	{}	\N	\N	\N	\N
526	\N	\N	2014-07-22 14:31:58.952682	2014-07-22 14:31:58.952682	81	1679	{}	\N	\N	\N	\N
527	\N	\N	2014-07-22 14:33:47.950206	2014-07-22 14:33:47.950206	82	1680	{}	\N	\N	\N	\N
528	\N	\N	2014-07-24 12:31:15.34715	2014-07-24 12:31:15.357629	83	1714	{"2014-07-30 04:00","2014-07-31 04:00","2014-07-29 10:00"}	\N	\N	\N	\N
529	\N	\N	2014-07-24 12:34:37.169035	2014-07-24 12:34:37.179037	83	1715	{"2014-07-24 03:00","2014-07-26 04:00","2014-07-29 03:00"}	\N	\N	\N	\N
550	\N		2014-07-24 22:33:00.335155	2014-07-24 22:33:02.747172	1715	1722	{"2014-07-30 03:00","2014-07-31 02:00"}	106	\N	\N	\N
517	\N	\N	2014-07-11 15:15:30.559989	2014-07-11 15:19:00.904277	77	1398	{"2014-07-16 04:00","2014-07-29 04:00","2014-07-24 05:00"}	89	\N	\N	\N
530	\N	\N	2014-07-24 12:35:34.089426	2014-07-24 12:35:34.112647	83	1715	{"2014-07-30 04:00","2014-07-29 05:00","2014-07-29 03:00"}	\N	\N	\N	\N
542	\N	hey	2014-07-24 18:53:53.81417	2014-07-24 18:53:56.398644	1715	1895	{"2014-07-31 03:00","2014-07-31 02:00"}	109	\N	\N	\N
531	\N	\N	2014-07-24 12:36:47.905774	2014-07-24 12:36:47.929412	83	1715	{"2014-07-24 04:00","2014-07-26 05:00","2014-07-29 11:00"}	\N	\N	\N	\N
518	\N	\N	2014-07-11 15:19:42.816908	2014-07-11 15:19:48.271023	77	1398	{"2014-07-23 05:00","2014-07-25 06:00","2014-07-12 03:00"}	89	\N	\N	\N
532	\N	\N	2014-07-24 12:37:18.446049	2014-07-24 12:37:18.457066	83	1718	{"2014-07-25 06:00","2014-07-30 02:00","2014-07-26 04:00"}	\N	\N	\N	\N
551	\N	\N	2014-07-24 22:36:44.017659	2014-07-24 22:36:44.017659	\N	1948	{}	\N	\N	\N	\N
552	\N	\N	2014-07-25 10:12:54.430417	2014-07-25 10:12:54.430417	1715	1408	{}	\N	\N	\N	\N
543	\N	hey	2014-07-24 18:59:22.893858	2014-07-24 18:59:25.870432	1715	1895	{"2014-07-31 05:00","2014-07-26 02:00"}	109	\N	\N	\N
553	\N	\N	2014-07-29 16:14:19.714767	2014-07-29 16:14:19.714767	1715	1982	{}	\N	\N	\N	\N
535	\N	Hello this is a test	2014-07-24 13:02:03.697235	2014-07-24 13:02:23.055594	1715	1722	{"2014-07-24 05:00","2014-07-26 05:00","2014-07-29 03:00"}	106	\N	\N	\N
519	\N	\N	2014-07-11 15:20:22.607466	2014-07-11 15:20:32.924768	77	1403	{"2014-07-24 11:00","2014-07-17 15:00","2014-07-20 16:00"}	91	\N	\N	\N
554	\N	\N	2014-07-29 16:19:38.772531	2014-07-29 16:19:38.772531	1715	1984	{}	\N	\N	\N	\N
536	\N	hello	2014-07-24 17:19:45.355459	2014-07-24 17:19:56.4469	1715	1892	{"2014-07-25 04:00","2014-07-31 12:00"}	107	\N	\N	\N
537	\N	\N	2014-07-24 17:21:06.344353	2014-07-24 17:21:06.352301	1715	1894	{"2014-07-25 04:00","2014-07-26 13:00"}	\N	\N	\N	\N
544	\N	heyllo	2014-07-24 19:09:10.142901	2014-07-24 19:09:12.795924	1715	1722	{"2014-07-24 04:00","2014-07-25 03:00"}	106	\N	\N	\N
538	\N		2014-07-24 17:26:32.647294	2014-07-24 17:26:40.167107	1715	1895	{"2014-07-25 04:00","2014-07-26 05:00"}	109	\N	\N	\N
555	\N	\N	2014-07-29 16:23:42.694814	2014-07-29 16:23:42.694814	1715	1986	{}	\N	\N	\N	\N
539	\N	hello	2014-07-24 17:31:10.592008	2014-07-24 17:31:13.560585	1715	1895	{"2014-07-30 03:00","2014-07-25 04:00"}	109	\N	\N	\N
556	\N	\N	2014-07-29 16:26:33.409361	2014-07-29 16:26:33.409361	1715	1987	{}	\N	\N	\N	\N
545	\N	helo\r\n	2014-07-24 19:21:45.71542	2014-07-24 19:21:49.269008	1715	1722	{"2014-07-25 05:00","2014-07-24 04:00"}	106	\N	\N	\N
540	\N		2014-07-24 18:36:11.259008	2014-07-24 18:36:15.43108	1715	1895	{"2014-07-24 04:00","2014-07-25 05:00"}	109	\N	\N	\N
557	\N	\N	2014-07-29 16:29:33.267419	2014-07-29 16:29:33.267419	1715	1988	{}	\N	\N	\N	\N
558	\N	\N	2014-07-29 18:20:46.68505	2014-07-29 18:20:46.68505	1715	2068	{}	\N	\N	\N	\N
559	\N	\N	2014-07-30 18:49:49.986646	2014-07-30 18:49:49.986646	1715	2338	{}	\N	\N	\N	\N
546	\N	hello\r\n	2014-07-24 19:48:09.257329	2014-07-24 19:48:12.615866	1715	1722	{"2014-07-25 03:00","2014-07-25 00:00"}	106	\N	\N	\N
560	\N	\N	2014-07-30 18:50:40.488689	2014-07-30 18:50:40.488689	1715	2339	{}	\N	\N	\N	\N
561	\N	\N	2014-07-30 18:51:24.39406	2014-07-30 18:51:24.39406	1715	2340	{}	\N	Sat, Aug 0212pm	\N	\N
547	\N	hey	2014-07-24 19:50:20.493442	2014-07-24 19:50:22.710209	1715	1722	{"2014-07-31 03:00","2014-07-25 04:00"}	106	\N	\N	\N
562	\N	\N	2014-07-30 18:52:05.887536	2014-07-30 18:52:05.887536	1715	2341	{}	\N	Sat, Aug 02 12pm	\N	\N
548	\N		2014-07-24 19:55:51.303582	2014-07-24 19:55:54.086644	1715	1722	{"2014-07-30 05:00","2014-07-26 02:00"}	106	\N	\N	\N
563	\N		2014-07-30 20:02:04.427995	2014-07-30 20:02:11.495964	1715	2470	{}	111	Tue, Aug 05  1pm	\N	\N
549	\N		2014-07-24 22:29:45.439401	2014-07-24 22:29:47.513747	1715	1722	{"2014-07-24 04:00","2014-07-26 04:00"}	106	\N	\N	\N
572	\N	est	2014-08-01 22:41:18.65399	2014-08-01 22:41:21.716037	1715	2563	{}	116	Sun, Aug 03 12pm	\N	\N
564	\N	hello	2014-07-30 20:10:52.374202	2014-07-30 20:11:10.030978	1715	1408	{}	93	Sun, Aug 03  2pm	\N	\N
565	\N		2014-07-30 20:18:34.132652	2014-07-30 20:18:42.553677	1715	1408	{}	93	Sat, Aug 02 12pm	\N	\N
566	\N	\N	2014-07-31 18:10:44.776131	2014-07-31 18:10:44.776131	\N	2538	{}	\N	\N	\N	\N
567	\N	\N	2014-08-01 15:08:19.217175	2014-08-01 15:08:19.217175	\N	2560	{}	\N	\N	\N	\N
568	\N	\N	2014-08-01 15:29:19.582003	2014-08-01 15:29:19.582003	\N	2561	{}	\N	\N	\N	\N
569	\N	\N	2014-08-01 15:30:29.886903	2014-08-01 15:30:29.886903	\N	2562	{}	\N	\N	\N	\N
570	\N	\N	2014-08-01 22:33:50.507234	2014-08-01 22:33:50.507234	\N	2563	{}	\N	\N	\N	\N
580	\N	\N	2014-10-10 20:33:51.736147	2014-10-10 20:33:51.736147	79	\N	{}	\N		genejaelee@gmail.com	\N
571	\N	hello\r\n	2014-08-01 22:40:05.934941	2014-08-01 22:40:09.841792	1715	2563	{}	116	Mon, Aug 04  2pm	\N	\N
573	\N	test	2014-08-01 22:43:21.689648	2014-08-01 22:43:24.60142	1715	2563	{}	116	Tue, Aug 05  4pm	\N	\N
574	\N	\N	2014-10-10 19:21:23.937865	2014-10-10 19:21:23.937865	79	\N	{}	\N	Sun, Oct 12 2:30pm	\N	\N
575	\N	\N	2014-10-10 19:23:32.505218	2014-10-10 19:23:32.505218	79	\N	{}	\N	Sun, Oct 12 2:30pm	\N	\N
576	\N	\N	2014-10-10 19:23:54.512213	2014-10-10 19:23:54.512213	79	\N	{}	\N	Sun, Oct 12 2:30pm	\N	\N
577	\N	\N	2014-10-10 19:24:39.84686	2014-10-10 19:24:39.84686	79	\N	{}	\N		genejaelee@gmail.com	(213) 493-1586
578	\N	\N	2014-10-10 19:24:53.804324	2014-10-10 19:24:53.804324	79	\N	{}	\N	Mon, Oct 13 10:30am	genejaelee@gmail.com	(213) 493-1586
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('events_id_seq', 580, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY messages (id, message, chat_id, user_id, created_at, updated_at) FROM stdin;
1	hey	1	1	2014-05-28 18:58:24.424439	2014-05-28 18:58:24.424439
2	hey	1	1	2014-05-28 18:58:46.173431	2014-05-28 18:58:46.173431
3	yo	1	1	2014-05-28 19:00:10.573449	2014-05-28 19:00:10.573449
4	Hey	2	1	2014-05-28 20:37:53.300049	2014-05-28 20:37:53.300049
5	Whats up	2	1	2014-05-28 20:38:02.938575	2014-05-28 20:38:02.938575
6	Hey	1	1	2014-05-28 20:40:22.657158	2014-05-28 20:40:22.657158
7	How's it going	1	1	2014-05-28 20:40:29.093715	2014-05-28 20:40:29.093715
8	Whats up	1	2	2014-05-28 20:45:17.848164	2014-05-28 20:45:17.848164
9	Supppp	3	2	2014-05-28 20:54:32.807922	2014-05-28 20:54:32.807922
10	Hey how's it going	1	1	2014-05-28 21:06:15.364131	2014-05-28 21:06:15.364131
11	Hey	1	1	2014-05-28 21:18:15.366913	2014-05-28 21:18:15.366913
12	Hey	1	1	2014-05-28 21:20:34.93593	2014-05-28 21:20:34.93593
13	Hey	1	1	2014-05-28 21:24:54.156613	2014-05-28 21:24:54.156613
14	Hello	1	1	2014-05-28 21:26:17.710943	2014-05-28 21:26:17.710943
15	fdagadfadfesafdafdafadfadfdafadfadfadf	1	1	2014-05-28 21:28:46.921845	2014-05-28 21:28:46.921845
16	Hey	1	1	2014-05-28 21:30:06.684429	2014-05-28 21:30:06.684429
17	Hey	1	1	2014-05-28 21:30:14.477677	2014-05-28 21:30:14.477677
18	Hey	1	2	2014-05-28 21:31:10.240644	2014-05-28 21:31:10.240644
19	Hu hi	1	1	2014-05-28 21:31:19.835385	2014-05-28 21:31:19.835385
20	Hey	1	1	2014-05-28 21:31:38.100079	2014-05-28 21:31:38.100079
21	Hey	1	2	2014-05-28 21:31:44.833225	2014-05-28 21:31:44.833225
22	Hi	1	1	2014-05-28 21:33:35.599287	2014-05-28 21:33:35.599287
23	Hey	1	1	2014-05-28 21:34:08.52692	2014-05-28 21:34:08.52692
24	Hey	1	1	2014-05-28 21:34:12.116266	2014-05-28 21:34:12.116266
25	hey	1	3	2014-05-28 22:00:52.525898	2014-05-28 22:00:52.525898
26	Hello this is gene. I'm testing this by writing something very log and meaningless. I am really tired, so tired that I want to sleep. I really want to see what happens when I get to the end of this text area box because it's necessary for me to know how to make this app better	1	3	2014-05-28 22:18:38.249329	2014-05-28 22:18:38.249329
27	Geg	1	3	2014-05-28 22:45:33.434286	2014-05-28 22:45:33.434286
28	Hey	1	1	2014-05-28 22:54:46.471038	2014-05-28 22:54:46.471038
29	What's up	1	1	2014-05-28 22:54:50.371115	2014-05-28 22:54:50.371115
30	How's it going	1	1	2014-05-28 22:54:53.243588	2014-05-28 22:54:53.243588
31	Not mich	1	3	2014-05-28 22:55:10.377497	2014-05-28 22:55:10.377497
32	Doing well, you?	1	3	2014-05-28 22:55:23.852088	2014-05-28 22:55:23.852088
33	hey	1	2	2014-05-29 14:09:07.699086	2014-05-29 14:09:07.699086
34	sup	1	1	2014-05-29 14:11:09.229227	2014-05-29 14:11:09.229227
35	dumb	1	2	2014-05-29 14:13:54.19382	2014-05-29 14:13:54.19382
36	dumb	1	2	2014-05-29 14:14:03.209563	2014-05-29 14:14:03.209563
37	dumb	1	1	2014-05-29 14:14:08.980865	2014-05-29 14:14:08.980865
38	hey	1	1	2014-05-29 14:14:27.412518	2014-05-29 14:14:27.412518
39	hey	1	2	2014-05-29 14:15:01.027365	2014-05-29 14:15:01.027365
40	how's it going	1	2	2014-05-29 14:15:14.515045	2014-05-29 14:15:14.515045
41	yo	1	2	2014-05-29 14:15:32.984436	2014-05-29 14:15:32.984436
42	hey	1	1	2014-05-29 14:17:18.136272	2014-05-29 14:17:18.136272
43	how's it going	1	1	2014-05-29 14:17:25.020973	2014-05-29 14:17:25.020973
44	hey	1	1	2014-05-29 14:19:03.133873	2014-05-29 14:19:03.133873
45	how's it going	1	1	2014-05-29 14:19:10.220355	2014-05-29 14:19:10.220355
46	test	1	1	2014-05-29 14:20:59.790733	2014-05-29 14:20:59.790733
47	foo	1	1	2014-05-29 14:21:06.860834	2014-05-29 14:21:06.860834
48	hey	1	1	2014-05-29 14:22:57.745893	2014-05-29 14:22:57.745893
49	hey	1	1	2014-05-29 14:23:02.742517	2014-05-29 14:23:02.742517
50	what's going on	1	1	2014-05-29 14:23:09.195885	2014-05-29 14:23:09.195885
51	test	1	2	2014-05-29 14:23:12.589739	2014-05-29 14:23:12.589739
52	hey	1	1	2014-05-29 14:32:41.126873	2014-05-29 14:32:41.126873
53	hey	1	1	2014-05-29 14:33:08.626771	2014-05-29 14:33:08.626771
54	hey	1	1	2014-05-29 14:33:49.868916	2014-05-29 14:33:49.868916
55	hey	1	1	2014-05-29 14:48:42.138304	2014-05-29 14:48:42.138304
56	hey	1	1	2014-05-29 14:54:00.31066	2014-05-29 14:54:00.31066
57	hey	1	1	2014-05-29 14:54:37.553453	2014-05-29 14:54:37.553453
58	hey	1	1	2014-05-29 14:57:13.968258	2014-05-29 14:57:13.968258
59	hey	1	1	2014-05-29 15:01:34.010136	2014-05-29 15:01:34.010136
60	sound test	1	1	2014-05-29 15:03:10.567452	2014-05-29 15:03:10.567452
61	sound test	1	1	2014-05-29 15:04:49.381756	2014-05-29 15:04:49.381756
62	testing controller	1	1	2014-05-29 15:06:34.780743	2014-05-29 15:06:34.780743
63	hey	1	1	2014-05-29 15:10:24.800972	2014-05-29 15:10:24.806896
64	hi	1	1	2014-05-29 15:11:53.178056	2014-05-29 15:11:53.183395
65	hey	1	1	2014-05-29 15:15:13.73479	2014-05-29 15:15:13.739513
66	hey	1	1	2014-05-29 15:15:18.445721	2014-05-29 15:15:18.453234
67	hey	1	1	2014-05-29 15:16:21.725624	2014-05-29 15:16:21.730293
68	hey	1	1	2014-05-29 15:16:30.150155	2014-05-29 15:16:30.154653
69	tie test	1	1	2014-05-29 15:21:13.188029	2014-05-29 15:21:13.194959
70	\N	\N	\N	2014-05-29 15:24:28.150616	2014-05-29 15:24:28.150616
71	\N	\N	\N	2014-05-29 15:24:41.904777	2014-05-29 15:24:41.904777
72	\N	\N	\N	2014-05-29 15:25:13.773983	2014-05-29 15:25:13.773983
73	\N	\N	\N	2014-05-29 15:25:40.514346	2014-05-29 15:25:40.514346
74	\N	\N	\N	2014-05-29 15:26:16.426666	2014-05-29 15:26:16.426666
75	\N	\N	\N	2014-05-29 15:26:28.857822	2014-05-29 15:26:28.857822
76	\N	\N	\N	2014-05-29 15:27:04.28221	2014-05-29 15:27:04.28221
77	payload test	1	1	2014-05-29 15:27:12.005704	2014-05-29 15:27:12.011153
78	sup	1	1	2014-05-29 15:39:34.245859	2014-05-29 15:39:34.253901
79	time test	1	1	2014-05-29 15:39:52.240539	2014-05-29 15:39:52.245718
80	test	1	1	2014-05-29 15:40:03.32824	2014-05-29 15:40:03.332048
81	time test	1	1	2014-05-29 15:41:32.183455	2014-05-29 15:41:32.187764
82	time test	1	1	2014-05-29 15:41:53.150484	2014-05-29 15:41:53.154931
83	\N	\N	\N	2014-05-29 15:45:01.983532	2014-05-29 15:45:01.983532
84	\N	\N	\N	2014-05-29 15:45:42.389885	2014-05-29 15:45:42.389885
94	time zone test time zone test, i'm testing time zones	1	2	2014-05-29 20:17:05.068628	2014-05-29 20:17:05.073785
85	time test	1	1	\N	2014-05-29 15:46:02.192054
86	\N	\N	\N	2014-05-29 15:51:02.21866	2014-05-29 15:51:02.21866
87	time test	1	1	2014-05-29 15:54:20.557683	2014-05-29 15:54:20.563368
88	hey	1	1	2014-05-29 15:55:20.85712	2014-05-29 15:55:20.863493
89	time test	1	1	2014-05-29 15:55:37.674062	2014-05-29 15:55:37.67876
90	time test	1	1	2014-05-29 16:02:37.109169	2014-05-29 16:02:37.114478
91	Hey	1	1	2014-05-29 19:31:01.797349	2014-05-29 19:31:01.804695
92	sup	1	2	2014-05-29 19:43:36.523487	2014-05-29 19:43:36.52843
93	time test	1	2	2014-05-29 20:09:54.151154	2014-05-29 20:09:54.156144
95	hello	1	1	2014-05-29 20:25:16.05229	2014-05-29 20:25:16.056318
96	hello	1	2	2014-05-29 20:25:20.343829	2014-05-29 20:25:20.348281
97	Hello	1	2	2014-05-29 20:25:27.14197	2014-05-29 20:25:27.146704
98	hey	1	1	2014-05-29 20:27:46.951586	2014-05-29 20:27:46.956628
99	hi	1	2	2014-05-29 20:27:51.930506	2014-05-29 20:27:51.935306
100	hey	1	2	2014-05-29 20:28:03.684177	2014-05-29 20:28:03.687116
101	hey	1	2	2014-05-29 20:28:08.21066	2014-05-29 20:28:08.214962
102	hi	1	1	2014-05-29 20:28:35.77511	2014-05-29 20:28:35.780731
103	hey	1	1	2014-05-29 20:28:50.005542	2014-05-29 20:28:50.010859
104	how's it going	1	2	2014-05-29 20:28:55.0347	2014-05-29 20:28:55.039793
105	hello	1	2	2014-05-29 20:29:07.216277	2014-05-29 20:29:07.221018
106	siup	1	2	2014-05-29 20:29:19.552989	2014-05-29 20:29:19.555362
107	hey	1	2	2014-05-29 20:30:12.170188	2014-05-29 20:30:12.175244
108	holla	1	2	2014-05-29 20:32:16.974156	2014-05-29 20:32:16.9771
109	hello	1	1	2014-05-29 20:49:54.252304	2014-05-29 20:49:54.256918
110	how it do	1	1	2014-05-29 20:50:00.842724	2014-05-29 20:50:00.847685
111	sup	1	1	2014-05-29 20:50:43.36991	2014-05-29 20:50:43.373568
112	Hey	1	4	2014-05-29 20:53:27.337658	2014-05-29 20:53:27.340615
113	How's it going?	1	4	2014-05-29 20:53:45.42573	2014-05-29 20:53:45.428721
114	hey	1	4	2014-05-29 20:54:57.079133	2014-05-29 20:54:57.083413
115	hey	1	1	2014-05-29 21:06:18.125459	2014-05-29 21:06:18.129666
116	Hey	1	1	2014-05-29 21:38:21.617234	2014-05-29 21:38:21.621684
117	hey	1	1	2014-05-29 21:38:55.023433	2014-05-29 21:38:55.027523
118	Hey	1	1	2014-05-29 21:39:18.622294	2014-05-29 21:39:18.625017
119	Hi	1	1	2014-05-29 21:39:22.665208	2014-05-29 21:39:22.668974
120	Hey how's it going?	1	2	2014-05-29 21:39:40.157144	2014-05-29 21:39:40.160008
121	Hey	1	1	2014-05-29 21:40:25.864947	2014-05-29 21:40:25.870318
122	Hello	1	2	2014-05-29 21:40:32.842846	2014-05-29 21:40:32.847517
123	Hey	1	1	2014-05-29 21:42:16.191503	2014-05-29 21:42:16.197346
124	Hey	1	1	2014-05-29 21:42:42.174202	2014-05-29 21:42:42.179228
125	hello	1	1	2014-05-29 21:43:00.2292	2014-05-29 21:43:00.235967
126	Hey	1	1	2014-05-29 21:43:42.233155	2014-05-29 21:43:42.23945
127	Hey	1	1	2014-05-29 21:44:16.282845	2014-05-29 21:44:16.288157
128	Whats up	1	1	2014-05-29 21:44:37.245875	2014-05-29 21:44:37.251114
129	Sound test sound test	1	1	2014-05-29 21:44:53.024695	2014-05-29 21:44:53.02703
130	This is a sound test	1	4	2014-05-29 21:45:16.616204	2014-05-29 21:45:16.621743
131	sound test	1	1	2014-05-29 21:46:45.302692	2014-05-29 21:46:45.305261
132	set the audio path	1	1	2014-05-29 21:47:30.623418	2014-05-29 21:47:30.628498
133	set the audio path	1	1	2014-05-29 21:47:50.580511	2014-05-29 21:47:50.586125
134	yo	1	1	2014-05-29 21:48:13.611189	2014-05-29 21:48:13.61702
135	audio test	1	1	2014-05-29 21:49:26.943918	2014-05-29 21:49:26.949632
136	this is an audio test	1	1	2014-05-29 21:49:49.774519	2014-05-29 21:49:49.779958
137	why isnt htis working	1	1	2014-05-29 21:50:09.693981	2014-05-29 21:50:09.69854
138	hey	1	1	2014-05-29 21:51:17.710156	2014-05-29 21:51:17.715258
139	Hey	1	1	2014-05-29 21:54:01.024911	2014-05-29 21:54:01.029242
140	Audio test	1	1	2014-05-29 21:57:29.576249	2014-05-29 21:57:29.582702
141	This is an audio test	1	5	2014-05-29 21:58:01.742989	2014-05-29 21:58:01.74719
142	this is an audio test	1	5	2014-05-29 21:58:18.561208	2014-05-29 21:58:18.566492
143	Hey	1	2	2014-05-29 22:00:07.744758	2014-05-29 22:00:07.749383
144	Hello	1	2	2014-05-29 22:02:13.099071	2014-05-29 22:02:13.104476
145	This is a test	1	2	2014-05-29 22:02:18.129659	2014-05-29 22:02:18.133966
146	This is a sound test	1	5	2014-05-29 22:02:57.864099	2014-05-29 22:02:57.869081
147	Sound is working now	1	2	2014-05-29 22:03:06.113957	2014-05-29 22:03:06.118568
148	Sound is not working now	1	5	2014-05-29 22:03:16.472029	2014-05-29 22:03:16.476476
149	hello	1	5	2014-05-29 22:04:42.035785	2014-05-29 22:04:42.040753
150	Hello	1	5	2014-05-29 22:05:26.560289	2014-05-29 22:05:26.563608
151	i'd like to test the soudn	1	5	2014-05-29 22:05:32.628011	2014-05-29 22:05:32.632288
152	I think th sound is working!	1	2	2014-05-29 22:05:41.565352	2014-05-29 22:05:41.570401
153	Get! Working sound!!	1	4	2014-05-29 22:05:56.77266	2014-05-29 22:05:56.777225
154	This is a test	1	4	2014-05-29 22:06:05.126761	2014-05-29 22:06:05.131825
155	Hey	1	5	2014-05-29 22:16:52.857188	2014-05-29 22:16:52.863537
156	Hey	1	5	2014-05-29 22:45:29.120281	2014-05-29 22:45:29.125871
157	hey	1	2	2014-05-29 22:45:35.501891	2014-05-29 22:45:35.505565
158	this is a test	1	5	2014-05-29 22:45:38.948982	2014-05-29 22:45:38.952836
159	this is a test too	1	2	2014-05-29 22:45:52.083382	2014-05-29 22:45:52.088377
160	hey	1	2	2014-05-30 04:56:56.256023	2014-05-30 04:56:56.269116
161	hey	1	2	2014-05-30 04:57:00.650768	2014-05-30 04:57:00.653791
162	hey	1	2	2014-05-30 05:03:53.030816	2014-05-30 05:03:53.037421
163	hey	1	2	2014-05-30 05:03:54.170823	2014-05-30 05:03:54.1749
164	audio test	1	2	2014-05-30 06:58:17.117675	2014-05-30 06:58:17.123215
165	hey	1	2	2014-05-30 22:30:58.252376	2014-05-30 22:30:58.257913
166	hey	1	2	2014-05-31 01:39:18.604143	2014-05-31 01:39:18.611778
167	hey	1	17	2014-06-03 21:56:04.193527	2014-06-03 21:56:04.197148
168	hey	1	16	2014-06-03 21:56:07.825286	2014-06-03 21:56:07.829706
169	hjgoeahdodlvnoalrngkafvaf	1	16	2014-06-03 22:07:42.607199	2014-06-03 22:07:42.611285
170	hello	1	18	2014-06-24 17:18:42.516465	2014-06-24 17:18:42.522606
171	hello	6	18	2014-06-24 17:28:29.116106	2014-06-24 17:28:29.120987
172	how's it going	6	18	2014-06-24 17:33:03.064146	2014-06-24 17:33:03.068555
173	how's it going	6	18	2014-06-24 17:33:05.000286	2014-06-24 17:33:05.005032
174	how's it going	6	18	2014-06-24 17:33:05.911414	2014-06-24 17:33:05.916043
175	how's it going	6	18	2014-06-24 17:33:06.622325	2014-06-24 17:33:06.626461
176	what's up	6	18	2014-06-24 17:34:03.674864	2014-06-24 17:34:03.678933
177	hey	6	18	2014-06-24 17:40:15.395146	2014-06-24 17:40:15.401084
178	hello	7	18	2014-06-24 17:52:38.382611	2014-06-24 17:52:38.388043
179	how's it going	6	18	2014-06-24 17:52:47.650105	2014-06-24 17:52:47.654414
180	hey what's up	6	19	2014-06-24 17:53:35.750796	2014-06-24 17:53:35.753433
181	well i've been struggling with this issue for awhile. i've been having some anxiety issues	6	19	2014-06-24 17:55:23.616623	2014-06-24 17:55:23.621003
182	hey	6	18	2014-06-24 17:58:45.448066	2014-06-24 17:58:45.453471
183	hello	1	18	2014-06-24 18:20:06.641472	2014-06-24 18:20:06.646387
184	what's up	6	18	2014-06-24 19:15:32.275461	2014-06-24 19:15:32.28009
185	how's it going	6	18	2014-06-24 19:15:38.284383	2014-06-24 19:15:38.288259
186	hi	6	18	2014-06-24 19:18:07.211789	2014-06-24 19:18:07.216437
187	what's going on	6	18	2014-06-24 19:18:11.902666	2014-06-24 19:18:11.906764
188	howdy	6	18	2014-06-24 19:21:14.272643	2014-06-24 19:21:14.277227
189	how's it going	6	18	2014-06-24 19:21:24.13708	2014-06-24 19:21:24.142054
190	well i think wht's going on is this	6	18	2014-06-24 19:21:42.656187	2014-06-24 19:21:42.660664
191	hello	6	18	2014-06-24 19:22:30.644695	2014-06-24 19:22:30.6481
192	sup	6	18	2014-06-24 19:22:40.606843	2014-06-24 19:22:40.612232
193	how's it going	6	18	2014-06-24 19:22:46.697346	2014-06-24 19:22:46.701843
194	hello	6	18	2014-06-24 19:23:43.406355	2014-06-24 19:23:43.409979
195	what's up	6	18	2014-06-24 19:23:49.329331	2014-06-24 19:23:49.333418
196	hello	6	18	2014-06-24 19:25:01.056325	2014-06-24 19:25:01.058627
197	what's up	6	18	2014-06-24 19:25:06.079044	2014-06-24 19:25:06.083759
198	i want to tell you something	6	18	2014-06-24 19:25:10.837912	2014-06-24 19:25:10.842594
199	i've been suffering fro somethign	6	18	2014-06-24 19:25:26.254267	2014-06-24 19:25:26.258502
200	i'm really tire	6	18	2014-06-24 19:30:04.157624	2014-06-24 19:30:04.161846
201	hello	6	18	2014-06-24 19:50:38.157085	2014-06-24 19:50:38.163083
202	sup	6	18	2014-06-24 19:50:42.681056	2014-06-24 19:50:42.685602
203	hello	1	18	2014-06-24 19:52:41.921971	2014-06-24 19:52:41.926489
204	hello	6	18	2014-06-24 19:54:49.107053	2014-06-24 19:54:49.111469
205	hi	6	18	2014-06-24 19:55:01.362645	2014-06-24 19:55:01.367209
206	testing animation	6	18	2014-06-24 19:55:04.146284	2014-06-24 19:55:04.149821
207	hello	6	18	2014-06-24 19:56:30.386249	2014-06-24 19:56:30.390714
208	hello	6	18	2014-06-24 19:58:38.433815	2014-06-24 19:58:38.438281
209	hi	6	18	2014-06-24 19:58:42.710843	2014-06-24 19:58:42.713248
210	ajax test	6	18	2014-06-24 19:58:47.881949	2014-06-24 19:58:47.886483
211	hello ajax test	6	18	2014-06-24 19:59:24.661056	2014-06-24 19:59:24.665379
212	hello	6	18	2014-06-24 20:01:41.896145	2014-06-24 20:01:41.898698
213	hello	6	18	2014-06-24 20:02:20.589159	2014-06-24 20:02:20.59351
214	ajax test	6	18	2014-06-24 20:02:27.698642	2014-06-24 20:02:27.702163
215	hello	6	18	2014-06-24 20:04:30.553989	2014-06-24 20:04:30.558694
216	test	6	18	2014-06-24 20:04:39.522125	2014-06-24 20:04:39.526682
217	hello	6	18	2014-06-24 20:05:06.843223	2014-06-24 20:05:06.847483
218	hello	6	18	2014-06-24 20:05:48.858073	2014-06-24 20:05:48.863087
219	hello	6	18	2014-06-24 20:05:59.113476	2014-06-24 20:05:59.11713
220	hi	6	18	2014-06-24 20:06:02.63898	2014-06-24 20:06:02.643783
221	hello	6	18	2014-06-24 20:06:15.661032	2014-06-24 20:06:15.66559
222	ajax test	6	18	2014-06-24 20:06:55.24891	2014-06-24 20:06:55.252638
223	test	6	18	2014-06-24 20:07:07.419222	2014-06-24 20:07:07.423588
224	hi	6	18	2014-06-24 20:07:18.990532	2014-06-24 20:07:18.995756
225	ajax test	6	18	2014-06-24 20:07:46.773893	2014-06-24 20:07:46.778513
226	ajax test again	6	18	2014-06-24 20:07:53.87046	2014-06-24 20:07:53.874878
227	testing loading animation	6	18	2014-06-24 20:08:03.414305	2014-06-24 20:08:03.418061
228	hello my name is Gene	6	18	2014-06-24 20:09:18.046863	2014-06-24 20:09:18.051157
232	hi	6	18	2014-06-24 21:27:52.788457	2014-06-24 21:27:52.792925
234	Test	6	18	2014-06-24 21:28:04.146696	2014-06-24 21:28:04.152151
236	blah blah	6	18	2014-06-24 21:57:48.22484	2014-06-24 21:57:48.229531
241	ajax tets	6	18	2014-06-25 05:12:56.859681	2014-06-25 05:12:56.862443
242	hello	6	18	2014-06-25 05:52:20.727446	2014-06-25 05:52:20.731994
229	I'm here to talk to you about stuff	6	18	2014-06-24 20:09:25.37843	2014-06-24 20:09:25.382586
230	hello	1	18	2014-06-24 20:52:46.179108	2014-06-24 20:52:46.183293
231	this is a test. i'm testing the ajax loading animation. it looks pretty ok	1	18	2014-06-24 21:00:26.020417	2014-06-24 21:00:26.025125
233	hello my name is Gene	6	18	2014-06-24 21:27:59.028646	2014-06-24 21:27:59.033789
235	Test test	6	18	2014-06-24 21:28:08.602591	2014-06-24 21:28:08.606785
237	blah blah this is an ajax test	1	18	2014-06-24 21:58:22.020908	2014-06-24 21:58:22.027494
238	hello	6	18	2014-06-25 01:05:17.430347	2014-06-25 01:05:17.436959
239	ajax test	6	18	2014-06-25 01:06:22.073181	2014-06-25 01:06:22.078779
240	gene	6	18	2014-06-25 04:02:40.860232	2014-06-25 04:02:40.866131
243	how's it going	1	18	2014-06-25 15:30:43.214843	2014-06-25 15:30:43.219153
244	i'm doing ok how bout you	1	18	2014-06-25 15:33:12.841604	2014-06-25 15:33:12.845816
245	\N	\N	\N	2014-06-27 05:54:24.043157	2014-06-27 05:54:24.043157
246	\N	\N	\N	2014-06-27 07:31:52.769272	2014-06-27 07:31:52.769272
247	\N	\N	\N	2014-06-27 07:31:59.437103	2014-06-27 07:31:59.437103
248	\N	\N	\N	2014-06-27 18:10:18.868043	2014-06-27 18:10:18.868043
249	\N	\N	\N	2014-06-27 18:10:31.3829	2014-06-27 18:10:31.3829
250	hey	21	25	2014-06-27 18:12:07.607179	2014-06-27 18:12:07.613844
251	my name is gene	21	25	2014-06-27 18:12:52.502436	2014-06-27 18:12:52.508566
252	hello	24	26	2014-06-27 23:20:28.060597	2014-06-27 23:20:28.067964
253	hey	24	26	2014-06-27 23:20:57.916161	2014-06-27 23:20:57.922774
254	hey	25	26	2014-06-27 23:26:18.871671	2014-06-27 23:26:18.878358
255	hi	25	26	2014-06-27 23:26:25.660292	2014-06-27 23:26:25.667187
256	my name is gene	25	26	2014-06-27 23:26:28.659807	2014-06-27 23:26:28.66616
257	hi	25	26	2014-06-27 23:26:50.7253	2014-06-27 23:26:50.73112
258	uhygtfredws	27	27	2014-06-28 23:01:30.536267	2014-06-28 23:01:30.54434
259	hey	29	28	2014-06-29 04:30:26.119213	2014-06-29 04:30:26.125683
260	hey	30	28	2014-06-29 15:03:34.052634	2014-06-29 15:03:34.059771
261	hey	30	28	2014-06-29 15:32:54.534848	2014-06-29 15:32:54.540548
262	hey	30	28	2014-06-29 15:43:17.210328	2014-06-29 15:43:17.217979
263	test	30	28	2014-06-29 15:47:11.646586	2014-06-29 15:47:11.652201
264	page-specific loaded	30	28	2014-06-29 15:47:29.89331	2014-06-29 15:47:29.898666
265	hey	31	26	2014-06-29 15:52:59.723151	2014-06-29 15:52:59.72761
266	is this working?	31	26	2014-06-29 15:53:32.395286	2014-06-29 15:53:32.401761
267	mesage posted?	31	26	2014-06-29 15:54:20.252459	2014-06-29 15:54:20.258087
268	test	31	26	2014-06-29 15:55:06.890546	2014-06-29 15:55:06.895123
269	test	31	26	2014-06-29 15:58:21.057594	2014-06-29 15:58:21.063988
270	hi	32	26	2014-06-29 15:58:48.238196	2014-06-29 15:58:48.243407
271	hey	32	26	2014-06-29 16:17:46.684018	2014-06-29 16:17:46.691495
272	hey	33	29	2014-06-29 20:55:54.233197	2014-06-29 20:55:54.239839
273	hello	43	31	2014-06-30 00:39:33.192754	2014-06-30 00:39:33.199333
274	hi how's it going?	30	33	2014-06-30 01:00:35.714138	2014-06-30 01:00:35.720457
275	hey what;s up	31	33	2014-06-30 01:04:50.785158	2014-06-30 01:04:50.791592
276	hey	46	34	2014-06-30 01:12:08.128662	2014-06-30 01:12:08.135084
277	hey	55	38	2014-06-30 07:18:27.257628	2014-06-30 07:18:27.263834
278	hey	56	38	2014-06-30 07:19:04.923019	2014-06-30 07:19:04.92871
279	hey	57	39	2014-06-30 07:20:26.534763	2014-06-30 07:20:26.542779
280	hey	58	33	2014-06-30 07:29:04.640664	2014-06-30 07:29:04.646603
281	hello	64	38	2014-06-30 21:31:06.568253	2014-06-30 21:31:06.575108
282	hey	64	33	2014-06-30 21:31:27.957322	2014-06-30 21:31:27.964958
283	hey	58	33	2014-06-30 22:51:10.826758	2014-06-30 22:51:10.832072
284	hey	58	33	2014-06-30 23:01:39.531024	2014-06-30 23:01:39.58022
285	hey	65	42	2014-07-01 00:03:44.040352	2014-07-01 00:03:44.047214
286	hhh	59	26	2014-07-01 02:45:43.293969	2014-07-01 02:45:43.30009
287	heyy	59	26	2014-07-01 02:45:51.527295	2014-07-01 02:45:51.531607
288	hi	59	26	2014-07-01 02:46:05.127133	2014-07-01 02:46:05.13341
289	hi hi	59	26	2014-07-01 02:46:08.524283	2014-07-01 02:46:08.530859
290	hey	59	26	2014-07-01 20:28:35.861309	2014-07-01 20:28:35.868871
291	hey	59	26	2014-07-02 13:41:30.125633	2014-07-02 13:41:30.134681
292	hey	59	26	2014-07-02 14:06:28.741937	2014-07-02 14:06:28.748429
293	hey	59	26	2014-07-02 14:27:53.336878	2014-07-02 14:27:53.342798
294	hows it going	59	26	2014-07-02 14:27:56.320878	2014-07-02 14:27:56.327065
295	this is a test	59	26	2014-07-02 14:27:58.093384	2014-07-02 14:27:58.098645
296	hi	59	26	2014-07-02 14:28:36.585033	2014-07-02 14:28:36.590177
297	sup	59	26	2014-07-02 14:29:31.13547	2014-07-02 14:29:31.139404
298	hey	59	26	2014-07-02 14:32:00.081514	2014-07-02 14:32:00.087177
299	hi	59	26	2014-07-02 14:32:02.82081	2014-07-02 14:32:02.826259
300	this is atest	59	26	2014-07-02 14:32:04.789279	2014-07-02 14:32:04.795244
301	i'm testing the scroll	59	26	2014-07-02 14:32:07.997645	2014-07-02 14:32:08.003347
302	scroll this shit	59	26	2014-07-02 14:32:10.413813	2014-07-02 14:32:10.420349
303	i ownt' break it	59	26	2014-07-02 14:32:12.677372	2014-07-02 14:32:12.683323
304	hey	59	26	2014-07-02 14:32:48.445948	2014-07-02 14:32:48.454061
305	hello	59	26	2014-07-02 14:36:08.394341	2014-07-02 14:36:08.401378
306	hey	59	26	2014-07-02 14:36:28.377684	2014-07-02 14:36:28.386612
307	hey	59	26	2014-07-02 14:36:50.832825	2014-07-02 14:36:50.839894
308	hows it going	59	26	2014-07-02 14:36:54.001095	2014-07-02 14:36:54.008263
309	hello	59	26	2014-07-02 14:36:55.908868	2014-07-02 14:36:55.917362
310	b	59	26	2014-07-02 14:36:57.89158	2014-07-02 14:36:57.899454
311	a	59	26	2014-07-02 14:36:58.544866	2014-07-02 14:36:58.552311
312	g	59	26	2014-07-02 14:36:59.235836	2014-07-02 14:36:59.243059
313	h	59	26	2014-07-02 14:36:59.840806	2014-07-02 14:36:59.849255
314	hey	59	26	2014-07-02 14:38:34.201335	2014-07-02 14:38:34.210299
315	hey	59	26	2014-07-02 14:40:25.725119	2014-07-02 14:40:25.731632
316	hey	59	26	2014-07-02 14:41:31.41595	2014-07-02 14:41:31.422139
317	hey	59	26	2014-07-02 14:42:23.692825	2014-07-02 14:42:23.700325
318	test	59	26	2014-07-02 14:43:23.32874	2014-07-02 14:43:23.336317
319	test	59	26	2014-07-02 14:44:34.878723	2014-07-02 14:44:34.886787
320	test	59	26	2014-07-02 14:44:59.313378	2014-07-02 14:44:59.320371
321	hey	59	26	2014-07-02 14:45:02.130896	2014-07-02 14:45:02.138444
322	asup	59	26	2014-07-02 14:45:24.640715	2014-07-02 14:45:24.646252
323	hey	59	26	2014-07-02 14:45:30.875517	2014-07-02 14:45:30.88372
324	hey	59	26	2014-07-02 14:46:15.329862	2014-07-02 14:46:15.33789
325	hey	59	26	2014-07-02 14:46:50.747998	2014-07-02 14:46:50.755733
326	hey	59	26	2014-07-02 14:47:00.718674	2014-07-02 14:47:00.72631
327	hows it going	59	26	2014-07-02 14:47:04.43411	2014-07-02 14:47:04.441912
328	how	59	26	2014-07-02 14:47:06.945779	2014-07-02 14:47:06.952
329	why	59	26	2014-07-02 14:47:08.609293	2014-07-02 14:47:08.617114
330	scroll	59	26	2014-07-02 14:47:30.179598	2014-07-02 14:47:30.186223
331	test	59	26	2014-07-02 14:47:31.384925	2014-07-02 14:47:31.392701
332	hi	59	26	2014-07-02 14:50:03.726175	2014-07-02 14:50:03.734213
333	hey	59	26	2014-07-02 14:50:54.862714	2014-07-02 14:50:54.86823
334	hi	59	26	2014-07-02 14:50:56.866293	2014-07-02 14:50:56.873481
335	hey	59	26	2014-07-02 14:51:26.586425	2014-07-02 14:51:26.59269
336	test	59	26	2014-07-02 14:51:27.841296	2014-07-02 14:51:27.848977
337	test	59	26	2014-07-02 14:53:40.128136	2014-07-02 14:53:40.135649
338	hey	59	26	2014-07-02 14:53:42.490828	2014-07-02 14:53:42.498327
339	spinner	59	26	2014-07-02 14:53:54.51142	2014-07-02 14:53:54.517263
340	test	59	26	2014-07-02 14:53:56.181098	2014-07-02 14:53:56.1886
341	tst	59	26	2014-07-02 14:54:41.172718	2014-07-02 14:54:41.179971
342	spinner	59	26	2014-07-02 14:56:38.777035	2014-07-02 14:56:38.784235
343	test	59	26	2014-07-02 14:56:41.702073	2014-07-02 14:56:41.709058
344	test	59	26	2014-07-02 14:57:04.29151	2014-07-02 14:57:04.297241
345	best	59	26	2014-07-02 14:57:06.00741	2014-07-02 14:57:06.015014
346	test	59	26	2014-07-02 14:57:07.566531	2014-07-02 14:57:07.574031
347	this is atest	59	26	2014-07-02 14:57:10.823593	2014-07-02 14:57:10.830857
348	hello	59	26	2014-07-02 14:57:12.853694	2014-07-02 14:57:12.860565
349	sup	59	26	2014-07-02 14:57:15.438226	2014-07-02 14:57:15.445219
350	hi	59	26	2014-07-02 14:57:34.700142	2014-07-02 14:57:34.708903
351	test	59	26	2014-07-02 14:57:37.938577	2014-07-02 14:57:37.946718
352	hi	59	26	2014-07-02 14:57:40.853659	2014-07-02 14:57:40.860365
353	i wanted to tell you about something	59	26	2014-07-02 14:57:43.64991	2014-07-02 14:57:43.657996
354	that i've been dealing with	59	26	2014-07-02 14:57:46.801476	2014-07-02 14:57:46.808667
355	i don't really know how to put all this	59	26	2014-07-02 14:57:50.657105	2014-07-02 14:57:50.664786
356	but i've just been really unhappy	59	26	2014-07-02 14:57:54.985408	2014-07-02 14:57:54.992064
357	hey	59	26	2014-07-02 15:00:33.316236	2014-07-02 15:00:33.324245
358	blah	59	26	2014-07-02 15:00:36.15082	2014-07-02 15:00:36.159328
359	testing	59	26	2014-07-02 15:00:39.325339	2014-07-02 15:00:39.333277
360	testing	59	26	2014-07-02 15:00:40.758219	2014-07-02 15:00:40.765169
361	hi	59	26	2014-07-02 15:00:52.337971	2014-07-02 15:00:52.345287
362	test	59	26	2014-07-02 15:00:53.713771	2014-07-02 15:00:53.720418
363	but i've just been really unhappy but i've just been really unhappybut i've just been really unhappy but i've just been really unhappy but i've just been really unhappybut i've just been really unhappy	59	26	2014-07-02 15:05:14.712125	2014-07-02 15:05:14.718291
364	ㅗ됴	59	26	2014-07-02 15:06:34.301706	2014-07-02 15:06:34.306762
365	hey	59	26	2014-07-02 15:06:38.424975	2014-07-02 15:06:38.43289
366	hi	59	26	2014-07-02 16:03:29.313587	2014-07-02 16:03:29.320594
367	hello	59	26	2014-07-02 16:03:32.567573	2014-07-02 16:03:32.5739
368	hey	59	26	2014-07-02 16:04:18.469027	2014-07-02 16:04:18.476805
369	so	59	33	2014-07-02 16:31:47.497593	2014-07-02 16:31:47.504691
370	hey	59	33	2014-07-02 16:31:48.903901	2014-07-02 16:31:48.910918
371	how's it going?	59	33	2014-07-02 16:31:51.422383	2014-07-02 16:31:51.429915
372	good	59	26	2014-07-02 16:31:56.801218	2014-07-02 16:31:56.808628
373	good	59	26	2014-07-02 16:31:59.079241	2014-07-02 16:31:59.08737
374	hey	59	33	2014-07-02 16:32:09.89671	2014-07-02 16:32:09.903962
375	test	59	26	2014-07-02 16:33:10.499978	2014-07-02 16:33:10.507308
376	hey	59	26	2014-07-02 16:34:41.828223	2014-07-02 16:34:41.83454
377	test	59	26	2014-07-02 16:35:30.810706	2014-07-02 16:35:30.818528
378	hello	59	26	2014-07-02 16:35:33.476992	2014-07-02 16:35:33.483173
379	hi	59	26	2014-07-02 16:35:35.64891	2014-07-02 16:35:35.655272
380	test	59	26	2014-07-02 16:56:22.162772	2014-07-02 16:56:22.16916
381	.container:before {\n\t\t\tcontent: '';\n\t\t\tdisplay: block;\n\t\t\tbox-shadow: inset 0px 40px 20px black;\n\t\t\tposition: absolute;\n\t\t\ttop: 0;\n\t\t\tleft: 0;\n\t\t\twidth: 100%;\n\t\t\theight: 100%;\n\t\t}	59	33	2014-07-02 16:56:25.388213	2014-07-02 16:56:25.396006
382	.container:before {\n\t\t\tcontent: '';\n\t\t\tdisplay: block;\n\t\t\tbox-shadow: inset 0px 40px 20px black;\n\t\t\tposition: absolute;\n\t\t\ttop: 0;\n\t\t\tleft: 0;\n\t\t\twidth: 100%;\n\t\t\theight: 100%;\n\t\t}	59	26	2014-07-02 16:56:27.98177	2014-07-02 16:56:27.987362
383	hello right?	59	26	2014-07-02 16:56:36.309924	2014-07-02 16:56:36.31557
384	hey what's up?	59	26	2014-07-02 17:04:52.480691	2014-07-02 17:04:52.488498
385	hello	59	26	2014-07-02 17:05:26.031105	2014-07-02 17:05:26.037815
386	#messages:before {\n\t\t\t\tcontent: '';\n\t\t\t\tdisplay: block;\n\t\t\t\tbox-shadow: inset 0px 80px 80px white;\n\t\t\t\tposition: absolute;\n\t\t\t\ttop: 0px;\n\t\t\t\tright: 5px;\n\t\t\t\twidth: 100%;\n\t\t\t\theight: 100%;\n\t\t\t}	59	33	2014-07-02 17:05:30.156513	2014-07-02 17:05:30.164167
387	hey	59	26	2014-07-02 17:24:05.080561	2014-07-02 17:24:05.088373
388	this is atest	59	26	2014-07-02 17:24:08.076716	2014-07-02 17:24:08.083427
389	hello?	59	26	2014-07-02 18:04:49.935094	2014-07-02 18:04:49.942638
390	hello	59	26	2014-07-02 18:40:03.823586	2014-07-02 18:40:03.828423
391	this is a test	59	26	2014-07-02 18:40:07.456862	2014-07-02 18:40:07.46472
392	hey	59	26	2014-07-02 18:40:43.07357	2014-07-02 18:40:43.080969
393	hey	59	26	2014-07-02 18:41:10.072501	2014-07-02 18:41:10.080995
394	how's it going	59	26	2014-07-02 18:41:13.094213	2014-07-02 18:41:13.102132
395	test	59	26	2014-07-02 18:41:28.853666	2014-07-02 18:41:28.858685
396	hey	59	26	2014-07-02 18:42:36.252186	2014-07-02 18:42:36.257246
397	this is a test	59	26	2014-07-02 18:42:45.744771	2014-07-02 18:42:45.751824
398	spinner test	59	26	2014-07-02 18:42:48.043571	2014-07-02 18:42:48.051492
399	spinner test	59	26	2014-07-02 18:43:58.229515	2014-07-02 18:43:58.234921
400	\N	\N	\N	2014-07-02 22:40:03.397098	2014-07-02 22:40:03.397098
401	\N	\N	\N	2014-07-02 22:40:26.479227	2014-07-02 22:40:26.479227
402	\N	\N	\N	2014-07-02 22:40:59.43542	2014-07-02 22:40:59.43542
403	\N	\N	\N	2014-07-02 22:41:01.719546	2014-07-02 22:41:01.719546
404	\N	\N	\N	2014-07-02 22:42:21.373269	2014-07-02 22:42:21.373269
405	hello	59	26	2014-07-02 22:46:34.942448	2014-07-02 22:46:34.95179
406	how's it going	59	44	2014-07-02 22:50:22.644336	2014-07-02 22:50:22.649889
407	hello	59	26	2014-07-02 23:33:37.442775	2014-07-02 23:33:37.451205
408	hey	59	26	2014-07-02 23:33:47.798002	2014-07-02 23:33:47.803062
409	hey	59	44	2014-07-02 23:48:32.261166	2014-07-02 23:48:32.266538
410	hi	59	26	2014-07-03 00:27:00.635366	2014-07-03 00:27:00.641487
411	food	59	26	2014-07-03 00:27:03.696207	2014-07-03 00:27:03.70312
412	is	59	26	2014-07-03 00:27:04.705702	2014-07-03 00:27:04.712469
413	tasty	59	26	2014-07-03 00:27:05.669915	2014-07-03 00:27:05.677225
414	yo	59	26	2014-07-03 00:27:06.384683	2014-07-03 00:27:06.392254
415	rawr	59	44	2014-07-03 00:27:14.18752	2014-07-03 00:27:14.19392
416	no you rawr	59	26	2014-07-03 00:27:17.663652	2014-07-03 00:27:17.670795
417	:(	59	44	2014-07-03 00:27:20.193846	2014-07-03 00:27:20.201344
418	:*(	59	26	2014-07-03 00:27:24.598433	2014-07-03 00:27:24.605822
419	lololol	59	26	2014-07-03 00:29:09.071752	2014-07-03 00:29:09.078459
420	niiiii	59	44	2014-07-03 00:32:02.083737	2014-07-03 00:32:02.090721
421	howww	59	26	2014-07-03 00:32:06.589894	2014-07-03 00:32:06.596712
422	giiiiii	59	26	2014-07-03 00:32:09.854371	2014-07-03 00:32:09.861447
423	test	59	26	2014-07-03 00:32:11.712101	2014-07-03 00:32:11.718195
424	yeah	59	26	2014-07-03 00:32:16.022506	2014-07-03 00:32:16.029834
425	i mean.....it's hard	59	26	2014-07-03 00:32:19.522125	2014-07-03 00:32:19.528957
426	hey	59	26	2014-07-03 00:34:22.742303	2014-07-03 00:34:22.748414
427	he	59	44	2014-07-03 00:36:27.42382	2014-07-03 00:36:27.429844
428	he	59	44	2014-07-03 00:36:31.189324	2014-07-03 00:36:31.196835
429	he	59	44	2014-07-03 00:36:33.486108	2014-07-03 00:36:33.492461
430	hey	59	44	2014-07-03 00:38:19.343427	2014-07-03 00:38:19.350025
431	hello	59	44	2014-07-03 00:38:23.022782	2014-07-03 00:38:23.028825
432	hi	59	44	2014-07-03 00:38:28.017051	2014-07-03 00:38:28.022395
433	test	59	44	2014-07-03 00:38:28.958311	2014-07-03 00:38:28.965587
434	test	59	44	2014-07-03 00:38:29.940387	2014-07-03 00:38:29.945925
435	test	59	44	2014-07-03 00:38:30.500878	2014-07-03 00:38:30.508221
436	est	59	44	2014-07-03 00:38:31.023364	2014-07-03 00:38:31.031451
437	test	59	44	2014-07-03 00:38:31.529076	2014-07-03 00:38:31.535696
438	es	59	44	2014-07-03 00:38:31.967136	2014-07-03 00:38:31.973683
439	\ntest	59	44	2014-07-03 00:38:33.573026	2014-07-03 00:38:33.578951
440	hello	59	44	2014-07-03 01:23:26.113574	2014-07-03 01:23:26.120873
441	hello this is a test	59	26	2014-07-03 03:05:02.260407	2014-07-03 03:05:02.268343
442	height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;	59	26	2014-07-03 03:05:07.075835	2014-07-03 03:05:07.082694
443	height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;height: 80px;\n\twidth: 100%;\n\ttext-align: center;	59	26	2014-07-03 03:05:11.300686	2014-07-03 03:05:11.308006
444	hello	59	26	2014-07-03 03:19:43.20647	2014-07-03 03:19:43.213599
446	hey	59	26	2014-07-03 03:37:58.773292	2014-07-03 03:37:58.781774
447	hey	59	26	2014-07-03 03:39:58.590709	2014-07-03 03:39:58.598063
449	sup	59	44	2014-07-03 03:40:29.849736	2014-07-03 03:40:29.948321
450	hey	59	26	2014-07-03 04:04:11.165301	2014-07-03 04:04:11.174554
452	hello	59	44	2014-07-03 11:28:21.465252	2014-07-03 11:28:21.475789
453	hey	59	26	2014-07-03 11:53:44.85704	2014-07-03 11:53:44.865428
457	how's it goinggggg	59	44	2014-07-03 21:19:10.766487	2014-07-03 21:19:10.773094
459	hey	59	26	2014-07-04 12:54:03.809106	2014-07-04 12:54:03.817898
445	hey howsi t going	59	44	2014-07-03 03:20:01.001269	2014-07-03 03:20:01.007848
448	what's up	59	26	2014-07-03 03:40:04.097338	2014-07-03 03:40:04.103495
451	hey	59	26	2014-07-03 11:13:27.568784	2014-07-03 11:13:27.574022
454	hey	59	26	2014-07-03 17:46:56.500416	2014-07-03 17:46:56.507718
455	supppppp	59	44	2014-07-03 21:01:27.733608	2014-07-03 21:01:27.740466
456	hey	59	44	2014-07-03 21:19:06.41017	2014-07-03 21:19:06.415822
458	SUPPPPPPPPPP BEETCHESSSSS	59	44	2014-07-03 21:19:19.099972	2014-07-03 21:19:19.106434
460	hello	59	26	2014-07-04 16:14:12.974618	2014-07-04 16:14:12.983602
461	hello	59	44	2014-07-04 18:23:09.53714	2014-07-04 18:23:09.542212
462	test	59	44	2014-07-04 18:23:11.353635	2014-07-04 18:23:11.36177
463	blah blah	59	44	2014-07-04 18:23:13.867461	2014-07-04 18:23:13.876686
464	test etst	59	44	2014-07-04 18:23:15.354149	2014-07-04 18:23:15.363026
465	halkjfoafioeaionfsdf	59	44	2014-07-04 18:23:17.651006	2014-07-04 18:23:17.658641
466	hey	59	26	2014-07-06 17:07:34.002597	2014-07-06 17:07:34.012714
467	hey	59	44	2014-07-06 17:07:35.810563	2014-07-06 17:07:35.818288
468	whats up	59	26	2014-07-06 17:07:38.184302	2014-07-06 17:07:38.191118
469	hey	59	44	2014-07-06 17:08:09.937585	2014-07-06 17:08:09.944034
470	helloooo	59	44	2014-07-06 17:08:16.356122	2014-07-06 17:08:16.364707
471	hi	59	26	2014-07-06 17:08:19.144581	2014-07-06 17:08:19.149933
472	hey	59	26	2014-07-06 17:24:17.922216	2014-07-06 17:24:17.928111
473	hey	59	44	2014-07-06 17:24:19.799715	2014-07-06 17:24:19.806647
474	test	59	26	2014-07-06 17:25:32.199423	2014-07-06 17:25:32.206455
475	test	59	26	2014-07-06 17:25:35.635592	2014-07-06 17:25:35.643156
476	yo	59	44	2014-07-06 17:25:38.08872	2014-07-06 17:25:38.096572
477	test	59	44	2014-07-06 17:27:12.257183	2014-07-06 17:27:12.268862
478	\nthis is a test	59	44	2014-07-06 17:27:19.86427	2014-07-06 17:27:19.869794
479	this is a test	59	26	2014-07-06 17:27:23.854073	2014-07-06 17:27:23.861362
480	i'm testing this	59	44	2014-07-06 17:27:27.424368	2014-07-06 17:27:27.430038
481	hello	59	44	2014-07-06 17:27:30.799087	2014-07-06 17:27:30.807766
482	hey	59	26	2014-07-06 22:20:14.044269	2014-07-06 22:20:14.05204
483	hey	59	26	2014-07-06 22:20:17.049673	2014-07-06 22:20:17.055982
484	johnson	59	26	2014-07-06 22:20:23.734283	2014-07-06 22:20:23.740472
485	test	60	26	2014-07-07 12:09:31.570234	2014-07-07 12:09:31.579329
486	hey hey	59	43	2014-07-07 13:19:42.314087	2014-07-07 13:19:42.323989
487	hello hello	60	43	2014-07-07 13:19:57.118159	2014-07-07 13:19:57.125391
488	hi	60	43	2014-07-07 13:20:03.232423	2014-07-07 13:20:03.242235
489	hello	60	48	2014-07-07 13:34:15.823922	2014-07-07 13:34:15.831053
490	JOHNSON	59	48	2014-07-07 13:34:23.250082	2014-07-07 13:34:23.259141
491	hello hello	59	49	2014-07-07 13:34:37.067982	2014-07-07 13:34:37.079075
492	hello	59	49	2014-07-07 13:34:45.625126	2014-07-07 13:34:45.636055
493	ih	59	49	2014-07-07 13:35:06.739199	2014-07-07 13:35:06.747761
494	this is a problem	59	50	2014-07-07 13:35:23.932094	2014-07-07 13:35:24.009236
495	gahhhh	59	50	2014-07-07 13:35:30.904496	2014-07-07 13:35:30.913556
496	nickname	59	50	2014-07-07 13:40:10.673903	2014-07-07 13:40:10.682271
497	blah	59	50	2014-07-07 13:40:13.541236	2014-07-07 13:40:13.551021
498	est	59	50	2014-07-07 13:40:47.360171	2014-07-07 13:40:47.371195
499	my nae	59	43	2014-07-07 13:40:52.985563	2014-07-07 13:40:52.99572
500	is test	59	43	2014-07-07 13:40:54.321283	2014-07-07 13:40:54.330088
501	change	59	43	2014-07-07 13:44:10.463092	2014-07-07 13:44:10.474215
502	nickname	59	43	2014-07-07 13:44:11.830813	2014-07-07 13:44:11.840436
503	my	59	51	2014-07-07 13:44:15.772273	2014-07-07 13:44:15.784885
504	nickname	59	51	2014-07-07 13:44:17.757227	2014-07-07 13:44:17.764501
505	hey	59	51	2014-07-07 13:52:16.498857	2014-07-07 13:52:16.507759
506	test	59	51	2014-07-07 13:52:18.86444	2014-07-07 13:52:18.87511
507	test	59	51	2014-07-07 13:53:31.86179	2014-07-07 13:53:31.869438
508	test	59	51	2014-07-07 13:54:21.46487	2014-07-07 13:54:21.474067
509	blah blah	59	51	2014-07-07 13:56:40.899434	2014-07-07 13:56:40.908573
510	blah blah	59	51	2014-07-07 13:56:43.678068	2014-07-07 13:56:43.684758
511	test	59	51	2014-07-07 13:57:41.808075	2014-07-07 13:57:41.822291
512	balh	59	51	2014-07-07 13:58:14.004563	2014-07-07 13:58:14.016196
513	test	59	51	2014-07-07 13:58:15.374446	2014-07-07 13:58:15.384563
514	test	59	51	2014-07-07 14:02:09.796566	2014-07-07 14:02:09.804794
515	hey	59	51	2014-07-07 14:02:11.434889	2014-07-07 14:02:11.444219
516	blah	59	51	2014-07-07 14:02:13.296822	2014-07-07 14:02:13.304238
517	hey	59	48	2014-07-07 14:02:17.013427	2014-07-07 14:02:17.025731
518	test	59	48	2014-07-07 14:03:40.913564	2014-07-07 14:03:40.921731
519	nickname	59	49	2014-07-07 14:03:47.47841	2014-07-07 14:03:47.486328
520	test	59	49	2014-07-07 14:03:56.361793	2014-07-07 14:03:56.372349
521	test	59	45	2014-07-07 14:08:30.684858	2014-07-07 14:08:30.69264
522	hey	59	45	2014-07-07 14:08:33.413634	2014-07-07 14:08:33.419718
523	test	59	45	2014-07-07 14:08:35.305248	2014-07-07 14:08:35.31358
524	this is a test	59	45	2014-07-07 14:08:36.937415	2014-07-07 14:08:36.945854
525	hey	59	45	2014-07-07 14:08:42.09385	2014-07-07 14:08:42.102505
526	nickname 2	59	45	2014-07-07 14:08:43.717158	2014-07-07 14:08:43.725719
527	yessss	59	45	2014-07-07 14:08:45.300609	2014-07-07 14:08:45.307266
528	blah	62	52	2014-07-07 14:08:52.928295	2014-07-07 14:08:52.933688
529	bkah	62	52	2014-07-07 14:08:54.7635	2014-07-07 14:08:54.769244
530	bkah	62	52	2014-07-07 14:08:56.55459	2014-07-07 14:08:56.561035
531	blah	62	52	2014-07-07 14:08:57.516818	2014-07-07 14:08:57.524107
532	bkah	62	52	2014-07-07 14:09:01.532907	2014-07-07 14:09:01.537389
533	blah	62	52	2014-07-07 14:09:02.81042	2014-07-07 14:09:02.817441
534	hey	59	45	2014-07-07 16:21:37.102521	2014-07-07 16:21:37.20759
535	hey	59	45	2014-07-07 16:21:47.104523	2014-07-07 16:21:47.110599
536	test	59	45	2014-07-07 16:22:22.662769	2014-07-07 16:22:22.672218
537	test	59	45	2014-07-07 17:46:35.639529	2014-07-07 17:46:35.645522
538	whotext-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;text-align: center;	59	45	2014-07-07 17:59:01.20384	2014-07-07 17:59:01.212269
539	text-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-aligntext-align:center:text-align	59	45	2014-07-07 17:59:13.40242	2014-07-07 17:59:13.408301
540	...	60	46	2014-07-07 20:22:06.27609	2014-07-07 20:22:06.281756
541	hello hello	69	51	2014-07-08 01:17:30.33449	2014-07-08 01:17:30.342495
542	this is gene	69	51	2014-07-08 01:17:34.065817	2014-07-08 01:17:34.072967
543	i've come to you from a far distance	69	51	2014-07-08 01:17:38.604211	2014-07-08 01:17:38.61125
544	hello	67	48	2014-07-08 01:18:04.421948	2014-07-08 01:18:04.429551
545	hey	59	53	2014-07-08 17:53:25.129563	2014-07-08 17:53:25.13482
546	test	59	53	2014-07-08 18:04:56.714227	2014-07-08 18:04:56.720133
547	test	59	53	2014-07-08 18:06:16.123973	2014-07-08 18:06:16.131305
548	test	59	53	2014-07-08 18:06:23.653878	2014-07-08 18:06:23.663545
549	test	59	53	2014-07-08 18:08:04.730092	2014-07-08 18:08:04.735914
550	test	59	53	2014-07-08 18:08:59.562951	2014-07-08 18:08:59.572974
551	test	59	53	2014-07-08 18:09:06.094737	2014-07-08 18:09:06.103846
552	test	59	53	2014-07-08 18:10:45.242857	2014-07-08 18:10:45.250397
553	hi	59	53	2014-07-08 18:10:50.197428	2014-07-08 18:10:50.204416
554	test	59	53	2014-07-08 18:18:12.007261	2014-07-08 18:18:12.014462
555	ㅅㄷㄴㅅ	59	53	2014-07-08 18:18:17.896074	2014-07-08 18:18:17.903163
556	height test	59	53	2014-07-08 18:19:01.546629	2014-07-08 18:19:01.551492
557	test	59	53	2014-07-08 18:20:21.721378	2014-07-08 18:20:21.725957
558	height test	59	53	2014-07-08 18:21:30.412583	2014-07-08 18:21:30.420384
559	test	59	45	2014-07-08 18:21:34.047665	2014-07-08 18:21:34.054288
560	test	59	53	2014-07-08 18:21:44.130594	2014-07-08 18:21:44.135964
561	test	59	53	2014-07-08 18:23:37.987135	2014-07-08 18:23:37.993803
562	hi	59	45	2014-07-08 18:23:44.304436	2014-07-08 18:23:44.310547
563	test	59	53	2014-07-08 18:24:12.911134	2014-07-08 18:24:12.918946
564	test	59	45	2014-07-08 18:24:15.664252	2014-07-08 18:24:15.670748
565	test	59	45	2014-07-08 18:24:31.938861	2014-07-08 18:24:31.946556
566	test	59	45	2014-07-08 18:24:34.478473	2014-07-08 18:24:34.488924
567	test	59	45	2014-07-08 18:24:36.195343	2014-07-08 18:24:36.202712
568	test	59	53	2014-07-08 18:24:37.762255	2014-07-08 18:24:37.770962
569	test	59	53	2014-07-08 18:25:27.682028	2014-07-08 18:25:27.690039
570	test	59	53	2014-07-08 18:25:41.565972	2014-07-08 18:25:41.573134
571	test	59	45	2014-07-08 18:27:16.353847	2014-07-08 18:27:16.357814
572	test	59	45	2014-07-08 18:27:20.029559	2014-07-08 18:27:20.036576
573	test	59	45	2014-07-08 18:27:21.603616	2014-07-08 18:27:21.60913
574	test	59	45	2014-07-08 18:27:40.981356	2014-07-08 18:27:40.987208
575	test	59	45	2014-07-08 18:27:42.609585	2014-07-08 18:27:42.614968
576	test	59	53	2014-07-08 18:27:49.971073	2014-07-08 18:27:49.979027
577	test	59	53	2014-07-08 18:29:32.007641	2014-07-08 18:29:32.01393
578	test	59	53	2014-07-08 18:30:19.423748	2014-07-08 18:30:19.430375
579	test	59	53	2014-07-08 18:30:22.558461	2014-07-08 18:30:22.56546
580	test	59	53	2014-07-08 18:30:25.172644	2014-07-08 18:30:25.180292
581	test	59	53	2014-07-08 18:30:28.292838	2014-07-08 18:30:28.299782
582	test	59	45	2014-07-08 18:30:32.511527	2014-07-08 18:30:32.51781
583	test	59	53	2014-07-08 18:30:52.530824	2014-07-08 18:30:52.537653
584	test	59	53	2014-07-08 18:31:00.863135	2014-07-08 18:31:00.87028
585	test	59	53	2014-07-08 18:31:03.263569	2014-07-08 18:31:03.271133
586	test	59	53	2014-07-08 18:31:06.118614	2014-07-08 18:31:06.125879
587	test	59	53	2014-07-08 18:31:13.304119	2014-07-08 18:31:13.310244
588	test	59	53	2014-07-08 18:31:18.07101	2014-07-08 18:31:18.078085
589	test	59	53	2014-07-08 18:31:20.701163	2014-07-08 18:31:20.707411
590	test	59	53	2014-07-08 18:31:22.780653	2014-07-08 18:31:22.786907
591	hi	59	53	2014-07-08 18:31:25.474848	2014-07-08 18:31:25.482801
592	scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));	59	53	2014-07-08 18:33:14.833277	2014-07-08 18:33:14.839139
593	scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));	59	53	2014-07-08 18:33:15.373546	2014-07-08 18:33:15.381625
594	scrollToTheBottom($('.messages-container'));	59	53	2014-07-08 18:33:20.337204	2014-07-08 18:33:20.343902
595	scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));	59	53	2014-07-08 18:33:44.723793	2014-07-08 18:33:44.731474
596	scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));	59	53	2014-07-08 18:34:09.135178	2014-07-08 18:34:09.141731
597	scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));	59	53	2014-07-08 18:34:38.309697	2014-07-08 18:34:38.314437
598	scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));scrollToTheBottom($('.messages-container'));	59	53	2014-07-08 18:34:42.656192	2014-07-08 18:34:42.663516
599	scrollToTheBottom($('.messages-container'));	59	45	2014-07-08 18:35:22.162092	2014-07-08 18:35:22.170023
600	test	59	53	2014-07-08 18:36:22.847247	2014-07-08 18:36:22.855846
601	test	59	53	2014-07-08 18:36:25.41259	2014-07-08 18:36:25.421335
602	hello	59	53	2014-07-08 18:37:27.141826	2014-07-08 18:37:27.149056
603	test	59	53	2014-07-08 18:38:06.033973	2014-07-08 18:38:06.041299
604	test	59	53	2014-07-08 18:44:10.442611	2014-07-08 18:44:10.44949
605	test	59	53	2014-07-08 18:44:14.893473	2014-07-08 18:44:14.900696
606	hey	59	53	2014-07-08 18:44:17.195014	2014-07-08 18:44:17.20191
607	hey	59	53	2014-07-08 18:44:19.957471	2014-07-08 18:44:19.96407
608	hi	59	53	2014-07-08 18:44:23.792568	2014-07-08 18:44:23.800056
609	hi	59	53	2014-07-08 18:44:26.894282	2014-07-08 18:44:26.901503
610	test	59	45	2014-07-08 18:46:13.923918	2014-07-08 18:46:13.931034
611	test	59	45	2014-07-08 18:46:21.379405	2014-07-08 18:46:21.386577
612	hello	59	45	2014-07-08 18:46:27.863777	2014-07-08 18:46:27.870945
613	hi	59	45	2014-07-08 18:46:39.075371	2014-07-08 18:46:39.082899
614	test	59	45	2014-07-08 18:46:43.563021	2014-07-08 18:46:43.568359
615	test	59	53	2014-07-08 18:46:50.483625	2014-07-08 18:46:50.492023
616	hi	59	53	2014-07-08 18:46:53.791973	2014-07-08 18:46:53.799417
617	hey	59	45	2014-07-08 18:59:52.046015	2014-07-08 18:59:52.052676
618	hello	59	45	2014-07-08 19:00:07.079563	2014-07-08 19:00:07.087364
619	test	59	45	2014-07-08 19:02:22.276666	2014-07-08 19:02:22.283014
620	hey	59	45	2014-07-08 19:04:24.424485	2014-07-08 19:04:24.430688
621	hey	59	53	2014-07-08 19:05:27.50234	2014-07-08 19:05:27.509479
622	hey	59	53	2014-07-08 19:05:29.818785	2014-07-08 19:05:29.82706
623	hi	59	53	2014-07-08 19:05:45.343295	2014-07-08 19:05:45.350018
624	hey	59	53	2014-07-08 19:07:29.839103	2014-07-08 19:07:29.845979
625	hey	59	53	2014-07-08 19:07:46.351314	2014-07-08 19:07:46.36051
626	hey	59	53	2014-07-08 19:07:47.868867	2014-07-08 19:07:47.874211
627	height test	59	53	2014-07-08 19:07:57.994197	2014-07-08 19:07:58.001708
628	test	59	45	2014-07-08 19:08:02.61178	2014-07-08 19:08:02.61837
629	test	59	45	2014-07-08 19:08:07.057228	2014-07-08 19:08:07.064704
630	test	59	45	2014-07-08 19:08:18.159205	2014-07-08 19:08:18.164305
631	test	59	45	2014-07-08 19:08:34.61553	2014-07-08 19:08:34.622617
632	test\\	59	45	2014-07-08 19:34:39.650624	2014-07-08 19:34:39.657104
633	test	59	45	2014-07-08 19:34:44.051266	2014-07-08 19:34:44.057208
634	hello	59	45	2014-07-08 19:34:46.962621	2014-07-08 19:34:46.971141
635	hey	59	53	2014-07-08 19:35:25.740541	2014-07-08 19:35:25.746824
636	hello	59	53	2014-07-08 19:35:29.671318	2014-07-08 19:35:29.67938
637	hey	59	53	2014-07-08 19:35:40.415612	2014-07-08 19:35:40.422625
741	hello	70	69	2014-07-09 15:30:22.644315	2014-07-09 15:30:22.653134
742	this is me	70	69	2014-07-09 15:30:25.321436	2014-07-09 15:30:25.330549
997	hey	79	646	2014-07-17 13:15:16.210341	2014-07-17 13:15:16.217477
638	background-color: rgba(255,255,255,0.5);background-color: rgba(255,255,255,0.5);background-color: rgba(255,255,255,0.5);background-color: rgba(255,255,255,0.5);background-color: rgba(255,255,255,0.5);background-color: rgba(255,255,255,0.5);background-color: rgba(255,255,255,0.5);background-color: rgba(255,255,255,0.5);	59	45	2014-07-08 19:35:48.58461	2014-07-08 19:35:48.592753
639	hello	59	53	2014-07-08 19:41:33.596966	2014-07-08 19:41:33.604451
640	test	59	53	2014-07-08 19:43:11.181459	2014-07-08 19:43:11.188259
641	hello	59	53	2014-07-08 19:44:18.580718	2014-07-08 19:44:18.585905
642	heyllo	59	53	2014-07-08 19:44:21.996739	2014-07-08 19:44:22.00372
643	hiiii	59	53	2014-07-08 19:44:24.320471	2014-07-08 19:44:24.327618
644	scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));	59	53	2014-07-08 19:44:26.287717	2014-07-08 19:44:26.29504
645	scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));	59	53	2014-07-08 19:44:29.624595	2014-07-08 19:44:29.631847
646	scrollToTheBottomUnlessScrolled($('#messages')); scrollToTheBottomUnlessScrolled($('#messages')); scrollToTheBottomUnlessScrolled($('#messages'));	59	53	2014-07-08 19:44:34.454905	2014-07-08 19:44:34.461733
647	scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));	59	53	2014-07-08 19:46:59.702149	2014-07-08 19:46:59.708648
648	scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));scrollToTheBottomUnlessScrolled($('#messages'));	59	45	2014-07-08 19:47:02.690694	2014-07-08 19:47:02.696047
649	hey	59	45	2014-07-08 22:17:36.630547	2014-07-08 22:17:36.642545
650	hey	59	45	2014-07-08 22:17:40.814319	2014-07-08 22:17:40.82363
651	hello	59	45	2014-07-08 22:17:44.030012	2014-07-08 22:17:44.037903
652	hello	59	45	2014-07-08 22:17:47.820218	2014-07-08 22:17:47.825107
653	test	59	45	2014-07-08 22:17:50.599529	2014-07-08 22:17:50.606326
654	test	59	45	2014-07-08 22:17:53.564061	2014-07-08 22:17:53.57169
655	hey	59	53	2014-07-08 22:21:05.110107	2014-07-08 22:21:05.118613
656	hey hows it going?	59	53	2014-07-08 22:21:17.353393	2014-07-08 22:21:17.360782
657	good!	59	53	2014-07-08 22:21:20.440131	2014-07-08 22:21:20.447406
658	you ?	59	53	2014-07-08 22:21:22.010277	2014-07-08 22:21:22.0162
659	great	59	53	2014-07-08 22:21:23.432315	2014-07-08 22:21:23.439876
660	great	59	45	2014-07-08 22:21:27.147782	2014-07-08 22:21:27.155021
661	supppppppppp	59	53	2014-07-08 22:22:37.246857	2014-07-08 22:22:37.254008
662	NOT MUCHHHHHH	59	45	2014-07-08 22:22:42.219496	2014-07-08 22:22:42.226502
663	YA BISHHHHHH	59	45	2014-07-08 22:22:50.164634	2014-07-08 22:22:50.171326
664	hello	59	45	2014-07-09 11:28:31.125667	2014-07-09 11:28:31.134106
665	hey	59	53	2014-07-09 11:41:10.840816	2014-07-09 11:41:10.846392
666	hey	70	61	2014-07-09 13:49:15.852252	2014-07-09 13:49:15.859683
667	\N	\N	\N	2014-07-09 14:00:10.377154	2014-07-09 14:00:10.377154
668	\N	\N	\N	2014-07-09 14:00:18.741714	2014-07-09 14:00:18.741714
669	\N	\N	\N	2014-07-09 14:03:46.747172	2014-07-09 14:03:46.747172
670	\N	\N	\N	2014-07-09 14:06:48.252462	2014-07-09 14:06:48.252462
671	\N	\N	\N	2014-07-09 14:10:38.671496	2014-07-09 14:10:38.671496
672	test	70	67	2014-07-09 14:11:40.166513	2014-07-09 14:11:40.177335
673	hello	70	67	2014-07-09 14:11:42.198243	2014-07-09 14:11:42.206042
674	es	70	67	2014-07-09 14:11:45.469496	2014-07-09 14:11:45.477143
675	whats up	70	67	2014-07-09 14:11:48.509502	2014-07-09 14:11:48.579548
676	blah	70	67	2014-07-09 14:16:09.540196	2014-07-09 14:16:09.551127
677	test	70	67	2014-07-09 14:16:57.339282	2014-07-09 14:16:57.346333
678	homebre	70	67	2014-07-09 14:17:03.966496	2014-07-09 14:17:03.974323
679	hombre	70	67	2014-07-09 14:17:06.663027	2014-07-09 14:17:06.669308
680	whats up	70	67	2014-07-09 14:17:13.908246	2014-07-09 14:17:13.916201
681	man	70	67	2014-07-09 14:17:15.005655	2014-07-09 14:17:15.014851
682	what's going on	70	67	2014-07-09 14:17:20.867879	2014-07-09 14:17:20.87631
683	heyyy	70	67	2014-07-09 14:26:47.714256	2014-07-09 14:26:47.721086
684	hello	70	67	2014-07-09 14:29:10.573759	2014-07-09 14:29:10.582044
685	heyyy	70	67	2014-07-09 14:29:18.77198	2014-07-09 14:29:18.77762
686	hey	70	67	2014-07-09 14:29:23.010123	2014-07-09 14:29:23.019441
687	hey	70	67	2014-07-09 14:29:24.321315	2014-07-09 14:29:24.331766
688	test	70	67	2014-07-09 14:30:41.951848	2014-07-09 14:30:41.959472
689	\N	\N	\N	2014-07-09 14:32:40.411869	2014-07-09 14:32:40.411869
690	\N	\N	\N	2014-07-09 14:33:25.274292	2014-07-09 14:33:25.274292
691	test	70	67	2014-07-09 14:34:01.452802	2014-07-09 14:34:01.461545
692	test	70	100	2014-07-09 14:37:30.714926	2014-07-09 14:37:30.72258
693	test	70	101	2014-07-09 14:37:36.170252	2014-07-09 14:37:36.179582
694	blah	70	102	2014-07-09 14:38:39.32373	2014-07-09 14:38:39.333928
695	hello	70	103	2014-07-09 14:42:39.081778	2014-07-09 14:42:39.094657
696	blah blah	70	103	2014-07-09 14:42:43.976068	2014-07-09 14:42:43.986795
697	blah blah	70	104	2014-07-09 14:42:48.573697	2014-07-09 14:42:48.583938
698	test	70	107	2014-07-09 14:42:59.5106	2014-07-09 14:42:59.519267
699	test	70	67	2014-07-09 14:44:29.280518	2014-07-09 14:44:29.291984
700	whyyyy	70	67	2014-07-09 14:44:33.390437	2014-07-09 14:44:33.402158
701	why is this happenign	70	67	2014-07-09 14:44:39.489958	2014-07-09 14:44:39.500225
702	i dont knowww	70	68	2014-07-09 14:44:46.154839	2014-07-09 14:44:46.164334
703	\N	\N	\N	2014-07-09 14:47:16.169746	2014-07-09 14:47:16.169746
704	test	70	110	2014-07-09 14:47:36.020962	2014-07-09 14:47:36.029602
705	test	70	110	2014-07-09 14:47:38.001812	2014-07-09 14:47:38.010318
706	\N	\N	\N	2014-07-09 14:50:06.468336	2014-07-09 14:50:06.468336
707	\N	\N	\N	2014-07-09 14:51:37.08294	2014-07-09 14:51:37.08294
708	\N	\N	\N	2014-07-09 14:51:37.135762	2014-07-09 14:51:37.135762
709	\N	\N	\N	2014-07-09 14:54:23.747575	2014-07-09 14:54:23.747575
710	\N	\N	\N	2014-07-09 14:58:24.117104	2014-07-09 14:58:24.117104
711	\N	\N	\N	2014-07-09 14:58:37.108185	2014-07-09 14:58:37.108185
712	\N	\N	\N	2014-07-09 15:00:00.715773	2014-07-09 15:00:00.715773
713	\N	\N	\N	2014-07-09 15:13:48.319723	2014-07-09 15:13:48.319723
714	\N	\N	\N	2014-07-09 15:15:27.408865	2014-07-09 15:15:27.408865
715	\N	\N	\N	2014-07-09 15:16:21.247688	2014-07-09 15:16:21.247688
716	\N	\N	\N	2014-07-09 15:19:04.809509	2014-07-09 15:19:04.809509
717	\N	\N	\N	2014-07-09 15:20:16.429696	2014-07-09 15:20:16.429696
718	\N	\N	\N	2014-07-09 15:20:37.893525	2014-07-09 15:20:37.893525
719	\N	\N	\N	2014-07-09 15:21:34.179907	2014-07-09 15:21:34.179907
720	\N	\N	\N	2014-07-09 15:22:38.84932	2014-07-09 15:22:38.84932
721	\N	\N	\N	2014-07-09 15:23:12.303193	2014-07-09 15:23:12.303193
722	\N	\N	\N	2014-07-09 15:24:16.569726	2014-07-09 15:24:16.569726
723	\N	\N	\N	2014-07-09 15:24:25.881788	2014-07-09 15:24:25.881788
724	\N	\N	\N	2014-07-09 15:24:37.247723	2014-07-09 15:24:37.247723
725	test	70	144	2014-07-09 15:25:18.573652	2014-07-09 15:25:18.586083
726	\N	\N	\N	2014-07-09 15:25:39.840111	2014-07-09 15:25:39.840111
727	\N	\N	\N	2014-07-09 15:25:46.154003	2014-07-09 15:25:46.154003
728	\N	\N	\N	2014-07-09 15:26:47.377467	2014-07-09 15:26:47.377467
729	\N	\N	\N	2014-07-09 15:27:46.588639	2014-07-09 15:27:46.588639
730	test	70	156	2014-07-09 15:28:30.007579	2014-07-09 15:28:30.017232
731	why	70	156	2014-07-09 15:28:32.769991	2014-07-09 15:28:32.782338
732	why	70	156	2014-07-09 15:28:35.581644	2014-07-09 15:28:35.592763
733	is this happening	70	156	2014-07-09 15:28:39.301729	2014-07-09 15:28:39.313725
734	hello	70	160	2014-07-09 15:30:04.279035	2014-07-09 15:30:04.287052
735	why	70	160	2014-07-09 15:30:06.210513	2014-07-09 15:30:06.220662
736	test	70	160	2014-07-09 15:30:07.336456	2014-07-09 15:30:07.347151
737	finally	70	160	2014-07-09 15:30:08.895642	2014-07-09 15:30:08.904747
738	test	70	68	2014-07-09 15:30:12.813739	2014-07-09 15:30:12.823892
739	working	70	69	2014-07-09 15:30:17.169215	2014-07-09 15:30:17.178872
740	finally	70	69	2014-07-09 15:30:18.427503	2014-07-09 15:30:18.436028
743	talking right now	70	69	2014-07-09 15:30:27.247802	2014-07-09 15:30:27.255321
744	blah	70	69	2014-07-09 15:30:43.793157	2014-07-09 15:30:43.802538
745	blah blah	70	69	2014-07-09 15:30:45.720531	2014-07-09 15:30:45.72905
746	yo	70	160	2014-07-09 15:30:56.10811	2014-07-09 15:30:56.115494
747	yo	70	160	2014-07-09 15:30:59.324384	2014-07-09 15:30:59.3339
748	test	70	160	2014-07-09 15:31:18.717458	2014-07-09 15:31:18.726064
749	hey	70	160	2014-07-09 15:33:13.409932	2014-07-09 15:33:13.419691
750	hey	70	160	2014-07-09 15:37:11.663696	2014-07-09 15:37:11.672328
751	test	70	160	2014-07-09 15:38:18.527136	2014-07-09 15:38:18.533988
752	test	70	160	2014-07-09 15:39:21.152921	2014-07-09 15:39:21.163345
753	whyi	70	160	2014-07-09 15:39:34.687603	2014-07-09 15:39:34.69711
754	isn't this updating	70	160	2014-07-09 15:39:37.094576	2014-07-09 15:39:37.102686
755	hey	70	69	2014-07-09 15:40:32.687077	2014-07-09 15:40:32.69247
756	this	70	69	2014-07-09 15:40:36.260715	2014-07-09 15:40:36.271147
757	whyyy	70	69	2014-07-09 15:41:33.879817	2014-07-09 15:41:33.887013
758	why	70	69	2014-07-09 15:41:37.767712	2014-07-09 15:41:37.773848
759	hey	70	160	2014-07-09 15:41:41.670526	2014-07-09 15:41:41.677608
760	this sucks	70	160	2014-07-09 15:41:45.809687	2014-07-09 15:41:45.817314
761	test	70	160	2014-07-09 15:44:02.414451	2014-07-09 15:44:02.422227
762	this works	70	160	2014-07-09 15:44:04.755981	2014-07-09 15:44:04.764902
763	yay	70	160	2014-07-09 15:44:06.113018	2014-07-09 15:44:06.1205
764	blah blah	70	69	2014-07-09 15:44:11.86029	2014-07-09 15:44:11.869031
765	hey	60	46	2014-07-09 15:45:01.320564	2014-07-09 15:45:01.327177
766	i'm still testing things	60	46	2014-07-09 15:45:04.644633	2014-07-09 15:45:04.652919
767	hello	60	46	2014-07-09 15:45:10.300328	2014-07-09 15:45:10.307691
768	yep	60	46	2014-07-09 15:45:16.414272	2014-07-09 15:45:16.421771
769	still here	60	46	2014-07-09 15:45:18.230207	2014-07-09 15:45:18.236232
770	booooom	59	45	2014-07-09 15:45:28.261148	2014-07-09 15:45:28.268983
771	boom shaka laka	59	45	2014-07-09 15:45:33.430462	2014-07-09 15:45:33.438937
772	hello	70	45	2014-07-09 15:45:42.233311	2014-07-09 15:45:42.242394
773	how's it going	70	45	2014-07-09 15:45:45.079686	2014-07-09 15:45:45.088145
774	working now	70	69	2014-07-09 15:48:08.66476	2014-07-09 15:48:08.673483
775	test	70	161	2014-07-09 15:49:09.687875	2014-07-09 15:49:09.699641
776	blah	70	163	2014-07-09 15:49:30.676954	2014-07-09 15:49:30.688957
777	hi	70	166	2014-07-09 15:50:58.379002	2014-07-09 15:50:58.388494
778	hi	70	165	2014-07-09 15:51:01.311759	2014-07-09 15:51:01.32085
779	whats up	70	166	2014-07-09 15:51:04.348969	2014-07-09 15:51:04.360034
780	not much	70	165	2014-07-09 15:51:07.794139	2014-07-09 15:51:07.805817
781	hello	70	171	2014-07-09 15:51:28.71989	2014-07-09 15:51:28.727944
782	test	70	172	2014-07-09 15:51:31.660501	2014-07-09 15:51:31.667208
783	hey	70	178	2014-07-09 15:54:49.802345	2014-07-09 15:54:49.813923
784	hey	59	179	2014-07-09 15:55:09.982029	2014-07-09 15:55:09.990449
785	test test	59	179	2014-07-09 15:55:11.876988	2014-07-09 15:55:11.883313
786	why	60	46	2014-07-09 15:55:20.078792	2014-07-09 15:55:20.086196
787	why is this happening	60	46	2014-07-09 15:55:22.648256	2014-07-09 15:55:22.654913
788	ughhhh	59	179	2014-07-09 15:55:31.935437	2014-07-09 15:55:31.942759
789	hey	59	179	2014-07-09 15:55:41.454238	2014-07-09 15:55:41.462263
790	blah	59	179	2014-07-09 15:55:55.131169	2014-07-09 15:55:55.137479
791	hi	60	46	2014-07-09 15:56:00.647415	2014-07-09 15:56:00.656042
792	hey hey	62	52	2014-07-09 15:56:07.156748	2014-07-09 15:56:07.162913
793	test	70	187	2014-07-09 16:08:44.754242	2014-07-09 16:08:44.763281
794	test	70	188	2014-07-09 16:08:51.156558	2014-07-09 16:08:51.165037
795	hey	70	188	2014-07-09 16:08:54.781892	2014-07-09 16:08:54.789214
796	test	70	188	2014-07-09 16:08:59.268223	2014-07-09 16:08:59.277977
797	test	70	188	2014-07-09 16:09:10.507905	2014-07-09 16:09:10.516402
798	hey	70	188	2014-07-09 16:47:36.016746	2014-07-09 16:47:36.023885
799	hey	70	190	2014-07-09 16:47:38.41321	2014-07-09 16:47:38.420296
800	oh heyyyy	70	190	2014-07-09 16:47:47.105118	2014-07-09 16:47:47.113417
801	oh heyyyyyy	70	191	2014-07-09 16:47:51.887025	2014-07-09 16:47:51.895575
802	sup	70	193	2014-07-09 16:48:23.709596	2014-07-09 16:48:23.718649
803	not much	70	194	2014-07-09 16:48:28.413556	2014-07-09 16:48:28.421102
804	hey	70	194	2014-07-09 16:48:56.585832	2014-07-09 16:48:56.593649
805	sup	70	194	2014-07-09 16:48:57.951037	2014-07-09 16:48:57.959133
806	hows it going	70	194	2014-07-09 16:49:00.384075	2014-07-09 16:49:00.393043
807	hey	70	196	2014-07-09 17:16:44.644146	2014-07-09 17:16:44.650871
808	test	70	196	2014-07-09 17:16:45.670038	2014-07-09 17:16:45.675773
809	test	70	196	2014-07-09 17:16:47.463901	2014-07-09 17:16:47.471062
810	test	60	46	2014-07-09 17:19:09.962349	2014-07-09 17:19:09.967748
811	hello	60	46	2014-07-09 17:19:11.604529	2014-07-09 17:19:11.612031
812	test	60	199	2014-07-09 17:19:31.090956	2014-07-09 17:19:31.099947
813	hiya	60	199	2014-07-09 17:26:00.567102	2014-07-09 17:26:00.574188
814	hello	60	46	2014-07-09 17:26:04.090208	2014-07-09 17:26:04.096671
815	hey	60	46	2014-07-09 17:27:21.78021	2014-07-09 17:27:21.786342
816	hey	60	46	2014-07-09 17:27:23.846306	2014-07-09 17:27:23.854068
817	heyaa	60	46	2014-07-09 17:27:26.232329	2014-07-09 17:27:26.23953
818	whats up	60	199	2014-07-09 17:27:33.316177	2014-07-09 17:27:33.32148
819	hiya	60	199	2014-07-09 17:27:37.336402	2014-07-09 17:27:37.341729
820	blahhh	60	46	2014-07-09 17:28:15.243079	2014-07-09 17:28:15.249656
821	suppp	60	199	2014-07-09 17:28:21.810227	2014-07-09 17:28:21.816621
822	hey	60	199	2014-07-09 17:28:33.185803	2014-07-09 17:28:33.192199
823	hi?	60	199	2014-07-09 17:31:33.509338	2014-07-09 17:31:33.516258
824	whats up	60	46	2014-07-09 17:31:39.743382	2014-07-09 17:31:39.750618
825	hello	60	46	2014-07-09 17:32:44.228659	2014-07-09 17:32:44.234334
826	test	60	199	2014-07-09 17:32:54.987736	2014-07-09 17:32:54.99235
827	hey	60	46	2014-07-09 17:34:19.238586	2014-07-09 17:34:19.245413
828	test	60	46	2014-07-09 17:34:29.766357	2014-07-09 17:34:29.772888
829	test	60	46	2014-07-09 17:35:19.302072	2014-07-09 17:35:19.309538
830	test	60	199	2014-07-09 17:35:26.707236	2014-07-09 17:35:26.714098
831	hi	60	199	2014-07-09 17:35:28.693431	2014-07-09 17:35:28.700253
832	hi	60	46	2014-07-09 17:35:31.950187	2014-07-09 17:35:31.957515
833	hey	60	46	2014-07-09 17:35:42.954761	2014-07-09 17:35:42.961567
834	hey	60	46	2014-07-09 17:35:44.545297	2014-07-09 17:35:44.552402
835	hey	60	199	2014-07-09 17:35:46.990446	2014-07-09 17:35:46.997331
836	hey	60	199	2014-07-09 17:35:48.02303	2014-07-09 17:35:48.030134
837	hey	60	46	2014-07-09 18:18:43.751619	2014-07-09 18:18:43.759522
838	hey	60	46	2014-07-09 18:18:46.841039	2014-07-09 18:18:46.847015
839	hello	60	46	2014-07-09 18:18:48.549578	2014-07-09 18:18:48.557035
840	tight	60	46	2014-07-09 18:19:04.650622	2014-07-09 18:19:04.659238
841	tight	60	199	2014-07-09 18:19:08.51378	2014-07-09 18:19:08.521498
842	test	60	199	2014-07-09 18:19:39.306107	2014-07-09 18:19:39.313076
843	whooo	60	199	2014-07-09 18:19:42.887129	2014-07-09 18:19:42.891646
844	hello	60	46	2014-07-09 18:19:45.886226	2014-07-09 18:19:45.892346
845	hello	60	199	2014-07-09 18:19:53.740794	2014-07-09 18:19:53.748744
846	hello	60	199	2014-07-09 18:19:55.54279	2014-07-09 18:19:55.548298
847	noooo	60	199	2014-07-09 18:19:57.213165	2014-07-09 18:19:57.220175
848	yessss	60	46	2014-07-09 18:20:00.381385	2014-07-09 18:20:00.388809
849	yessss	60	46	2014-07-09 18:20:02.996314	2014-07-09 18:20:03.004863
850	gahhhh	60	199	2014-07-09 18:21:49.637479	2014-07-09 18:21:49.645058
851	yesssss	60	199	2014-07-09 18:21:51.87655	2014-07-09 18:21:51.885401
852	hi	63	49	2014-07-09 18:22:21.259359	2014-07-09 18:22:21.266349
853	hows it going	63	49	2014-07-09 18:22:25.307424	2014-07-09 18:22:25.314869
854	good how bout oyu?	63	49	2014-07-09 18:22:28.055954	2014-07-09 18:22:28.061658
855	hey	60	46	2014-07-09 18:22:36.681292	2014-07-09 18:22:36.687549
856	hey	60	46	2014-07-09 18:22:38.922836	2014-07-09 18:22:38.929984
857	hello	60	199	2014-07-09 18:28:18.343865	2014-07-09 18:28:18.35804
858	hii	70	201	2014-07-09 18:28:32.255957	2014-07-09 18:28:32.270516
859	what's up	70	201	2014-07-09 18:28:34.329586	2014-07-09 18:28:34.348757
860	cool	70	201	2014-07-09 18:28:36.779877	2014-07-09 18:28:36.798331
861	hey	70	202	2014-07-09 18:30:58.085292	2014-07-09 18:30:58.099814
862	test	70	202	2014-07-09 18:31:00.384067	2014-07-09 18:31:00.400525
863	test	70	203	2014-07-09 18:31:45.278091	2014-07-09 18:31:45.29375
864	test	70	203	2014-07-09 18:31:46.862069	2014-07-09 18:31:46.878143
865	test 3	70	203	2014-07-09 18:31:52.410069	2014-07-09 18:31:52.425742
866	test 4	70	203	2014-07-09 18:31:55.327955	2014-07-09 18:31:55.343949
892	hey	70	236	2014-07-09 18:53:38.850449	2014-07-09 18:53:38.904164
893	hello	70	236	2014-07-09 18:53:41.262133	2014-07-09 18:53:41.270692
894	hello	70	361	2014-07-09 21:01:15.841616	2014-07-09 21:01:15.850355
895	heyyyy	59	179	2014-07-10 12:12:22.797965	2014-07-10 12:12:22.805039
896	test	70	373	2014-07-10 20:45:34.893898	2014-07-10 20:45:34.903143
897	god	70	373	2014-07-10 20:46:00.954245	2014-07-10 20:46:00.962343
898	hey	70	374	2014-07-10 20:50:36.693332	2014-07-10 20:50:36.7039
899	hey	78	388	2014-07-11 18:42:04.29734	2014-07-11 18:42:04.305194
900	hello	78	387	2014-07-11 18:42:06.978359	2014-07-11 18:42:06.985451
901	hey	78	388	2014-07-11 18:42:10.708021	2014-07-11 18:42:10.715465
902	hey	78	388	2014-07-11 18:42:12.445507	2014-07-11 18:42:12.452637
903	hello	70	390	2014-07-14 14:30:33.062784	2014-07-14 14:30:33.070261
904	http://lvh.me:3000/testchathttp://lvh.me:3000/testchathttp://lvh.me:3000/testchathttp://lvh.me:3000/testchathttp://lvh.me:3000/testchat	70	391	2014-07-14 14:30:40.858292	2014-07-14 14:30:40.862924
905	http://lvh.me:3000/testchat http://lvh.me:3000/testchat	70	391	2014-07-14 14:30:44.594357	2014-07-14 14:30:44.600604
906	whyyy	70	390	2014-07-14 14:30:52.826981	2014-07-14 14:30:52.836052
907	http://lvh.me:3000/testchat http://lvh.me:3000/testchat http://lvh.me:3000/testchat 	70	390	2014-07-14 14:30:56.059135	2014-07-14 14:30:56.065806
908	this is a test. i'm testing the chat system	70	390	2014-07-14 14:31:04.398708	2014-07-14 14:31:04.407559
909	it has its fair share of flaws	70	390	2014-07-14 14:31:13.026083	2014-07-14 14:31:13.034819
910	\N	\N	\N	2014-07-15 22:04:18.750361	2014-07-15 22:04:18.750361
911	\N	\N	\N	2014-07-15 22:04:29.130871	2014-07-15 22:04:29.130871
912	hey	79	412	2014-07-15 22:07:23.845558	2014-07-15 22:07:23.851547
913	test	79	412	2014-07-15 22:07:26.008485	2014-07-15 22:07:26.014117
914	this is a test	79	412	2014-07-15 22:07:28.714854	2014-07-15 22:07:28.721896
915	hello hello	79	412	2014-07-15 22:07:33.240349	2014-07-15 22:07:33.24631
916	how	79	412	2014-07-15 22:07:34.578532	2014-07-15 22:07:34.585408
917	how's it goinggggg	79	412	2014-07-15 22:07:37.308367	2014-07-15 22:07:37.3145
918	blahhhhh	79	412	2014-07-15 22:07:40.271832	2014-07-15 22:07:40.278434
919	hello	79	412	2014-07-15 22:08:49.584844	2014-07-15 22:08:49.591305
920	hi	79	412	2014-07-15 22:08:54.436888	2014-07-15 22:08:54.443055
921	this is a test	79	412	2014-07-15 22:08:56.810861	2014-07-15 22:08:56.816385
922	oh hello	70	414	2014-07-15 22:09:05.363179	2014-07-15 22:09:05.368862
923	blah blah blah	70	414	2014-07-15 22:09:11.005006	2014-07-15 22:09:11.009247
924	Hello	79	412	2014-07-15 22:17:33.513251	2014-07-15 22:17:33.519315
925	heyyyyy	79	412	2014-07-15 22:27:42.570049	2014-07-15 22:27:42.57639
926	how's it goingggggg	79	412	2014-07-15 22:27:53.098975	2014-07-15 22:27:53.106689
927	goooood	79	412	2014-07-15 22:28:00.640752	2014-07-15 22:28:00.648401
928	how bout you	79	412	2014-07-15 22:28:10.403435	2014-07-15 22:28:10.409955
929	hi	79	412	2014-07-15 22:28:50.158901	2014-07-15 22:28:50.162907
930	hello	79	421	2014-07-15 22:30:14.007668	2014-07-15 22:30:14.015035
931	test	79	421	2014-07-15 22:30:16.69237	2014-07-15 22:30:16.699716
932	what uppp	79	422	2014-07-15 22:30:21.679976	2014-07-15 22:30:21.688287
933	not much bish	79	422	2014-07-15 22:30:26.47679	2014-07-15 22:30:26.48681
934	yeah?	79	421	2014-07-15 22:30:29.674764	2014-07-15 22:30:29.681339
935	hey	79	424	2014-07-15 22:30:41.843632	2014-07-15 22:30:41.850125
936	whats up	79	425	2014-07-15 22:30:44.859795	2014-07-15 22:30:44.866637
937	\ntest	79	425	2014-07-15 22:30:52.379809	2014-07-15 22:30:52.386573
938	\N	\N	\N	2014-07-15 22:42:38.600148	2014-07-15 22:42:38.600148
939	\N	10	1	2014-07-15 22:42:49.226564	2014-07-15 22:43:20.639754
940	hey	79	438	2014-07-16 12:01:34.255932	2014-07-16 12:01:34.262505
941	hello	79	438	2014-07-16 12:01:39.041309	2014-07-16 12:01:39.047006
942	hello	79	462	2014-07-16 12:51:58.397227	2014-07-16 12:51:58.404744
943	heyyy	79	463	2014-07-16 12:52:11.00732	2014-07-16 12:52:11.015161
944	Hello	79	466	2014-07-16 12:57:43.411565	2014-07-16 12:57:43.418438
945	hello\n	79	603	2014-07-17 12:25:15.753472	2014-07-17 12:25:15.760707
946	hello	79	604	2014-07-17 12:27:45.966215	2014-07-17 12:27:45.97259
947	hello	79	606	2014-07-17 12:28:33.756325	2014-07-17 12:28:33.763557
948	hello	79	607	2014-07-17 12:34:13.426091	2014-07-17 12:34:13.432635
949	hello	79	609	2014-07-17 12:34:53.814986	2014-07-17 12:34:53.820308
950	hi	79	609	2014-07-17 12:35:28.050334	2014-07-17 12:35:28.057566
951	hello	79	610	2014-07-17 12:37:40.869283	2014-07-17 12:37:40.877
952	hey	79	611	2014-07-17 12:40:19.96181	2014-07-17 12:40:19.969811
953	hey	79	612	2014-07-17 12:41:37.896295	2014-07-17 12:41:37.902698
954	hey	79	613	2014-07-17 12:42:43.863229	2014-07-17 12:42:43.873218
955	hey	79	614	2014-07-17 12:46:05.609735	2014-07-17 12:46:05.615989
956	hello	79	616	2014-07-17 12:49:35.999536	2014-07-17 12:49:36.007081
957	hello	79	616	2014-07-17 12:49:51.266205	2014-07-17 12:49:51.272477
958	hey	79	617	2014-07-17 12:54:02.883856	2014-07-17 12:54:02.889692
959	hello	79	617	2014-07-17 12:54:16.2554	2014-07-17 12:54:16.261443
960	hey	79	617	2014-07-17 12:54:25.026108	2014-07-17 12:54:25.033356
961	hey	79	617	2014-07-17 12:54:38.317023	2014-07-17 12:54:38.323909
962	hey	79	617	2014-07-17 12:54:43.099428	2014-07-17 12:54:43.105949
963	hi	79	618	2014-07-17 12:56:50.053413	2014-07-17 12:56:50.061765
964	hello	79	618	2014-07-17 12:56:53.624913	2014-07-17 12:56:53.631053
965	hello	79	619	2014-07-17 12:57:10.936588	2014-07-17 12:57:10.942985
966	hello	79	620	2014-07-17 12:57:51.078331	2014-07-17 12:57:51.082882
967	hi	79	620	2014-07-17 12:57:53.143413	2014-07-17 12:57:53.14845
968	hey	79	621	2014-07-17 12:58:24.035828	2014-07-17 12:58:24.041905
969	hello	79	621	2014-07-17 12:58:26.560637	2014-07-17 12:58:26.567181
970	hello	79	622	2014-07-17 12:59:46.744982	2014-07-17 12:59:46.751828
971	hi	79	622	2014-07-17 12:59:49.342538	2014-07-17 12:59:49.347093
972	hiii	79	622	2014-07-17 12:59:51.74211	2014-07-17 12:59:51.747383
973	hello	79	622	2014-07-17 12:59:53.509447	2014-07-17 12:59:53.515258
974	hey	79	623	2014-07-17 13:00:01.676475	2014-07-17 13:00:01.682233
975	hey	79	624	2014-07-17 13:00:06.065005	2014-07-17 13:00:06.072295
976	hey	79	624	2014-07-17 13:00:07.334307	2014-07-17 13:00:07.340726
977	hey	79	624	2014-07-17 13:00:08.111474	2014-07-17 13:00:08.117651
978	hey	79	624	2014-07-17 13:00:08.959778	2014-07-17 13:00:08.966994
979	hey	79	625	2014-07-17 13:00:18.343033	2014-07-17 13:00:18.349706
980	hey	79	625	2014-07-17 13:00:19.630092	2014-07-17 13:00:19.634689
981	tvpost	79	625	2014-07-17 13:00:21.527542	2014-07-17 13:00:21.533946
982	hey	79	626	2014-07-17 13:00:29.658814	2014-07-17 13:00:29.66583
983	hey	79	626	2014-07-17 13:00:30.894749	2014-07-17 13:00:30.900962
984	hey	79	627	2014-07-17 13:00:38.967543	2014-07-17 13:00:38.97281
985	hey	79	627	2014-07-17 13:00:40.049137	2014-07-17 13:00:40.055932
986	hey	79	628	2014-07-17 13:02:08.351097	2014-07-17 13:02:08.35913
987	hey	79	628	2014-07-17 13:02:09.677418	2014-07-17 13:02:09.681469
988	hi	79	628	2014-07-17 13:02:11.868559	2014-07-17 13:02:11.875406
989	hello	79	629	2014-07-17 13:04:53.119586	2014-07-17 13:04:53.124972
990	hello	79	629	2014-07-17 13:05:17.872054	2014-07-17 13:05:17.880586
991	hello	79	630	2014-07-17 13:05:38.217935	2014-07-17 13:05:38.224495
992	hello	79	631	2014-07-17 13:06:05.657428	2014-07-17 13:06:05.663383
993	hey	79	634	2014-07-17 13:07:01.408537	2014-07-17 13:07:01.413808
994	hey	79	636	2014-07-17 13:07:29.239637	2014-07-17 13:07:29.244644
995	hey	79	642	2014-07-17 13:10:06.768951	2014-07-17 13:10:06.775263
996	hey	79	644	2014-07-17 13:14:59.768937	2014-07-17 13:14:59.773469
998		79	646	2014-07-17 13:15:16.939476	2014-07-17 13:15:16.943496
999		79	646	2014-07-17 13:15:18.009069	2014-07-17 13:15:18.01557
1000		79	647	2014-07-17 13:16:36.560336	2014-07-17 13:16:36.56671
1001		79	648	2014-07-17 13:16:47.306671	2014-07-17 13:16:47.313355
1002	hey	79	649	2014-07-17 13:17:13.211207	2014-07-17 13:17:13.217617
1003	hey	79	650	2014-07-17 13:22:29.040167	2014-07-17 13:22:29.046466
1004	hi	79	650	2014-07-17 13:22:36.151285	2014-07-17 13:22:36.157914
1005	hey	79	651	2014-07-17 13:22:50.227546	2014-07-17 13:22:50.233738
1006	hey	79	656	2014-07-17 13:23:14.117748	2014-07-17 13:23:14.125231
1007	hey	79	656	2014-07-17 13:23:15.948881	2014-07-17 13:23:15.955383
1008	hey	79	661	2014-07-17 13:32:43.519382	2014-07-17 13:32:43.525416
1009	hey	79	662	2014-07-17 13:34:40.553005	2014-07-17 13:34:40.558825
1010	hey	79	663	2014-07-17 13:39:59.42399	2014-07-17 13:39:59.428112
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('messages_id_seq', 1010, true);


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY requests (id, insurance, age_preference, gender_preference, email, first_name, comments, created_at, updated_at, document_id) FROM stdin;
1	\N	\N	\N	\N	\N	\N	2014-09-21 02:38:18.617651	2014-09-21 02:38:18.617651	\N
2	\N	\N	\N	\N	\N	\N	2014-09-21 02:39:47.194989	2014-09-21 02:39:47.194989	6cd87ebd-631f-43bc-bf70-1d0c6c8f0fc5
3	\N	\N	\N	\N	\N	\N	2014-09-21 02:40:13.786034	2014-09-21 02:40:13.786034	af7ed007-cbac-44cc-a795-e4c220f813e0
4	\N	\N	\N	\N	\N	\N	2014-09-21 02:40:30.346281	2014-09-21 02:40:30.346281	b83b60c0-0f6c-481c-b693-951d4161655b
\.


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('requests_id_seq', 4, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY schema_migrations (version) FROM stdin;
20140404004454
20140307194958
20140328045034
20140401001134
20140401013536
20140401013550
20140401015259
20140404025654
20140404061701
20140404190744
20140405165251
20140405193746
20140405202714
20140405203921
20140408184259
20140408192015
20140408194746
20140408195040
20140409184816
20140409203143
20140409203358
20140410155153
20140410185639
20140410192032
20140410201959
20140410202229
20140414182653
20140414183647
20140414195549
20140414200411
20140414204146
20140414213036
20140421140417
20140423174117
20140527234428
20140527234518
20140527234606
20140529194621
20140530185826
20140530200255
20140530202448
20140530202454
20140615182045
20140617165717
20140617165753
20140617170339
20140617170739
20140626144604
20140626144743
20140626145044
20140626190930
20140626204335
20140626204615
20140626205025
20140626210021
20140627005711
20140627040932
20140627041810
20140627225052
20140629144318
20140629144804
20140629203314
20140629235822
20140630051854
20140703014536
20140703021736
20140704150255
20140704175240
20140707165130
20140710180504
20140726070912
20140729223654
20140729233511
20140729234843
20140730215030
20140801010206
20140919044604
20140921023629
20141008222719
20141008222832
20141009001204
20141009001335
20141009004438
20141010191023
20141010192007
\.


--
-- Data for Name: therapists; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY therapists (id, created_at, updated_at, first_name, last_name, gender, state, license_number, degree, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, city, zipcode, phone, bio, permalink, retina_dimensions, title, school_name, open_slots, client_id, years, issues, topics, intro_gif_subtitles, address) FROM stdin;
77	2014-07-11 15:14:25.597642	2014-10-10 06:16:55.982893	Gene	Lee	Male	IL	\N	PsyD, MA	\N	\N	\N	\N	Chicago	60615	(213) 493-1586	Note: The first conversation is free, but we still ask for your credit card. We're subsidizing the first conversation in the hopes you'll want to schedule more, so we want to make sure you're serious if you're trying this. In turn, we ask you to store your credit card information in your account in case you end up wanting to have more conversations. This will make followups easier, and you will only be charged if you actually indicate you want another session. So take your time when making this hefty decision. It's the last chance you will ever get. Note: The first conversation is free, but we still ask for your credit card. We're subsidizing the first conversation in the hopes you'll want to schedule more, so we want to make sure you're serious if you're trying this. In turn, we ask you to store your credit card information in your account in case you end up wanting to have more conversations. This will make followups easier, and you will only be charged if you actually indicate you want another session. 	\N	\N	Psychologist	University of Massachusetts	{}	\N	\N	{}	{anxiety,depression,artists,start_ups,multicultural}	\N	\N
1715	2014-07-24 10:34:27.60388	2014-10-10 06:31:29.812357	Matthew	Krisiloff	Male	California	MFC41619	MFT	\N	\N	\N	\N				I listen carefully, but I don't hesitate to share my perspective when I feel it is needed. I work well with clients who want to try new things and figure out what helps. Whether you would like to talk once or multiple times, we will problem solve and come up with solutions that can help.	\N	\N	Counselor		{}	\N	\N	{Anxiety,Anger,Depression,Schizophrenia,Anxiety,Test}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
86	2014-10-30 06:11:25.032764	2014-10-30 06:11:25.032764	Andrew	Susskind	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
87	2014-10-30 06:13:48.978822	2014-10-30 06:13:48.978822	Dan	Lippmann	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
88	2014-10-30 06:13:53.243416	2014-10-30 06:13:53.243416	Dan	Litov	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
89	2014-10-30 06:14:01.579147	2014-10-30 06:14:01.579147	Darlene	Basch	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
90	2014-10-30 06:14:06.90671	2014-10-30 06:14:06.90671	David	Lindquist	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
85	2014-10-30 06:10:06.936013	2014-10-30 20:48:46.115019	Chris	Chroniak	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	Hello I'm Dr. Chris Chroniak, I'm a clinical psychologist	\N
91	2014-10-30 06:14:13.002886	2014-10-30 06:14:13.002886	Elise	James	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
92	2014-10-30 06:14:20.194698	2014-10-30 06:14:20.194698	Emily	Schafer	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
93	2014-10-30 06:14:27.002606	2014-10-30 06:14:27.002606	Glenn	Stevenson	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
94	2014-10-30 06:14:34.762723	2014-10-30 06:14:34.762723	Judy	Glickman	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
95	2014-10-30 06:14:42.67408	2014-10-30 06:14:42.67408	Karrie	Kindl-Valdez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
96	2014-10-30 06:14:49.722196	2014-10-30 06:14:49.722196	Kirk	Andrews	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
97	2014-10-30 06:14:54.889646	2014-10-30 06:14:54.889646	Rachel	Clark	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
98	2014-10-30 06:15:00.569656	2014-10-30 06:15:00.569656	Randall	Meadows	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
99	2014-10-30 06:15:05.217265	2014-10-30 06:15:05.217265	Rhea	Adams	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
100	2014-10-30 06:15:09.593183	2014-10-30 06:15:09.593183	Ricki	Bander	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
101	2014-10-30 06:15:14.280987	2014-10-30 06:15:14.280987	Sarah	Novia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
102	2014-10-30 06:15:18.60106	2014-10-30 06:15:18.60106	Tom	Wilda	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
103	2014-10-30 06:15:25.512487	2014-10-30 06:15:25.512487	Trina	O'Quinn	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
104	2014-10-30 06:15:33.112547	2014-10-30 06:15:33.112547	Victoria	Sciarra	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
105	2014-10-30 06:15:39.512467	2014-10-30 06:15:39.512467	Yaffa	Balsam	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	I am a doctorate-level psychologist experienced in helping people with anxiety, stress, and depression. I specialize in working with highly-ambitious adults to improve their emotional well-being and strengthen their interpersonal relationships. My office is located in San Francisco's Financial District and is conveniently within a block of the Montgomery BART/ Muni stops.	\N	\N	\N	\N	{}	\N	\N	{}	{topic1,topic2,topic3,topic4,topic5}	\N	\N
\.


--
-- Name: therapists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('therapists_id_seq', 105, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY users (id, created_at, updated_at, role_id, role_type, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, time_zone) FROM stdin;
91	2014-07-11 15:20:29.412563	2014-07-11 15:23:39.341204	1403	Client	client2@gmail.com	$2a$10$/FOxdyi5TPFHLoW5YG0AN.Bv2qkxT9mq7RpUQBgU5yQXo667D4DMW	\N	\N	2014-07-11 15:23:39.335452	2	2014-07-11 15:23:39.340264	2014-07-11 15:23:39.340264	127.0.0.1	127.0.0.1	Santiago
129	2014-10-30 06:26:06.679173	2014-10-30 06:26:06.681305	96	Therapist	test96@test.com	$2a$10$xbViQI5dby6e4LBIZ8cETe51Wng88LS4JC.hvsgx87W4z.9mdw7pe	\N	\N	\N	0	\N	\N	\N	\N	\N
92	2014-07-11 15:40:31.133641	2014-07-11 15:40:31.175612	1405	Client	client3@gmail.com	$2a$10$DLYeyF33kOZrGe9c1Ctg2uO0nvMWG5KP/GwAj2Vu1G/WIdXSzDjHa	\N	\N	\N	1	2014-07-11 15:40:31.137693	2014-07-11 15:40:31.137693	127.0.0.1	127.0.0.1	\N
116	2014-08-01 22:33:50.404691	2014-08-01 22:33:50.478618	2563	Client	emailtest4@gmail.com	$2a$10$sQWnltZuMxLaiS7UHHYXV.jTdGWjAEzBdCf39VTGe/Cd5cxK/iqdW	\N	\N	\N	1	2014-08-01 22:33:50.457489	2014-08-01 22:33:50.457489	127.0.0.1	127.0.0.1	America/Los_Angeles
94	2014-07-14 14:30:29.671004	2014-07-14 14:30:29.671004	\N	Therapist	test@gmail.com	$2a$10$8F5z.ntwBK5/XTzqTYnzZuu4eYbzijGhbg8hHYvxihDtOzAs3n6pa	\N	\N	\N	0	\N	\N	\N	\N	\N
104	2014-07-24 10:34:27.591487	2014-07-24 13:31:55.47185	1715	Therapist	patriciacruzmft@gmail.com	$2a$10$dcEDRTBrw1q1x6bpgMGdzOVkb.J.4pbLJDqwpHT77uL.QGd33u5s2	\N	\N	\N	4	2014-07-24 13:31:55.470523	2014-07-24 13:29:03.914596	127.0.0.1	127.0.0.1	\N
107	2014-07-24 17:19:56.252756	2014-07-24 17:19:56.405639	1892	Client	test3@gmail.com	$2a$10$MeNIq33B7tEhQ10FW1slc.rJfrQv4ZI3zUGN.ZXJA9FHdvu2iwh9e	\N	\N	\N	1	2014-07-24 17:19:56.258561	2014-07-24 17:19:56.258561	127.0.0.1	127.0.0.1	\N
108	2014-07-24 17:21:17.990131	2014-07-24 17:21:18.000942	1894	Client	test4@gmail.com	$2a$10$LsA73kp6wbWbzPZZ0a5XPO9Oxu1vgSYiexKKjVWL/OxdXGCZ3sZBC	\N	\N	\N	1	2014-07-24 17:21:17.993434	2014-07-24 17:21:17.993434	127.0.0.1	127.0.0.1	\N
118	2014-10-30 06:26:05.900721	2014-10-30 06:26:05.903325	85	Therapist	test85@test.com	$2a$10$Z6DF.uuVdiPpTAizaA4MZ.BQiUvcA.htahcrZ1mtr4sdKZFymDl9.	\N	\N	\N	0	\N	\N	\N	\N	\N
109	2014-07-24 17:26:40.114896	2014-07-24 17:26:40.129118	1895	Client	test5@gmail.com	$2a$10$vc/HQTJFBqCWGF8R9gNkNuLzgB67TBmDd7i7pEQeVMKxOXNKcRQMS	\N	\N	\N	1	2014-07-24 17:26:40.1187	2014-07-24 17:26:40.1187	127.0.0.1	127.0.0.1	\N
106	2014-07-24 13:02:22.967294	2014-07-24 19:08:52.340702	1722	Client	test100@gmail.com	$2a$10$pHBuCumj20od/V50OO4Tu..rVR/dwOquHSFZGZkX.KGPjRzpCiByO	\N	\N	\N	4	2014-07-24 19:08:52.339166	2014-07-24 13:28:53.525314	127.0.0.1	127.0.0.1	\N
119	2014-10-30 06:26:05.971328	2014-10-30 06:26:05.973583	86	Therapist	test86@test.com	$2a$10$RGC6mqxdwlVoNjiQi7dOsutpc5JEKX4uxc2Jba.n3StMZVbXlqOU.	\N	\N	\N	0	\N	\N	\N	\N	\N
110	2014-07-24 22:36:43.9932	2014-07-24 22:36:44.0106	1948	Client	test102@gmail.com	$2a$10$1iR4xKTHl6hg3Azo52EdKeV8NH4vH8Hp9lKxuKrd8wTVY4osrQpIu	\N	\N	\N	1	2014-07-24 22:36:43.998802	2014-07-24 22:36:43.998802	127.0.0.1	127.0.0.1	\N
120	2014-10-30 06:26:06.041581	2014-10-30 06:26:06.04419	87	Therapist	test87@test.com	$2a$10$sD80X5bUC/tUtsxt1hCTTuBnzuCifg01BYYPWym7mYyUa8el3RGKi	\N	\N	\N	0	\N	\N	\N	\N	\N
105	2014-07-24 12:38:04.021346	2014-07-24 12:38:04.035791	1719	Client	test99@gmail.com	$2a$10$uEGg5GQgm4D/5wy7BHgjleLitPZCeCbytgJRjPRm.EQE.eUeNOXka	\N	\N	\N	1	2014-07-24 12:38:04.025353	2014-07-24 12:38:04.025353	127.0.0.1	127.0.0.1	\N
93	2014-07-11 15:44:04.72412	2014-07-30 20:18:40.555445	1408	Client	genejaelee@gmail.com	$2a$10$CKZ8fbsQsGoXp9ZndsXrm.RyrtxCZbSEtHGcH9bd2dNHrJwEmHUcG	\N	\N	\N	5	2014-07-30 20:18:40.553775	2014-07-30 20:11:07.214602	127.0.0.1	127.0.0.1	\N
121	2014-10-30 06:26:06.117414	2014-10-30 06:26:06.119944	88	Therapist	test88@test.com	$2a$10$eaI9oi5S9TYXi5jGXUvo5e93/mayZXTnuTwG8iiHELkmZIE66QiRa	\N	\N	\N	0	\N	\N	\N	\N	\N
112	2014-07-31 18:10:44.667916	2014-07-31 18:10:44.701083	2538	Client	blahblahblah@gmail.com	$2a$10$plD4ZbFZ61Lmt3ik8wvnquN9D42Pfa0QAh6qdyBjv6lgXNI54yE6u	\N	\N	\N	1	2014-07-31 18:10:44.673961	2014-07-31 18:10:44.673961	127.0.0.1	127.0.0.1	America/Los_Angeles
122	2014-10-30 06:26:06.187364	2014-10-30 06:26:06.189792	89	Therapist	test89@test.com	$2a$10$Q1UqxcRUGnaAGBylDssjRuDgq82LtHOR4UHK02EVFXTkqB0tEI/Ea	\N	\N	\N	0	\N	\N	\N	\N	\N
113	2014-08-01 15:08:19.089563	2014-08-01 15:08:19.194663	2560	Client	emailtest@gmail.com	$2a$10$uF7tbUPWOoBmp1.IdHQexebSAHYU1dFysi4w1.TJ2BWqkKLdjS3x2	\N	\N	\N	1	2014-08-01 15:08:19.098492	2014-08-01 15:08:19.098492	127.0.0.1	127.0.0.1	America/Los_Angeles
123	2014-10-30 06:26:06.258905	2014-10-30 06:26:06.261118	90	Therapist	test90@test.com	$2a$10$QCzQG1/NhUVOfCyoQUH7juINdqakK5fnBQnAV9oIuItq7vXjBMThe	\N	\N	\N	0	\N	\N	\N	\N	\N
124	2014-10-30 06:26:06.325876	2014-10-30 06:26:06.328048	91	Therapist	test91@test.com	$2a$10$zQFL1VQth7GBqpih1WiGnO2XD5EJTYt3jSyfm4StqwLoFNI4S6UQ6	\N	\N	\N	0	\N	\N	\N	\N	\N
125	2014-10-30 06:26:06.394401	2014-10-30 06:26:06.396438	92	Therapist	test92@test.com	$2a$10$CqTVsCsGTq/s83hqEPr0KuA8EbiWsNVTNylsCmxDpPIoMDFlNrBMK	\N	\N	\N	0	\N	\N	\N	\N	\N
126	2014-10-30 06:26:06.461577	2014-10-30 06:26:06.463994	93	Therapist	test93@test.com	$2a$10$45fL6pxaCBtxsMQolRZXrOa0j5iNcvzPOKHfl.YrOdF15BptRKX8a	\N	\N	\N	0	\N	\N	\N	\N	\N
127	2014-10-30 06:26:06.537243	2014-10-30 06:26:06.539893	94	Therapist	test94@test.com	$2a$10$t7BZhDvtPcMrdHEaOBkxu.aUG.wM/ffLb4KkmXkSQFsrgdQpPOqqi	\N	\N	\N	0	\N	\N	\N	\N	\N
128	2014-10-30 06:26:06.607476	2014-10-30 06:26:06.60981	95	Therapist	test95@test.com	$2a$10$EJ4.wqGCJhrvjI2W7mEAme2w02RWJCtc6BMxNqIKKQ76tbiQuiAFu	\N	\N	\N	0	\N	\N	\N	\N	\N
130	2014-10-30 06:26:06.748153	2014-10-30 06:26:06.75012	97	Therapist	test97@test.com	$2a$10$kyQ4IU7NdHx8D7TRG6lP7O4a0ru/8lMk6/ORfS6LKUfYDiaSZoYVC	\N	\N	\N	0	\N	\N	\N	\N	\N
131	2014-10-30 06:26:06.814986	2014-10-30 06:26:06.817033	98	Therapist	test98@test.com	$2a$10$v/a9gwCX0jyNxuVGtt8iO.2TRifTbECuNS6b/.M.VAM6TpMNblOjC	\N	\N	\N	0	\N	\N	\N	\N	\N
132	2014-10-30 06:26:06.885983	2014-10-30 06:26:06.888734	99	Therapist	test99@test.com	$2a$10$iluXXhqw4XTFZsdL2.uMweyR3DM49OE/CeHUMY6ONVl4R5mdMaMEa	\N	\N	\N	0	\N	\N	\N	\N	\N
133	2014-10-30 06:26:06.956056	2014-10-30 06:26:06.958528	100	Therapist	test100@test.com	$2a$10$p/LGntH0Ttx4jKEUWtgdvOr0LzvmPKde0C/DaEiYQd9g.DpO7Pffm	\N	\N	\N	0	\N	\N	\N	\N	\N
134	2014-10-30 06:26:07.028675	2014-10-30 06:26:07.031359	101	Therapist	test101@test.com	$2a$10$KTzKGF.ZFogqAJ7BRub6sOk33Q4TCba7ZX7IE9/GkPDnmf/nPpnfy	\N	\N	\N	0	\N	\N	\N	\N	\N
135	2014-10-30 06:26:07.099066	2014-10-30 06:26:07.101373	102	Therapist	test102@test.com	$2a$10$FFfHDchihxxeBreOSvVei.4auwfC5hmjOLw1GR7V04Xrvjygwyhne	\N	\N	\N	0	\N	\N	\N	\N	\N
136	2014-10-30 06:26:07.167097	2014-10-30 06:26:07.169229	103	Therapist	test103@test.com	$2a$10$nSgRoqgAhXPDrdH/gS/Bne.gZcpq87Wo8tx6ewjT/tBkAQ8TsWskC	\N	\N	\N	0	\N	\N	\N	\N	\N
137	2014-10-30 06:26:07.239504	2014-10-30 06:26:07.241556	104	Therapist	test104@test.com	$2a$10$NWIPJTLndQ7LII2Bo2zdmeGfDdrIe46ROmUbSo77LWBR18Q8L2og6	\N	\N	\N	0	\N	\N	\N	\N	\N
138	2014-10-30 06:26:07.30622	2014-10-30 06:26:07.308826	105	Therapist	test105@test.com	$2a$10$eLLFq8h6mlj0RUkNFLg/p.hRz5YcYL0cP7lEIjnf17rbp8XmXFgVm	\N	\N	\N	0	\N	\N	\N	\N	\N
111	2014-07-30 20:02:11.440059	2014-07-30 20:02:11.458097	2470	Client	blah@gmail.com	$2a$10$zodr1VMTo4kjcI1KrzYHgO4NriBVifQUMBZZO3pCB8a8M1ocy1pNa	\N	\N	\N	1	2014-07-30 20:02:11.448529	2014-07-30 20:02:11.448529	127.0.0.1	127.0.0.1	\N
95	2014-07-18 16:26:47.239543	2014-07-18 16:26:47.268359	1479	Client	client5@gmail.com	$2a$10$sndyA7JKoxdbOPUwjjGx9uodFM3fE0s31Kz5f0hHrh3/bMi2d0XHm	\N	\N	\N	1	2014-07-18 16:26:47.247789	2014-07-18 16:26:47.247789	127.0.0.1	127.0.0.1	\N
114	2014-08-01 15:29:19.509509	2014-08-01 15:29:19.577148	2561	Client	emailtest2@gmail.com	$2a$10$A.JfDUh31Q/AIUcx6qhfnuc4/uBYYbNoHk9mZwQZ.I3NdpK.zhgsS	\N	\N	\N	1	2014-08-01 15:29:19.514101	2014-08-01 15:29:19.514101	127.0.0.1	127.0.0.1	America/Los_Angeles
96	2014-07-18 16:28:24.032451	2014-07-18 16:28:24.082841	1480	Client	client6@gmail.com	$2a$10$6j35jPtXcFpODg2qDAbCKuEgSl0oWcIXwslSQx8Qd/yvdFNgauNY2	\N	\N	\N	1	2014-07-18 16:28:24.039073	2014-07-18 16:28:24.039073	127.0.0.1	127.0.0.1	\N
115	2014-08-01 15:30:29.784204	2014-08-01 15:30:29.809238	2562	Client	emailtest3@gmail.com	$2a$10$/m6UDtT7at21AhNKeCxtq.J2PQJdKwYDXXzohXH/gR2G2InOJSvFq	\N	\N	\N	1	2014-08-01 15:30:29.790105	2014-08-01 15:30:29.790105	127.0.0.1	127.0.0.1	America/Los_Angeles
102	2014-07-22 14:33:47.750681	2014-07-22 14:34:47.925266	1680	Client	test1@gmail.com	$2a$10$C1UJQTFJDwSH9VivXrf60OgNlBK8rKfEAGlD8sDUTamsBVO/NQPIW	\N	\N	\N	2	2014-07-22 14:34:47.924036	2014-07-22 14:33:58.434932	127.0.0.1	127.0.0.1	\N
89	2014-07-11 15:13:53.504071	2014-07-22 18:16:24.635664	1398	Client	client@gmail.com	$2a$10$iah/CpBfZbbC2BOvoz.IZuKoCrDd6qsxlVZL.SdUH1tHCfieuFVnm	\N	\N	\N	6	2014-07-22 18:16:24.634239	2014-07-22 12:23:21.281522	127.0.0.1	127.0.0.1	Hawaii
90	2014-07-11 15:14:25.589085	2014-07-22 18:16:40.46252	77	Therapist	therapist@gmail.com	$2a$10$if.JPl7ul5jvKJTEnVFnp.kpA/4THh0GV6BfZe944UNvXrJ1SPWkq	\N	\N	\N	6	2014-07-22 18:16:40.461361	2014-07-22 15:05:46.914969	127.0.0.1	127.0.0.1	Santiago
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('users_id_seq', 138, true);


--
-- Data for Name: video_galleries; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY video_galleries (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: video_galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('video_galleries_id_seq', 1, false);


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: jaelee
--

COPY videos (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaelee
--

SELECT pg_catalog.setval('videos_id_seq', 1, false);


--
-- Name: appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: charges_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY charges
    ADD CONSTRAINT charges_pkey PRIMARY KEY (id);


--
-- Name: chat_users_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY chat_users
    ADD CONSTRAINT chat_users_pkey PRIMARY KEY (id);


--
-- Name: chats_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: email_boxes_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY email_boxes
    ADD CONSTRAINT email_boxes_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: requests_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: therapists_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY therapists
    ADD CONSTRAINT therapists_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_pkey1; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey1 PRIMARY KEY (id);


--
-- Name: video_galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY video_galleries
    ADD CONSTRAINT video_galleries_pkey PRIMARY KEY (id);


--
-- Name: videos_pkey; Type: CONSTRAINT; Schema: public; Owner: jaelee; Tablespace: 
--

ALTER TABLE ONLY videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: index_chat_users_on_chat_id; Type: INDEX; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE INDEX index_chat_users_on_chat_id ON chat_users USING btree (chat_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_role_id_and_role_type; Type: INDEX; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE INDEX index_users_on_role_id_and_role_type ON users USING btree (role_id, role_type);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: jaelee; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: jaelee
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jaelee;
GRANT ALL ON SCHEMA public TO jaelee;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

