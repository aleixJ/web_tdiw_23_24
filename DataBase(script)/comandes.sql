CREATE TABLE public.comandes (
    id SERIAL PRIMARY KEY,
    id_u character varying(1000) NOT NULL,
    preu DECIMAL NOT NULL,
    data_comanda timestamp with time zone DEFAULT now()
);

--afegim la clau foranea "email" de "usuari"
ALTER TABLE ONLY public."comandes"
    ADD CONSTRAINT id_c_u FOREIGN KEY ("id_u") REFERENCES public.usuari(email);

--Nota: es possa el preu perque si aquest es modifica a la base de dades, aixi el client sap quan va pagar
CREATE TABLE public.productes_comandes (
    id SERIAL PRIMARY KEY,
    id_t INT NOT NULL,
    id_c INT NOT NULL,
    preu DECIMAL NOT NULL,
    unitats int NOT NULL
);

--afegim la clau foranea "id" de "talles_model"
ALTER TABLE ONLY public."productes_comandes"
    ADD CONSTRAINT id_pc_t FOREIGN KEY ("id_t") REFERENCES public.talles_model(id);

--afegim la clau foranea "id" de "comandes"
ALTER TABLE ONLY public."productes_comandes"
    ADD CONSTRAINT id_pc_c FOREIGN KEY ("id_c") REFERENCES public.comandes(id);

-- Evitem que pogui haver el mateix producte repetit a la mateixa comanda
ALTER TABLE ONLY public."productes_comandes"
    ADD CONSTRAINT producte_unic_comanda UNIQUE ("id_t", "id_c");
