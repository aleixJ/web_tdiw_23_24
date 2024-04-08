
<?php 
    $resultat = pg_fetch_all($result);
    foreach ($resultat as $fila) {
?>

<div class="producte">

    <div class="descripcio" onclick="carregarUnProducte('<?php echo $fila['id']?>')" >
        <img src=<?php echo $fila['foto'] ?> >
        <p class="marca"> <?php echo $fila['marca']?></p>
        <p class="nom"> <?php echo $fila['nom']?></p>
        <p class="preu"> <?php echo $fila['preu']?> €</p> 
    </div>

</div>


<?php } ?>
