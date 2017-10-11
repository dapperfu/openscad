// Model of the CR-10 stock hotend.
width = 19.3;
length = 19.3;
height = 9.3;


difference([24,0,0]) {
    linear_extrude(height) {
        square([width, length]);
    };
    translate([width/2,length/2,0]) {
        linear_extrude(height) {
            circle(diameter=8);
        }
    };
};


echo(version=version());