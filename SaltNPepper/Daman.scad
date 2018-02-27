// Peugeot Daman U'Select S&P shakers
// shaker_radius = 64.8/2;

// Peugeot OUESSANT
shaker_radius = 56.0/2;

shaker_offset=0.5;
shaker_separation=7.5;

hole_depth = 10;
plate_thickness = 2.5;

height = 1;
length = 50;
width = 10;

$fn=100;


difference() {
hull() {
cylinder(
    r=shaker_radius+shaker_offset+shaker_separation,
    h=hole_depth+plate_thickness,
    center=false
);
translate(v=[2*(shaker_radius+shaker_offset)+shaker_separation, 0, 0]) {
cylinder(
    r=shaker_radius+shaker_offset+shaker_separation,
    h=hole_depth+plate_thickness,
    center=false
);
}
}
    
    
    
translate(v=[0, 0, plate_thickness+0.01]) {
color("red") {
cylinder(
    r=shaker_radius+shaker_offset,
    h=hole_depth,
    center=false
);
}

color("blue") {
translate(v=[2*(shaker_radius+shaker_offset)+shaker_separation, 0, 0]) {
cylinder(
    r=shaker_radius+shaker_offset,
    h=hole_depth,
    center=false
);
}
}
}
}