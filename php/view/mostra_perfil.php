
<h1>Benvingut <?php echo $resultat[0]["nom"]?>,</h1>


<div id="opcions"> 

    <button onclick="displayOpcio('0')" class="seleccionat">Dades</button>
    <button id="editarPerfil" onclick="displayOpcio('1')" class="no-seleccionat">Editar Perfil</button> <!-- En lloc de displayEditarPerfil fer displayOpcio() -->
    <button onclick="displayOpcio('2')" class="no-seleccionat">Opcions</button>

</div>

<div id="dades">

    <div id="fotoDePerfil">
        <img id="fotoMeuUsuari" src="<?php echo $resultat[0]["foto"]?>" alt="Foto Perfi">
    </div>

    <div id="dadesUsuari">
        <fieldset>
            <legend>Nom</legend>
            <?php echo $_SESSION["usuari"]["nom"] ?>
        </fieldset>

        <fieldset>
            <legend>Email</legend>
            <?php echo $_SESSION["usuari"]["email"] ?>
        </fieldset>

        <fieldset>
            <legend>Adreça</legend>
            <?php echo $resultat[0]["adreca"] ?>
        </fieldset>

        <fieldset>
            <legend>Població</legend>
            <?php echo $resultat[0]["poblacio"] ?>
        </fieldset>

        <fieldset>
            <legend>Codi Postal</legend>
            <?php echo $resultat[0]["cp"] ?>
        </fieldset>
        
    </div>
</div>



<div id="editarDades">
    <div id="marco-register" class="form">

        <section id="register-form">

            <form method="POST" action="index.php?accio=13" enctype="multipart/form-data"> <!-- Accio per editar el perfil -->
                <h1>Editar Perfil</h1>

                <br>
                
                <fieldset>
                    <legend>Nova Foto de Perfil</legend>
                    <input type="file" name="fotoPerfil" id="inputFoto" accept=".jpg">
                </fieldset>
                <br>

                <input type="text" id="nom" name="username" oninput="validarInput(this)" pattern="^[A-Za-zàíèéòóúô\s]+$" placeholder="Nom" required value="<?php echo $resultat[0]["nom"]; ?>" onchange="comprovarNom()"/> <br>
                <input value="<?php echo $resultat[0]["email"]?>"  disabled /> <br>
                <input type="text" id="adreca" name="adreca" oninput="validarInput(this)" pattern="^[a-zA-Z0-9 çÇ]{1,30}$"  value="<?php echo $resultat[0]["adreca"]; ?>" placeholder="Adreça" required /><br>
                <input type="text" id="poblacio" name="poblacio" oninput="validarInput(this)" pattern="^[a-zA-Z0-9 çÇ]{1,30}$" value="<?php echo $resultat[0]["poblacio"]; ?>" placeholder="Població" required /><br>
                <input type="text" id="cp" name="cp" pattern="^\d{5}$" oninput="validarInput(this)" placeholder="Codi Postal" value="<?php echo $resultat[0]["cp"]; ?>" required /><br>

                <input type="submit" name="submit" value="Guardar Canvis"/>
    
            </form>
            <span class="error-message" id="errorMiInput"></span>
        </section>  

    </div>

</div>

<div id="canviContra" class="form">
    <div class="form">

    <section id="canviar-contra-form">

        <form method="POST" action="index.php?accio=11"> <!-- Accio per canviar la contrasenya -->
            <h1>Canviar Contrasenya</h1>

            <br>

            <input type="password" id="Acontrasenya" name="Acontra" pattern="^[a-zA-Z0-9]*$" oninput="validarInput(this,'errorMiInputContrasenya')"  placeholder="Antiga Contrasenya" required /><br>
            <input type="password" id="contrasenya" name="contra" pattern="^[a-zA-Z0-9]*$" oninput="validarInput(this,'errorMiInputContrasenya')"  placeholder="Nova Contrasenya" required /><br>

            <input type="submit" value="Actualitzar Contrasenya"/>

        </form>
        <span class="error-message" id="errorMiInputContrasenya"></span>

    </section>  

    </div>
</div>