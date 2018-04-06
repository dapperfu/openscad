$fn=100;

height = 10;
webbing_thickness = 7.2;
hole_edge = 24;

washer_id = 8.5;
washer_od = 16;

clip_width = 1.50*washer_od;
clip_len = 4*webbing_thickness+hole_edge;

clip_pts = [
    [0,0],
    [webbing_thickness, 0],
    [webbing_thickness, height],
    [webbing_thickness+webbing_thickness, height],
    [webbing_thickness+webbing_thickness, 0],
    [2*webbing_thickness+hole_edge, 0],
    [2*webbing_thickness+hole_edge, height],
    [3*webbing_thickness+hole_edge, height],
    [3*webbing_thickness+hole_edge, 0],
    [4*webbing_thickness+hole_edge, 0],
    [4*webbing_thickness+hole_edge, 2*height],
    [0, 2*height],
 ];

difference() {    
    linear_extrude(height = clip_width)
    {
        polygon(points = clip_pts);
    }
    color("red") {
        translate([clip_len/2, 2*height+0.1, clip_width/2]) {
            rotate([90, 0, 0]) {
                union()
                {
                    cylinder(d=washer_id, h=2*height+0.2, center=false);
                    cylinder(d=washer_od, h=height, center=false);
                }
            }
        }
    }
}
