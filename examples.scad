difference() {
cube(30, center=true);
sphere(20);
}
translate([0,0,30]){
cylinder(h=40,r=10);
}

translate([0,5,0]){
cube(size=[2,3,4], center=false);
translate([3,0,0]){
cube([2,3,4]);
}
}

color([1,0,0]) cube([2,3,4]);
translate([3,0,0])
color([0,1,0]) cube([2,3,4]);
translate([6,0,0])
color([0,0,1]) cube([2,3,4]);

// this will create a high resolution sphere with a 2mm radius
translate([-2,-5,0]) color("red") sphere(r=1, $fn=100);
// will also create a 2mm high resolution sphere but this one 
// does not have as many small triangles on the poles of the sphere
translate([0,-5,0]) color("cyan")
intersection_for(n=[1:6]) {
rotate([0,0,n*60])
{
translate([0.5,0,0])
sphere(1, $fa=5, $fs=0.1);
}
}


translate([30,0,-15]){
polyhedron
    (points = [
	       [0, -10, 60], [0, 10, 60], [0, 10, 0], [0, -10, 0], [60, -10, 60], [60, 10, 60], 
	       [10, -10, 50], [10, 10, 50], [10, 10, 30], [10, -10, 30], [30, -10, 50], [30, 10, 50]
	       ], 
     faces = [
		  [0,3,2],  [0,2,1],  [4,0,5],  [5,0,1],  [5,2,4],  [4,2,3],
                  [6,8,9],  [6,7,8],  [6,10,11],[6,11,7], [10,8,11],
		  [10,9,8], [3,0,9],  [9,0,6],  [10,6, 0],[0,4,10],
                  [3,9,10], [3,10,4], [1,7,11], [1,11,5], [1,8,7],  
                  [2,8,1],  [8,2,11], [5,11,2]
		  ]
     );
}

echo("The quick brown fox \tjumps \"over\" the lazy dog.\rThe quick brown fox.\nThe \\lazy\\ dog.");

translate([-30,0,0]) {
for (z = [-1, 1]) // two iterations, z = -1, z = 1
{
    translate([0, 0, z])
    color("red") cube(size = 1, center = false);
}
for ( i = [0 : 5] )
{
    rotate( i * 360 / 6, [1, 0, 0])
    translate([0, 10, 0])
    color("green") sphere(r = 1);
}
// Note: The middle parameter in the range designation 
// ('0.2' in this case) is the 'increment-by' value
// Warning: Depending on the 'increment-by' value, the
// real end value may be smaller than the given one.
translate([-5,0,0]){
for ( i = [0 : 0.2 : 6] )
{
    rotate( i * 360 / 6, [1, 0, 0])
    translate([0, 10, 0])
    color("brown") sphere(r = 1);
}
}
translate([-9,0,0]) rotate([0,90,0])
cylinder(h=15,r1=10,r2=5,center=true);
}

translate([-60,0,0]){
for(i = [ [  0,  0,   0],
          [ 10, 20, 300],
          [200, 40,  57],
          [ 20, 88,  57] ])
{
    rotate(i)
    cube([10, 2, 2], center = true);
}
}

translate([0,100,0]){
 for(i = [ [ 0,  0,  0],
           [10, 12, 10],
           [20, 24, 20],
           [30, 36, 30],
           [20, 48, 40],
           [10, 60, 50] ])
{
    translate(i)
    cube([50, 15, 10], center = true);
}
}

translate([-100,-100,0]){
for(i=[0:36])
    translate([i*10,0,0])
       cylinder(r=5,h=cos(i*10)*50+60);
}


translate([0,0,-100]){
for(i=[0:36]) {
   for(j=[0:36]) {
     color( [0.5+sin(10*i)/2, 0.5+sin(10*j)/2, 0.5+sin(10*(i+j))/2] )
     translate( [i, j, 0] )
     cube( size = [1, 1, 11+10*cos(10*i)*sin(10*j)] );
   }
 }
}
