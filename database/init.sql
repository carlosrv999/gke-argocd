CREATE USER notes_user WITH ENCRYPTED PASSWORD 'My_Encrypted_P4ssW0rd!';
CREATE DATABASE notesapp OWNER notes_user;
GRANT ALL PRIVILEGES ON DATABASE notesapp TO notes_user;
GRANT ALL PRIVILEGES ON DATABASE notesapp TO postgres;

\connect notesapp

CREATE TABLE public."Note" (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);

ALTER TABLE public."Note" OWNER TO notes_user;

CREATE SEQUENCE public."Note_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public."Note_id_seq" OWNER TO notes_user;

ALTER SEQUENCE public."Note_id_seq" OWNED BY public."Note".id;

ALTER TABLE ONLY public."Note" ALTER COLUMN id SET DEFAULT nextval('public."Note_id_seq"'::regclass);

ALTER TABLE ONLY public."Note"
    ADD CONSTRAINT "Note_pkey" PRIMARY KEY (id);
