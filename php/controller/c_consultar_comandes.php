<?php
    
    include_once __DIR__."/../model/connectaBD.php";
    include_once __DIR__."/../model/m_consultar_comandes.php";
    if($existeixComandes)
    {
        include_once __DIR__."/../model/m_consultar_productes_comanda.php"; //carrega la funcio ProductesComanda($conn, $id_c)
        include __DIR__."/../controller/c_carrega_comandes.php"; // carrega la funcio CarregaComanda($conn, $id_t, $preu, $unitats)
        include_once __DIR__."/../view/v_load_comandes.php";
    }
?>