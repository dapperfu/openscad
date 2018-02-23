edge = 17.7/2+7;
edge2 = 8.4/2;

h = 4.8;

difference() {
cylinder(
r = edge,
h = h,
center = true,
$fn = 100);

cylinder(
r = edge2,
h = 2*h,
center = true,
$fn = 100);
    
}