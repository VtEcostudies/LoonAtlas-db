-- Table: public.vcgi_parcel

-- DROP TABLE IF EXISTS public.vcgi_parcel;

CREATE TABLE IF NOT EXISTS public.vcgi_parcel
(
    "vcgiTownId" integer NOT NULL,
    "vcgiTownName" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "vcgiParcel" jsonb,
    CONSTRAINT vcgi_parcel_pkey PRIMARY KEY ("vcgiTownId"),
    CONSTRAINT unique_town_name UNIQUE ("vcgiTownName"),
    CONSTRAINT fk_town_id FOREIGN KEY ("vcgiTownId")
        REFERENCES public.town ("townId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.vcgi_parcel
    OWNER to loonatlas;

-- Trigger: trigger_insert_vcgi_town_name_to_upper

-- DROP TRIGGER IF EXISTS trigger_insert_vcgi_town_name_to_upper ON public.vcgi_parcel;

CREATE TRIGGER trigger_insert_vcgi_town_name_to_upper
    BEFORE INSERT
    ON public.vcgi_parcel
    FOR EACH ROW
    EXECUTE FUNCTION public.vcgi_town_name_to_upper();

-- Trigger: trigger_update_vcgi_town_name_to_upper

-- DROP TRIGGER IF EXISTS trigger_update_vcgi_town_name_to_upper ON public.vcgi_parcel;

CREATE TRIGGER trigger_update_vcgi_town_name_to_upper
    BEFORE UPDATE
    ON public.vcgi_parcel
    FOR EACH ROW
    EXECUTE FUNCTION public.vcgi_town_name_to_upper();
