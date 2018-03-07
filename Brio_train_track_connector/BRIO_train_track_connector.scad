$fn=80;

difference()
{
        cylinder (h = 10, r=6.35, center = true);
        color("blue")
        cylinder (h = 11, r=3.2, center = true);;
}

translate([2.75,5,0]) cylinder(8,1,center=true);
translate([2.75,-5,0]) cylinder(8,1,center=true);

difference()
{
        translate([20,0,0]) cylinder (h = 10, r=5.85, center = true);
        color("blue")
        translate([20,0,0]) cylinder (h = 11, r=3.2, center = true);
}

translate([5,-2.5,-5]) cube([10,5,10]);
