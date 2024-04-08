<?php

    session_start();
    
    include_once __DIR__."/../model/connectaBD.php";
    include_once __DIR__."/../model/demanarDadesUsuari.php";
    include_once __DIR__."/../model/queryEditarPerfil.php";


    header("Location: perfil.php?estat=" . $estat);


?>