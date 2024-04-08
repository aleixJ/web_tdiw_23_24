<?php
    $producte_id = $_REQUEST['producte'] ?? NULL;
    $model_id = $_REQUEST['model'] ?? NULL;
    if($producte_id != NULL && $model_id != NULL)
    {
        include_once __DIR__."/../model/query_unic_producte.php";
        include_once __DIR__."/../view/load_pagina_model.php";
    }
    else
        header("Location: index.php");

?>