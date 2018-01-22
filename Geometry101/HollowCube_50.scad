first_layer_height = 0.24;
layer_height = 0.08;

edge = 50;
pillars= 10;

translate( v = [0,
                0,
                0] ) {
    cube(
        [edge,
        edge,
        pillars,
        ],
        center=false);
}
    
translate( v = [edge - pillars,
                edge - pillars,
                0] ) {
    cube(
        [pillars,
        pillars,
        edge,
        ],
        center=false);
}

translate( v = [0,
                edge - pillars,
                0] ) {
    cube(
        [pillars,
        pillars,
        edge,
        ],
        center=false);
}

translate( v = [edge - pillars,
                0,
                0] ) {
    cube(
        [pillars,
        pillars,
        edge,
        ],
        center=false);
}

translate( v = [0,
                0, 
                edge - pillars] ) {
    cube(
        [edge,
        edge,
        pillars,
        ],
        center=false);
}