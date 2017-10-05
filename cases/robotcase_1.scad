RASP_TOTAL_X=85.5;
RASP_TOTAL_Y=57;
RASP_TOTAL_Z=20;
DISPLAY_RASP_PI=false;

BOX_RADIUS = 28;

BASE_MARGIN_X_LEFT = BOX_RADIUS;
BASE_MARGIN_X_RIGHT = BOX_RADIUS;
RASP_Y_SHIFT = 5;
BASE_MARGIN_Y_TOP = BOX_RADIUS + RASP_Y_SHIFT;
BASE_MARGIN_Y_BOTTOM = BOX_RADIUS - RASP_Y_SHIFT;
BASE_PLATE_X_MIN = 0 - BASE_MARGIN_X_LEFT;
BASE_PLATE_Y_MIN = 0 - BASE_MARGIN_Y_BOTTOM;

TOTAL_X = RASP_TOTAL_X + BASE_MARGIN_X_LEFT + BASE_MARGIN_X_RIGHT;
TOTAL_Y = RASP_TOTAL_Y + BASE_MARGIN_Y_BOTTOM + BASE_MARGIN_Y_TOP;
BASE_PLATE_Y_MAX = TOTAL_Y - BASE_MARGIN_Y_BOTTOM;
BASE_PLATE_X_MAX = TOTAL_X - BASE_MARGIN_X_LEFT;
PLATE_WIDTH=2;
BASE_PLATE_ENTRETOISE_RADIUS=3;
RASP_HOLE_RADIUS=2.9 / 2.0;
BASE_PLATE_HOLE_RADIUS=RASP_HOLE_RADIUS;
ENTRETOISE_HEIGHT = 7;
RASP_Z = ENTRETOISE_HEIGHT;
CAMERA_HOLE_POSITION=[TOTAL_X / 2,TOTAL_Y / 2 + 35,-5];
BASE_PLATE_ENTRETOISES = [[25.5,   18, ENTRETOISE_HEIGHT / 2.0],
                          [  25.5, 43.5, ENTRETOISE_HEIGHT / 2.0],
                          [  79, 43.5, ENTRETOISE_HEIGHT / 2.0],
                          [  77, 10, ENTRETOISE_HEIGHT / 2.0],
                          ];



CALE_HEIGHT=3;
CALE_WIDTH=3;
CALE_H_LENGTH=10;
CALE_V_LENGTH=CALE_H_LENGTH + CALE_WIDTH;
H_CALES = [[0, -CALE_WIDTH,0],
           [RASP_TOTAL_X - CALE_H_LENGTH, -CALE_WIDTH,0],
           [RASP_TOTAL_X - CALE_H_LENGTH, RASP_TOTAL_Y,0],
           [0, RASP_TOTAL_Y,0],
          ];

V_CALES = [[-CALE_WIDTH , RASP_TOTAL_Y - CALE_V_LENGTH + CALE_WIDTH,0],
           [RASP_TOTAL_X, RASP_TOTAL_Y - CALE_V_LENGTH + CALE_WIDTH,0],
          ];

TOTAL_Z = PLATE_WIDTH + ENTRETOISE_HEIGHT + RASP_TOTAL_Z;

FIX_STAR_DIAMETER = 17;
FIX_DIAMETER = 1.75;
HOLE_CENTER_X = BASE_PLATE_X_MIN + TOTAL_X / 2.0;
HEAD_FIXATION_HOLES = [[HOLE_CENTER_X + FIX_STAR_DIAMETER/2.0, BASE_PLATE_Y_MAX -10, TOTAL_Z / 2],
                       [HOLE_CENTER_X - FIX_STAR_DIAMETER/2.0, BASE_PLATE_Y_MAX -10, TOTAL_Z / 2],
                       [HOLE_CENTER_X, BASE_PLATE_Y_MAX - 10, TOTAL_Z / 2 + FIX_STAR_DIAMETER/2.0],
                       [HOLE_CENTER_X, BASE_PLATE_Y_MAX - 10, TOTAL_Z / 2  - FIX_STAR_DIAMETER/2.0]
                    ];

PLATE_FIXATION_HOLES = [[BASE_PLATE_X_MIN, RASP_TOTAL_Y / 2 , TOTAL_Z - 5],
                        [BASE_PLATE_X_MAX, RASP_TOTAL_Y / 2 , TOTAL_Z - 5],
                    ];


HDMI_PORT_X_SHIFT = 45;
USB_PORT_Y_SHIFT = 30;


H_NERVURES =  [6,BASE_PLATE_Y_MAX - 26];
V_NERVURES =  [10,BASE_PLATE_X_MAX - 36];

AIR_HOLE_NUMBER=6;

module nervures() {
  union(){
    for (i=V_NERVURES) {
       translate([i,BASE_PLATE_Y_MIN,0]) {
         cube([2,TOTAL_Y - 2,2]);
       }
    }
    for (i=V_NERVURES) {
       translate([i,BASE_PLATE_Y_MIN + PLATE_WIDTH,0]) {
         cube([2,2,TOTAL_Z - PLATE_WIDTH]);
       }
    }
    for (i=V_NERVURES) {
       translate([i,BASE_PLATE_Y_MAX - 2 * PLATE_WIDTH,0]) {
         cube([2,2,TOTAL_Z - PLATE_WIDTH]);
       }
    }
    for (i=H_NERVURES) {
       translate([BASE_PLATE_X_MIN, i, 0]) {
         cube([TOTAL_X,2,2]);
       }
    }
    for (i=H_NERVURES) {
       translate([BASE_PLATE_X_MIN, i, 0]) {
         cube([PLATE_WIDTH * 2,2,TOTAL_Z - PLATE_WIDTH]);
       }
    }
    for (i=H_NERVURES) {
       translate([BASE_PLATE_X_MAX - 2 * PLATE_WIDTH, i, 0]) {
         cube([PLATE_WIDTH * 2,2,TOTAL_Z - PLATE_WIDTH]);
       }
    }
  }
}

module cable_output() {
   translate([BASE_PLATE_X_MIN + TOTAL_X / 2.0,BASE_PLATE_Y_MAX - 20,0]) {
      cube([25,15, 10], center = true);
   }
   translate([HDMI_PORT_X_SHIFT, -20, ENTRETOISE_HEIGHT + PLATE_WIDTH + 10 / 2]) {
      cube([25,25, 15], center = true);
   }
   translate([BASE_PLATE_X_MAX, USB_PORT_Y_SHIFT - RASP_Y_SHIFT, ENTRETOISE_HEIGHT + PLATE_WIDTH + 10 / 2]) {
      cube([15,25, 10], center = true);
   }
}

module head_fixation_hole(i) {
    translate(i) {
      rotate([90,0,0]) {
        cylinder(r=FIX_DIAMETER, h=10, $fn=50, center = true);
      } 
    }
}

module plate_fixation_hole(i) {
    translate(i) {
      rotate([90,0,0]) {
        rotate([0,90,0]) {
            cylinder(r=FIX_DIAMETER, h=10, $fn=50, center = true);
        }
      }
    }
}


AIR_HOLE_DIAMETER = 2;

module air_holes() {  
  translate([BASE_PLATE_X_MIN + TOTAL_X / 2.0, BASE_PLATE_Y_MIN + TOTAL_Y / 2.0  - RASP_Y_SHIFT, 0]) {
    for (i = [0 : AIR_HOLE_NUMBER] ) {
      rotate( i * 360 / AIR_HOLE_NUMBER, [0, 0, 1])
      translate([0, 10, 0])
      cylinder(r=AIR_HOLE_DIAMETER, h=10, $fn=50, center = true);
    }
  }
}


module h_cale(i) {
  translate(i) {
    cube([CALE_H_LENGTH, CALE_WIDTH, ENTRETOISE_HEIGHT + CALE_HEIGHT], center = false);
  }
}

module v_cale(i) {
  translate(i) {
    cube([CALE_WIDTH, CALE_V_LENGTH, ENTRETOISE_HEIGHT + CALE_HEIGHT], center = false);
  }
}

module entretoise (r_outer, r_inner, h, $fn=50, center = false) {
  difference() {
      cylinder(r=r_outer, h=h, $fn=$fn, center = center);
      cylinder(r=r_inner, h=h * 2, $fn=$fn, center = center);
  }

}


module rasp_pi() {
  color("red") {
      difference() {
        cube([RASP_TOTAL_X, RASP_TOTAL_Y, PLATE_WIDTH]);
        for (i = BASE_PLATE_ENTRETOISES) {
          translate(i) {
            cylinder(r=RASP_HOLE_RADIUS, h=20, $fn=50, center = true);
          }
        }
      }
  }
}

module plate() {
  translate([BASE_PLATE_X_MIN, BASE_PLATE_Y_MIN, 0]) {
    difference() {
      cube([TOTAL_X, TOTAL_Y, TOTAL_Z]);
      translate([PLATE_WIDTH, PLATE_WIDTH, PLATE_WIDTH]) {
        cube([TOTAL_X - PLATE_WIDTH * 2, TOTAL_Y - PLATE_WIDTH * 2, TOTAL_Z]);
      }
      // Camera hole
      translate(CAMERA_HOLE_POSITION) {
        cube([9,9,40], center = true);
      }
    }
    translate(CAMERA_HOLE_POSITION) { 
      for(i = [-1,1]) {
        translate([i * 22,00,PLATE_WIDTH + 6]) {   
          difference() {
            cube([10,40,5], center = true);
            translate([-i * 10,0,-8]) {   
              cube([15,30,18], center = true); 
            }
          }
        }  
      }
    }
  }
}

module case()
{
$fn=50;
union() {
 
  translate([0, RASP_Y_SHIFT, 0]) {
    difference() {
      minkowski()
      {  
        cube([RASP_TOTAL_X, RASP_TOTAL_Y, TOTAL_Z]);
        cylinder(r=BOX_RADIUS,h=0.01);
      }
      translate([0,0, PLATE_WIDTH]) {
        minkowski()
        {  
          cube([RASP_TOTAL_X, RASP_TOTAL_Y, TOTAL_Z]);
          cylinder(r=BOX_RADIUS - PLATE_WIDTH,h=0.01);
        }
      }
      for(i=HEAD_FIXATION_HOLES) {
         head_fixation_hole(i);
      }
      for(i=PLATE_FIXATION_HOLES) {
         plate_fixation_hole(i);
      }
      air_holes();
      cable_output();
    }
  }

  translate([0,0,PLATE_WIDTH]) {
    nervures();
    if (DISPLAY_RASP_PI) {
      translate([0,0,RASP_Z]) {   
        rasp_pi();
      }
    }

   for (i = BASE_PLATE_ENTRETOISES) {
        translate(i)
        entretoise(BASE_PLATE_ENTRETOISE_RADIUS, BASE_PLATE_HOLE_RADIUS, h = ENTRETOISE_HEIGHT, center=true);
    }
    for (i = H_CALES) {
       h_cale(i);
    }
    for (i = V_CALES) {
       v_cale(i);
    }
  }
}
}

color(red)
  case();