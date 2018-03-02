module pin(height, hole_d, position)
{
    color("green")
    {
        translate(v = position)
        {
            union()
            {
                translate(v = [0, 0, -height]) {
                    cylinder(h=3*height,
                             d=hole_d,
                             center=false);
                }
                translate(v = [0, 0, height/2])
                {
                    cylinder(h=2*height,
                             d=2*hole_d,
                             center=false);
                }
            }
        }
    }
}