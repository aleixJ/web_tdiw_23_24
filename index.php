<?php
    
    $accio = $_REQUEST['accio'] ?? NULL;
    if(isset($accio)) //comprovem si existeix la variable
    {
        switch($accio)
        {
            case '1': //register a la base de dades
                require_once __DIR__."/php/controller/controller_inserir_usuaris.php"; //insereix el nou registre
                break;
            case '2': //comprovar usuari registrat
                require_once __DIR__."/php/controller/usuari_existent.php"; //comprova que no estigui ja registrat
                break;
            case '3': //Demanar productes amb AJAX
                require_once __DIR__."/php/controller/consulta_productes.php";
                break;
            case '4': //Demanar un unic producte amb AJAX
                require_once __DIR__."/php/controller/consulta_un_producte.php";
                break;
            case '5': //Carrega model
                require_once __DIR__."/php/controller/consulta_models.php";
                break;
            case '6': //Carrega les talles
                require_once __DIR__."/php/controller/consulta_talles.php";
                break;
            case '7': //carrega existencies
                require_once __DIR__."/php/controller/consulta_existencies.php";
                break;
            case '8': //comprova el login
                require_once __DIR__."/php/controller/c_login.php";
                break;
            case '9': //afegir producte
                require_once __DIR__."/php/controller/c_afegir_producte.php";
                break;
            case '10': //elimina cabas
                require_once __DIR__."/php/controller/c_esborrar_cabas.php";
                break;
            case '11': //disponible
                require_once __DIR__."/php/controller/c_editar_contrasenya.php";
                break;
            case '12': //modifica quantitat cabas
                require_once __DIR__."/php/controller/c_modificar_quantitat.php";
                break;
            case '13': //editar perfil
                require_once __DIR__."/php/controller/c_editar_perfil.php";
                break;
            case '14': //buscador
                require_once __DIR__."/php/controller/c_buscarProducte.php";
                break;
            case '15': // checkout
                require_once __DIR__."/php/controller/c_checkout.php";
                break;
            default:
                echo "default index, accio no reconeguda";
        }
    }
    else
        include_once __DIR__."/php/controller/controller_pagina_principal.php";
?>