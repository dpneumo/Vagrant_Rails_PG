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

echo ---
echo base setup for vm is complete!
echo ===================================
