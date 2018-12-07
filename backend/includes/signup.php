<?php 
require_once("session.php");
require_once("db_connection.php");
require_once("functions.php");
require_once("validation_functions.php");
require_once("swiftmailer/swift_required.php");


if(isset($_POST)) {
  var_dump($_POST);
  $_SESSION['email'] = $_POST["email"];
  $_SESSION['username'] = $_POST["username"];

  if (empty($errors)) {
    // Perform Create
    $email = mysql_prep($_POST["email"]);
    $username = mysql_prep($_POST["username"]);
    $hashed_password = password_encrypt($_POST["password"]);

    if (!find_user_by_email($email)) {
      $query  = "INSERT INTO users (username, email, password, date_added, activated, date_updated) VALUES ('{$username}', '{$email}', '{$hashed_password}', now(), '0', now())";
      $result = mysqli_query($connection, $query);

      if ($result) {
        $user_id = find_user_by_field('email', $email)["id"];
        $encoded_id = base64_encode("encodeuserid".$user_id);
        $mail_body = '<html><body><p>Dear '.$username.'!</p><p>Thank you for your registration on <a href="https://carbid.info">carbid.info</a>.</p><p>Please confirm your e-mail address to complete registration.</p><p><a href="http://php72.nginx.localhost/Carfax/backend/includes/activate.php?id='.$encoded_id.'">Confirm e-mail</a></p></body></html>';
        $mail_subject = 'Activation email';
        send_email('simonova.ganna@gmail.com', $email, $mail_subject, $mail_body);

        // Success
        $_SESSION["message"] = "New user created."; 
        redirect_to('../../index.html');
        ?>
        <script>
      let str = '<h3>Registration successful!</h3><p>Please check your mailbox to complete registration and activate your account!</p>';
      popUp(str, '../../index.html');
    </script>
    <?php
    
      } else {
        // Failure
        $_SESSION["message"] = "New user creation failed.";
        redirect_to('../../index.html');
        ?>
    <script>
      var str = '<h3>Registration failed!</h3><p>Please try again in several minutes and if unsuccessful again please apply to our support center.</p>';
      popUp(str, '../../index.html');
    </script>
    <?php
      }
    } else { 
      redirect_to('../../index.html');?>
    <script>
      var str = '<h3>This email is already registered!</h3><p>Please Login to enter your personal account.</p>';
      popUp(str, '../../index.html');
    </script>
    <?php }
    
  }
} ?>
          
          