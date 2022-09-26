-- Table: public.user_alias

-- DROP TABLE IF EXISTS public.user_alias;

CREATE TABLE IF NOT EXISTS public.user_alias
(
    alias text COLLATE pg_catalog."default" NOT NULL,
    "aliasUserId" integer NOT NULL,
    CONSTRAINT user_alias_pkey PRIMARY KEY (alias),
    CONSTRAINT "user_alias_aliasUserId_fkey" FOREIGN KEY ("aliasUserId")
        REFERENCES public.user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user_alias
    OWNER to loonatlas;
