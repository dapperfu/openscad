# openscad

GitHub repository for my OpenSCAD models.

# Usage.

1. Clone repository:

    ```git clone --recurse-submodules git@github.com:jed-frey/openscad.git```

    ```git clone --recurse-submodules https://github.com/jed-frey/openscad.git```

1. Run ```make bootstrap``` to install requirements on apt-get based Linux distribution.

   Note: Ubuntu 18.04 needs openscad ppa's installed ```sudo add-apt-repository ppa:openscad/releases```

1. Add or modify any ```.scad``` model with openscad.

1. Run ```make```. 
    1. G-code willl be in the ```build/``` directory.
    2. ```.stl``` files will be next to the ```.scad``` files.
    3. ```.png``` images will be next to the ```.scad``` files.

## Changing Settings.

To generate g-code for a different printer or with different printer settings specify the desired settings as environment variables to the ```make``` command.

    NOZZLE=0.8 make
    
    FILAMENT=H210-190_B70-40 PRINT_CENTER=50,50 make
    
    
# Extra:

### Update Slic3r profile to HEAD.
 
     make update