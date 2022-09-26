-- Table: public.geo_town

-- DROP TABLE IF EXISTS public.geo_town;

CREATE TABLE IF NOT EXISTS public.geo_town
(
    "geoId" integer NOT NULL,
    "geoPolygon" geometry(Geometry,4326),
    CONSTRAINT geo_town_pkey PRIMARY KEY ("geoId"),
    CONSTRAINT fk_geo_town_id FOREIGN KEY ("geoId")
        REFERENCES public.town ("townId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.geo_town
    OWNER to loonatlas;
