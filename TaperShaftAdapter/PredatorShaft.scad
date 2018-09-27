/*
Shaft Diameter 	3/4 in. / 19.1 mm
Shaft length (in.) 	2.43 in. / 61.7 mm
Keyway 	3/16 in. / 4.76 mm
https://www.harborfreight.com/65-hp-212cc-ohv-horizontal-shaft-gas-engine-epa-69730.html

*/
$fn=50;
diameter=19.1;
length=61.7;
keyway=4.76;

translate([0, 0, length/2]) 
{
difference()
    {
color("blue")
cylinder(h=length, d=diameter, center=true);

color("red")
translate([diameter/2, 0, 0])
cube([keyway, keyway, length*1.1], center=true);
}
}

translate([0, diameter*1.1, length/2]) 
{
union()
    {
color("blue")
cylinder(h=length, d=diameter, center=true);

color("red")
translate([diameter/2, 0, 0])
cube([keyway, keyway, length ], center=true);
}
}