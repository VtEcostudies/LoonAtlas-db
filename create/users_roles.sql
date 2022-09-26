-- Table: public.users_roles

-- DROP TABLE IF EXISTS public.users_roles;

CREATE TABLE IF NOT EXISTS public.users_roles
(
    "userId" integer NOT NULL,
    role text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_role_unique UNIQUE ("userId", role),
    CONSTRAINT users_roles_role_fkey FOREIGN KEY (role)
        REFERENCES public.role (role) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "users_roles_userId_fkey" FOREIGN KEY ("userId")
        REFERENCES public.user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users_roles
    OWNER to loonatlas;
