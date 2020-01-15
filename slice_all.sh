#!/usr/bin/env bash

# Slice all 

SLIR3R=${HOME}/.Slic3r

# Generate g-code for a full permutation of profile settings.

# List all of the print profiles.
for PRINT_ in $(ls ${SLIR3R}/print/*)
do

# List all of the printer profiles.
for PRINTER_ in $(ls ${SLIR3R}/printer/*)
do

# List all of the filament profiles
for FILAMENT_ in $(ls ${SLIR3R}/filament/*)
do
export PRINT=$(basename $PRINT_ .ini)
export PRINTER=$(basename $PRINTER_ .ini)
export FILAMENT=$(basename $FILAMENT_ .ini)

echo Slicing ${PRINT} ${PRINTER} ${FILAMENT}
# Run make with the given profiles.
THREADS=8 make -j1

done
done
done
