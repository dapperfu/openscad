# Find all OpenSCAD files.
SCAD ?= $(shell find . -name "*.scad" | sort)

# STL Files to build.
STL := $(patsubst %.scad,%.stl,${SCAD})

# PNG Preview images.
PNG := $(patsubst %.scad,%.png,${SCAD})


# Default to building the stl files.
.DEFAULT: all
.PHONY: all
all: pngs stls


.PHONY: pngs
pngs: ${PNG}

%.png: %.scad
	openscad -o ${@} --imgsize=1024,1024 ${<}


# Build the STL files with OpenSCAD.
.PHONY: stls
stls: ${STL}

%.stl: %.scad
	openscad -o ${@} ${<}

# Update slicer profiles.
.PHONY: update
update:
	git submodule init slic3r_profiles/
	git submodule update --remote --force --checkout slic3r_profiles/

# Clean up the g-code.
.PHONY: clean
clean:
	rm -rf ${GCODE} ${STL}

.PHONY: bootstrap
bootstrap:
	sudo apt-get install slic3r openscad

# slic3r profiles to use.
FILAMENT ?= temp_H250-240_B70-40
PRINT ?= fine3_3
PRINTER ?= CR10

PRINT_CENTER?=50,50

THREADS?=$(shell grep -c ^processor /proc/cpuinfo)

# Find all STL files.
# STL ?= $(wildcard */*.stl)
# Search deeper than with just wildcard.
STL ?= $(shell find . -name "*.stl" | sort)

# Setup a directory structure for the output gcode.
GPREFIX := build/${PRINTER}/
# Add suffix to base .stl
GSUFFIX := -${PRINTER}-${FILAMENT}-${PRINT}

# Determine the gcode files to make.
GCODE := $(patsubst %.stl,${GPREFIX}%${GSUFFIX}.gcode,${STL})

.PHONY: gcode
gcode: ${GCODE}

# Slice the STL files into G-code
${GPREFIX}%${GSUFFIX}.gcode: %.stl
	@mkdir -p ${dir ${@}}
	@echo Slicing: ${<}

	@slic3r --print-center=${PRINT_CENTER} \
	  --threads=${THREADS} \
	  --load=slic3r_profiles/filament/${FILAMENT} \
	  --load=slic3r_profiles/print/${PRINT} \
	  --load=slic3r_profiles/printer/${PRINTER} \
	  --output=${@} \
	  ${<}

