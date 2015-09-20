#!/usr/php
<?php
     $pid = pcntl_fork();
     if ($pid)
     {
          exit (0);
     }
     // създава нова сесия, откача се от групата процеси на обвивката
     posix_setsid();
     
     while (true)
     {
          error_log ("heartbeat\n", 3, "/tmp/test.log");
          sleep(10);
     }
?>

