<?php
    require_once __DIR__."/connectaBD.php"; //retorna $conn
    extract($_REQUEST);
    $correcte = NULL;
    //comprovem que els valors existeixin i que el CP tingui 5 caracters
    if (isset($username, $email, $contra, $adreca, $poblacio, $cp) && $_SERVER["REQUEST_METHOD"] == "POST")
    {
        //comprovem al servidor que el format es l'adequat
        $patronUsername = "/^[A-Za-zàíèéòóúô\s]+$/";
        $patronEmail = "/[a-zA-Z0-9!#$%&'*\/=?^_`\{\|\}~\+\-]([\.]?[a-zA-Z0-9!#$%&'*\/=?^_`\{\|\}~\+\-])+@[a-zA-Z0-9]([^@&%$\/\(\)=?¿!\.,:;]|\d)+[a-zA-Z0-9][\.][a-zA-Z]{2,4}([\.][a-zA-Z]{2})?/";
        $patronPassword = "/^[a-zA-Z0-9]*$/";
        $patronAdreca = "/^[a-zA-Z0-9 çÇ]{1,30}$/";
        $patronPoblacio = "/^[a-zA-Z0-9 çÇ]{1,30}$/";
        $patronCp = "/^\d{5}$/";

        if(preg_match($patronEmail, $email) && preg_match($patronPassword, $contra) &&  preg_match($patronUsername, $username) &&  preg_match($patronAdreca, $adreca) && preg_match($patronPoblacio, $poblacio)  && preg_match($patronCp, $cp) )
        {
            //comprovem que el correu no estigui ja registrat
            $registrat = true;

            //query parametritzada
            $query = "SELECT email FROM public.usuari WHERE email = $1";
            $statement = pg_prepare($conn, "my_query", $query);
            $result = pg_execute($conn, "my_query", array($email));

            if (pg_num_rows($result) == 0) {
                $registrat = false;
            }
            if(!$registrat)
            {
                $opciones = ['cost'=>10]; //modificar tambe a 'm_check_login'

                $contra = password_hash($contra, PASSWORD_BCRYPT, $opciones);


                $query_insert = "INSERT INTO public.usuari VALUES ($1, $2, $3, $4, $5, $6)";
                $statement = pg_prepare($conn, "insert_usuari", $query_insert);
                $result = pg_execute($conn, "insert_usuari", array($username, $email, $contra, $adreca, $poblacio, $cp));

                $correcte = 1;

            }
        }
        else
            $correcte = 2;
        
    }
    else
        $correcte = 0;
    




    
?>

