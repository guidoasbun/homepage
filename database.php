<?php
    $db_server = "mariadb";
    $db_username = "cs332g1";
    $db_password = "IZot12jf";
    $db_name = "cs332g1";
    $conn = "";

    try{
        $conn = mysqli_connect($db_server,$db_username, $db_password, $db_name);
    }catch(mysqli_sql_exception $e){
        echo "Connection failed: " . $e->getMessage();
    }
?>