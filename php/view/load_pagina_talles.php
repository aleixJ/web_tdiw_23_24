<?php
    if(isset($model_id))
        $talla = pg_fetch_all($resultTalles);
?>
<?php
    //sort el array $talla per el 'talla'
    //aixi es mostran les talles en ordre ascendent (en el que cas que no ho estiguin a la base de dadades)
    usort($talla, function($a, $b) {
        return $a['talla'] <=> $b['talla'];
    });
?>

<?php foreach ($talla as $TallaFila) { ?>
    <option value= "<?php echo $TallaFila['id'] ?>" > <?php echo $TallaFila['talla'] ?> </option>
<?php }?>