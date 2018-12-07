<?php 
require_once("session.php");
require_once("db_connection.php");
require_once("functions.php");
require_once("validation_functions.php");

if(isset($_POST)) {
  if (empty($errors)) {
     $email = $_POST["email"];
     $password = $_POST["password"];
     $remember = isset($_POST["remember"]) ? $_POST["remember"] : "";

     $found_user = attempt_login($email, $password);

    if ($found_user) {
      if ($found_user['activated'] === '1') {
        // Success
      $_SESSION["user_id"] = $found_user["id"];
      $_SESSION["username"] = $found_user["username"];
      if ($remember === "yes") {
        rememberMe($found_user["id"]);
      }
      redirect_to("../../index.html");
    } else {
      echo '<p>Your account is not activated.</p><p>Please check your mailbox to complete registration and activate your account!</p>';
    }
  } else {
      // Failure
      $_SESSION["message"] = "E-mail/password not found.";
      echo '<h3>Login failed!</h3><p>E-mail/password not found.</p>';
    }
  }
} else { }
  ?>