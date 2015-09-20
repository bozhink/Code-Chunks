difference(){
cube(size=30,center=true);
cylinder(h=40,r=10,center=true);
rotate([0,90,0]) cylinder(h=40,r=10,center=true);
translate([12,10,0]) sphere(r=8);
translate([-10,10,0]) sphere(r=10);
}