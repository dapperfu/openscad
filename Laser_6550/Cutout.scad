color("red") {
    rotate([0,90,0]) {
        cube([10, 10, 10], center=true)
    }
}


/*
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
*/