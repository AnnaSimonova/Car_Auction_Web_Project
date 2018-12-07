<?php
require_once("db_connection.php");
require_once("functions.php");

$result_set = [];
$query = "SELECT * FROM us_state;";
$query_result = mysqli_query($connection, $query);
confirm_query($query_result);
while($location = mysqli_fetch_assoc($query_result)) {
    $result_set[] = $location;
}

print_r(json_encode($result_set));

?>