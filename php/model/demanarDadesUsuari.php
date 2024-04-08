<?php

    $aux = $_SESSION["usuari"]["email"];
    $query = "SELECT * FROM public.usuari WHERE email = '$aux'";
    $result = pg_query($conn, $query);
    $resultat = pg_fetch_all($result);
    
?>