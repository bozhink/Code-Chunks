<?php
  class connection{
	  var $my_connection;
	  function connect(){
		  $ini_array=parse_ini_file("config.ini");
		  $base=$ini_array["db"];
		  $host=$ini_array["host"];
		  $user=$ini_array["user"];
		  $pass=$ini_array["password"];
		  $port=$ini_array["port"];
		  
		  $this->my_connection=mysql_connection($host.':'.$port,$user,$pass) or die ("Could not connect: ".mysql_error());
		  mysql_select_db($base);
		  mysql_query("SET NAMES 'cp1251'");
	  }
      function disconnect(){
	      mysql_close($this->my_connection);
      }
  }
?>