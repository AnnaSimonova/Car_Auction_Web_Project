<?php
session_start();
require_once("db_connection.php");
if(!isset($_SESSION['request_time'])) {
	$_SESSION['request_time'] = $_SERVER['REQUEST_TIME'];
}
$request_time = $_SESSION['request_time'];
if (!isset($_COOKIE['PHPSESSID'])) {
$user_id = isset($_SESSION["user_id"]) ? $_SESSION["user_id"] : 0;
$ip_addr = $_SERVER['REMOTE_ADDR'];
$local_ip_addr = getHostByName(getHostName());
$browser = $_SERVER['HTTP_USER_AGENT'];
$location = json_decode(file_get_contents('http://api.ipstack.com/'.$ip_addr.'?access_key=e6a50f41ead61fe5878415fdce026f28'), true);
$query  = "INSERT INTO sessions (user_id, request_time, ip_address, local_ip_addr, browser, continent_code, continent_name, country_code, country_name, region_code, region_name, city, zip, latitude, longitude, created, updated) VALUES ({$user_id}, {$request_time}, '{$ip_addr}', '{$local_ip_addr}', '{$browser}', '{$location['continent_code']}', '{$location['continent_name']}', '{$location['country_code']}', '{$location['country_name']}', '{$location['region_code']}', '{$location['region_name']}', '{$location['city']}', '{$location['zip']}', '{$location['latitude']}', '{$location['longitude']}', now(), now())";
$result = mysqli_query($connection, $query);
} else {
	$phpsessid = $_COOKIE['PHPSESSID'];
    $query  = "UPDATE sessions SET phpsessid='{$phpsessid}', updated=now() where request_time={$request_time}";
    $result = mysqli_query($connection, $query);
}
if(isset($_SESSION["user_id"])) {
	$query  = "UPDATE sessions SET user_id='{$_SESSION["user_id"]}', updated=now() where request_time={$request_time}";
    $result = mysqli_query($connection, $query);
}

function message() {
    if (isset($_SESSION["message"])) {
        $output = "<div class=\"message\">";
        $output .= htmlentities($_SESSION["message"]);
        $output .= "</div>";

        $_SESSION["message"] = null;
        return $output;
    }
}

function errors() {
    if (isset($_SESSION["errors"])) {
        $errors = $_SESSION["errors"];
            
        // clear message after use
        $_SESSION["errors"] = null;
            
        return $errors;
    }
}
?>