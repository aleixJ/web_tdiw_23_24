<?php
    $modificar = $_REQUEST['modificar'] ?? NULL;
    $index = $_REQUEST['index'] ?? NULL;
    if($modificar != NULL && $index != NULL)
    {
        session_start();
        $quantitat = $_SESSION["cabas"][$index]["unitats"];
        if($modificar < 0) //vol dir que es vol eliminar
        {
            if(($quantitat + $modificar) <= 0){ //si es igual a 0, s'ha d'eliminar el producte 
                unset($_SESSION["cabas"][$index]);
                $_SESSION["cabas"] = array_values($_SESSION["cabas"]); //reasignem les posicions del array
                echo 0;
            }
            else{
                $quantitat = $quantitat + $modificar;
                $_SESSION["cabas"][$index]["unitats"] = $quantitat;
                echo $quantitat;
            }
            $recarga_necessaria = true;
        }
        else if($modificar > 0){ //vol dir que es vol afegir
            //comprovem les exixistencies que hi ha del producte. per si n'hi ha suficients
            $id_t = $_SESSION["cabas"][$index]["id_t"];
            include_once __DIR__."/../model/connectaBD.php"; //retorna $conn
            include_once __DIR__."/../model/query_existencies.php";
            if(($quantitat + $modificar) <= $existencies)
            {
                $quantitat = $quantitat + $modificar;
                $_SESSION["cabas"][$index]["unitats"] = $quantitat;
                echo $quantitat;
            }
            else //no hi ha suficients existencies
                echo "no";
            
        }
        else //cas de no voler ni afegir ni eliminar (0)
            echo $quantitat;
    }
    else
        header("Location: index.php");
?>