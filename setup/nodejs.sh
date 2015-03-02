#!/bin/bash
#
# nodejs.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =       Installing nodejs
echo =
echo ===================================

provisioned=/etc/nodejs_provisioned
if [ -f "$provisioned" ]
then
  echo "nodejs has already been provisioned"
else
  # NodeJS
  echo  Adding node ppa with apt-add-repository via software-properties-common
  sudo apt-get install software-properties-common -y
  sudo add-apt-repository ppa:chris-lea/node.js -y

  echo  Updating apt-get after repository addition
  sudo apt-get update -y > /dev/null

  echo  Installing nodejs
  sudo apt-get install nodejs -y

  # Set provisioned flag
  touch $provisioned
fi

echo ---
echo nodejs installation is complete!
echo ===================================
