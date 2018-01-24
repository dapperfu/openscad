blade_width = 7/2;
blade_radius= 40;
blades = 6;;
height = 4;

module Blade(rot) {
rotate(a=[0, 0, rot]) {
linear_extrude(height = height) {
    translate(v = [blade_radius-blade_width/2, 0, 0]) {
        circle(
            r = 1.5*blade_width,
            $fn = 50,
            center = true
            );
    };
    polygon(points=[[0, -blade_width],[blade_radius-blade_width/2,-blade_width],[blade_radius-blade_width/2, blade_width],[0, blade_width]]);
};
};
}

difference() {
for (i = [0:360/blades:360-360/blades]) {
    echo(i);
    Blade(i);
}

translate( v = [0, 0, -height*0.5]) {
    linear_extrude(height = 2*height) {
        circle(
            r = 1,
            $fn = 500,
            center = true
            );
        };
    };
}

