
$fn=12;
mount_edge = 45;
laser_edge = 40;
gantry_mount_hole=3.4;
laser_mount_hole=8;
mount_height = 70;
mount_thickness = 5;

x = 55;
y=47;
module mount_cube ( ) { 
    cube(
    [mount_edge,
    mount_edge,
    mount_height,
    ],
    center=false);
}

//difference()
{
translate( v = [0,
                0,
                0] ) {
    mount_cube();
}
translate( v = [mount_thickness,
                    mount_thickness,
                    0] ) {
                        color("red") {

        mount_cube();
    }
}



translate([0,mount_edge-laser_edge/2,mount_height*.9]) {
    color("red")
    rotate([0,90,0]) {
        hull() {
            translate([mount_height*.75,0,0]) 
                cylinder(h=mount_thickness,d=laser_mount_hole,center=false);
            cylinder(h=mount_thickness,d=laser_mount_hole,center=false);
        }
    }
}


translate([mount_edge-laser_edge/2-gantry_mount_hole
, 0,mount_height*.75]) {
    color("blue")
    rotate([0,90,90]) {
        hull() {
            translate([20,0,0]) 
                cylinder(h=mount_thickness,d=gantry_mount_hole,center=false);
            cylinder(h=mount_thickness,d=gantry_mount_hole,center=false);
        }
    }
}
}
/*
translate( v = [0,
                0,
                0] ) {
    cube(2
        [pillars,
        pillars,
        edge,
        ],
        center=false);
}

translate( v = [edge - pillars,
                edge - pillars,
                0] ) {
    cube(
        [pillars,
        pillars,
        edge,
        ],
        center=false);
}

translate( v = [0,
                edge - pillars,
                0] ) {
    cube(
        [pillars,
        pillars,
        edge,
        ],
        center=false);
}

translate( v = [edge - pillars,
                0,
                0] ) {
    cube(
        [pillars,
        pillars,
        edge,
        ],
        center=false);
}

// Top
translate( v = [0,
                0, 
                edge - pillars] ) {
    cube(
        [edge,
        edge,
        pillars,
        ],
        center=false);
}
*/