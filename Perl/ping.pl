use Net::Ping;

$pingobject = Net::Ping->new(icmp);

if ($pingobject->ping('cpan.org')) {print "Could reach CPAN."};

$pingobject->close();
