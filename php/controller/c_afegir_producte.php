<?php
    $id_t = $_REQUEST['model_talla'] ?? NULL;
    if($id_t != NULL){
        session_start();
        $unitats_solicitades = $_REQUEST['unitats'] ?? NULL;
        include_once __DIR__."/../model/connectaBD.php"; //retorna $conn

        if($id_t == '0' || $unitats_solicitades == NULL)
            return 0;

        include_once __DIR__."/../model/query_existencies.php";

        

        if(isset($_SESSION["cabas"])){
            foreach($_SESSION["cabas"] as $i => $itemSession)
            {
                if($itemSession["id_t"] == $id_t)
                {
                    $index = $i;
                    break;
                }
            }
        }

        if(isset($index)) //ja esta al cabas
        { 
            $unitats = $_SESSION["cabas"][$index]["unitats"];
            if(($unitats + $unitats_solicitades) <= $existencies) //comprovem si hi ha suficients existencies
            { 
                $unitats += $unitats_solicitades;
                $itemSession = array("id_t" => $id_t, "unitats" => $unitats);
                $_SESSION["cabas"][$index] = $itemSession;
            }
        }
        else //si no esta al cabas
        {
            if($existencies > 0){ //hi ha existencies
                if(!isset($_SESSION["cabas"])){ // Si no existeix el cabas, creem l'array
                    $_SESSION["cabas"] = [];
                }
                
                if(($unitats_solicitades) <= $existencies )
                {
                    $itemSession = array("id_t" => $id_t, "unitats" => $unitats_solicitades);
                    $_SESSION["cabas"][] = $itemSession;
                }
                
            }
        }
    }


?>