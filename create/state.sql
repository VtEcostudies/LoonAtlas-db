-- Table: public.state

-- DROP TABLE IF EXISTS public.state;

CREATE TABLE IF NOT EXISTS public.state
(
    "stateId" integer NOT NULL DEFAULT nextval('"state_stateId_seq"'::regclass),
    "stateName" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT state_pkey PRIMARY KEY ("stateId")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.state
    OWNER to loonatlas;
