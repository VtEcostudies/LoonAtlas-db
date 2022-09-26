-- Table: public.geo_county

-- DROP TABLE IF EXISTS public.geo_county;

CREATE TABLE IF NOT EXISTS public.geo_county
(
    "geoId" integer NOT NULL,
    "geoPolygon" geometry(Geometry,4326),
    CONSTRAINT geo_county_pkey PRIMARY KEY ("geoId"),
    CONSTRAINT fk_geo_county_id FOREIGN KEY ("geoId")
        REFERENCES public.county ("countyId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.geo_county
    OWNER to loonatlas;
