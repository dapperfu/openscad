# Find all SCAD files.
SCAD := $(wildcard *.scad)

STL := $(patsubst %.scad,%.stl,${SCAD})

# Default to building the stl files.
.DEFAULT: stl
.PHONY: stl
stl: ${STL}

%.stl: %.scad
	openscad -o ${@} ${<}

.PHONY: clean
clean:
	rm -rf ${STL}
