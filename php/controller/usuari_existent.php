<?php
    include_once __DIR__."/../model/connectaBD.php"; //retorna $conn
    require_once __DIR__."/../model/check_users.php";
    $email = $_REQUEST["email"] ?? null;
    if(isset($email))
        echo check_user($conn,$email);
     else
        echo 0;
?>