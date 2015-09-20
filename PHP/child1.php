#!/usr/bin/php
<?php
     $child_pid = pcntl_fork();
     if ($child_pid == -1) {
        die ("pcntl_fork() failed: $pph_errorstr");
     } else if ($child_pid) {
        printf("I am the parent, my pid is %d and mw child's pid id %d.\n", posix_getpid(),$child_pid);
     } else {
        printf ("I am the child, my pid is %d.\n",posix_getpid());
     }
?>
