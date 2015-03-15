#!/bin/bash

# ember_app.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
echo ===================================
echo =     Setting up My Ember App
echo =
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

mkdir -p /home/$USER/projects
cd /home/$USER/projects
ember new $MY_EMBER_APP >> /dev/null
rsync -a --exclude node_modules /home/$USER/projects/$MY_EMBER_APP /$SYNCED_FLDR


mkdir -p /home/$USER/bin
sudo cat - >> "/home/$USER/.profile" <<EOF
export PATH=/home/$USER/bin:$PATH
EOF

source /home/$USER/.profile

cat - > "/home/$USER/bin/build_ember.sh" <<EOF
rsync -a --progress --exclude dist --exclude tmp /$SYNCED_FLDR/ /home/$USER/projects/$MY_EMBER_APP/
cd /home/$USER/projects/$MY_EMBER_APP
bower install
ember build
rsync -a --progress --exclude node_modules /home/$USER/projects/ /$SYNCED_FLDR/
EOF
