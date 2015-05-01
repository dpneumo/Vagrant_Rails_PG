#!/bin/bash
#
# rbenv-first-ruby.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
starting "Install first ruby, Ruby $RUBY_VERSION"

# Install ruby version $RUBY_VERSION
rbenv install $RUBY_VERSION |
  tee -a /var/log/vagrant_setup.log
rbenv global $RUBY_VERSION |
  tee -a /var/log/vagrant_setup.log

gem update --system |
  tee -a /var/log/vagrant_setup.log

echo  Gems will install without local documentation
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

completed "ruby $RUBY_VERSION installation"
