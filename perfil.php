<?php
    session_start();
    if (empty($_SESSION["usuari"]))
        header("Location: login.html");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/capcalera.css">
    <link rel="stylesheet" href="css/formularis.css">
    <link rel="stylesheet" href="css/perfil.css">
    <link rel="stylesheet" href="css/sabata.css">

    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/header_footer.js"></script>
    <script src="js/botiga.js"></script>

    <title>Botiga Sabates</title>
</head>
<body>

    <!--Header-->
    <div id="header"></div>

    <div id="error">

    <?php
        if(isset($_REQUEST["estat"])){
            switch ($_REQUEST["estat"]) {
                case 0:
                    ?><p id="ok"> <?php echo "Actualitzat Correctament";
                    break;
                case 1:
                    echo "Format no vàlid";
                    break;

                case 2:
                    echo "Error de dades";
                    break;
                
                case 3:
                    echo "La contrasenya no és vàlida";
                    break;
            }
        }

    ?>

    </div>

    <section id="perfil">
        <br>
        <?php  include_once __DIR__."/php/controller/c_perfil.php"; ?>
    </section>


  

</body>
</html>
