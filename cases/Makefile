# slic3r profile to use.
ifndef PROFILE
	PROFILE := fine3_2
endif
# Find all SCAD files.
SCAD := $(wildcard *.scad)

# Generate STL files.
STL := $(patsubst %.scad,%.stl,${SCAD})

# Generate GCode
GSUFFIX = _${PROFILE}.gcode
GPREFIX = 
GCODE := $(patsubst %.stl,${GPREFIX}%${GSUFFIX},${STL})


# Default to building the stl files.
.DEFAULT: gcode
.PHONY: gcode
gcode: ${GCODE}

.PHONY: stl
stl: ${STL}

%.stl: %.scad
	openscad -o ${@} ${<}

${GPREFIX}%${GSUFFIX}: %.stl
	slic3r --print-center=150,150 --load=../slic3r/${PROFILE}.ini --output=${@} ${<}

.PHONY: clean
clean:
	rm -rf ${STL} ${GCODE}
