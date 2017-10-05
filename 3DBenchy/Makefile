# slic3r profile to use.
PROFILE := fine3_2

# Find all STL files.
STL := $(wildcard *.stl)

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

${GPREFIX}%${GSUFFIX}: %.stl ../slic3r/${PROFILE}.ini
	slic3r --threads=8 --load=../slic3r/${PROFILE}.ini --output=${@} ${<}

.PHONY: clean
clean:
	rm -rf ${GCODE}
