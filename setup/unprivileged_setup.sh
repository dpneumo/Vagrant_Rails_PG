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

script_dir="/vagrant/setup/unprivileged"

. "$script_dir/../environmental_variables.sh"
flag_dir=$VAGRANT_PROV_DIR
mkdir -p $flag_dir

. "$script_dir/../functions.sh"
provision_1x rbenv
provision_1x rbenv-first-ruby
provision_1x rails
provision_1x rails_app
provision_1x emberjs

echo ---
echo unprivileged setup for vm is complete!
echo ===================================
