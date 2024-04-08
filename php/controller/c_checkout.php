<?php
    session_start();
    include_once __DIR__."/../model/connectaBD.php";
    include_once __DIR__."/../model/m_check_cabas.php";
    $disponible = check_cabas($conn);
    if($disponible == 1)
        include_once __DIR__."/../model/m_inserir_comanda.php";
    
    include_once __DIR__."/../view/v_checkout.php";

?>
