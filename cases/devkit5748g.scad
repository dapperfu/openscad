use <devkit.scad>

// 
translate([0, 0, 0]) {
    rotate([0, 0, 0]) {
        enclosure(0);
    };
}

translate([130, 80, 3]) {
    rotate([0, 180, 0]) {
        enclosureLid(0);
    };
}