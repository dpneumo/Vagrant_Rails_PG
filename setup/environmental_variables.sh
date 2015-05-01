#!/bin/bash
#
# environmental_variables.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

# Source functions
. "/vagrant/setup/functions.sh"

echo "++ setting environmental variables ++" | tee -a /var/log/vagrant_setup.log

# Clean PATH
# http://unix.stackexchange.com/questions/40749/remove-duplicate-path-entries-with-awk-command
export PATH=$(echo -n $PATH | awk -vRS=: -vORS= '!a[$0]++ {if (NR>1) printf(":"); printf("%s", $0) }' )

# Linux
export ENCODING=en_US.UTF-8

export ROOT_PROVISIONED_FLAGS_DIR=/etc/provisioned
export USER_PROVISIONED_FLAGS_DIR=~/provisioned
export SYNCED_FLDR=/vagrant

# Postgresql
export PG_VERSION=9.3
export DBUSER=ember_crm
export DBPASS=Dragon123

# rbenv
export RBENV_SHELL=bash

# ruby
export RUBY_VERSION=2.2.0

# rails
export RAILS_VERSION=4.2.0

# Application
export MY_RAILS_APP=ember-crm
export MY_EMBER_APP=releases
export MY_APP=myproj
export SYNCED_APPS_FLDR=~/projects
export APP_BUILD_FLDR=~/srv

export APPUSER=$MY_RAILS_APP
export APPUSER_PW=Dragon123
export DB=postgresql
export DBYML=config/database.yml
export ORIG_DBYML=config/database_orig.yml
