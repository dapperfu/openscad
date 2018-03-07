$fn=80;

// Config
pin_height = 10;
pin_diameter = 11.1;
pin_spacing = 22;
connector_wid= 7;
cutout = pin_diameter/6;
cutout_radius=pin_diameter/3;
start_angle=30;

module pin(location) {
    translate(v=location)
    {
        cylinder(
            d=pin_diameter,
            h=pin_height,
            center=false
        );
        color("green") 
        {
            for (r = [[start_angle:1:180-start_angle], [180+start_angle:1:360-start_angle]])
            {
                for(i=r)
                    {
                        translate([cutout_radius*cos(i), cutout_radius*sin(i), 0])
                            {
                                cylinder(
                                    d=cutout,
                                    h=1.2*pin_height,
                                    center=false
                               );    
                            }
                    }
            }
        }
    }
}

pin([0, 0, 0]);
pin([pin_spacing, 0, 0]);
    
color("red")
{
    translate([pin_diameter/2, -connector_wid/2, 0])
    {
        cube(size = [pin_spacing-pin_diameter, connector_wid, 1.01*pin_height], center = false);
    }
}
    
    
    
        
    
    //r=10;
    //color("red") 
    //{
    //    {
    //        for (i = [0:10:360]) {
    //            translate([r*cos(i), r*sin(i), 0]) {
    //                cylinder(r=1,
    //                    h=pin_height);
    //            }
    //        }
//    }
//}