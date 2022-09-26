-- Table: public.geo_state

-- DROP TABLE IF EXISTS public.geo_state;

CREATE TABLE IF NOT EXISTS public.geo_state
(
    "geoId" integer NOT NULL,
    "geoPolygon" geometry(Geometry,4326),
    CONSTRAINT geo_state_pkey PRIMARY KEY ("geoId"),
    CONSTRAINT fk_geo_state_id FOREIGN KEY ("geoId")
        REFERENCES public.state ("stateId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.geo_state
    OWNER to loonatlas;
