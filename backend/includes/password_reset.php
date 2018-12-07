<?php
include_once('top.php');
if(isset($_POST['passresetbtn'])) {
  if (empty($errors)) {
     $hashed_password = password_encrypt($_POST["new-pass"]);
     if(isset($_GET['id'])) {
      $encoded_id = $_GET['id'];
      $decoded_id = base64_decode($encoded_id);
      $user_id = explode('encodeduserid', $decoded_id)[1];

      $find_user_query = find_user_by_id($user_id);
      if (!$find_user_query) {
      $_SESSION["message"] = "Password reset failed. Id not found";
        echo '<div class="verification-respond" style="text-align: center"><p>Password reset failed. Your id wasn\'t found.</p></div>';
      } else {
        $query  = "UPDATE users SET password='{$hashed_password}', date_updated=now() where id={$user_id}";
        $result = mysqli_query($connection, $query);
        echo $result ? "Your password is changed. Please <a href=\"login.php\">Login</a> to enter your personal account." : "Your password hasn't been changed. Please try again or apply to our support center.";
      }
    }
  }
} ?>
  <p>Please insert your new password:</p>
  <form method = 'post' action='' name='pass-reset'>
    <p>New password <input type='password' name='new-pass' placeholder='new password' required pattern="^\S*(?=\S{8,})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])\S*$" title="Password must contain at least 1 number, 1 uppercase and 1 lower case character and be at least 6 characters long."/><span class="regis-form-hint">Password must contain at least 1 number, 1 uppercase, 1 lower case character and be at least 6 characters long</span></p>
    <!-- <p><label>Confirm new password <input type='password' name='new-pass' placeholder='new password' required/></label></p> -->
    <input type="submit" name="passresetbtn" value="Change password" />
  </form>
<?php include_once('bottom.php'); ?>