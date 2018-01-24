blade_width = 3.5;
blade_radius= 40;
blades = 6;
height = 4;

module Blade(rot) {
    rotate(a=[0, 0, rot]) {
        linear_extrude(height = height) {
            translate(v = [blade_radius-blade_width/2,
                           0,
                           0]) {
                circle(
                    r = 1.5*blade_width,
                    $fn = 50,
                    center = true
                    );
            };
            polygon(
                points=[
                [0, -blade_width],
                [blade_radius-blade_width/2,-blade_width],
                [blade_radius-blade_width/2, blade_width],
                [0, blade_width]]
            );
        };
    };
}

difference() {
// Draw the number of blades.
for (i = [0:360/blades:360-360/blades]) {
    Blade(i);
}

// Subtract a hole to put the pin from.
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

