edge = 50;
pillars= 10;


difference () {
cube(
    [edge,
    edge,
    pillars,
    ],
    center=false);
    
    
color("blue") {
translate( v = [edge/2, edge /2, -edge/2] ) {
cylinder(
r=pillars,
h=edge,
center=false,
$fn=100);
}
}
}
    
cube(
    [pillars,
    pillars,
    edge,
    ],
    center=false);
    
translate( v = [edge - pillars, edge - pillars, 0] ) {
translate( v = [pillars/2,pillars/2,0] ) {
    cylinder(
    r=pillars/2,
    h=edge,
    center=false,
    $fn=100);
}
}

translate( v = [0, edge - pillars, 0] ) {
    cube(
    [pillars,
    pillars,
    edge,
    ],
    center=false);
}

translate( v = [edge - pillars, 0, 0] ) {
translate([pillars/2, pillars/2, 0]) {
rotate([0, 0, 45]) {
translate([-pillars/2, -pillars/2, 0]) {
    cube(
        [pillars,
        pillars,
        edge*0.5,
        ],
        center=false);
}
}
}
}

translate( v = [edge - pillars, edge - pillars, 0] ) {
    translate( v = [pillars/2,pillars/2,0] ) {
        cylinder(
            r=pillars/2,
            h=edge,
            center=false,
            $fn=100
        );
    }
}
