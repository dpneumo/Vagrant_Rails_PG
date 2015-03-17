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

  # Railyard
  gem install railyard
  rbenv rehash

  # Rails
  echo  Installing rails skeleton
  railyard version $RAILS_VERSION

echo ---
echo rails installation is complete!
echo ===================================
