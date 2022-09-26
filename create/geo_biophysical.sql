-- Table: public.geo_biophysical

-- DROP TABLE IF EXISTS public.geo_biophysical;

CREATE TABLE IF NOT EXISTS public.geo_biophysical
(
    "geoId" integer NOT NULL,
    "geoPolygon" geometry(Geometry,4326),
    CONSTRAINT geo_biophysical_pkey PRIMARY KEY ("geoId"),
    CONSTRAINT fk_geo_biophysical_id FOREIGN KEY ("geoId")
        REFERENCES public.vpbiophysical ("biophysicalId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.geo_biophysical
    OWNER to loonatlas;
