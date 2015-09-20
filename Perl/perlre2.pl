#!/usr/bin/perl
$_      = "!!!!";
$char   = "!";
$insert = "AAA";

s@($char)(?=$char)@$char . $insert@xeg;
print("$_\n");

