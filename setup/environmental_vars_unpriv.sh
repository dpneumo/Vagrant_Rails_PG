#!/bin/bash
#
# environmental_vars_unpriv.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#+

echo
echo ===================================
echo =
echo =   set unprivileged environmental variables
echo =
echo ===================================

# Linux
export PROVISIONS_DIR=/home/vagrant/provisions
export RUBY_FLAG=ruby2.2.0
export RAILS_FLAG=rails
export RAILS_APP_FLAG=rails_app

# rbenv
export PATH="$HOME/.rbenv/bin:${PATH}"
export PATH="$HOME/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash

# ruby
export RUBY_VERSION=2.2.0

# Database
export DB=postgresql
export PG_VERSION=9.3
export DBYML=config/database.yml
export ORIG_DBYML=config/database_orig.yml
export DBUSER=ember_crm
export DBPASS=Dragon123

  # Application constants
export MYAPP=ember-crm
export DB=postgresql
export DBYML=config/database.yml
export ORIG_DBYML=config/database_orig.yml

