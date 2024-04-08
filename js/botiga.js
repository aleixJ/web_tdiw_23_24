var contadorDeProductes = 1;

function comprovarNom(){
    
    // Reemplazar múltiples espacios por uno solo
    var nom = document.getElementById("nom");
    var nombreUsuario = nom.value;
    var resultado = '';
    var espacioPrevio = false;

    //per treure espais intermitjos
    for (var i = 0; i < nombreUsuario.length; i++) {
        var caracter = nombreUsuario[i];
        
        if (caracter === ' ') {
            if (!espacioPrevio) {
                resultado += caracter;
            }
            espacioPrevio = true;
        } else {
            resultado += caracter;
            espacioPrevio = false;
        }
    }
    
    //per treure l'ultim caracter si es un espai
    if (resultado.charAt(resultado.length - 1) == '\n' || resultado.charAt(resultado.length - 1) == '\r' || resultado.charAt(resultado.length - 1) == ' ') 
        resultado = resultado.slice(0,-1);

    if(resultado.charAt(0) == '\n' || resultado.charAt(0) == '\r' || resultado.charAt(0) == ' ')
        resultado = resultado.slice(1, resultado.length);

    nom.value = resultado;
}

function validarInput(inputElement, form) {
    // Obtener el valor del input
    var valorInput = inputElement.value;

    if(form == undefined)
        var error = document.getElementById("errorMiInput");
    else
        var error = document.getElementById(form);
  
    // Obtener la expresión regular del atributo pattern
    var patron = new RegExp(inputElement.getAttribute("pattern"));
  
    // Comprobar si el valor cumple con la expresión regular
    if (patron.test(valorInput) || valorInput == "") {
        // Si cumple, mostrar mensaje de éxito o realizar otras acciones
      
        error.innerText = "";
    } else {
        // Si no cumple, mostrar mensaje de error o realizar otras acciones
        var camp = inputElement.getAttribute("placeholder");
        var format = "";
        
        switch (inputElement.name) {
            case "username":
                format = "Només caràcters i espais.";
                break;
            
            case "email":
                format = "Correu electrònic vàlid"
                break;
            
            case "contra":
            case "contrasenya":
            case "Acontra":
                format = "Camp alfanumèric."
                break;

            case "adreca":
            case "poblacio":
                format = "Pot contenir fins a 30 caràcters i espais.";
                break;

            case "cp":
                format = "Ha de contenir 5 dígits";
                break;
        }

        error.innerText = "El camp " + camp + " ha de tenir el format: " + format;
    }
  }

async function comprovarEmail(registre)
{
    //'register' comprova si es crida desde el register (true) o desde el login (false)
    if(registre != undefined) //en la primer load de la pagina es posa com undefined
    {
        var email = document.getElementById("ce");

        var response = await fetch("index.php?accio=2&email=" + email.value, {method: 'POST'});
        var registrat = await response.text();
        if(registre == true)
        {
            if(registrat == true)
            {
                email.value = "";
                alert("Usuari ja registrat");
            }
        }
        else
        {
            if(registrat == false)
            {
                email.value = "";
                alert("Usuari no registrat");
            }
        }
    }
}



// --------- BUSCADOR ---------
let categoriaSeleccionada = "none";

function canviarCategoria(cat){
    categoriaSeleccionada = cat;
}

async function carregarProductes(id)
{
    //esborrem el menu de categories
    let cat = document.getElementById("categories");
    cat.innerHTML = " ";
    
    //Demanar tots els productes amb ajax
    let productes = document.getElementById("productes");

    var response = await fetch("index.php?accio=3&categoria=" + id, {method: 'GET'});
    
    var llista_productes = await response.text();   
    productes.innerHTML = llista_productes;

    canviarCategoria(id);
}

async function carregarUnProducte(id)
{
    //esborrem el menu de categories
    let cat = document.getElementById("categories");
    cat.innerHTML = " ";

    let productes = document.getElementById("productes");
    productes.innerHTML = " ";
    
    let producte = document.getElementById("descripcioProducte");
    producte.style.display = "grid";
    var response = await fetch("index.php?accio=4&producte=" + id, {method: 'GET'});    
    
    var llista_producte = await response.text();   
    producte.innerHTML = llista_producte;

    contadorDeProductes = 1;
}





async function carregaModel(producte)
{
    let fotos = document.getElementById("fotos");

    var model = document.getElementById("selModel");
    var response = await fetch("index.php?accio=5&producte=" + producte + "&model=" + model.value, {method: 'GET'});

    var fotos_model = await response.text();   
    fotos.innerHTML = fotos_model;

    carregaTalles(producte); //actualitzem les talles
}

async function carregaTalles(producte)
{
    let llistaTalles = document.getElementById("selTalles");

    var model = document.getElementById("selModel");
    var response = await fetch("index.php?accio=6&producte=" + producte + "&model=" + model.value, {method: 'GET'});

    var talles = await response.text();
    llistaTalles.innerHTML = talles;

    carregaExistencies();
}

async function carregaExistencies()
{
    let llistaTalles = document.getElementById("selTalles");
    let model_talla = llistaTalles.value;
    let textExistencies = document.getElementById("textExistencies");

    var response = await fetch("index.php?accio=7&model_talla=" +  model_talla, {method: 'GET'});
    var existencies = await response.text();
    textExistencies.innerHTML = existencies;

    var existencies = document.getElementById("textExistencies").innerText;
    var boto = document.getElementById("botoCompra");
    if(existencies == '0')
    {
        boto.style.backgroundColor = "rgb(184, 178, 156)";
        boto.style.cursor = "not-allowed";
        contadorDeProductes = 0;
    }
    else{
        boto.style.backgroundColor = "rgb(247, 240, 210)";
        boto.style.cursor = "pointer";
        contadorDeProductes = 1;
    }

    document.getElementById("num-quantitat-producte").innerText = contadorDeProductes;
}




//Carousel
let slideIndex = 0;
function numImgDiv(div)
{
    var div = document.getElementById(div);
    var images = div.getElementsByTagName('img');
    var numberOfImages = images.length;
    return numberOfImages;
}
function changeSlide(value)
{
    var numImg = numImgDiv("fotos");
    var fotos = document.getElementById("fotos");
    slideIndex = slideIndex + value;
    if(slideIndex >= numImg)
        slideIndex = 0;
    if(slideIndex < 0)
        slideIndex = numImg-1;
    fotos.style.transform = `translate(-${(slideIndex)*100}%)`;
}
//End Carousel




async function AfegirProducte()
{
    var llistaTalles = document.getElementById("selTalles");
    talla = llistaTalles.value;

    if(talla != '0'){
        var unitats = Number(document.getElementById("num-quantitat-producte").innerText);
        var response = await fetch("index.php?accio=9&model_talla=" +  talla + "&unitats=" + unitats, {method: 'GET'});
        var resposta = await response.text();
        setTimeout(function() {obrirMenu("menu_cabas"); }, 1500);
        $("#header").load("header.php"); //actualitzem el header perque es mostri la nova imatge del cabàs.
    }

    
}

async function EliminaCabas(index)
{
    //si value es '-1', l'elimina tot
    var response = await fetch("index.php?accio=10&index=" +  index, {method: 'GET'});
    location.reload(); //actualitzem la pagina
}

async function CarregaCabas(id_t, unitats, index)
{
    var response = await fetch("index.php?accio=11&id_t=" +  id_t + "&unitats=" + unitats, {method: 'GET'});
    var resposta = await response.text();
    var descripcio = document.getElementById("producte-"+index);
    descripcio.innerHTML = resposta;
}

async function ModificarQuantitat(modificar, index)
{
    //si modificar 1, aumenta les unitats. Si es -1, decrementa les unitats
    var response = await fetch("index.php?accio=12&modificar=" + modificar + "&index=" + index, {method: 'GET'});
    var resposta = await response.text();
    if(resposta == 0) //nomes si s'ha eliminat algun producte actualitzem la pagina
        location.reload(); //actualitzem la pagina
    var numQuantitat = document.getElementById("num-quantitat-producte-"+index);
    if(resposta != "no")
    {
        numQuantitat.innerHTML = resposta;
        location.reload();
    }
}


function displayOpcio(opcio){
    let a = document.getElementById("dades");
    let b = document.getElementById("editarDades");
    let c = document.getElementById("canviContra");
    let perfil = document.getElementById("perfil");

    a.style.display = "flex";
    b.style.display = "none";
    c.style.display = "none";
    //amagar totes i declarar totes
    switch (opcio) {
        case '0':
            a.style.display = ((a.style.display == "initial") ? "none" : "initial");
            b.style.display = "none";
            c.style.display = "none";
            perfil.style.gridTemplateAreas = 'opcions dades';
            break;
        case '1': 
            b.style.display = ((b.style.display == "initial") ? "none" : "initial");
            a.style.display = "none";
            c.style.display = "none";
            perfil.style.gridTemplateAreas = 'opcions editar';
            break;

        case '2':
            c.style.display = ((c.style.display == "initial") ? "none" : "initial");
            b.style.display = "none";
            a.style.display = "none";
            perfil.style.gridTemplateAreas = 'opcions contra';
            break;
        default:
            break;
    }
}

async function botoComprar(){
    var boto = document.getElementById("boto_comprar");
    boto.style.backgroundColor = "rgb(184, 178, 156)";
    boto.style.cursor = "not-allowed";
    document.documentElement.classList.add('waiting');
    
    //Guardar a la base de dades, comprovar les dades al servidor
    var response = await fetch("index.php?accio=15",  {method: 'GET'});
    var resposta = await response.text();

    location.href = "compra.php?index="+resposta;
}

var seconds = 10; //número de segundos a contar
function secondPassed() {
    var count = document.getElementById('countdown')
    if(count)
    {
        var remainingSeconds = seconds % 60; //calcula los segundos
        //si los segundos usan sólo un dígito, añadimos un cero a la izq
        if (remainingSeconds < 10) { 
            remainingSeconds = "0" + remainingSeconds; 
        } 
        document.getElementById('countdown').innerHTML = remainingSeconds; 
        if (seconds == 1) { 
            clearInterval(countdownTimer); 
        } else { 
            seconds--; 
        } 
    }
}

function redirigirAPaginaPrincipal() {
    // Cambiar la ubicación a la página principal
    window.location.href = "/";
}

var countdownTimer = setInterval(secondPassed, 1000);

function ModificarQuantitatProducte(num)
{
    if((num==1 || num==-1) && document.getElementById("selTalles").value != '0')
    {
        var existencies = document.getElementById("textExistencies").innerText;

        if(contadorDeProductes < existencies && contadorDeProductes > 1)
        {
            contadorDeProductes += num;
            document.getElementById("num-quantitat-producte").innerText = contadorDeProductes;
        }
        else if((contadorDeProductes == 1 && num == 1) || ((contadorDeProductes == existencies && num == -1) && contadorDeProductes !=0))
        {
            contadorDeProductes += num;
            document.getElementById("num-quantitat-producte").innerText = contadorDeProductes;
        }
    }
}

