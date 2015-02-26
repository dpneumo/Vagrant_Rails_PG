#!/bin/bash
#
# rbenv-first-ruby.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo =================================
echo =
echo =    Installing first ruby
echo =         Ruby 2.2.0
echo =
echo =================================

# Environment Vars
export PATH="$HOME/.rbenv/bin:${PATH}"
export PATH="$HOME/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash

# Install ruby version 2.2.0
rbenv install 2.2.0
rbenv global 2.2.0

echo  Gems will install without local documentation
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

echo ---
echo ruby 2.2.0 has been installed!
echo ruby 2.2.0 is the rbenv global ruby
echo ===================================
