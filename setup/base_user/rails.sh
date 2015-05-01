#!/bin/bash

# rails.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
starting "Install rails"

gem install rails |
  tee -a /var/log/vagrant_setup.log
rbenv rehash |
  tee -a /var/log/vagrant_setup.log

completed "rails installation"
