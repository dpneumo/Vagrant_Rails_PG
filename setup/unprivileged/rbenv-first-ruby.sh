#!/bin/bash
#
# rbenv-first-ruby.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo =================================
echo =
echo =    Installing first ruby
echo =     Ruby $RUBY_VERSION
echo =          $(timestamp)
echo =================================

# Install ruby version $RUBY_VERSION
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

echo  Gems will install without local documentation
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

echo ---
echo ruby $RUBY_VERSION has been installed!
echo ruby $RUBY_VERSION is the rbenv global ruby
echo ===================================
