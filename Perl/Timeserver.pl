#!/usr/bin/perl  -T
#Usage: timeserver [port number]

use strict;
use warnings;
$port=9876;
$AF_INET=2;
$SOCK_STREAM = 1;
$sockaddr = 'S n a4 x8';
($name,$aliases,$proto)=getprotobyname('tcp');
if($port !~ /^\d+$/){
    ($name, $aliases, $port)=getservbyport($port,'tcp');
}

print "Port = $port\n";

$this = pack($sockaddr, $AF_INET, $port, "\0\0\0\0");
select(COMM_SOCK); $| = 1; select (STDOUT);
socket(R_SOCKET, $AF_INET, $SOCK_STREAM, $proto ) ||die "socket: $!\n";
bind(R_SOCKET, $this) || die "bind: $!\n";
listen(R_SOCKET, 5) || die "connect: $!\n";

while(1){
     accept(COMM_SOCK, R_SOCKET) || die "$!\n";
     $now = time;
     print COMM_SOCK $now;
}
