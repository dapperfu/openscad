// New Connector 

// 26 px ~ 0.5mm
// Tooth Length 135.5 px ~ 2.6mm

/* 
Sanity check: 2.6mm * 16 =  41.6mm.

"ID": {13.38, 13.45, 13.51} ~ 42.24 mm circumference.
*/

r = 12.86/2;
r2 = 14.66/2;
L = 20;
cylinder(h = L, r= r, center=false);

w=2;
union() {
color("blue") {
translate([-w/2,-r2,0]) {
cube([w, 2*r2, L]);
}
}
color("green") {
translate([-r2,-w/2,0]) {
cube([2*r2, w, L]);
}
}
}

/*
rotate([0, 0, 45]) {
union() {
color("blue") {
translate([-w/2,-r2,0]) {
cube([w, 2*r2, L]);
}
}
color("green") {
translate([-r2,-w/2,0]) {
cube([2*r2, w, L]);
}
}
}
}
*/