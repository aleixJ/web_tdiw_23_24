<?php

    include_once __DIR__."/../model/connectaBD.php";
    include_once __DIR__."/../model/query_buscar_producte.php";
    
    if(pg_num_rows($result) != 0)
        include_once __DIR__."/../view/load_productes.php";
    else
        echo "";
    

?>