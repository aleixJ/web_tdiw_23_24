<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/capcalera.css">
    <link rel="stylesheet" href="css/formularis.css">

    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/botiga.js"></script>
    <script src="js/header_footer.js"></script>

    <title>Botiga Sabates</title>
</head>
<body>

    <!--Header-->
    <div id="header"></div>

    <div id="marco-login" class="form">

        <section id="login-form">
            <div class="error">
                <?php if (isset($_REQUEST["estat"])) 
                        if($_REQUEST["estat"] == "0") 
                            echo "Contrasenya incorrecte"; 
                        else if($_REQUEST["estat"] == "1") 
                            echo "Format d'input incorrecte"; 
                ?>
            </div>
            <h1>Login</h1>
            <br>

            <form method="POST" action="index.php?accio=8">
                
                <input type="email" id="ce" name="email" oninput="validarInput(this)" pattern="[a-zA-Z0-9!#$%&'*\/=?^_`\{\|\}~\+\-]([\.]?[a-zA-Z0-9!#$%&'*\/=?^_`\{\|\}~\+\-])+@[a-zA-Z0-9]([^@&%$\/\(\)=?¿!\.,:;]|\d)+[a-zA-Z0-9][\.][a-zA-Z]{2,4}([\.][a-zA-Z]{2})?"  placeholder="Correu electrònic" required onchange="comprovarEmail(0)"/> <br>
                <input type="password" name="contrasenya" oninput="validarInput(this)" pattern="^[a-zA-Z0-9]*$" placeholder="Contrasenya" required /><br>
            
                <input type="submit" value="Entrar"/>
            
            </form>
            <span class="error-message" id="errorMiInput"></span>
            <p id="compte">No tens compte? <a href="register.html">Registra't</a></p>
            
        </section>

    </div>
    
</body>
</html>