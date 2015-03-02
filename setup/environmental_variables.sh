#!/bin/bash
#
# environmental_variables.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
echo ===================================
echo =
echo =   set environmental variables
echo =
echo ===================================

# Linux
export ENCODING=en_US.UTF-8

export ROOT_PROV_DIR=/etc/provisions
export CBD_FLAG=common_build_deps
export NODEJS_FLAG=nodejs
export PG_FLAG=vm_provision_on_timestamp

export VAGRANT_PROV_DIR=/home/vagrant/provisions
export RBENV_FLAG=rbenv
export RUBY_FLAG=ruby2.2.0
export RAILS_FLAG=rails
export RAILS_APP_FLAG=rails_app

# Postgresql
export PG_VERSION=9.3
export DBUSER=ember_crm
export DBPASS=Dragon123

# rbenv
export PATH="$HOME/.rbenv/bin:${PATH}"
export PATH="$HOME/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash

# ruby
export RUBY_VERSION=2.2.0

# Application
export MYAPP=ember-crm
export APPUSER=$MYAPP
export APPUSER_PW=Dragon123
export DB=postgresql
export DBYML=config/database.yml
export ORIG_DBYML=config/database_orig.yml
