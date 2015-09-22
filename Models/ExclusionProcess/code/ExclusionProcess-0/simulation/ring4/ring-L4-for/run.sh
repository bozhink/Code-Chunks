#!/bin/bash
line="###################################################"

bin=./build/ring41
out=./data/ring-l4-n1.txt

$bin 0.0 >  $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 0.1 >> $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 0.5 >> $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 0.8 >> $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 1.0 >> $out




bin=./build/ring42
out=./data/ring-l4-n2.txt

$bin 0.0 >  $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 0.1 >> $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 0.5 >> $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 0.8 >> $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 1.0 >> $out





bin=./build/ring43
out=./data/ring-l4-n3.txt

$bin 0.0 >  $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 0.1 >> $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 0.5 >> $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 0.8 >> $out && printf "\n\n\n%s\n\n\n" $line >> $out
$bin 1.0 >> $out
