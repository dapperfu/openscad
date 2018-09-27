/*
Hillman® 1-1/4" x 72" Steel Perforated Tube - 14 Gauge

Link: https://www.menards.com/main/p-1444432406788.htm
*/
thickness = 1.984375 ; /* 14 Gauge */
mm_per_inch = 25.4; 
in_to_mm = mm_per_inch;
kg_per_pound = 0.453592;


edge_en = 1.25; /* inch */
length_en = 72; /* inch */
mass_en = 7.055; /* pounds */

/* Modernize */
edge = edge_en*mm_per_inch;
length = length_en*mm_per_inch;
mass = mass_en*kg_per_pound;

hole_size = 9; /* M8 bolts */ 

echo(mass);

edge = 50;
pillars= 10;

debug=2;

module hole_cylinder() {
cylinder(
    r=hole_size/2,
    h=edge+debug,
    center=false,
    $fn=20);
   
}

module tube_unit() {
difference() {
color("red") {
cube(
    [edge,
    edge,
    edge,
    ],
    center=false);
}
color("green") {
translate([thickness, 0-debug/2, thickness]) {
    cube(
        [edge-thickness*2,
        edge+debug,
        edge-thickness*2,
        ],
        center=false);
    }
}

translate([edge/2, edge/2, 0]) {
hole_cylinder();
}

translate([0, edge/2, edge/2]) {
rotate(a = [0, 90, 0]) { 
hole_cylinder();
}
}
}
}


tube_unit();

union() {
for(variable = [0 : edge : 72*in_to_mm]) {
    translate([0, variable, 0]) {
    tube_unit();
}
}
}