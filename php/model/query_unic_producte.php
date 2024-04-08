<?php

    require_once __DIR__."/connectaBD.php"; //retorna $conn

    $queryProducte = "SELECT * FROM public.productes WHERE id = '$producte_id'";
    $resultProducte = pg_query($conn, $queryProducte);
    
    $queryModel = "SELECT * FROM public.producte_model WHERE id_p = '$producte_id'";
    $resultModel = pg_query($conn, $queryModel);

    if(isset($model_id)) //nomes en el cas d'accio 5
    {
        $queryFotos = "SELECT * FROM public.fotos_model WHERE id_m = '$model_id'";
        $resultFotos = pg_query($conn, $queryFotos);
    }

    if(isset($model_id)) //nomes en el cas d'accio 5 o 6. encara que en la 5 no es fara servir
    {
        $queryTalles = "SELECT * FROM public.talles_model WHERE id_m = '$model_id'";
        $resultTalles = pg_query($conn, $queryTalles);
    }



?>