<?php
    if(isset($model_id))
        $fotos = pg_fetch_all($resultFotos);
    $talla = pg_fetch_all($resultTalles);
?>

<?php foreach ($fotos as $foto){ ?>
    <img src= <?php echo $foto['url']; ?> >
<?php } ?>