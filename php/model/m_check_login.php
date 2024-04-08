<?php
    function check_login($conn,$email, $password)
    {
        include_once __DIR__."/connectaBD.php"; //retorna $conn
        $login = 0;
        $query = "SELECT * FROM public.usuari WHERE email = '$email'";
        $result = pg_query($conn, $query);
        $resultat = pg_fetch_all($result);
        $opciones = ['cost'=>10]; //modificar tambe a 'model/insert_users'

        if (password_verify($password, $resultat[0]["contrasenya"]))
        {
            $login = 1;
            session_start();
            $usuari = array("email" => $email, "nom" => $resultat[0]["nom"]);
            $_SESSION["usuari"] = $usuari;
            header("Location: index.php");
        }
        return $login;
    }
//NOTA: si es posa false es pot no printar be la variable
?>