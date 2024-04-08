<?php
    //per comprovar que hi hagi suficients productes. Ja es comprova a l'afegir al cabas, però s'ha de tornar a comprovar pel checkout
    function check_cabas($conn)
    {
        $retornar = 1;
        $index = 0;
        foreach ($_SESSION["cabas"] as $itemSession)
        {
            $id_t = $itemSession["id_t"];
            include __DIR__."/query_existencies.php";
            if($existencies < $itemSession["unitats"])
            {
                $retornar = 0; //indiquem que hi ha un error
                //eliminem les unitats que no es poden comprar per falta de stock
            }
            $index++;
        }
        return $retornar;
    }
?>