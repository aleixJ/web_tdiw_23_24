<?php
    //mostrem si s'ha pogut realitzar la comanda o no
    if($disponible == 1)
        echo 1;    //echo "COMANDA REALITZADA CORRECTAMENT";
    else if($disponible == 0)
        echo 0;    //echo "COMANDA ANULADA PER FALTA DE PRODUCTES";
?>