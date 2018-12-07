<?php
require_once("backend/includes/session.php");
require_once("backend/includes/db_connection.php");
require_once("backend/includes/functions.php");
require_once("backend/includes/validation_functions.php");
require_once("backend/includes/swiftmailer/swift_required.php");
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel='shortcut icon' type='image/x-icon' href='favicon.ico' />
<script src="script.js"></script>
<!-- <script src="data.js" async></script> -->
<link rel="stylesheet" href="style.css">
<title>Bidfax - Register</title>
    
</head>
<body>
	<header>
		<?php 
		var_dump($_SESSION);
		var_dump($_COOKIE);
		var_dump($_SERVER);
		// echo session_id();
		// echo 'localIP - '.getHostByName(getHostName());
		// $location = file_get_contents('http://api.ipstack.com/93.175.229.62?access_key=e6a50f41ead61fe5878415fdce026f28');
		// print_r($location);
		
		$logged_in = logged_in() || isCookieValid();
			if ($logged_in) {
				echo '<h1>Hello '.$_SESSION["username"].'</h1>';
			} else {
				echo '<h1>Hello World</h1>';
			} ?>
	</header>
	<main>
		<div class="menu">
			<a href="index.php">Home page</a>
			<?php 
			if ($logged_in) {
				echo '<a href="logout.php">Logout</a>';
			} else {
				echo '<a href="signup.php">Register</a><a href="login.php">Login</a>';
			} ?>
          </div>
          <div class="main">