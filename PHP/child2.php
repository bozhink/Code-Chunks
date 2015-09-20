#!/usr/bin/php
<?php
     $child_pid = pcntl_fork();
     if ($child_pid == 0)
     {
          pcntl_exec("/bin/ls",array("-la"));
     }
     elseif ($child_pid != -1)
     {
          pcntl_waitpid($child_pid, $status, 0);
     }
?>

