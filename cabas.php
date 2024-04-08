<?php
    session_start();
    if (empty($_SESSION["cabas"]))
        $cabas = 0;
    else
        $cabas= count($_SESSION["cabas"]);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/capcalera.css">
    <link rel="stylesheet" href="css/formularis.css">
    <link rel="stylesheet" href="css/cabas.css">

    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/header_footer.js"></script>
    <script src="js/botiga.js"></script>

    <title>Botiga Sabates</title>
</head>
<body>

    <!--Header-->
    <div id="header"></div>

        <div class="cabas">
            <?php if(!empty($_SESSION["cabas"])) { $index=0;?>
                <?php foreach ($_SESSION["cabas"] as $itemSession){ ?>
                    <div id="producte-<?php echo $index ?>" class="producte">
                        <?php
                        $id_t = $itemSession["id_t"];
                        $unitats = $itemSession["unitats"];
                        include __DIR__."/php/controller/c_carrega_cabas.php";
                        ?>
                        <div class="quantitat-producte">
                            <button onclick="ModificarQuantitat(-1,<?php echo $index ?>)" class="button-eliminar-producte">-</button>
                            <span id="num-quantitat-producte-<?php echo $index ?>" class="num-quantitat-producte"> <?php echo $itemSession["unitats"]; ?> </span>
                            <button onclick="ModificarQuantitat(1,<?php echo $index ?>)" class="button-afegir-producte">+</button>
                        </div>
                        <div class="eliminar-producte">
                            <button onclick="EliminaCabas(<?php echo $index ?>)" class="button-eliminar-producte">Elimina el producte</button>
                        </div>
                    </div>
                <?php $index++;} ?>
                <button onclick="EliminaCabas(-1)" class="button-eliminar-productes">Elimina tot el cabàs</button>

                <div class="preu-final"> Preu Final: <?php include_once __DIR__."/php/model/m_calcula_preu_final.php"; echo $preuFinal;?> €</div>
            <?php }?>
        
            <?php if($cabas > 0 && !empty($_SESSION["usuari"])) { ?>
                <div id="compra">
                    <div  id="boto_comprar" class="button-6" onclick=botoComprar()> <a id="boto-compra">Comprar</a> </div>
                </div>
            <?php } else if (empty($_SESSION["usuari"])){ ?>
                <div id="compra">
                    <div class="button-6" > <a id="boto-compra" href="login.php">Iniciar Sessió</a> </div>
                </div>
            <?php } ?>
        </div>
</body>

 
</html>