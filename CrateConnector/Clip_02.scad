$fn=100;

height = 10;
webbing_thickness = 7.2;
hole_edge = 24;

washer_id = 9;
washer_od = 20;

clip_width = washer_od;
clip_len = 4*webbing_thickness+hole_edge;

retainer_edge = 42;

difference () {
linear_extrude(1.1*washer_od) {
    union() {
        square([height, retainer_edge],center=true);
        translate([height, 0, 0]) {
            square([height, hole_edge],center=true);
        }
    }
}
color("red") {
        translate([-height/2, 0, 1.1*washer_od/2]) {
            rotate([0, 90, 0]) {
                union()
                {
                    cylinder(d=washer_id, h=2*height+0.2, center=false);
                    cylinder(d=washer_od, h=3*height/4, center=false);
                }
            }
        }
    }
}
