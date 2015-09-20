<?php
  if(!isset($_POST['register'] || ($_POST['register']!='Register')))
  {
?>
ERROR
<?php
  } else {
?>
E-mail: <?php echo $_POST['email']; ?> <br />
Name:   <?php echo $_POST['first_name'].' '.$_POST['last_name']]; ?> <br />
Password: <?php echo $_POST['password']; ?> <br />
<?php
  }
?>
 