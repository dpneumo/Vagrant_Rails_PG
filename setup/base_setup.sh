#!/bin/bash
#
# base_setup.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =   base setup for vm
echo =   run as user: root
echo ===================================

script_dir="/vagrant/setup"

. "$script_dir/functions.sh"
. "$script_dir/environmental_variables.sh"

mkdir -p $ROOT_PROV_DIR

provision_1x common_build_dependencies
provision_1x encodings
provision_1x app_user_as_linux_user
provision_1x nodejs
provision_1x postgres_bootstrap

echo ---
echo base setup for vm is complete!
echo ===================================
