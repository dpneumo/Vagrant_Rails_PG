#!/bin/bash
#
# setup_base_user.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =   unprivileged setup for vm
echo =   run as user: vagrant
echo =
echo ===================================

# $script_dir is required by provision_1x
# Cannot be set by environmental_variables.sh
script_dir="/vagrant/setup/base_user"

. "$script_dir/../environmental_variables.sh"

# $flag_dir is required by provision_1x
flag_dir=$USER_PROVISIONED_FLAGS_DIR
mkdir -p $flag_dir

. "$script_dir/../functions.sh"

provision_1x rbenv
provision_1x rbenv-first-ruby
provision_1x rails

provision_1x nodejs-v0.12
provision_1x ember-cli

provision_1x projects_support

. $script_dir/cleanup.sh

echo ---
echo unprivileged setup for vm is complete!
echo ===================================
