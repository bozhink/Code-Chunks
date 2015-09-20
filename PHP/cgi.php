<?php
  echo "Hello\n";
  $newfile="cgix.php";
  $content='<?php echo "Hello World!\n"; ?>';
  $c='<?php ';
  $c=$c.'class hello{';
  $c=$c.'function sayhello($n){';
  $c=$c.'for($i=0;$i<$n;$i++){echo "Hello\n";}';
  $c=$c.'}';
  $c=$c.'} ';
  $c=$c.'?>';
  $fp=fopen($newfile,'w+');    
    fwrite($fp,$content);
    fwrite($fp,$c);
  fclose($fp);
include("cgix.php");
$hi=new hello;
$hi->sayhello(30);
?>