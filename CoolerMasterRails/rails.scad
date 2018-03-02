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

module pin(height, hole_d, position)
{
    color("green")
    {
        translate(v = position)
        {
            union()
            {
                translate(v = [0, 0, -height]) {
                    cylinder(h=3*height,
                             d=hole_d,
                             center=false);
                }
                translate(v = [0, 0, height/2])
                {
                    cylinder(h=2*height,
                             d=2*hole_d,
                             center=false);
                }
            }
        }
    }
}

difference()
{
color("red") {
  cube([length, width, height]);
}


pin(height, hole_d, [hole1_x, hole_y, 0]);
pin(height, hole_d, [hole2_x, hole_y, 0]);
pin(height, hole_d, [hole3_x, hole_y, 0]);
}