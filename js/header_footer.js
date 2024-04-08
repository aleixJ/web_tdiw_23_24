$(function(){
    $("#header").load("header.php"); 
    $("#footer").load("footer.html"); 
});


window.onload = (event) => {
    posarLogo();
};

function posarLogo()
{
    document.head.innerHTML += ' <link rel="shortcut icon" type="image/x-icon" href="/img/logo100.png" />';
}

let m_cabas = 0;
let m_perfil = 0;
function obrirMenu(id)
{

    if(id == "menu_opcions")
    {
        m_perfil = 1;
        m_cabas = 0;
        let canviar = document.getElementById(id);
        canviar.style.display = (canviar.style.display === 'block') ? 'none' : 'flex';
        document.getElementById("menu_cabas").style.display = 'none';
    }
    else
    {
        m_cabas = 1;
        m_perfil = 0;
        let canviar = document.getElementById(id);
        canviar.style.display = (canviar.style.display === 'block') ? 'none' : 'flex';
        document.getElementById("menu_opcions").style.display = 'none';
    }        
}

//per amagar els menus
window.addEventListener('click', function (event) {
    var menuContainer = document.getElementById('fotoUsuari');
    if (!menuContainer.contains(event.target)) {
        document.getElementById('menu_opcions').style.display = 'none';
        document.getElementById('menu_cabas').style.display = 'none';
    }
});



// --------- BUSCADOR ---------
window.addEventListener('click', function (event) {
    var fotoBuscar = document.getElementById('fotoBuscar');
    var urlActual = window.location.href;
    const urlPaginaIncluida = 'https://tdiw-g2.deic-docencia.uab.cat/index.php';
    const urlPaginaIncluida2 = "https://tdiw-g2.deic-docencia.uab.cat/";
    if (fotoBuscar.contains(event.target) && ( urlActual == urlPaginaIncluida || urlActual == urlPaginaIncluida2 )) {
        obrirMenu("desplegable");
    }
});

//Amagar desplegable
window.addEventListener('click', function (event) {
    var fotoBuscar = document.getElementById('fotoBuscar');
    var desplegable = document.getElementById("desplegable");
    if (!fotoBuscar.contains(event.target) && !desplegable.contains(event.target)) {
        document.getElementById('desplegable').style.display = 'none';
    }
});

async function buscarProductes(txt){
    //esborrem el menu de categories
    let cat = document.getElementById("categories");
    cat.style.display = "none";

    //Demanar tots els productes amb ajax
    let productes = document.getElementById("productes");   
    var response = await fetch("index.php?accio=14&categoria=" + categoriaSeleccionada + "&filtre=" + txt, {method: 'GET'});

    var llista_productes = await response.text();   
    productes.innerHTML = llista_productes;
}

//Event on input change on buscador
window.addEventListener('input', (event) => {
 let bus = document.getElementById('buscador');
 if (bus.contains(event.target)) {
   if(bus.value.length > 1){
        buscarProductes(bus.value);
        document.getElementById("productes").style.display = "flex";
        document.getElementById("productes").style.marginTop = "8rem";
        document.getElementById("descripcioProducte").style.display = "none";
   }
   else{
        document.getElementById("categories").style.display = "flex";
        document.getElementById("productes").style.display = "none"; 

        if(categoriaSeleccionada != "none"){
           document.getElementById("productes").style.display = "flex";
           carregarProductes(categoriaSeleccionada);
        } 
        document.getElementById("productes").style.marginTop = "0rem";
   }
 }
});

// !--------- BUSCADOR ---------!