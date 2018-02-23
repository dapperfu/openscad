edge = 17.7/2+7;
edge2 = 8.4/2;

h = 4.8;

module Standoff(x,y) {
    translate( v = [x, y, 0]) {
difference() {
cylinder(
r = edge,
h = h,
center = true,
$fn = 100);

cylinder (
r = edge2,
h = 2*h,
center = true,
$fn = 100); 
}
}
}

Standoff(0, 0);
Standoff(2*edge+1, 0);

Standoff(0, 2*edge+1);

Standoff(2*edge+1, 2*edge+1);
