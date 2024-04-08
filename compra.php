<?php
    $accio = $_REQUEST['index'] ?? NULL;
    // Comprovem que l'usuari s'ha registrat
    session_start();
    if (empty($_SESSION["usuari"]))
        header("Location: login.html");
    
    //comprovem que accedeixi mitjançant una accio
    if($accio == NULL)
        header("Location: index.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/botiga.css">
    <link rel="stylesheet" href="css/capcalera.css">
    <link rel="stylesheet" href="css/formularis.css">
    <link rel="stylesheet" href="css/cabas.css">
    <link rel="stylesheet" href="css/comandes.css">

    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/header_footer.js"></script>
    <script src="js/botiga.js"></script>

    <script> setTimeout("location.href='index.php'",10000) </script>

    <title>Botiga Sabates</title>
</head>
<body>
    <div id="header"></div>
    
    
    <div id="missatge-comanda">
        <?php
            if($accio == 0)
                echo "COMANDA ANULADA PER FALTA DE PRODUCTES";
            else if($accio == 1)
                echo "COMANDA REALITZADA CORRECTAMENT";
        ?>
        <p> 
            Redirigint en : <label id="countdown"></label> s
        </p>
    </div>

    <section id="comandes">
        <?php 
            $iteracions = 1;
            include_once __DIR__."/php/controller/c_consultar_comandes.php"; 
        ?>
    </section>
</body>
</html>