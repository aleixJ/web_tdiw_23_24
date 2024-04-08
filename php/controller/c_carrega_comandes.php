<?php

    function CarregaComanda($conn, $id_t, $preu, $unitats)
    {

        include __DIR__."/../model/m_info_producte_from_talla.php";
        include __DIR__."/../view/v_carrega_comanda.php";
    }

?>