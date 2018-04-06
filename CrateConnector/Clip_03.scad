$fn=100;

height = 10;
webbing_thickness = 7.2;
hole_edge = 24;

washer_id = 9;
washer_od = 20;

clip_width = washer_od;
clip_len = 4*webbing_thickness+hole_edge;

retainer_edge = 50;

difference()
{
color("blue")
{
    translate([-height/2, 0, 0])
    {
        cube([height, retainer_edge, 1.5*washer_od], center=false);
    }
    translate([height/2, (retainer_edge-hole_edge)/2, 0])
    {
        //cube([height, hole_edge, 1.5*washer_od], center=false);
    }
    translate([height, retainer_edge/2, (1.5*washer_od)/2])
    {
        rotate([90, 0, 90])
        {
            cylinder(h=height, d = 1.5*washer_od, center=true);
        }
    }
}
color("red") 
{
    translate([-height/2-0.01, retainer_edge/2, 1.5*washer_od/2])
    {
        rotate([0, 90, 0])
        {
            union()
            {
                cylinder(d=washer_id, h=3*height, center=false);
                cylinder(d=washer_od, h=3/4*height, center=false);
            }
        }
    }
}
}




// "Original" one using extrusion
//color("green") {
//translate([0, 100, 0]) 
//{
//difference () {
//linear_extrude(1.5*washer_od) {
//    union() {
//        square([height, retainer_edge],center=true);
//        translate([height, 0, 0]) {
//            square([height, hole_edge],center=true);
//        }
//    }
//}
//}
//}
//color("red") {
//        translate([-height/2, 0, 1.1*washer_od/2]) {
//            rotate([0, 90, 0]) {
//                union()
//                {
//                    cylinder(d=washer_id, h=2*height+0.2, center=false);
//                    cylinder(d=washer_od, h=3*height/4, center=false);
//                }
//            }
//        }
//    }
