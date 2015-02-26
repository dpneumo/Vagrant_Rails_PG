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

echo ---
echo rails installation is complete!
echo ===================================
