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

dir="$PWD"
. "$dir/environmental_variables.sh"
. "$dir/common_build_dependencies.sh"
. "$dir/encodings.sh"

. "$dir/app_user_as_linux_user.sh"

. "$dir/nodejs.sh"
. "$dir/postgres_bootstrap.sh"

echo ---
echo base setup for vm is complete!
echo ===================================
