$fn=10;

height = 10;
webbing_thickness = 7.2;
hole_edge = 20;
retainer_edge = 42;

socket_diameter= 25;
hole_diameter = 10;
//
//cylinder(d=hole_diameter, h=20);
//cylinder(d=socket_diameter, h=7.5);

union() {
union() {
    cube([hole_edge,hole_edge,height], center=true);
    translate([0, 0, height]) {
        cube([retainer_edge,retainer_edge,height], center=true);
    }
}

    
color("red") {
    union() {
        translate([0, 0, height]) {
            cylinder(d=hole_edge, h=height+0.1, center=true);
        }
        cylinder(d=hole_diameter, h=50, center=true);
    }
}
}