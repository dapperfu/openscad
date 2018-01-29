rotate([0,0,180]) difference(){
    cube([20,20,20],center=true);
    difference(){
        union(){
            translate([0,9.005,0]) rotate([0,55,0]) cube([16,2.01,2],center=true);
            translate([0,9.005,0]) rotate([0,-55,0]) cube([16,2.01,2],center=true);
        }
        translate([0,8.5,7]) rotate([0,0,0]) cube([16,3.5,2],center=true);
        translate([0,8.5,-7]) rotate([0,0,0]) cube([16,3.5,2],center=true);
    }
    rotate([0,0,90]) difference(){
        union(){
            translate([0,9.005,0]) rotate([0,55,0]) cube([16,2.01,2],center=true);
            translate([0,9.005,0]) rotate([0,-55,0]) cube([16,2.01,2],center=true);
        }
        translate([0,8.5,7]) rotate([0,0,0]) cube([16,3.5,2],center=true);
        translate([0,8.5,-4]) rotate([0,0,0]) cube([16,3.5,8],center=true);
    }
    translate([-9,0,-2.9]) cube([2,2.45,6.2],center=true);
    
    rotate([90,0,0]) intersection(){
        translate([0,9.005,0]) cube([11,2.01,12],center=true);
        union(){
            translate([0,9.005,5]) cube([11,2.01,2],center=true);
            translate([0,9.005,-5]) cube([11,2.01,2],center=true);
            translate([0,9.005,0]) rotate([0,45,0]) cube([16,2.01,2],center=true);
        }
    }
}