gantry_edge = 45;
laser_edge = 40;
laser_mount_hole=8;
mount_height = 70;
mount_thickness = 5;

translate( v = [0,
                0,
                0] ) {
    cube(
        [gantry_edge,
        laser_edge+mount_thickness,
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