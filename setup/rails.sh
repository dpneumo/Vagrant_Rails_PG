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

provisioned=/home/vagrant/provisions/rails
if [ -f "$provisioned" ]
then
  echo "rails has already been provisioned"
else
  # Environment Vars
  export PATH="$HOME/.rbenv/bin:${PATH}"
  export PATH="$HOME/.rbenv/shims:${PATH}"
  export RBENV_SHELL=bash

  # Set ruby version
  rbenv local 2.2.0

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
