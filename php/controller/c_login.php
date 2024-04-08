<?php
    include_once __DIR__."/../model/connectaBD.php"; //retorna $conn
    require_once __DIR__."/../model/check_users.php"; //comprovem que el usuari existexi
    require_once __DIR__."/../model/m_check_login.php"; //comprovem que el usuari estigui registrat i la contrasenya correcta
    
    $email = $_REQUEST["email"] ?? null;
    $password = $_REQUEST["contrasenya"] ?? null;

    $patronEmail = "/[a-zA-Z0-9!#$%&'*\/=?^_`\{\|\}~\+\-]([\.]?[a-zA-Z0-9!#$%&'*\/=?^_`\{\|\}~\+\-])+@[a-zA-Z0-9]([^@&%$\/\(\)=?¿!\.,:;]|\d)+[a-zA-Z0-9][\.][a-zA-Z]{2,4}([\.][a-zA-Z]{2})?/";
    $patronPassword = "/^[a-zA-Z0-9]*$/";


    if(isset($email) && isset($password))
    {
        //comprovem que els formats son correctes
        if ( preg_match($patronEmail, $email) && preg_match($patronPassword, $password)) {

            if(check_user($conn,$email))
                if( check_login($conn,$email, $password) != 1)
                    header("Location: login.php?estat=0");
            else
                header("Location: index.php");

        }
        else // si el format no es correcte enviem un missatge d'error
            header("Location: login.php?estat=1");
        
    }
    else
        header("Location: index.php");

?>