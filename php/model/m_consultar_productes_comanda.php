<?php

    function ProductesComanda($conn, $id_c)
    {
        $queryProductesCom = "SELECT * FROM public.productes_comandes WHERE id_c = '$id_c'";
        $resultProductesCom = pg_query($conn, $queryProductesCom);
        $resultatProductesCom = pg_fetch_all($resultProductesCom);
        return $resultatProductesCom;
    }
?>