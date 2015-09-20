#!/usr/perl
    $fmt1 = '(?<y>\d\d\d\d)-(?<m>\d\d)-(?<d>\d\d)';
    $fmt2 = '(?<m>\d\d)/(?<d>\d\d)/(?<y>\d\d\d\d)';
    $fmt3 = '(?<d>\d\d)\.(?<m>\d\d)\.(?<y>\d\d\d\d)';
    for my $d qw( 2006-10-21 15.01.2007 10/31/2005 ){
        if ( $d =~ m{$fmt1|$fmt2|$fmt3} ){
            print "day=$+{d} month=$+{m} year=$+{y}\n";
        }
    }
