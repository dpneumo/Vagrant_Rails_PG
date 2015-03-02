#!/bin/bash

# rails.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =       Installing rails
echo =
echo ===================================

provisioned=$PROVISIONS_DIR/$RAILS_FLAG
if [ -f "$provisioned" ]
then
  echo "rails has already been provisioned"
else
  # Set ruby version
  #rbenv local 2.2.0

  # Rails
  echo  Installing rails
  gem install rails
  rbenv rehash

  # Set provisioned flag
  touch $provisioned
fi

echo ---
echo rails installation is complete!
echo ===================================
