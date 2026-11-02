#!/bin/sh
# Copies the four knitted reports into docs/, the folder GitHub Pages serves.
# Run from the repository root after every re-knit, then commit and push.
set -e
cp Ipsos-Izbori-2026.html    docs/Ipsos-Izbori-2026.html
cp Ipsos-Izbori-2026-SR.html docs/Ipsos-Izbori-2026-SR.html
cp Ipsos-Izbori-2026-py.html docs/Ipsos-Izbori-2026-py.html
cp Poll-Misses-2010-2026.html docs/Poll-Misses-2010-2026.html
echo "docs/ updated"
