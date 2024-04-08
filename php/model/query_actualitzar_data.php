<?php
    //modifiquem la data de modificació
    $query_inser = "UPDATE public.usuari SET data_modificacio=$1 WHERE email=$2";
    $statement = pg_prepare($conn, "editar_data_modificacio", $query_inser);
    $result = pg_execute($conn, "editar_data_modificacio", array("now()", $aux));

?>