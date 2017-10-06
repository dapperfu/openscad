# slic3r profile to use.
ifndef PROFILE
	PROFILE := fine3_2
endif
# Find all STL files.
ifndef STL
	STL := $(wildcard *.stl)
endif
# Generate GCode
ifndef GSUFFIX
	GSUFFIX = _${PROFILE}.gcode
endif

ifndef GPREFIX
	GPREFIX =
endif

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
	slic3r --print-center=150,150 --load=../slic3r/${PROFILE}.ini --output=${@} ${<}

.PHONY: clean
clean:
	rm -rf ${GCODE}
