<?php

    $estat=0;
    $contraValida = 0;
    $patronPassword = "/^[a-zA-Z0-9]*$/";

    //Verifiquem que la antiga contrasenya s'ha posat be
    $antiga = $_REQUEST["Acontra"];
    $email = $_SESSION["usuari"]["email"];
    if(preg_match($patronPassword, $antiga) && check_user($conn,$email))
        $contraValida = check_login($conn,$email, $antiga);

    if( $contraValida == 1  && preg_match($patronPassword, $_REQUEST["contra"]))
    {
        //Fem hash de la contrasenya
        $opciones = ['cost'=>10];
        $contra = password_hash($_REQUEST["contra"], PASSWORD_BCRYPT, $opciones);
        // inserim les dades
        $query_insert = "UPDATE public.usuari SET contrasenya=$1 WHERE email=$2";
        $statement = pg_prepare($conn, "editar_contra", $query_insert);
        $result = pg_execute($conn, "editar_contra", array($contra, $aux));
    }
    else
    {
        $estat = 3; // La contrasenya no és vàlida
    }


?>