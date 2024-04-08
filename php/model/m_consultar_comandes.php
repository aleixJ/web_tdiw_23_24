<?php
    $existeixComandes = false;
    $email = $_SESSION["usuari"]["email"];
    $queryComandes = "SELECT * FROM public.comandes WHERE id_u = '$email'";
    $resultComandes = pg_query($conn, $queryComandes);
    if (pg_num_rows($resultComandes) != 0) //comprovem si el client te alguna comanda
    {
        $existeixComandes = true;
        $resultatComandes = pg_fetch_all($resultComandes);
    }
?>