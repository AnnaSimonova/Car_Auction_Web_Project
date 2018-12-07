<?php

function redirect_to($new_location) {
    header("Location: " . $new_location);
    exit;
}

function mysql_prep($string) {
    global $connection;

    $escaped_string = mysqli_real_escape_string($connection, $string);
    return $escaped_string;
}

function confirm_query($result_set) {
    if(!$result_set) {
        die("Database query failed.");
    }
}

function form_errors($errors=array()) {
    $output = "";
    if(!empty($errors)) {
        $output .= "<div class =\"error\">";
        $output .= "Please fix the following errors:";
        $output .= "<ul>";
        foreach($errors as $key => $error) {
            $output .= "<li>";
            $output .= htmlentities($error);
            $output .= "</li>";
        }
        $output .= "</ul>";
        $output .= "</div>";
        }
    return $output;
}

function find_all_subjects($public=true) {
    global $connection;

    $query = "SELECT * ";
    $query .= "FROM subjects ";
    if ($public) {
        $query .= "WHERE visible = 1 ";
    }
    $query .= "ORDER BY position ASC";
    $subject_set = mysqli_query($connection, $query);
    confirm_query($subject_set);
    return $subject_set;
}

function find_pages_for_subject($subject_id, $public=true) {
    global $connection;
    $safe_subject_id = mysqli_real_escape_string($connection, $subject_id);

    $query = "SELECT * ";
    $query .= "FROM pages ";
    $query .= "WHERE subject_id = {$safe_subject_id} ";
    if ($public) {
        $query .= "AND visible = 1 ";
    }
    $query .= "ORDER BY position ASC";
    $page_set = mysqli_query($connection, $query);
    confirm_query($page_set);
    return $page_set;
}

    function navigation($subject_array, $page_array) {
        $output = "<ul class=\"subjects\">";
        $subject_set = find_all_subjects(false);
        while($subject = mysqli_fetch_assoc($subject_set)) {
            $output .= "<li";
            if ($subject_array && $subject["id"] == $subject_array["id"]) {
                $output .= " class=\"selected\"";
            }
            $output .= ">";
            $output .= "<a href=\"manage_content.php?subject=";
            $output .= urlencode($subject["id"]);
            $output .= "\">";
            $output .= htmlentities($subject["menu_name"]);
            $output .= "</a>";
            
            $page_set = find_pages_for_subject($subject["id"], false);
            $output .= "<ul class=\"pages\">";
            while($page = mysqli_fetch_assoc($page_set)) {
                $output .= "<li";
                if ($page_array && $page["id"] == $page_array["id"]) {
                    $output .= " class=\"selected\"";
                }
                $output .= ">";
                $output .= "<a href=\"manage_content.php?page=";
                $output .= urlencode($page["id"]);
                $output .= "\">";
                $output .= htmlentities($page["menu_name"]);
                $output .= "</a></li>";
            }
            mysqli_free_result($page_set);
            $output .= "</ul></li>";
        }
        mysqli_free_result($subject_set);
        $output .= "</ul>";
        return $output;
    }

function navigation_by_subject($subject_id, $page_array) {
        $page_set = find_pages_for_subject($subject_id);
        $output = "<ul class=\"pages\">";
        while ($page = mysqli_fetch_assoc($page_set)) {
            $output .= "<li>";
            $output .= "<a href=\"manage_content.php?page=";
            $output .= urlencode($page["id"]);
            $output .= "\">";
            $output .= htmlentities($page["menu_name"]);
            $output .= "</a>";
            $output .= "</li>";
        }
        mysqli_free_result($page_set);
        $output .= "</ul>";

    return $output;
}

function public_navigation($subject_array, $page_array) {
    $output = "<ul class=\"subjects\">";
    $subject_set = find_all_subjects();
    while($subject = mysqli_fetch_assoc($subject_set)) { 
        $output .= "<li ";
        if ($subject_array && $subject["id"] == $subject_array["id"]) {
            $output .= "class=\"selected\"";
        }
        $output .= ">" ;
        $output .= "<a href=\"index.php?subject=";
        $output .= urlencode($subject["id"]); 
        $output .= "\">";
        $output .= htmlentities($subject["menu_name"]);
        $output .= "</a>";

        if ($subject_array["id"] == $subject["id"] || $page_array["subject_id"] == $subject["id"]) {
            $page_set = find_pages_for_subject($subject["id"]);
            $output .= "<ul class=\"pages\">";
            while($page = mysqli_fetch_assoc($page_set)){
            $output .= "<li ";
            if ($page_array && $page["id"] == $page_array["id"]) {
                $output .= "class=\"selected\"";
            } 
            $output .= ">" ;
            $output .= "<a href=\"index.php?page=";
            $output .= urlencode($page["id"]);
            $output .= "\">";
            $output .= htmlentities($page["menu_name"]);
            $output .= "</a>";
            $output .= "</li>";
        }
        $output .= "</ul>";
        mysqli_free_result($page_set);
    }
        $output .= "</li>";
    }
    mysqli_free_result($subject_set);
    $output .= "</ul>";

    return $output;
}

function find_subject_by_id ($subject_id) {
    global $connection;

    $safe_subject_id = mysqli_real_escape_string($connection, $subject_id);

    $query = "SELECT * ";
    $query .= "FROM subjects ";
    $query .= "WHERE id = {$safe_subject_id} ";
    $query .= "LIMIT 1";
    $subject_set = mysqli_query($connection, $query);
    confirm_query($subject_set);
    if ($subject = mysqli_fetch_assoc($subject_set)) {
        return $subject;
    } else {
        return null;
    }
}

function find_default_page_for_subject($subject_id) {
    $page_set = find_pages_for_subject($subject_id);
    if ($first_page = mysqli_fetch_assoc($page_set)) {
        return $first_page;
    } else {
        return null;
    }

    $safe_subject_id = mysqli_real_escape_string($connection, $subject_id, $public=true);

    $query = "SELECT * ";
    $query .= "FROM subjects ";
    $query .= "WHERE id = {$safe_subject_id} ";
    if($public) {
        $query .= "AND visible = 1 ";
    }
    $query .= "LIMIT 1";
    $subject_set = mysqli_query($connection, $query);
    confirm_query($subject_set);
    if ($subject = mysqli_fetch_assoc($subject_set)) {
        return $subject;
    } else {
        return null;
    }
}

function find_page_by_id ($page_id, $public=true) {
    global $connection;

    $safe_page_id = mysqli_real_escape_string($connection, $page_id);

    $query = "SELECT * ";
    $query .= "FROM pages ";
    $query .= "WHERE id = {$safe_page_id} ";
    if($public) {
        $query .= "AND visible = 1 ";
    }
    $query .= "LIMIT 1";
    $page_set = mysqli_query($connection, $query);
    confirm_query($page_set);
    if ($page = mysqli_fetch_assoc($page_set)) {
        return $page;
    } else {
        return null;
    }
}

function find_selected_page($public=false) {
    global $current_subject;
    global $current_page;

    if (isset($_GET["subject"])) {
        $current_subject = find_subject_by_id($_GET["subject"], $public);
        if ($current_subject && $public) {
            $current_page = find_default_page_for_subject($current_subject["id"]);
        } else {
            $current_page = null;
        }
        
    } elseif(isset($_GET["page"])) {
        $current_page = find_page_by_id($_GET["page"], $public);
        $current_subject = null;
    } else {
        $current_subject = null;
        $current_page = null;
    }
}

function find_all_admins() {
    global $connection;

    $query = "SELECT * ";
    $query .= "FROM admins ";
    $query .= "ORDER BY username ASC";
    $admin_list = mysqli_query($connection, $query);
    confirm_query($admin_list);
    return $admin_list;
}

function find_admin_by_id($admin_id) {
    global $connection;

    $safe_admin_id = mysqli_real_escape_string($connection, $admin_id);

    $query = "SELECT * ";
    $query .= "FROM admins ";
    $query .= "WHERE id = {$safe_admin_id} ";
    $query .= "LIMIT 1";
    $admin_set = mysqli_query($connection, $query);
    confirm_query($admin_set);
    if ($admin = mysqli_fetch_assoc($admin_set)) {
        return $admin;
    } else {
        return null;
    }
}

function find_user_by_email($email) {
    global $connection;

    $safe_email = mysqli_real_escape_string($connection, $email);

    $query = "SELECT * FROM users WHERE email = '{$safe_email}' LIMIT 1";
    $user_set = mysqli_query($connection, $query);
    confirm_query($user_set);
    if ($user = mysqli_fetch_assoc($user_set)) {
        return $user;
    } else {
        return null;
    }
}

function find_selected_admin() {
    global $current_admin;

    if (isset($_GET["admin"])) {
        $current_admin = find_admin_by_id($_GET["admin"]);
    } else {
        $current_admin = null;
    }
}

function password_encrypt($password) {
    $hash_format = "$2y$11$";
    $salt_length = 22;
    $salt = generate_salt($salt_length);
    $format_and_salt = $hash_format . $salt;
    $hash = crypt($password, $format_and_salt);
    return $hash;
}

function generate_salt($length) {
    $unique_random_string = md5(uniqid(mt_rand(), true));
    $base64_string = base64_encode($unique_random_string);
    $modified_base64_string = str_replace('+', '.', $base64_string);
    $salt = substr($modified_base64_string, 0, $length);

    return $salt;
}

function password_check($password, $existing_hash) {
    $hash = crypt($password, $existing_hash);
    if ($hash === $existing_hash) {
        return true;
    } else {
        return false;
    }
}

function attempt_login($email, $password) {
    $user = find_user_by_email($email);
    if ($user) {
        if (password_check($password, $user["password"])) {
            return $user;
        }
    } else {
        return false;
    }
}

function confirm_logged_in() {
    if (!isset($_SESSION['admin_id'])) {
        redirect_to("login.php");
    }
}

function logged_in() {
    return isset($_SESSION['user_id']);
}

function find_user_by_id($id, $activated = null) {
  global $connection;
  $query = "SELECT * FROM users WHERE id={$id}";
  if ($activated) {
    $query .= " and activated={$activated}";
  }
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

function rememberMe($user_id) {
    $encryptCookieData = base64_encode("fdajhsa6Sdas_S3z{$user_id}");
    setCookie("rememberUserCookie", $encryptCookieData, time()+60*60*24*100, "/");
}

function isCookieValid() {
    global $connection;

    $isValid = false;

    if(isset($_COOKIE["rememberUserCookie"])) {
        $decryptCookieData = base64_decode($_COOKIE["rememberUserCookie"]);
        $user_id = explode("fdajhsa6Sdas_S3z", $decryptCookieData);
        $userID = $user_id[1];
        $user = find_user_by_id($userID);
        if ($user) {
            $_SESSION["user_id"] = $user["id"];
            $_SESSION["username"] = $user["username"];
            $isValid = true;
        }
    } 
    return $isValid;
    // else {
    //     $isValid = false;
    //     redirect_to("logout.php");
    // }
}

function send_email($emailFrom, $emailTo, $sSubject, $sBody, $arAttach = array()) {
    if (is_array($emailTo)) {
      $emailToPrint = join(',', $emailTo);
    } else {
      $emailToPrint = $emailTo;
    }
    //Create the message
    $message = Swift_Message::newInstance()
      //Give the message a subject
      ->setSubject($sSubject)
      //Set the From address with an associative array
      ->setFrom($emailFrom)
      //Set the To addresses with an associative array
      ->setTo($emailTo)
      //Give it a body
      ->setBody($sBody, 'text/html')
      ;
    //Optionally add any attachments
    if (!empty($arAttach)) {
      $attachment = Swift_Attachment::newInstance()
        ->setFilename($arAttach['fn'])
        ->setContentType($arAttach['content_type'])
        ->setBody($arAttach['content']);
      $message->attach($attachment);
    }
    //Create the Transport
    $transport = Swift_SmtpTransport::newInstance('smtp.gmail.com', 465)
      ->setUsername('simonova.ganna@gmail.com')
      ->setPassword('@br@k@d@bR@2')
      ->setEncryption('tls');
    //Create the Mailer using your created Transport
    $mailer = Swift_Mailer::newInstance($transport);
    //Send the message
    $result = $mailer->send($message);

    return $result;
  }

  function find_session_by_field($field, $name) {
    echo $name;
  global $connection;
  $query = "SELECT * FROM sessions WHERE {$field}={$name}";
  $query_result = mysqli_query($connection, $query);
  if(!$query_result) {
        die("Database query failed.");
    }
  if ($session = mysqli_fetch_assoc($query_result)) {
        return $session;
    } else {
        return null;
    }
}
?>