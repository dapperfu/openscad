translate([0,0,20]) {
    rotate([0,90,0]) {
        hull() {
            color("red") {
            translate([15,0,0]) 
                cylinder(h=20,d=10,center=false);
            cylinder(h=20,d=10,center=false);
            }
        }
    }
}