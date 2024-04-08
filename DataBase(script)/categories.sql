CREATE TABLE public."categories" (
    "id" SERIAL NOT NULL,
    "categoria" VARCHAR(1000) NOT NULL UNIQUE,
    "foto" VARCHAR(1000) NOT NULL
);

ALTER TABLE ONLY public."categories"
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--inserim les categories que tenim
INSERT INTO public.categories VALUES (1, 'home', '/img/hombre.jpg');
INSERT INTO public.categories VALUES (2, 'dona', '/img/mujer.jpg');
INSERT INTO public.categories VALUES (3, 'nens', '/img/nens.jpg');