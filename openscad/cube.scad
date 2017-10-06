// text_on_cube.scad - Example for text() usage in OpenSCAD

echo(version=version());


cube_size = 20;


translate([0,0, cube_size/2]) {
union() {
color("gray") cube(cube_size, center = true);
};
};