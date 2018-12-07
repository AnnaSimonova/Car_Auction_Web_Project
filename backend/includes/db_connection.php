<?php
define("DB_SERVER", "localhost");
define("DB_USER", "root");
define("DB_PASS", "'");
define("DB_NAME", "bidfax");

// define("DB_SERVER", "generis.mysql.tools");
// define("DB_USER", "generis_bidfax");
// define("DB_PASS", "1t)#9XdBy4");
// define("DB_NAME", "generis_bidfax");

$connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);
if(mysqli_connect_errno()) {
    die("Database connection failed: " . 
         mysqli_connect_error() .
         " (" . mysqli_connect_errno() . ")"
);
}
?>