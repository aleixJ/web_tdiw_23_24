<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="css/botiga.css">
    <link rel="stylesheet" href="css/capcalera.css">
    <link rel="stylesheet" href="css/productes_categoria.css">
    <link rel="stylesheet" href="css/sabata.css">
    
    <script src="js/botiga.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/header_footer.js"></script>
    

    

    <title>Botiga Sabates</title>
</head>
<body>
    
    <!--Header-->
    <div id="header"></div>


    <section id="categories"> <!-- Escollir Categoria -->

        <?php $resultat = pg_fetch_all($result); //retorna un array associatiu
            foreach($resultat as $fila){ ?>
        
        <div class="categoria" id="<?php echo $fila['categoria'] ?>" style="order: <?php echo $fila['id']?>" onclick="carregarProductes('<?php echo $fila['categoria']?>')" >
            <h2> <?php echo strtoupper(htmlspecialchars($fila['categoria'], ENT_QUOTES, 'UTF-8')) ?> </h2>
            <img src=<?php echo $fila['foto'] ?> >
        </div>
            
        <?php } ?>
    </section>
    
    <section id="productes">


    </section>

    <section id="descripcioProducte"></section>

</body>
</html>




