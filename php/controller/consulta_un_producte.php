<?php

    $producte_id = $_REQUEST['producte'] ?? NULL;
    if(isset($producte_id))
    {
      include_once __DIR__."/../model/query_unic_producte.php";
      include_once __DIR__."/../view/load_pagina_producte.php";
    
    }
    else
    {
       echo "producte not set \n";
    }

?>