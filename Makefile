## Slic3r Make Tool for OpenSCAD users.
# Place in your top level OpenSCAD folder.y

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
	openscad -o ${@} --render --imgsize=1024,1024 --projection=o ${<}

# Build the STL files with OpenSCAD.
.PHONY: stl
stl: ${STL}

%.stl: %.scad
	openscad -o ${@} ${<}
	
.PHONY: debug
debug:
	$(info $${PNG}=${PNG})
	
.PHONY: previews
previews: png
	bash previews.sh ${PNG}

## Utility Targets

# Clean up the g-code.
.PHONY: clean
clean:
	@git clean -xfd
	


include ~/.Slic3r/make_tool/slice.mk
