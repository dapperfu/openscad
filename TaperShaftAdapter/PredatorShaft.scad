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


linear_extrude(10, center=true)
{
    color("blue")
    {
    circle(d=diameter);
    }
}
linear_extrude(11, center=true)
{
    color("red")
    {
    square(4.76, center=true);
    }
}