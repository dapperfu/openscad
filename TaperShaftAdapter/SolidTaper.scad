/*

Adapter for a leaf blower with a blown motor.

Leaf blower fan (and old motor) had a tapered shaft.

New motor has a straight shaft.

New Motor: Harbor Freight Predator 212cc
Old Motor: Coleman 10HP Tecumseh
Blower: 880A http://www.mackissic.com/Leaf%20Blowers.html

*/
$fn=12;
diameter=19.1;
length=61.7;
keyway=4.76;

color("blue")
cylinder(h=length, d1=diameter, d2=diameter*.65, center=true);
/*
translate([0, 0, -length*.99])
cylinder(h=length, d=diameter, center=true);
*/

translate([0, 50 , 0]) {
color("blue")
cylinder(h=length, d=diameter, center=true);

color("red")
translate([diameter/2, 0, 0])
cube([keyway, keyway, length], center=true);
}

/*
rotate_extrude(convexity = 10) {
    translate([2, 0, 0]) {
        circle(r = 1);
    }
}
*/

/*
hole_radius=5;
big_radius=10;
taper_radius=20;

rotate_extrude()
{
polygon(
    points = [
        [hole_radius, 0],
        [big_radius, 0],
        [taper_radius, 30],
        [hole_radius, 30],
    ]
);
};

color(red) {
    cube(
        [10,
        20,
        30,
        ],
        center=true);
}

*/