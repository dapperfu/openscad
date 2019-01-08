mount_edge = 45;

gantry_edge = 45;
laser_edge = 40;
laser_mount_hole=8;
mount_height = 70;
mount_thickness = 5;

translate( v = [0,
                0,
                0] ) {
    cube(
        [mount_edge,
        mount_edge,
        mount_height,
        ],
        center=false);
}

color("red") {
    translate( v = [mount_thickness,
                    mount_thickness,
                    0] ) {
        cube(
            [gantry_edge,
            laser_edge,
            mount_height,
            ],
            center=false);
    }
}

translate([0,0,20]) {
    color("red")
    rotate([0,90,0]) {
        hull() {
            translate([15,0,0]) 
                cylinder(h=20,d=10,center=false);
            cylinder(h=20,d=10,center=false);
        }
    }
}
/*
translate( v = [0,
                0,
                0] ) {
    cube(
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