<?php
require_once("backend/includes/session.php");
require_once("backend/includes/db_connection.php");
require_once("backend/includes/functions.php");
require_once("backend/includes/validation_functions.php");
require_once("backend/includes/swiftmailer/swift_required.php");
include 'top.php'; 

if(isset($_GET['id'])) {
  $encoded_id = $_GET['id'];
  $decoded_id = base64_decode($encoded_id);
  $user_id = explode('encodeuserid', $decoded_id)[1];

  $find_user_query = find_user_by_id($user_id);
  $check_email_activation = find_user_by_id($user_id, 1);
  mysqli_query($connection, "SELECT id FROM users WHERE id='{$user_id}' and activated=1");
  if (!$find_user_query) {
    $_SESSION["message"] = "Email verification failed. Id not found";
    echo '<div class="verification-respond" style="text-align: center"><p>Your E-mail is not registered. Please fill in <a href="signup.php">Registration form</a>.</p></div>';
  } elseif ($check_email_activation) {
    $_SESSION["message"] = "This e-mail has already been activated.";
    echo '<div class="verification-respond" style="text-align: center"><p>This e-mail has already been activated.</p><p>Please <a href="login.php">Login</a> to enter your personal account.</p></div>';
  } else {
    $query  = "UPDATE users SET activated=1, date_updated=now() where id={$user_id} and activated=0";
    $result = mysqli_query($connection, $query);
    $_SESSION["message"] = "User with id ".$user_id." activated.";
    echo '<div class="verification-respond" style="text-align: center"><h3>Congratulations!</h3><p>Your e-mail address has been verified.</p><p>Please <a href="login.php">Login</a> to enter your personal account.</p></div>';
  }
}
include 'bottom.php'; ?>       