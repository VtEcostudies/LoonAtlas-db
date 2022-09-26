-- Table: public.user

-- DROP TABLE IF EXISTS public.user;

CREATE TABLE IF NOT EXISTS public.user
(
    id integer NOT NULL DEFAULT nextval('user_id_seq'::regclass),
    username text COLLATE pg_catalog."default" NOT NULL,
    hash text COLLATE pg_catalog."default" NOT NULL,
    firstname text COLLATE pg_catalog."default" NOT NULL,
    lastname text COLLATE pg_catalog."default" NOT NULL,
    email text COLLATE pg_catalog."default" NOT NULL,
    userrole text COLLATE pg_catalog."default" NOT NULL,
    "middleName" text COLLATE pg_catalog."default",
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone DEFAULT now(),
    "userPhone" text COLLATE pg_catalog."default",
    "userAddress" text COLLATE pg_catalog."default",
    "userCredentials" text COLLATE pg_catalog."default",
    "userTrained" boolean,
    token character varying COLLATE pg_catalog."default",
    status user_status_type DEFAULT 'registration'::user_status_type,
    alias text[] COLLATE pg_catalog."default",
    CONSTRAINT user_pkey PRIMARY KEY (username),
    CONSTRAINT unique_email UNIQUE (email),
    CONSTRAINT user_id_unique_key UNIQUE (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user
    OWNER to loonatlas;
-- Index: user_lowercase_email_index

-- DROP INDEX IF EXISTS public.user_lowercase_email_index;

CREATE UNIQUE INDEX IF NOT EXISTS user_lowercase_email_index
    ON public.user USING btree
    (lower(email) COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: trigger_before_insert_set_user_alias_rows_from_user_array

-- DROP TRIGGER IF EXISTS trigger_before_insert_set_user_alias_rows_from_user_array ON public.user;

CREATE TRIGGER trigger_before_insert_set_user_alias_rows_from_user_array
    AFTER INSERT
    ON public.user
    FOR EACH ROW
    EXECUTE FUNCTION public.set_user_alias_rows_from_user_array();

-- Trigger: trigger_before_update_set_user_alias_rows_from_user_array

-- DROP TRIGGER IF EXISTS trigger_before_update_set_user_alias_rows_from_user_array ON public.user;

CREATE TRIGGER trigger_before_update_set_user_alias_rows_from_user_array
    AFTER UPDATE
    ON public.user
    FOR EACH ROW
    EXECUTE FUNCTION public.set_user_alias_rows_from_user_array();

-- Trigger: trigger_updated_at

-- DROP TRIGGER IF EXISTS trigger_updated_at ON public.user;

CREATE TRIGGER trigger_updated_at
    BEFORE UPDATE
    ON public.user
    FOR EACH ROW
    EXECUTE FUNCTION public.set_updated_at();
