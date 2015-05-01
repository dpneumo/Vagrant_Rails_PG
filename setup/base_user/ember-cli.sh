#!/bin/bash

# ember-cli.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
starting " Install ember-cli"

npm install -g ember-cli |
  tee -a /var/log/vagrant_setup.log

completed "ember-cli installation"
