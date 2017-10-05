.DEFAULT: null
.PHONY: null
null:
	@echo No default make target

# Python targets
VENV = .venv
${VENV}:
	python3 -mvenv ${@}

.PHONY: pip
pip:
	pip install -U -r requirements.txt

#
.PHONY: bootstrap
bootstrap:
	sudo apt-get install openscad python3 python3-venv slic3r

.PHONY: clean
clean:
	rm -rf ${VENV}

# Get all subdirectories that contain a makefile.
SUBMAKE=$(wildcard */Makefile)
# Artificially append a .clean to the end of it to clean.
SUBCLEAN = $(addsuffix .clean,$(SUBMAKE))
# Register the phony files.
.PHONY: force clean $(SUBCLEAN)

# make all & make clean.
gcode: $(SUBMAKE)

$(SUBMAKE): force
	-@$(MAKE) -C $(@D)
