<?php
require_once("db_connection.php");
require_once("functions.php");

$result_set = [];
$query = "SELECT model.id as 'id', model.name as 'model', make.name as 'make' FROM model JOIN make ON model.make_id=make.id WHERE make.priority = 1;";
$query_result = mysqli_query($connection, $query);
confirm_query($query_result);
while($model = mysqli_fetch_assoc($query_result)) {
    $result_set[] = $model;
}
print_r(json_encode($result_set));

?>