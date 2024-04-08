<?php
    session_start();
    if (empty($_SESSION["usuari"]))
        $registrat = false;
    else
        $registrat = true;
    if (empty($_SESSION["cabas"]))
        $cabas = 0;
    else
        $cabas= count($_SESSION["cabas"]);
?>
<header id="capcalera">
    <!--Buscador / Login....-->

    <div id="fotoTitol">
        <div id="divLogo">
            <a href="index.php" onclick="canviarCategoria('none')"><img id="fotoLogo" src="/img/logo300.png" alt="Logo"></a>
        </div>

        <div id="textBotiga">
            <h3> Botiga de Sabates</h3>
        </div>

    </div>

    <div id="menu">

        <div id="desplegable">
            <input type="search" id="buscador" placeholder="Buscar..." ></input> 
        </div>
        
        <img id="fotoBuscar" src="/img/buscar.png" alt="Buscar">

        
        <div id="autenticarse">

            
            
            <?php if($registrat){ 
                include_once __DIR__."/php/model/connectaBD.php";
                include_once __DIR__."/php/model/demanarDadesUsuari.php";
            ?>
                <img id="fotoUsuari" src="<?php echo $resultat[0]["foto"]?>" alt="Login" onclick="obrirMenu('menu_opcions')">
            <?php }else{ ?>
                <img id="fotoUsuari" src="/img/usuario_default.png" alt="Login" onclick="obrirMenu('menu_opcions')">
            <?php } ?>
            
            
            <div id="menu_opcions" class="menu_desplegable">
                <?php if(!$registrat){ ?>
                    <a href="login.php">
                        <div class="menu_item">Iniciar Sessió</div>
                    </a>
                    <a href="register.html">
                        <div class="menu_item">Registrar-se</div>
                    </a>
                <?php }else{ ?>
                    <a href="perfil.php">
                        <div class="menu_item">Perfil</div>
                    </a>
                    <a href="comandes.php">
                        <div class="menu_item">Comandes</div>
                    </a>
                    <a href="logout.php">
                        <div class="menu_item">Logout</div>
                    </a>
                <?php } ?>
            </div>

        </div>
        
        <a id="cabas" href="cabas.php"><img id="fotoCarrito" src="/img/carrito-de-compras.png" alt="Carrito" onmouseover ="obrirMenu('menu_cabas')">
            <?php if($cabas > 0){ ?>
                <div id="cabasPle"> <?php echo $cabas ?></div>
            <?php } ?>
        </a>
        <div id="menu_cabas" class="menu_desplegable">
            <?php if($cabas > 0) { ?>
                <div class="menu_item">
                    Productes: <?php echo $cabas; ?>
                </div>
                <div class="menu_item">
                   Preu Final: <?php include_once __DIR__."/php/model/m_calcula_preu_final.php"; echo $preuFinal; ?> €
                </div>
            <?php } ?>
        </div>
        
    </div>


</header>

