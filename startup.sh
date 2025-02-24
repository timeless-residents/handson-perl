#!/bin/bash
cd /app
carton install
carton exec -- plackup -E production -s Starman --workers=4 script/app.psgi