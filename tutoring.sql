--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: academic_consulting_hours; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE academic_consulting_hours (
    id integer NOT NULL,
    start_hour time without time zone,
    end_hour time without time zone,
    days character varying(10)
);


ALTER TABLE academic_consulting_hours OWNER TO leonvillapun;

--
-- Name: academic_consulting_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE academic_consulting_hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE academic_consulting_hours_id_seq OWNER TO leonvillapun;

--
-- Name: academic_consulting_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE academic_consulting_hours_id_seq OWNED BY academic_consulting_hours.id;


--
-- Name: academic_period; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE academic_period (
    id integer NOT NULL,
    period character varying(10)
);


ALTER TABLE academic_period OWNER TO leonvillapun;

--
-- Name: academic_period_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE academic_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE academic_period_id_seq OWNER TO leonvillapun;

--
-- Name: academic_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE academic_period_id_seq OWNED BY academic_period.id;


--
-- Name: class_hours; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE class_hours (
    id integer NOT NULL,
    start_hour time without time zone,
    end_hour time without time zone,
    days character varying(10)
);


ALTER TABLE class_hours OWNER TO leonvillapun;

--
-- Name: class_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE class_hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE class_hours_id_seq OWNER TO leonvillapun;

--
-- Name: class_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE class_hours_id_seq OWNED BY class_hours.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE student (
    id integer NOT NULL,
    name character varying(50),
    password character varying(50)
);


ALTER TABLE student OWNER TO leonvillapun;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_id_seq OWNER TO leonvillapun;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE student_id_seq OWNED BY student.id;


--
-- Name: student_period; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE student_period (
    id integer NOT NULL,
    id_student integer,
    id_period integer
);


ALTER TABLE student_period OWNER TO leonvillapun;

--
-- Name: student_period_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE student_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_period_id_seq OWNER TO leonvillapun;

--
-- Name: student_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE student_period_id_seq OWNED BY student_period.id;


--
-- Name: student_requests_tutoring; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE student_requests_tutoring (
    id integer NOT NULL,
    id_student integer,
    id_teacher integer,
    id_subject integer,
    id_tutoring integer,
    topic character varying(50),
    date date
);


ALTER TABLE student_requests_tutoring OWNER TO leonvillapun;

--
-- Name: student_requests_tutoring_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE student_requests_tutoring_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_requests_tutoring_id_seq OWNER TO leonvillapun;

--
-- Name: student_requests_tutoring_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE student_requests_tutoring_id_seq OWNED BY student_requests_tutoring.id;


--
-- Name: subject; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE subject (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE subject OWNER TO leonvillapun;

--
-- Name: subject_class_hours; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE subject_class_hours (
    id integer NOT NULL,
    id_subject integer,
    id_class integer
);


ALTER TABLE subject_class_hours OWNER TO leonvillapun;

--
-- Name: subject_class_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE subject_class_hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subject_class_hours_id_seq OWNER TO leonvillapun;

--
-- Name: subject_class_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE subject_class_hours_id_seq OWNED BY subject_class_hours.id;


--
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subject_id_seq OWNER TO leonvillapun;

--
-- Name: subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE subject_id_seq OWNED BY subject.id;


--
-- Name: teacher; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE teacher (
    id integer NOT NULL,
    name character varying(50),
    password character varying(50),
    department character varying(50)
);


ALTER TABLE teacher OWNER TO leonvillapun;

--
-- Name: teacher_has_tutoring_hours; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE teacher_has_tutoring_hours (
    id integer NOT NULL,
    id_teacher integer,
    id_tutoring integer
);


ALTER TABLE teacher_has_tutoring_hours OWNER TO leonvillapun;

--
-- Name: teacher_has_tutoring_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE teacher_has_tutoring_hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_has_tutoring_hours_id_seq OWNER TO leonvillapun;

--
-- Name: teacher_has_tutoring_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE teacher_has_tutoring_hours_id_seq OWNED BY teacher_has_tutoring_hours.id;


--
-- Name: teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE teacher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_id_seq OWNER TO leonvillapun;

--
-- Name: teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE teacher_id_seq OWNED BY teacher.id;


--
-- Name: teacher_period; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE teacher_period (
    id integer NOT NULL,
    id_teacher integer,
    id_period integer
);


ALTER TABLE teacher_period OWNER TO leonvillapun;

--
-- Name: teacher_period_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE teacher_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_period_id_seq OWNER TO leonvillapun;

--
-- Name: teacher_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE teacher_period_id_seq OWNED BY teacher_period.id;


--
-- Name: teacher_subject; Type: TABLE; Schema: public; Owner: leonvillapun
--

CREATE TABLE teacher_subject (
    id integer NOT NULL,
    id_teacher integer,
    id_subject integer
);


ALTER TABLE teacher_subject OWNER TO leonvillapun;

--
-- Name: teacher_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: leonvillapun
--

CREATE SEQUENCE teacher_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_subject_id_seq OWNER TO leonvillapun;

--
-- Name: teacher_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: leonvillapun
--

ALTER SEQUENCE teacher_subject_id_seq OWNED BY teacher_subject.id;


--
-- Name: academic_consulting_hours id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY academic_consulting_hours ALTER COLUMN id SET DEFAULT nextval('academic_consulting_hours_id_seq'::regclass);


--
-- Name: academic_period id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY academic_period ALTER COLUMN id SET DEFAULT nextval('academic_period_id_seq'::regclass);


--
-- Name: class_hours id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY class_hours ALTER COLUMN id SET DEFAULT nextval('class_hours_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student ALTER COLUMN id SET DEFAULT nextval('student_id_seq'::regclass);


--
-- Name: student_period id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_period ALTER COLUMN id SET DEFAULT nextval('student_period_id_seq'::regclass);


--
-- Name: student_requests_tutoring id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_requests_tutoring ALTER COLUMN id SET DEFAULT nextval('student_requests_tutoring_id_seq'::regclass);


--
-- Name: subject id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY subject ALTER COLUMN id SET DEFAULT nextval('subject_id_seq'::regclass);


--
-- Name: subject_class_hours id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY subject_class_hours ALTER COLUMN id SET DEFAULT nextval('subject_class_hours_id_seq'::regclass);


--
-- Name: teacher id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher ALTER COLUMN id SET DEFAULT nextval('teacher_id_seq'::regclass);


--
-- Name: teacher_has_tutoring_hours id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_has_tutoring_hours ALTER COLUMN id SET DEFAULT nextval('teacher_has_tutoring_hours_id_seq'::regclass);


--
-- Name: teacher_period id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_period ALTER COLUMN id SET DEFAULT nextval('teacher_period_id_seq'::regclass);


--
-- Name: teacher_subject id; Type: DEFAULT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_subject ALTER COLUMN id SET DEFAULT nextval('teacher_subject_id_seq'::regclass);


--
-- Data for Name: academic_consulting_hours; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY academic_consulting_hours (id, start_hour, end_hour, days) FROM stdin;
\.


--
-- Name: academic_consulting_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('academic_consulting_hours_id_seq', 1, false);


--
-- Data for Name: academic_period; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY academic_period (id, period) FROM stdin;
\.


--
-- Name: academic_period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('academic_period_id_seq', 1, false);


--
-- Data for Name: class_hours; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY class_hours (id, start_hour, end_hour, days) FROM stdin;
\.


--
-- Name: class_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('class_hours_id_seq', 1, false);


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY student (id, name, password) FROM stdin;
\.


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('student_id_seq', 1, false);


--
-- Data for Name: student_period; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY student_period (id, id_student, id_period) FROM stdin;
\.


--
-- Name: student_period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('student_period_id_seq', 1, false);


--
-- Data for Name: student_requests_tutoring; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY student_requests_tutoring (id, id_student, id_teacher, id_subject, id_tutoring, topic, date) FROM stdin;
\.


--
-- Name: student_requests_tutoring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('student_requests_tutoring_id_seq', 1, false);


--
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY subject (id, name) FROM stdin;
\.


--
-- Data for Name: subject_class_hours; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY subject_class_hours (id, id_subject, id_class) FROM stdin;
\.


--
-- Name: subject_class_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('subject_class_hours_id_seq', 1, false);


--
-- Name: subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('subject_id_seq', 1, false);


--
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY teacher (id, name, password, department) FROM stdin;
\.


--
-- Data for Name: teacher_has_tutoring_hours; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY teacher_has_tutoring_hours (id, id_teacher, id_tutoring) FROM stdin;
\.


--
-- Name: teacher_has_tutoring_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('teacher_has_tutoring_hours_id_seq', 1, false);


--
-- Name: teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('teacher_id_seq', 1, false);


--
-- Data for Name: teacher_period; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY teacher_period (id, id_teacher, id_period) FROM stdin;
\.


--
-- Name: teacher_period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('teacher_period_id_seq', 1, false);


--
-- Data for Name: teacher_subject; Type: TABLE DATA; Schema: public; Owner: leonvillapun
--

COPY teacher_subject (id, id_teacher, id_subject) FROM stdin;
\.


--
-- Name: teacher_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: leonvillapun
--

SELECT pg_catalog.setval('teacher_subject_id_seq', 1, false);


--
-- Name: academic_consulting_hours academic_consulting_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY academic_consulting_hours
    ADD CONSTRAINT academic_consulting_hours_pkey PRIMARY KEY (id);


--
-- Name: academic_period academic_period_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY academic_period
    ADD CONSTRAINT academic_period_pkey PRIMARY KEY (id);


--
-- Name: class_hours class_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY class_hours
    ADD CONSTRAINT class_hours_pkey PRIMARY KEY (id);


--
-- Name: student_period student_period_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_period
    ADD CONSTRAINT student_period_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: student_requests_tutoring student_requests_tutoring_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_requests_tutoring
    ADD CONSTRAINT student_requests_tutoring_pkey PRIMARY KEY (id);


--
-- Name: subject_class_hours subject_class_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY subject_class_hours
    ADD CONSTRAINT subject_class_hours_pkey PRIMARY KEY (id);


--
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- Name: teacher_has_tutoring_hours teacher_has_tutoring_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_has_tutoring_hours
    ADD CONSTRAINT teacher_has_tutoring_hours_pkey PRIMARY KEY (id);


--
-- Name: teacher_period teacher_period_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_period
    ADD CONSTRAINT teacher_period_pkey PRIMARY KEY (id);


--
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);


--
-- Name: teacher_subject teacher_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_subject
    ADD CONSTRAINT teacher_subject_pkey PRIMARY KEY (id);


--
-- Name: student_period student_period_id_period_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_period
    ADD CONSTRAINT student_period_id_period_fkey FOREIGN KEY (id_period) REFERENCES academic_period(id) ON DELETE CASCADE;


--
-- Name: student_period student_period_id_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_period
    ADD CONSTRAINT student_period_id_student_fkey FOREIGN KEY (id_student) REFERENCES student(id) ON DELETE CASCADE;


--
-- Name: student_requests_tutoring student_requests_tutoring_id_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_requests_tutoring
    ADD CONSTRAINT student_requests_tutoring_id_student_fkey FOREIGN KEY (id_student) REFERENCES student(id) ON DELETE CASCADE;


--
-- Name: student_requests_tutoring student_requests_tutoring_id_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_requests_tutoring
    ADD CONSTRAINT student_requests_tutoring_id_subject_fkey FOREIGN KEY (id_subject) REFERENCES subject(id) ON DELETE CASCADE;


--
-- Name: student_requests_tutoring student_requests_tutoring_id_teacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_requests_tutoring
    ADD CONSTRAINT student_requests_tutoring_id_teacher_fkey FOREIGN KEY (id_teacher) REFERENCES teacher(id) ON DELETE CASCADE;


--
-- Name: student_requests_tutoring student_requests_tutoring_id_tutoring_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY student_requests_tutoring
    ADD CONSTRAINT student_requests_tutoring_id_tutoring_fkey FOREIGN KEY (id_tutoring) REFERENCES academic_consulting_hours(id) ON DELETE CASCADE;


--
-- Name: subject_class_hours subject_class_hours_id_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY subject_class_hours
    ADD CONSTRAINT subject_class_hours_id_class_fkey FOREIGN KEY (id_class) REFERENCES class_hours(id) ON DELETE CASCADE;


--
-- Name: subject_class_hours subject_class_hours_id_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY subject_class_hours
    ADD CONSTRAINT subject_class_hours_id_subject_fkey FOREIGN KEY (id_subject) REFERENCES subject(id) ON DELETE CASCADE;


--
-- Name: teacher_has_tutoring_hours teacher_has_tutoring_hours_id_teacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_has_tutoring_hours
    ADD CONSTRAINT teacher_has_tutoring_hours_id_teacher_fkey FOREIGN KEY (id_teacher) REFERENCES teacher(id) ON DELETE CASCADE;


--
-- Name: teacher_has_tutoring_hours teacher_has_tutoring_hours_id_tutoring_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_has_tutoring_hours
    ADD CONSTRAINT teacher_has_tutoring_hours_id_tutoring_fkey FOREIGN KEY (id_tutoring) REFERENCES academic_consulting_hours(id) ON DELETE CASCADE;


--
-- Name: teacher_period teacher_period_id_period_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_period
    ADD CONSTRAINT teacher_period_id_period_fkey FOREIGN KEY (id_period) REFERENCES academic_period(id) ON DELETE CASCADE;


--
-- Name: teacher_period teacher_period_id_teacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_period
    ADD CONSTRAINT teacher_period_id_teacher_fkey FOREIGN KEY (id_teacher) REFERENCES teacher(id) ON DELETE CASCADE;


--
-- Name: teacher_subject teacher_subject_id_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_subject
    ADD CONSTRAINT teacher_subject_id_subject_fkey FOREIGN KEY (id_subject) REFERENCES subject(id) ON DELETE CASCADE;


--
-- Name: teacher_subject teacher_subject_id_teacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: leonvillapun
--

ALTER TABLE ONLY teacher_subject
    ADD CONSTRAINT teacher_subject_id_teacher_fkey FOREIGN KEY (id_teacher) REFERENCES teacher(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
