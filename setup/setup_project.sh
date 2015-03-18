#!/bin/bash
#
# setup_project.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =   setup project
echo =   run as user: vagrant
echo =
echo ===================================

# $script_dir is required by provision_1x
# Cannot be set by environmental_variables.sh
script_dir="/vagrant/setup/project_user"

. "$script_dir/../environmental_variables.sh"

# $flag_dir is required by provision_1x
flag_dir=$USER_PROVISIONED_FLAGS_DIR
mkdir -p $flag_dir

. "$script_dir/../functions.sh"

mkdir -p ~/projects/myproj

provision_1x rails_app
provision_1x ember_app
provision_1x myproj

. $script_dir/cleanup.sh

echo ---
echo setup project is complete!
echo ===================================
