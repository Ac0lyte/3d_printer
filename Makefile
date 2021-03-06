# Large chunks (read almost all of it) of this make file
# were purloined from the Splendor organizers makefile
# by W. Craig Trader is dual-licensed under
# Creative Commons Attribution-ShareAlike 3.0 Unported License and
# GNU Lesser GPL 3.0 or later.
# It can be found at :
# # https://raw.githubusercontent.com/wcraigtrader/game-parts/master/splendor/Makefile
#
# THANKS!!!!
#
# This makefile expects an OpenSCAD file named $(PREFIX).scad that defines
# the following variables:
#
# PART    -- the name of a part to generate
# VERBOSE -- logically true if you want verbose output (optional)
#
# The OpenSCAD program should have logic that renders a single part by name:
#
# if (PART == "foo") {
#     foo();
# } else if (PART == "bar") {
#     bar();
# } else if (PART == "foo-bar") {
#     foo_bar();
# }
#
# This makefile will use OpenSCAD to create individual model (STL) files and
# image (PNG) files for each declared part, and will use Slic3r to generate
# G-Code for each declared part.
#
# So if PREFIX=widget, then the created files will be:
#
# stl/widget-foo.stl stl/widget-bar.stl stl/widget-foo-bar.stl
# png/widget-foo.png png/widget-bar.png png/widget-foo-bar.png
# gcode/widget-foo.gcode gcode/widget-bar.gcode gcode/widget-foo-bar.gcode

# Name of OpenSCAD model file
PREFIX=printer_frame

# OpenSCAD binary and options on OS X
ifeq ($(OS),Windows_NT)
    OPENSCAD=""
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        OPENSCAD=/usr/bin/openscad
		else
	    ifeq ($(UNAME_S),Darwin)
	        OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
	    endif
		endif
endif

OPENSCAD_OPTIONS= -D VERBOSE=false -D SHOW=\"part\"

# IMAGE_OPTIONS=--imgsize=1024,768 --colorscheme=DeepOcean
IMAGE_OPTIONS=--imgsize=1024,768

# Slic3r binary and options
SLIC3R=/opt/Slic3r/latest/slic3r
SLIC3R_INI=slic3r.ini
SLIC3R_OPTIONS=--load $(SLIC3R_INI) --print-center 125,105

# ----- Everything after this should not need modification

# Names of parts to build
PARTS=$(shell grep 'PART == ' *.scad | cut -d'"' -f2)

STL=stl
IMAGE=png
GCODE=gcode

MODELS=$(patsubst %,$(STL)/$(PREFIX)-%.$(STL),$(PARTS))
IMAGES=$(patsubst %,$(IMAGE)/$(PREFIX)-%.$(IMAGE),$(PARTS))
GCODES=$(patsubst %,$(GCODE)/$(PREFIX)-%.$(GCODE),$(PARTS))

MODEL_NAME=$(STL)/$(PREFIX)-$@.$(STL)
IMAGE_NAME=$(IMAGE)/$(PREFIX)-$@.$(IMAGE)
GCODE_NAME=$(GCODE)/$(PREFIX)-$@.$(GCODE),

all:	$(PARTS)

directories:
	@mkdir -p $(STL) $(IMAGE) $(GCODE)

models: directories $(MODELS)

gcodes: directories $(GCODES)

images: directories $(IMAGES)

$(PARTS): $(shell grep -i "PART == \"$@\"" *.scad)
	make $(IMAGE_NAME)
	make $(MODEL_NAME)

clean:
	rm -rf $(STL) $(GCODE) $(IMAGE)

# Dependencies for models

$(MODELS) : $(STL)/$(PREFIX)-%.$(STL) : parts.scad
	time $(OPENSCAD) $(OPENSCAD_OPTIONS) -o $@ -DPART=\"$(subst $(PREFIX)-,,$(subst .$(STL),,$(@F)))\" $<

# Dependencies for images

$(IMAGES) : $(IMAGE)/$(PREFIX)-%.$(IMAGE) : parts.scad
	time $(OPENSCAD) $(OPENSCAD_OPTIONS) -o $@ -DPART=\"$(subst $(PREFIX)-,,$(subst .$(IMAGE),,$(@F)))\" $(IMAGE_OPTIONS) $<

# Dependencies for slicing

$(GCODES) : $(GCODE)/%.$(GCODE) : $(STL)/%.$(STL) $(SLIC3R_INI)
