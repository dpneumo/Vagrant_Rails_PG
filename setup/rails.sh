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

provisioned=$VAGRANT_PROV_DIR/$RAILS_FLAG
if [ -f "$provisioned" ]
then
  echo "rails has already been provisioned"
else
  # Set ruby version
  #rbenv local $RUBY_VERSION

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
