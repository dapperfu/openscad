// Peugeot Daman U'Select S&P shakers
// shaker_radius = 64.8/2;

// Peugeot OUESSANT
shaker_radius = 50;

shaker_offset=2;
shaker_separation=7.5;

hole_depth = 10;
plate_thickness = 2.5;

height = 1;
length = 50;
width = 10;

$fn=100;

radius=5;


//translate(v=[radius, radius, radius]) {
//minkowski()
//{
//    cube(size=[shaker_radius-2*radius,
//               shaker_radius-2*radius,
//               hole_depth+plate_thickness], center=false);
//               
//    // Using a sphere is possible, but will kill performance
//    sphere(
//        r=radius,
//        center=false
//    );
//};
//}

minkowski() {
          
cylinder(
    r=10,
    h=20,
    center=false
);
    t
translate(v=[10, 0, 0]) {
sphere(
    radius=2,
    center=false
);
}
  
}
                   
        // Using a sphere is possible, but will kill performance
//        sphere(
//            r=radius,
//            center=false
//        );
//    };
//}

//difference() {
//hull() {
//cylinder(
//    r=shaker_radius+shaker_offset+shaker_separation,
//    h=hole_depth+plate_thickness,
//    center=false
//);
//translate(v=[2*(shaker_radius+shaker_offset)+shaker_separation, 0, 0]) {
//cylinder(
//    r=shaker_radius+shaker_offset+shaker_separation,
//    h=hole_depth+plate_thickness,
//    center=false
//);
//}
//}
    
//    
//    
//translate(v=[0, 0, plate_thickness+0.01]) {
//color("red") {
//cylinder(
//    r=shaker_radius+shaker_offset,
//    h=hole_depth,
//    center=false
//);
//}
//
//color("blue") {
//translate(v=[2*(shaker_radius+shaker_offset)+shaker_separation, 0, 0]) {
//cylinder(
//    r=shaker_radius+shaker_offset,
//    h=hole_depth,
//    center=false
//);
//}
//}
//}
