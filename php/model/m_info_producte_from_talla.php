<?php

    $queryTalla = "SELECT * FROM public.talles_model WHERE id = '$id_t'";
    $rTalla = pg_query($conn, $queryTalla);
    $rTalla = pg_fetch_all($rTalla);

    $id_m = $rTalla[0]["id_m"];
    $queryModel = "SELECT * FROM public.producte_model WHERE id = '$id_m'";
    $rModel = pg_query($conn, $queryModel);
    $rModel = pg_fetch_all($rModel);

    $color = $rModel[0]["color"];
    $id_p = $rModel[0]["id_p"];
    $queryProductes = "SELECT * FROM public.productes WHERE id = '$id_p'";
    $rProductes = pg_query($conn, $queryProductes);
    $rProductes = pg_fetch_all($rProductes);
    
    $queryFotos = "SELECT * FROM public.fotos_model WHERE id_m = '$id_m'";
    $rFotos = pg_query($conn, $queryFotos);
    $rFotos = pg_fetch_all($rFotos);

    $nom = $rProductes[0]['nom'];
    $marca = $rProductes[0]['marca'];
    $preu = $rProductes[0]['preu'];
    $talla = $rTalla[0]['talla'];
    $foto = $rFotos[0]['url'];
    $item =
        array(
            "id_p" => $id_p, "id_m" => $id_m, "id_t" => $id_t, "nom" => $nom, "marca" => $marca,  "color" => $color, "preu" => $preu, "talla" => $talla, "foto" => $foto
        );
?>