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
    source "$script_dir/$resource_name.sh"
    touch $provisioned
  fi #| tee -a /var/log/vagrant_setup.log
}


# setup-script header
# Usage: starting "task description"
function starting () {
  task=$1
  echo "
===================================
=    $1
=    $(timestamp)
===================================
"
}

# setup-script footer
# Usage: completed "task description"
function completed () {
  task=$1
  echo "
---
$task is complete!
===================================
"
}


# Define a timestamp function
timestamp() {
  date +"%T"
}
