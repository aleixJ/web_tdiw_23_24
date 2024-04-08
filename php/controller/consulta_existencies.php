<?php
    $id_t = $_REQUEST['model_talla'] ?? NULL;
    include_once __DIR__."/../model/connectaBD.php"; //retorna $conn
    include_once __DIR__."/../model/query_existencies.php";
    include_once __DIR__."/../view/load_pagina_existencies.php";

?>