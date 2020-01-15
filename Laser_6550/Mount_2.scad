$fn=12;

/*
# General Parameters
*/

mount_height = 100;

/*
# Gantry Edge Parameters

The side that is towards the gantry.
*/
gantry_edge_color = "blue";
//gantry_length = 25;
gantry_thickness = 5; 

gantry_mount_hole=3.4;

gantry_length = 25; //gantry_mount_hole*8;

/*
# Laser Edge Parameters


The side that is towards the Laser Module..
*/
laser_edge_color = "red";
laser_length = 50;
laser_thickness = 5; 
laser_mount_hole=8;

// = 55;
// = 47;

union()
{

difference() 
{
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

translate([0, laser_length/2*1.01, laser_mount_hole/2+mount_height*.25/2]) {
    color("green")
    rotate([90,-90,90]) {
        hull() {
            translate([mount_height*.75-laser_mount_hole,0,0]) 
                cylinder(h=laser_thickness*1.1,d=laser_mount_hole,center=false);
            cylinder(h=laser_thickness*1.1,d=laser_mount_hole,center=false);
        }
    }
}



}


difference()
{
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

union()
{
translate([gantry_length/2, gantry_thickness, gantry_mount_hole/2+mount_height*.25/2]) {
    color("green")
    rotate([90,-90,0]) {
        hull() {
            translate([mount_height*.75-gantry_mount_hole,0,0]) 
                cylinder(h=gantry_thickness,d=gantry_mount_hole,center=false);
            cylinder(h=gantry_thickness,d=gantry_mount_hole,center=false);
        }
    }
}
translate([gantry_length/2, gantry_thickness*1.01,gantry_mount_hole/2+mount_height*.25/2]) {
    color("red")
    rotate([90,-90,0]) {
        hull() {
            translate([mount_height*.75-gantry_mount_hole,0,0]) 
                cylinder(h=gantry_thickness/2,d=3*gantry_mount_hole,center=false);
            cylinder(h=gantry_thickness/2,d=3*gantry_mount_hole,center=false);
        }
    }
}
}
}
}