<?php

    if(isset($id_t))
    {
        $queryExistencies = "SELECT existencies FROM public.talles_model WHERE id = '$id_t'";
        $resultExistencies = pg_query($conn, $queryExistencies);
        $resultExistencies = pg_fetch_all($resultExistencies);
        $existencies = $resultExistencies[0]['existencies'];
    }
?>