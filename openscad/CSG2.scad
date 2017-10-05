// CSG.scad - Basic example of CSG usage

translate([-20,0,0]) {
intersection() {
    cube(15, center=true);
    sphere(10);
}
}

translate([20,0,15/2]) {
    difference() {
        cube(15, center=true);
        sphere(10);
    }
}

linear_extrude(height = 10, center = false, convexity = 10)
translate([2, 0, 0])
square(size = [10, 10], center = true);