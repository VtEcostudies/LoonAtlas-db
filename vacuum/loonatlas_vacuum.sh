#!/bin/bash -x

#create vacuum output filename and filepath
filename=loonatlas_vacuum_$(date -d "today" +"%Y%m%d-%H%M").log
filepath=/home/ubuntu/dbLoonAtlas/vacuum/
echo $filepath$filename

#vacuum the entire db. it's small, and this goes fast.
sudo -u postgres vacuumdb -d loonatlas > $filepath$filename
