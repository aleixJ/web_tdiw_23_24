<?php
    //$existencies es negatiu si es volen restar i positiu si es volen afegir
    function modificarBD($conn, $id_t, $existencies) 
    {
        $query = "SELECT * FROM public.talles_model WHERE id = $id_t";
        $result = pg_query($conn, $query);
        if (pg_num_rows($result) != 0) //comprovem que el producte existeixi
        {
            $rTalla = pg_fetch_all($result);
            $antExistencies = $rTalla[0]["existencies"];
            $updateQuery = "UPDATE public.talles_model SET existencies = ($antExistencies + $existencies) WHERE id = $id_t";
            $updateResult = pg_query($conn, $updateQuery);
            if($updateResult)
                return 1;
            else
                return 0; //error al modificar
        }
        else
            return -1; //el producte no existeix
    }    
?>