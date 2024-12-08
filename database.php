<?php
    // Enter "mariadb"
    $db_server = "127.0.0.1";
    // Enter your username
    $db_username = "root";
    // Enter your password
    $db_password = "my-secret-pw";
    // Enter the name of the database
    $db_name = "CPSC332DB";
    $conn = "";

    try{
        $conn = mysqli_connect($db_server,$db_username, $db_password, $db_name);
    }catch(mysqli_sql_exception $e){
        echo "Connection failed: " . $e->getMessage();
    }
?>