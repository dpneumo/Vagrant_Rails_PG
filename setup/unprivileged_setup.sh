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
mkdir -p /home/vagrant/provisions
. "$dir/environmental_vars_unpriv.sh"

. "$dir/rbenv.sh"
. "$dir/rbenv-first-ruby.sh"

. "$dir/rails.sh"
. "$dir/rails_app.sh"

echo ---
echo base setup for vm is complete!
echo ===================================
