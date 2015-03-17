#!/bin/bash

# rails.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =       Installing rails
echo =         $(timestamp)
echo ===================================

gem install rails
rbenv rehash

echo ---
echo rails installation is complete!
echo ===================================
