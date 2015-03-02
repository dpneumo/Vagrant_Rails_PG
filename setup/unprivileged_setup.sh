#!/bin/bash
#
# unprivileged_setup.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =   unprivileged setup for vm
echo =
echo ===================================

dir="/vagrant/setup"

# As user: vagrant
. "$dir/environmental_variables.sh"
mkdir -p $VAGRANT_PROV_DIR

. "$dir/rbenv.sh"
. "$dir/rbenv-first-ruby.sh"

. "$dir/rails.sh"
. "$dir/rails_app.sh"

echo ---
echo base setup for vm is complete!
echo ===================================
