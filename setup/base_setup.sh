#!/bin/bash
#
# base_setup.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =   base setup for vm
echo =
echo ===================================

dir="/vagrant/setup"

. "$dir/environmental_variables.sh"
mkdir -p $ROOT_PROV_DIR

#. "$dir/common_build_dependencies.sh"
#. "$dir/encodings.sh"

#. "$dir/app_user_as_linux_user.sh"

#. "$dir/nodejs.sh"
#. "$dir/postgres_bootstrap.sh"

echo ---
echo base setup for vm is complete!
echo ===================================

# As user: root

script_dir="/vagrant/setup"
flag_dir="/etc/provisions"

. "$script_dir/functions.sh"
. "$script_dir/environmental_variables.sh"

mkdir -p $ROOT_PROV_DIR

provision_1x common_build_dependencies
#provision_1x encodings
#provision_1x app_user_as_linux_user
#provision_1x nodejs
#provision_1x postgres_bootstrap

echo ---
echo base setup for vm is complete!
echo ===================================
