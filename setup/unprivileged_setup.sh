#!/bin/bash
#
# unprivileged_setup.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =   unprivileged setup for vm
echo =   run as user: vagrant
echo =
echo ===================================

# Cannot be set by environmental_variables.sh
script_dir="/vagrant/setup/unprivileged"

. "$script_dir/../environmental_variables.sh"

# $flag_dir is required by provision_1x
flag_dir=$VAGRANT_PROV_DIR
mkdir -p $flag_dir

. "$script_dir/../functions.sh"

provision_1x rbenv
provision_1x rbenv-first-ruby
provision_1x rails
#provision_1x rails_app
#provision_1x emberjs

provision_1x nodejs-v0.12
provision_1x ember-cli
provision_1x ember_app

echo ---
echo unprivileged setup for vm is complete!
echo ===================================
