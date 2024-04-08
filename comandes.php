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
    <link rel="stylesheet" href="css/comandes.css">

    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/header_footer.js"></script>
    <script src="js/botiga.js"></script>

    <title>Botiga Sabates</title>
</head>
<body>

    <!--Header-->
    <div id="header"></div>

    <section id="comandes">
        <h2>Historial de comandes:</h2>
        <?php include_once __DIR__."/php/controller/c_consultar_comandes.php"; ?>
    </section>

</body>
</html>
