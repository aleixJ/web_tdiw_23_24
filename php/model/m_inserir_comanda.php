<?php
    include __DIR__."/../model/m_modificar_productes_BD.php";
    if(!empty($_SESSION["cabas"]))
    {
        //calculem el preu final
        include_once __DIR__."/m_calcula_preu_final.php";
        $query_insert = "INSERT INTO public.comandes VALUES (DEFAULT, $1, $2, DEFAULT)";
        $statement = pg_prepare($conn, "insert_comanda", $query_insert);
        $result = pg_execute($conn, "insert_comanda", array($_SESSION["usuari"]["email"], $preuFinal));
        //obtenim el id de la comanda que acabem d'inserir per poder relacionar cada producte
        $query_last_id = "SELECT lastval() as id";
        $statement_last_id = pg_query($conn, $query_last_id);
        $row = pg_fetch_assoc($statement_last_id);
        $IdComanda = $row['id'];

        foreach ($_SESSION["cabas"] as $itemSession)
        {
            //carreguem la info del producte, per el preu
            $id_t = $itemSession["id_t"];
            include __DIR__."/m_info_producte_from_talla.php";
            $query_insert2 = "INSERT INTO public.productes_comandes VALUES (DEFAULT, $1, $2, $3, $4)";
            $statement = pg_prepare($conn, "insert_productes_comanda_bd" . $id_t, $query_insert2);

            $result = pg_execute($conn, "insert_productes_comanda_bd" . $id_t, array($id_t, $IdComanda, $preu, $itemSession["unitats"]));
            //modifiquem les existencies del producte a la base de dades
            modificarBD($conn, $id_t, (0-$itemSession["unitats"])); //el tercer parametre ha de ser negatiu perque s'han de restar     
        }

        //borrar cabas
        unset($_SESSION["cabas"]);
    }


?>