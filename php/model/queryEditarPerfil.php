<?php
    $dades = $_REQUEST['dades'] ?? NULL;
    $estat = 0; // OK

    $aux=$_SESSION["usuari"]["email"];
    $patronUsername = "/^[A-Za-zàíèéòóúô\s]+$/";
    $patronEmail = "/[a-zA-Z0-9!#$%&'*\/=?^_`\{\|\}~\+\-]([\.]?[a-zA-Z0-9!#$%&'*\/=?^_`\{\|\}~\+\-])+@[a-zA-Z0-9]([^@&%$\/\(\)=?¿!\.,:;]|\d)+[a-zA-Z0-9][\.][a-zA-Z]{2,4}([\.][a-zA-Z]{2})?/";
    $patronPassword = "/^[a-zA-Z0-9]*$/";
    $patronAdreca = "/^[a-zA-Z0-9 çÇ]{1,30}$/";
    $patronPoblacio = "/^[a-zA-Z0-9 çÇ]{1,30}$/";
    $patronCp = "/^\d{5}$/";
    
    // Editem la foto de perfil si cal
    if(isset($_FILES["fotoPerfil"]) && !empty($_FILES['fotoPerfil']) && $_FILES["fotoPerfil"]["size"] != 0)
    {
        //esborrem la antiga foto
        $fotoAntiga = $resultat[0]["foto"];
        unlink($fotoAntiga);

        $destinationPath= "./img/usuaris/";
        move_uploaded_file($_FILES['fotoPerfil']['tmp_name'], $destinationPath.$aux.$_FILES['fotoPerfil']['name']);
        $query_insert = "UPDATE public.usuari SET foto=$1 WHERE email=$2";
        $statement = pg_prepare($conn, "editar_foto", $query_insert);
        $result = pg_execute($conn, "editar_foto", array($destinationPath.$aux.$_FILES['fotoPerfil']['name'], $aux));
    }
    
    //Actualitzem les dades que s'ens han passat
    if(isset($_REQUEST["username"], $_REQUEST["adreca"], $_REQUEST["poblacio"], $_REQUEST["cp"]))
    {
        if(preg_match($patronUsername, $_REQUEST["username"]) && preg_match($patronAdreca, $_REQUEST["adreca"]) && preg_match($patronPoblacio, $_REQUEST["poblacio"]) && preg_match($patronCp, $_REQUEST["cp"]) )
        {
            // inserim les dades
            $query_insert = "UPDATE public.usuari SET nom=$1, adreca=$2, poblacio=$3, cp=$4 WHERE email=$5";
            $statement = pg_prepare($conn, "editar_usuari", $query_insert);
            $result = pg_execute($conn, "editar_usuari", array($_REQUEST["username"], $_REQUEST["adreca"], $_REQUEST["poblacio"], $_REQUEST["cp"],$aux));
            $_SESSION["usuari"]["nom"] = $_REQUEST["username"];
        }
        else
            $estat = 1; //format no vàlid
    }
    else
        $estat = 2; //error de dades
        
    if($estat == 0)
        include_once __DIR__."/query_actualitzar_data.php";
    
        

?>



