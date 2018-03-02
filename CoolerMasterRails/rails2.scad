// Cooler Master HD Rails
use <pin.scad>

$fn = 100;

length = 135;
width = 12.4;
height = 4.8;

hole_d = 3.9;

hole1_x = 8.2+hole_d/2;
hole2_x = hole1_x+45.3-hole_d;
hole3_x = hole1_x+105.2-hole_d;
hole_y = width/2;

fillet_r = width/4;

union()
{
color("red") {
  cube([length, width, height]);
}
color("green") {
    translate([fillet_r, fillet_r, 0]) 
    {
        cylinder(
            r=fillet_r,
            h=2*height
        );
    }
}


//pin(height, hole_d, [hole1_x, hole_y, 0]);
//pin(height, hole_d, [hole2_x, hole_y, 0]);
//pin(height, hole_d, [hole3_x, hole_y, 0]);
}