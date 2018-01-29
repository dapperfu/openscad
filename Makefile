# slic3r profiles to use.
FILAMENT ?= H250-240_B70-40
PRINT ?= fine3_3
PRINTER ?= CR10
NOZZLE ?= 0.4
PRINT_CENTER ?= 150,150

# Find all OpenSCAD files.
SCAD ?= $(shell find . -name "*.scad" | sort)

# STL Files to build.
STL := $(patsubst %.scad,%.stl,${SCAD})

# PNG Preview images.
PNG := $(patsubst %.scad,%.png,${SCAD})

# Setup a directory structure for the output gcode.
GCODE_PATH:=build/${PRINTER}-${NOZZLE}-${FILAMENT}
# Add suffix to base .stl
GCODE_NAME:=-${PRINT}

# Determine the gcode files to make.
GCODE:=$(patsubst %.stl,${GCODE_PATH}%${GCODE_NAME}.gcode,${STL})

# Determine the number of threads to use.
THREADS?=$(shell grep -c ^processor /proc/cpuinfo)

# Default to building the stl files.
.DEFAULT: all
.PHONY: all
all: stls pngs gcode

# Debugging
.PHONY: debug
debug:
	$(info $$SCAD=${SCAD})
	$(info $$STL=${STL})
	$(info $$PNG=${PNG})
	$(info $$GCODE=${GCODE})

# Images
.PHONY: pngs
pngs: ${PNG}

%.png: %.scad
	openscad -o ${@} --imgsize=1024,1024 --projection=o ${<}

# Build the STL files with OpenSCAD.
.PHONY: stls
stls: ${STL}

%.stl: %.scad
	openscad -o ${@} ${<}

# G-Code targets.
.PHONY: gcode
gcode: ${GCODE}

# Slice the STL files into G-code
${GCODE_PATH}%${GCODE_NAME}.gcode: %.stl
	@mkdir -p ${dir ${@}}
	@echo Slicing: ${<}
	@slic3r --print-center=${PRINT_CENTER} \
	  --nozzle-diameter=${NOZZLE} \
	  --threads=${THREADS} \
	  --load=slic3r_profiles/filament/${FILAMENT} \
	  --load=slic3r_profiles/print/${PRINT} \
	  --load=slic3r_profiles/printer/${PRINTER} \
	  --output=${@} \
	  ${<}

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
