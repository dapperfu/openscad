$fn=12;

/*
# General Parameters
*/

mount_height = 70;

/*
# Gantry Edge Parameters

The side that is towards the gantry.
*/
gantry_edge_color = "blue";
gantry_length = 40;
gantry_thickness = 5; 

gantry_mount_hole=3.4;



/*
# Laser Edge Parameters


The side that is towards the Laser Module..
*/
laser_edge_color = "red";
laser_length = 40;
laser_thickness = 5; 
laser_mount_hole=8;

// = 55;
// = 47;


color(gantry_edge_color)
{
    cube(
        [gantry_length,
        gantry_thickness,
        mount_height,
        ],
        center=false
    );
};


difference() {
    
color(laser_edge_color)
{
    cube(
        [
        laser_thickness,
        laser_length,
        mount_height,
        ],
        center=false
    );
}

union() {
translate([0, gantry_length/2,gantry_mount_hole/2+mount_height*.25/2]) {
    color("green")
    rotate([90,-90,90]) {
        hull() {
            translate([mount_height*.75-gantry_mount_hole,0,0]) 
                cylinder(h=gantry_thickness,d=gantry_mount_hole,center=false);
            cylinder(h=gantry_thickness,d=gantry_mount_hole,center=false);
        }
    }
}
translate([gantry_thickness/2*1.01, gantry_length/2,gantry_mount_hole/2+mount_height*.25/2]) {
    color("blue")
    rotate([90,-90,90]) {
        hull() {
            translate([mount_height*.75-gantry_mount_hole,0,0]) 
                cylinder(h=gantry_thickness/2,d=2*gantry_mount_hole,center=false);
            cylinder(h=gantry_thickness/2,d=2*gantry_mount_hole,center=false);
        }
    }
}
}
}


/*
module mount_cube ( ) { 
    cube(
    [mount_edge,
    mount_edge,
    mount_height,
    ],
    center=false);
}
*/

//difference()


/*
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