<?php

    $indexComanda = 0;
    foreach ($resultatComandes as $filaComanda)
    {
        //per mostrar la ultima comanda feta quan s'ha fet la compra. (compra.php)
        if(isset($iteracions) && $indexComanda != (count($resultatComandes)-1)){
            //echo count($resultatComandes) . " " . $indexComanda;
            $indexComanda++;
            continue;
        }
?>
    <div id="Comanda-<?php echo $indexComanda;?>" class="comanda"> Comanda #<?php echo$filaComanda["id"];  ?>
    <?php
        $indexProducte = 0;
        $resultatProductes = ProductesComanda($conn, $filaComanda["id"]);
        foreach ($resultatProductes as $filaProductes)
        {
    ?>
            <div id="Producte-<?php echo $indexComanda;?>-<?php echo $indexProducte;?>" class="producte">
            <?php
                $id_t = $filaProductes["id_t"];
                $unitats = $filaProductes["unitats"];
                $preu = $filaProductes["preu"];
                CarregaComanda($conn, $id_t, $preu, $unitats);
            ?>
            </div>
        <?php
            $indexProducte++;
        }
        $indexComanda++;
        ?>
        <div class="preu-i-data">
            <div class="preu-comanda"> Preu Total: <?php echo $filaComanda["preu"]; ?> € </div>
            <div class="data-comanda"> Data: <?php echo substr($filaComanda["data_comanda"], 0, strpos($filaComanda["data_comanda"], '.')); ?> </div>
        </div>
    </div>
    
<?php
}



?>