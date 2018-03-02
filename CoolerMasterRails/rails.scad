// Cooler Master HD Rails

$fn = 100;

length = 135;
width = 12.4;
height = 4.8;

hole_d = 3.9;

hole1_x = 8.2+hole_d/2;
hole2_x = hole1_x+45.3-hole_d;
hole3_x = hole1_x+105.2-hole_d;
hole_y = width/2;

//difference()
{
color("red") {
    cube([length, width, height]);
}
{

module (height, hole_d, location) {
    color("blue")
    {
        translate(v = [0, 0, 0])
        {
            union()
            {
                cylinder(h=height,
                         d=hole_d,
                         center=false);
                translate(v = [0, 0, height/2])
                {
                    cylinder(h=height,
                             d=2*hole_d,
                             center=false);
                }
            }
        }
    }
}

translate(v = [hole1_x, hole_y, 0]) {
cylinder(h=3*height,
         d=hole_d,
         center=true);
}
translate(v = [hole2_x, hole_y, 0]) {
cylinder(h=3*height,
         d=hole_d,
         center=true);
}
translate(v = [hole3_x, hole_y, 0]) {
cylinder(h=3*height,
         d=hole_d,
         center=true);
}
}
}