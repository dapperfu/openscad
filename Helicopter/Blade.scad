blade_width = 9/2;
blade_radius= 80;
height = 2;

module Blade(rot) {
rotate(a=[0, 0, rot]) {
linear_extrude(height = 2) {
    translate(v = [blade_radius-blade_width/2, 0, 0]) {
        circle(
            r = blade_width,
            $fn = 50,
            center = true
            );
    };
    polygon(points=[[0, -blade_width],[blade_radius-blade_width/2,-blade_width],[blade_radius-blade_width/2, blade_width],[0, blade_width]]);
};
};
}

blades = 5;
for (i = [0:360/blades:360-360/blades]) {
    echo(i);
    Blade(i);
}
