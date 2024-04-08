<?php

    $categoria = $_REQUEST["categoria"];
    $filtre = $_REQUEST["filtre"];
    
    if($categoria == "none")
    {
        $query = "SELECT * FROM public.productes WHERE nom LIKE '%". $filtre ."%' OR marca LIKE '%" . $filtre . "%' OR categoria LIKE '%" . $filtre . "%' OR nom LIKE '%" . strtoupper($filtre) . "%' OR marca LIKE '%" . strtoupper($filtre) . "%' OR categoria LIKE '%" . strtoupper($filtre) . "%'";
        $result = pg_query($conn, $query);
    }
    else
    {
        $query = "SELECT * FROM public.productes WHERE (nom LIKE '%". $filtre ."%' OR marca LIKE '%" . $filtre . "%' OR nom LIKE '%" . strtoupper($filtre) . "%' OR marca LIKE '%" . strtoupper($filtre) . "%' ) AND categoria = '$categoria'" ;
        $result = pg_query($conn, $query);
    }



?>

