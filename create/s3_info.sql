-- Table: public.s3_info

-- DROP TABLE IF EXISTS public.s3_info;

CREATE TABLE IF NOT EXISTS public.s3_info
(
    "bucketName" text COLLATE pg_catalog."default" NOT NULL,
    "accessKeyId" text COLLATE pg_catalog."default" NOT NULL,
    "secretAccessKey" text COLLATE pg_catalog."default" NOT NULL,
    region text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "s3_info_bucketName_key" UNIQUE ("bucketName")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.s3_info
    OWNER to postgres;
