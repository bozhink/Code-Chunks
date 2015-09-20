#!/usr/bin/perl

open(INPUT, "<perlre.pl");

while (<INPUT>) {
  $_ = <INPUT>;
  print "s/<\/?[^>]*?>//";
}
close(INPUT);
