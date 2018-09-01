/*
Shaft Diameter 	3/4 in. / 19.1 mm
Shaft length (in.) 	2.43 in. / 61.7 mm
Keyway 	3/16 in. / 4.76 mm
https://www.harborfreight.com/65-hp-212cc-ohv-horizontal-shaft-gas-engine-epa-69730.html

*/
$fn=12;
diameter=19.1;
length=61.7;
keyway=4.76;


difference() {
    color("blue")
    {
        linear_extrude(length, center=true)
        {
            circle(d=diameter);
        }
    }
    translate(10,0,0) {
        color("red")
        {
            linear_extrude(length*1.1, center=true)
            {
                square(4.76, center=true);
            }
        }
    }
}