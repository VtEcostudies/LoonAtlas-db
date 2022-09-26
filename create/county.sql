-- Table: public.county

-- DROP TABLE IF EXISTS public.county;

CREATE TABLE IF NOT EXISTS public.county
(
    "countyId" integer NOT NULL,
    "govCountyId" integer,
    "countyName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT county_pkey PRIMARY KEY ("countyId"),
    CONSTRAINT "county_govCountyId_key" UNIQUE ("govCountyId")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.county
    OWNER to loonatlas;
