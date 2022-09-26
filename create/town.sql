-- Table: public.town

-- DROP TABLE IF EXISTS public.town;

CREATE TABLE IF NOT EXISTS public.town
(
    "townId" integer NOT NULL,
    "townName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "townCountyId" integer NOT NULL,
    "townAlias" text COLLATE pg_catalog."default",
    CONSTRAINT town_pkey PRIMARY KEY ("townId"),
    CONSTRAINT fk_gov_county_id FOREIGN KEY ("townCountyId")
        REFERENCES public.county ("govCountyId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.town
    OWNER to loonatlas;
