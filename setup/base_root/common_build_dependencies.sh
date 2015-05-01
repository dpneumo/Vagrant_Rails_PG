#!/bin/bash
#
# common_build_dependencies.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

starting "Install common build dependencies"

sudo apt-get update -y |
  tee -a /var/log/vagrant_setup.log > /dev/null

sudo apt-get install \
       git-core curl zlib1g-dev build-essential \
       libssl-dev libreadline-dev libyaml-dev \
       libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev \
       libcurl4-openssl-dev python-software-properties \
       libpq-dev -y |
  tee -a /var/log/vagrant_setup.log

sudo apt-get autoremove -y |
  tee -a /var/log/vagrant_setup.log

completed "common build dependencies installation"
