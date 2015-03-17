#!/bin/bash

# app_support.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
echo ===================================
echo =
echo =     Setting up App Support
echo =          $(timestamp)
echo ===================================
# Based on:
# http://space-pope.github.io/vagrant/ember/ember-cli/2014/06/02/ember-npm-and-vagrant/

# On vagrant based Ubuntu VM:
# ember new <app-name> via ember-cli fails when working in a sync'd folder
# So will create, update and run the app from a non-sync'd folder: ~/srv
# Then copy project files minus those in node_modules back to the sync'd folder: ~/projects

# After editing run build_ember.sh to apply ember related changes in $APP_BUILD_FLDR
# Any changes are copied back to $SYNCED_APPS_FLDR

# rsync is used as it only moves the changes

# Comment: 1. This is is a serious kludge!
#          2. There ought to be a way to automate this.

mkdir -p ~/projects
mkdir -p $SYNCED_APPS_FLDR      # ~/projects
mkdir -p $APP_BUILD_FLDR        # ~/srv
mkdir -p ~/bin

rsync -a --exclude .git $SYNCED_APPS_FLDR/$MY_APP/ $APP_BUILD_FLDR/$MY_APP/
cd $APP_BUILD_FLDR/$MY_APP
ember new $MY_EMBER_APP >> /dev/null
rsync -a --exclude node_modules --exclude .git $APP_BUILD_FLDR/$MY_APP/ $SYNCED_APPS_FLDR/$MY_APP/


cat - > ~/bin/build_ember.sh <<EOF
rsync -a --exclude .git $SYNCED_APPS_FLDR/$MY_APP/ $APP_BUILD_FLDR/$MY_APP/
cd $APP_BUILD_FLDR/$MY_APP
bower install
ember build
rsync -a --exclude node_modules --exclude .git $APP_BUILD_FLDR/$MY_APP/ $SYNCED_APPS_FLDR/$MY_APP/
EOF

echo ---
echo App support has been setup!
echo ===================================
