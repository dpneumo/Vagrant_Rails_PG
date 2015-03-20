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
# ~/scripts/build_proj.sh

# sync & update sync folder with build/serve folder

rsync -a --exclude .git $SYNCED_APPS_FLDR/$MY_APP $APP_BUILD_FLDR/
cd $APP_BUILD_FLDR/$MY_APP/ember
bower install
ember build
rsync -a --exclude node_modules --exclude .git $APP_BUILD_FLDR/$MY_APP $SYNCED_APPS_FLDR/
EOF

chmod +x ~/scripts/build_proj.sh
echo "alias build_proj='~/scripts/build_proj.sh'" >> ~/.bashrc

echo ---
echo My Project setup is complete!
echo ===================================
