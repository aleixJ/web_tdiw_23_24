<?php
    
    include_once __DIR__."/../model/connectaBD.php";

    $query = "SELECT * FROM public.categories";
    $result = pg_query($conn, $query);


?>