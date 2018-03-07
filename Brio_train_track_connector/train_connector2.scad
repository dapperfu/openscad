$fn=80;

nozzle_size = 0.2;

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
    }
}

pin([0, 0, 0]);
pin([pin_spacing, 0, 0]);
    
color("brown")
{
    translate([0, -connector_wid/2, 0])
    {
        cube(size = [pin_spacing, connector_wid, pin_height], center = false);
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