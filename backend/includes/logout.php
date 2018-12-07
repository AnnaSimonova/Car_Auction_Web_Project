<?php require_once("backend/includes/session.php"); ?>
<?php require_once("backend/includes/functions.php"); ?>

<?php
$_SESSION["user_id"] = null;
$_SESSION["username"] = null;

if(isset($_COOKIE["rememberUserCookie"])) {
  unset($_COOKIE["rememberUserCookie"]);
  setCookie("rememberUserCookie", null, -1, "/");
}
session_destroy();
redirect_to("index.php");
?>