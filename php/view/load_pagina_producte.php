
<?php 
    $producte = pg_fetch_all($resultProducte);
    $model = pg_fetch_all($resultModel);
?>

    <div id="carousel">
        <div id="fotos-container">
            <div id="fotos">
                <img src=<?php echo $producte[0]['foto']; ?> >
            </div>    
        </div>

        <div id="prev-next">
            <button class="prev" onclick="changeSlide(-1)">&#10094;</button>
            <button class="next" onclick="changeSlide(1)">&#10095;</button>   
        </div>
        
    </div>


    <div id="descripcio">
            <div id="marcaNom">
                <h3 class="marca"> <?php echo $producte[0]['marca']; ?> </h3>

                <p class="nom"> <?php echo $producte[0]['nom']; ?> </p>
            </div>

            <div id="DivDescripcio">
                <h3>Descripció:</h3>
                Categoria: <?php echo $producte[0]['categoria']; ?>
                <p id="textDescripcio"> <?php echo $producte[0]['descripcio']; ?> </p>
            </div>

            <div id="selleccionaModel">
                <select id="selModel" onchange="carregaModel(<?php echo $producte_id; ?>);">
                    <option disabled selected value> -- Selecciona un Color -- </option>
                    <?php foreach ($model as $modelFila) { ?>
                    <option value= "<?php echo $modelFila['id']; ?>" > <?php echo $modelFila['color']; ?> </option>
                    <?php }?>
                </select>
            </div>

            <div id="selleccionaTalles">
                <select id="selTalles" onchange="carregaExistencies();"> 
                <option disabled value="0" selected > -- Selecciona una Talla -- </option>
                </select>
            </div>

            <div class="quantitat-producte">
                <button onclick="ModificarQuantitatProducte(-1)" class="button-eliminar-producte">-</button>
                <span id="num-quantitat-producte" class="num-quantitat-producte">1</span>
                <button onclick="ModificarQuantitatProducte(1)" class="button-afegir-producte">+</button>
            </div>

            <div id="DivExistencies">
                <h3>Existencies:</h3>
                <p id="textExistencies"> </p>
            </div>

    </div>

    <div id="gestio">
            <div id="preu">
                <p> <?php echo $producte[0]['preu']; ?> €</p>
            </div>

            <div id="carrito">
                <button id="botoCompra" class="button-6" onclick="AfegirProducte()">Afegir a la cistella</button>
                <button id="botoIniciCompra" class="button-6" onclick="redirigirAPaginaPrincipal()">Tornar a l'inici</button>
            </div>
    </div>



