# Find all OpenSCAD files.
SCAD ?= $(shell find . -name "*.scad" | sort)
# STL Files to build.
STL := $(patsubst %.scad,%.stl,${SCAD})
# PNG Preview images.
PNG := $(patsubst %.scad,%.png,${SCAD})

# Default to building the stl files.
.DEFAULT: all
.PHONY: all
all: stl png gcode

# Images
.PHONY: png
png: ${PNG}

%.png: %.scad
	openscad -o ${@} --imgsize=1024,1024 --projection=o ${<}

# Build the STL files with OpenSCAD.
.PHONY: stl
stl: ${STL}

%.stl: %.scad
	openscad -o ${@} ${<}
	
## Utility Targets
	
# Clean up the g-code.
.PHONY: clean
clean:
	@git clean -xfd

# Update slicer profiles.
.PHONY: update
update:
	git submodule init slic3r_profiles/
	git submodule update --remote --force --checkout slic3r_profiles/

# Bootstrap apt-get based distribution.
.PHONY: bootstrap
bootstrap:
	sudo apt-get install slic3r openscad

include slic3r_profiles/slice.mk
