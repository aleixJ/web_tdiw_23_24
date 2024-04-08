--es millor fer servir varchar que character perque aquest ultim omple la mida amb espais en blanc
CREATE TABLE public."productes" (
    "id" SERIAL NOT NULL,
    "nom" VARCHAR(1000) NOT NULL,
    "marca" VARCHAR(1000) NOT NULL,
    "categoria" VARCHAR(10) NOT NULL,
    "preu" DECIMAL NOT NULL,
    "descripcio" VARCHAR(1000),
    "tipo" VARCHAR(1000),
    "foto" VARCHAR(1000) NOT NULL
);

ALTER TABLE ONLY public."productes"
    ADD CONSTRAINT productes_pkey PRIMARY KEY (id);

--afegim la clau foranea categoria'
ALTER TABLE ONLY public."productes"
    ADD CONSTRAINT categoria FOREIGN KEY (categoria) REFERENCES public.categories(categoria);


CREATE TABLE public."producte_model" (
    "id" SERIAL PRIMARY KEY, --identificador unic de model
    "id_p" SERIAL NOT NULL, --indentificador del producte
    "color" VARCHAR(1000) NOT NULL
);

-- Com que es 1-N, no posem la clau privada 'producte model', ja que faria que nomes poguem tenir una instancia de 'producte'. En altre paraules, nomes podriem tenir un color
-- ALTER TABLE ONLY public."producte_model"
--     ADD CONSTRAINT "producte_model_pkey" PRIMARY KEY ("id_model");

--Ara linkem les dues taules
ALTER TABLE ONLY public."producte_model"
    ADD CONSTRAINT id_m_p FOREIGN KEY ("id_p") REFERENCES public.productes(id);

--Evitem que pogui haver més d'un color per producte
ALTER TABLE ONLY public.producte_model
    ADD CONSTRAINT color_unic_producte UNIQUE (id_p, color);

-- taula fotos per poder tenir mes de una foto de un model
CREATE TABLE public."fotos_model" (
    "id_m" SERIAL,
    "url" VARCHAR(1000) NOT NULL
);

ALTER TABLE ONLY public."fotos_model"
    ADD CONSTRAINT id_f_m FOREIGN KEY ("id_m") REFERENCES public.producte_model(id);



CREATE TABLE public."talles_model" (
    "id" SERIAL PRIMARY KEY, --identificador unic de talla
    "id_m" SERIAL NOT NULL, --indentificador del producte
    "talla" DECIMAL NOT NULL,
    "existencies" INT NOT NULL
);

ALTER TABLE ONLY public."talles_model"
    ADD CONSTRAINT id_t_m FOREIGN KEY ("id_m") REFERENCES public.producte_model(id);

-- Evitem que pogui haver més d'una talla per model
ALTER TABLE ONLY public."talles_model"
    ADD CONSTRAINT talla_unica_model UNIQUE (id_m, talla);



-- INSERT INTO public.productes VALUES (2, 'lalala', 'adidoa', 'dona', 9.99,'dep','dep', '/img/productes/home/air-force.jpg');
-- INSERT INTO public.productes VALUES (3, 'asdjh', 'alal', 'home', 9.99,'lala','dep', '/img/productes/home/air-force.jpg');
-- INSERT INTO public.productes VALUES (5, 'asdassa', 'asdasd', 'home', 9.99,'adad','dep', '/img/productes/home/air-force.jpg');
-- INSERT INTO public.productes VALUES (4, 'asda', 'adad', 'home', 9.99,'adas','dep', '/img/productes/home/air-force.jpg');