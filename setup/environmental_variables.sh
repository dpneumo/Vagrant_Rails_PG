#!/bin/bash
#
# environmental_variables.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo
echo ===================================
echo =
echo =   set environmental variables
echo =
echo ===================================

# Linux
export ENCODING=en_US.UTF-8
export PROVISIONS_DIR=/etc/provisions
export CBD_FLAG=common_build_deps
export NODEJS_FLAG=nodejs
export PG_FLAG=vm_provision_on_timestamp

# Application
export MYAPP=ember-crm
export APPUSER=$MYAPP
export APPUSER_PW=Dragon123

# Database
export DB=postgresql
export PG_VERSION=9.3
export DBYML=config/database.yml
export ORIG_DBYML=config/database_orig.yml
export DBUSER=ember_crm
export DBPASS=Dragon123
