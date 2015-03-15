#!/bin/bash

# functions.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

# Usage: provision_1x resource_name
# Expects these to be defined:
#     a script dir: eg. script_dir="/vagrant/setup"
#     a flag dir:   eg. flag_dir="/etc/provisions"
#
function provision_1x () {
  resource_name=$1
  provisioned=$flag_dir/$resource_name
  if [ -f "$provisioned" ]
  then
    echo "$resource_name has already been provisioned"
  else
    . "$script_dir/$resource_name.sh"

    # Set provisioned flag
    touch $provisioned
  fi
}
