<?php
    if($index != NULL)
    {
        if($index == -1)
            unset($_SESSION["cabas"]);
        else
        {//en el cas que nomes es volgui eliminar un item
            unset($_SESSION["cabas"][$index]);
            $_SESSION["cabas"] = array_values($_SESSION["cabas"]); //reasignem les posicions del array
        }
    }

?>