#!/bin/bash

# myproj.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
echo ===================================
echo =     Setting up My Project
echo =          $(timestamp)
echo ===================================

# Create script to sync & update sync folder with build/serve folder
cat - > ~/scripts/build_proj.sh <<EOF
#!/bin/bash
# ~/scripts/build_ember.sh

# sync & update sync folder with build/serve folder

rsync -a --exclude .git \~/projects/myproj/ \~/srv/myproj/
cd \~/srv/myproj/ember
bower install
ember build
rsync -a --exclude node_modules --exclude .git \~/srv/myproj/ \~/projects/myproj/
EOF

echo ---
echo My Project setup is complete!
echo ===================================
