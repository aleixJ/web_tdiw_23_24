<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/capcalera.css">
    <link rel="stylesheet" href="css/formularis.css">
    <link rel="stylesheet" href="css/cabas.css">
    <link rel="stylesheet" href="css/comandes.css">

    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/header_footer.js"></script>
    <script src="js/botiga.js"></script>

    

    <title>Botiga Sabates</title>
</head>
<body>
    <div id="header"></div>

    <div style="text-align:center; font-size:30px; margin-top:100px;">
        <a id="missatge-registre"><!-- aqui va el missatge que es retorna --> </a>
        <?php
        if($correcte == 0)
        {
            echo "ERROR REGISTRE";
            header("refresh:10;url=register.html");
        }   
        else if($correcte == 1)
        {
            echo "REGISTRE CORRECTE";
            header("refresh:10;url=login.php");
        }
        else if($correcte == 2)
        {
            echo "ERROR REGISTRE, FORMAT INVÀLID";
            header("refresh:10;url=register.html");
        }
        ?>
        <p> 
            Redirigint en : <label id="countdown"></label> s
        </p>
    </div>
    
    

</body>
</html>