#!/bin/bash
#
# git_config.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

starting "Git configuration"

# Install git
sudo apt-get install git |
  tee -a /var/log/vagrant_setup.log

# Configure git
git config --global color.ui true
git config --global user.name "Mitchell C Kuppinger"
git config --global user.email "dpneumo@gmail.com"

#ssh-keygen -t rsa -C "dpneumo@gmail.com"
#cat ~/.ssh/id_rsa.pub
# paste the output of the cat to:
# https://github.com/settings/ssh

completed "git configuration"
