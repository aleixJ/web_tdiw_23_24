CREATE TABLE public.usuari (
    nom character varying(1000) NOT NULL,
    email character varying(1000) NOT NULL,
    contrasenya character varying(1000) NOT NULL,
    adreca character varying(1000),
    poblacio character varying(1000),
    cp character varying(5),
    data_creacio timestamp with time zone DEFAULT now(),
    foto character varying(1000) DEFAULT '/img/usuario_default.png'::character varying
);

ALTER TABLE ONLY public.usuari
    ADD CONSTRAINT usuari_pkey PRIMARY KEY (email);