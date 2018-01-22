first_layer_height = 0.24;
layer_height = 0.08;

edge = 10;

cube(
    [edge,
    edge,
    first_layer_height+ layer_height,
    ],
    center=false);