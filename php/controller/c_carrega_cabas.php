<?php
//es crida aquesta funcio per cada itemSession
if($id_t != NULL && $unitats != NULL)
{
    include __DIR__."/../model/connectaBD.php"; //retorna $conn
    include __DIR__."/../model/m_info_producte_from_talla.php";
    include __DIR__."/../view/v_carrega_cabas.php";
}
else
    header("Location: index.php");

?>