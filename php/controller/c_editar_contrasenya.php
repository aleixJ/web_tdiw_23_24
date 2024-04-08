<?php
    session_start();

    include_once __DIR__."/../model/connectaBD.php"; //retorna $conn
    require_once __DIR__."/../model/check_users.php"; //comprovem que el usuari existexi
    require_once __DIR__."/../model/m_check_login.php"; //comprovem que el usuari estigui registrat i la contrasenya correc
    
    include_once __DIR__."/../model/query_editar_contrasenya.php";
    include_once __DIR__."/../model/query_actualitzar_data.php";

    header("Location: perfil.php?estat=" . $estat);


?>