<?php
    $db_server = "localhost";
    $db_username = "root";
    $db_password = "my-secret-pw";
    $db_name = "CPSC332DB";
    $conn = "";

    try{
        $conn = mysqli_connect($db_server,$db_username, $db_password, $db_name);
    }catch(mysqli_sql_exception $e){
        echo "Connection failed: " . $e->getMessage();
    }
?>