<?php

$errors = array();

function has_presence($value) {
    return isset($value) && $value !== "";
}

function fieldname_as_text($fieldname) {
    $fieldname = str_replace("_", " ", $fieldname);
    $fieldname = ucfirst($fieldname);
    return $fieldname;
}

function has_inclusion_in($value, $set){
    return in_array($value, $set);
}

function find_user_by_field($field, $name) {
  global $connection;
  $query = "SELECT * FROM users WHERE {$field}='{$name}'";
  $query_result = mysqli_query($connection, $query);
  if(!$query_result) {
        die("Database query failed.");
    }
  if ($user = mysqli_fetch_assoc($query_result)) {
        return $user;
    } else {
        return null;
    }
}

function validate_field_uniqueness($email) {
    if (find_user_by_field('email', $email)) {
        return false;
    }
    return true;
}

?>
