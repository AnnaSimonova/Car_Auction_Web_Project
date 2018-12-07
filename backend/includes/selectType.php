<?php
require_once("db_connection.php");
require_once("functions.php");

$query = "SELECT * FROM vehicle_type ORDER BY  name ASC";
$query_result = mysqli_query($connection, $query);
$result_set = [];
confirm_query($query_result);
while($type = mysqli_fetch_assoc($query_result)) {
    $result_set[] = $type;
}
print_r(json_encode($result_set));

?>