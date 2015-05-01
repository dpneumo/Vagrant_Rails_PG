#!/bin/bash
#
# setup_project.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

# $script_dir is required by provision_1x
# Cannot be set by environmental_variables.sh
script_dir="/vagrant/setup/project_user"
. "$script_dir/../environmental_variables.sh"
. "$script_dir/../functions.sh"

starting "Setup project"

# $flag_dir is required by provision_1x
flag_dir=$USER_PROVISIONED_FLAGS_DIR
mkdir -p $flag_dir


mkdir -p ~/projects/myproj
mkdir -p ~/srv/myproj

provision_1x rails_app
provision_1x ember_app
provision_1x myproj

. $script_dir/../cleanup.sh

completed "project setup"
