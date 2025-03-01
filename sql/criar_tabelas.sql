CREATE TABLE IF NOT EXISTS public.sales
(
    invoice_id character varying(50) COLLATE pg_catalog."default" NOT NULL,
    branch character varying(50) COLLATE pg_catalog."default",
    city character varying(50) COLLATE pg_catalog."default",
    customer_type character varying(50) COLLATE pg_catalog."default",
    gender character varying(10) COLLATE pg_catalog."default",
    product_line character varying(100) COLLATE pg_catalog."default",
    unit_price numeric(10,2),
    quantity integer,
    tax_5_percent numeric(10,2),
    total numeric(10,2),
    date date,
    "time" time without time zone,
    payment character varying(50) COLLATE pg_catalog."default",
    cogs numeric(10,2),
    gross_margin_percentage numeric(5,2),
    gross_income numeric(10,2),
    rating numeric(3,1),
    CONSTRAINT sales_pkey PRIMARY KEY (invoice_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.sales
    OWNER to postgres;
-- Index: idx_sales_date

-- DROP INDEX IF EXISTS public.idx_sales_date;

CREATE INDEX IF NOT EXISTS idx_sales_date
    ON public.sales USING btree
    (date ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: idx_sales_product_line

-- DROP INDEX IF EXISTS public.idx_sales_product_line;

CREATE INDEX IF NOT EXISTS idx_sales_product_line
    ON public.sales USING btree
    (product_line COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
