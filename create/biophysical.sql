-- Table: public.biophysical

-- DROP TABLE IF EXISTS public.biophysical;

CREATE TABLE IF NOT EXISTS public.biophysical
(
    "biophysicalId" integer NOT NULL DEFAULT nextval('"biophysical_biophysicalId_seq"'::regclass),
    "biophysicalName" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT biophysical_pkey PRIMARY KEY ("biophysicalId")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.biophysical
    OWNER to loonatlas;
