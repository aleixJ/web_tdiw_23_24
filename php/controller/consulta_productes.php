<?php

  $categoria = $_REQUEST['categoria'] ?? NULL;
  if(isset($categoria))
  {
    include_once __DIR__."/../model/query_productes.php";
    include_once __DIR__."/../view/load_productes.php";
  }
  else
  {
     echo "-1";
  }

?>