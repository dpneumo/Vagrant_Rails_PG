#!/bin/bash

# rails_skeleton.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =  Installing rails skeleton
echo =       with railyard
echo =
echo =  https://github.com/brandonweiss/railyard
echo ===================================

provisioned=$VAGRANT_PROV_DIR/$RAILS_FLAG
if [ -f "$provisioned" ]
then
  echo "rails has already been provisioned"
else
  # Railyard
  gem install railyard
  rbenv rehash

  # Rails
  echo  Installing rails skeleton
  railyard version 4.2.0

  # Set provisioned flag
  touch $provisioned
fi

echo ---
echo rails installation is complete!
echo ===================================
