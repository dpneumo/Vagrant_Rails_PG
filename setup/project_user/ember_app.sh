#!/bin/bash

# ember_app.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
echo ===================================
echo =     Setting up My Ember App
echo =          $(timestamp)
echo ===================================
# Based on:
# http://space-pope.github.io/vagrant/ember/ember-cli/2014/06/02/ember-npm-and-vagrant/

# On vagrant based Ubuntu VM:
# ember new <app-name> via ember-cli fails when working in a sync'd folder
# So will create and run the app from a non-sync'd folder: ~/projects
# The project files minus those in node_modules will be copied to a sync'd folder: /$SYNCED_FLDR

# After editing run build_ember.sh to copy file changes back to the project folder
# Notice that after changes are copied back to the project folder
# bower install and ember build are run to assure that the project is fully updated.
# Then any project folder changes are in turn pushed back to /$SYNCED_FLDR

# rsync is used as it only moves the changes

# Comment: 1. This is is a serious kludge!
#          2. There ought to be a way to automate this.

cd ~/srv

# Remove earlier version of the ember app if it exists
if [ -d ember ]; then sudo rm -Rf ember; fi

# Create new Ember app in srv folder
ember new myember --skip-git
mv myember ember
# Copy it to myproj folder excluding node_modules
rsync -a --exclude node_modules ~/srv/ember ~/projects/myproj/

# Create script to sync & update sync folder with build/serve folder
cat - > ~/scripts/build_ember.sh <<EOF
#!/bin/bash
# ~/scripts/build_ember.sh

# sync & update sync folder with build/serve folder

rsync -a --exclude .git \~/projects/myproj/ember/ \~/srv/ember/
cd \~/srv/ember
bower install
ember build
rsync -a --exclude node_modules --exclude .git \~/srv/ember/ \~/projects/myproj/ember/
EOF

echo ---
echo ember_app is complete!
echo ===================================
