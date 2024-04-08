<?php
    function check_user($conn,$email)
    {
        
        $registrat = false;
        $query = "SELECT email FROM public.usuari WHERE email = '$email'";
        $result = pg_query($conn, $query);
        if (pg_num_rows($result) != 0)
        {
            $registrat = true;
        }
        return $registrat;
    }
    //NOTA: si es posa false es pot no printar be la variable
?>


