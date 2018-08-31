/*

Adapter for a leaf blower with a blown motor.

Leaf blower fan (and old motor) had a tapered shaft.

New motor has a straight shaft.

*/

$fn=100;


/*
rotate_extrude(convexity = 10) {
    translate([2, 0, 0]) {
        circle(r = 1);
    }
}
*/

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