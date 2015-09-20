use Astro::Coord::ECI;
use Astro::Coord::ECI::Sun;
use Astro::Coord::ECI::Utils qw(deg2rad);

# 1600 Pennsylvania Ave, Washington DC USA
# latitude 38.899 N, lingitude 77.038 W,
# altitude 16.88 meters above sea level
my $lat=deg2rad(38.899); # Radians
my $long=deg2rad(-77.038); # Radians
my $alt=16.68/1000; # Kilometers
my $sum=Astro::Coord::ECI::Sun->new();
my $sta=Astro::Coord::ECI->universal(time())->geodetic($lat,$long,$alt);
my ($time,$rise)=$sta->next_elevation($sun);
print "Sun @{[$rise ? 'rise' : 'set']} is",
scalar localtime $time,"
";

