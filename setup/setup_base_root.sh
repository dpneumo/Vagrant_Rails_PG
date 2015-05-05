#!/bin/bash
#
# setup_base_root.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

# $script_dir is required by provision_1x
# Cannot be set by environmental_variables.sh
script_dir="/vagrant/setup/base_root"
. "$script_dir/../environmental_variables.sh"
. "$script_dir/../functions.sh"

starting "Privileged setup for vm. Run as user: root"

# set vagrant_setup.log ownership and permissions
sudo chown root:vagrant /var/log/vagrant_setup.log
sudo chmod 664 /var/log/vagrant_setup.log

# $flag_dir is required by provision_1x
flag_dir=$ROOT_PROVISIONED_FLAGS_DIR
mkdir -p $flag_dir

provision_1x common_build_dependencies
provision_1x git_config
provision_1x encodings
provision_1x app_user_as_linux_user
provision_1x postgres_bootstrap

. $script_dir/../cleanup.sh

completed "privileged setup for vm"
