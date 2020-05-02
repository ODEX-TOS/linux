#!/bin/bash

# This file updates the current version of .PKGVER as this is used in the naming of the resulting package

OUT=".PKGVER"
INPUT="Makefile"
VERSION="$(grep -E "^VERSION" $INPUT | cut -d= -f2 | sed -e 's/^[[:space:]]*//')"
PATCHLEVEL="$(grep -E "^PATCHLEVEL" "$INPUT" | cut -d= -f2 | sed -e 's/^[[:space:]]*//')"
SUBLEVEL="$(grep -E "^SUBLEVEL" "$INPUT" | cut -d= -f2 | sed -e 's/^[[:space:]]*//')"
EXTRAVERSION="$(grep -E "^EXTRAVERSION" "$INPUT" | cut -d= -f2 | sed -e 's/^[[:space:]]*//' | tr '-' '.')"

ORIGINAL="$(cat $OUT)"
UPDATED="$VERSION.$PATCHLEVEL.$SUBLEVEL$EXTRAVERSION"
UPDATED=$(printf "%s" "$UPDATED" | sed -r 's/\s+//g')
echo -e "$UPDATED" > "$OUT"

echo -e "\e[91m[ORIGINAL]\e[39m $ORIGINAL"
echo -e "\e[93m[UPDATED]\e[39m $UPDATED"
