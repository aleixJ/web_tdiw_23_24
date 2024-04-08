<?php

    require_once __DIR__."/connectaBD.php"; //retorna $conn

    $query = "SELECT * FROM public.productes WHERE categoria = '$categoria'";
    $result = pg_query($conn, $query);
    

?>
