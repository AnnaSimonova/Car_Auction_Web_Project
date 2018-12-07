<?php
include_once('top.php');
if(isset($_POST['send-request'])) {
  if (empty($errors)) {
     $email = $_POST["email"];
     
     $user = find_user_by_email($email);

    if ($user) {
      $user_id = $user["id"];
      $encoded_id = base64_encode("encodeduserid".$user_id);
      $username = $user["username"];
      $mail_body = '<html><body><p>Dear '.$username.'!</p><p>Password reset request for your account was sent. Please follow this <a href="http://php72.nginx.localhost/Carfax/password_reset.php?id='.$encoded_id.'">link</a> to reset your password.</p><p>If you didn\'t send this request, please ignore this message.</p></body></html>';
      $mail_subject = 'Password reset email';
      send_email('simonova.ganna@gmail.com', $email, $mail_subject, $mail_body);
      // $_SESSION["message"] = "New user created.";
      echo '<h3>Password reset link is sent!</h3><p>Please check your mailbox to reset your password!</p>';
    } else {
      echo '<p>Unfortunately, this e-mail is not registered.</p>';
    }
  }
}  
  ?>
  <p>To request password reset link please fill in your e-mail address in the form below:</p>
  <form method = 'post' action='#' name='send-request'>
    <p><label>E-mail <input type='email' name='email' placeholder='email' required/></label></p>
    <input type="submit" name="send-request" value="Send request" />
  </form>
<?php 
include_once('bottom.php'); ?>
