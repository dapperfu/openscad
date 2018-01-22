first_layer_height = 0.24;
layer_height = 0.08;

edge = 50;

cylinder(
    r = edge/2,
    h = first_layer_height+ layer_height,
    center = false,
    $fn = 100);