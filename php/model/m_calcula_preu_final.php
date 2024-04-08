<?php 
    $preuFinal = 0;
    if (!empty($_SESSION["cabas"]))
    {    
        include __DIR__."/connectaBD.php"; //retorna $conn
        foreach ($_SESSION["cabas"] as $itemSession){ 

            $id_t = $itemSession["id_t"]; 
            //!!!!!!!!! Sumament IMPORTANT NO posar include_once o no funcionará i et rallaras!!!!!!!!!!!
            include __DIR__."/m_info_producte_from_talla.php";
        
            $preuFinal += $preu * $itemSession["unitats"];
        }
    }
?>

