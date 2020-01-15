# openscad

GitHub repository for my OpenSCAD models with slic3r make

# Usage.

1. Clone repository:

    ```git clone https://github.com/jed-frey/openscad.git```

1. Have Slic3r make tool installed in ~./Slic3r/make_tool

    ```git clone https://github.com/jed-frey/slic3r_profiles.git ~/.Slic3r/make_tool```

1. Add or modify any ```.scad``` model with openscad.

1. Run ```make```. 
    1. G-code willl be in the ```build/``` directory.
    2. ```.stl``` files will be next to the ```.scad``` files.
    3. ```.png``` images will be next to the ```.scad``` files.
    
## Slice All Configs

Run ```./slice_all.sh``` to slice all OpenScad models with all slic3r settings, results in ```build/```

## Changing Settings.

To generate g-code for a different printer or with different printer settings specify the desired settings as environment variables to the ```make``` command.

    NOZZLE=0.8 make
    
    FILAMENT=H210-190_B70-40 PRINT_CENTER=50,50 make
