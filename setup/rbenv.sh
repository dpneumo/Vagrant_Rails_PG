#!/bin/bash
#
# rbenv.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =         Installing rbenv
echo =
echo ===================================


provisioned=$VAGRANT_PROV_DIR/$RBENV_FLAG
if [ -f "$provisioned" ]
then
  echo "rbenv has already been provisioned"
else
  # Install rbenv
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc

  # Init rbenv
  source '/home/vagrant/.rbenv/libexec/../completions/rbenv.bash'
  rbenv rehash 2>/dev/null

  # Plugins directory
  mkdir -p ~/.rbenv/plugins
  cd ~/.rbenv/plugins
  echo '------ rbenv plugins ------'

  # Install ruby-build
  git clone https://github.com/sstephenson/ruby-build.git

  # Install rbenv-vars
  git clone https://github.com/sstephenson/rbenv-vars.git

  # Install rbenv-gemset
  git clone git://github.com/jf/rbenv-gemset.git

  # Set provisioned flag
  touch $provisioned
fi

echo ---
echo rbenv installation is complete!
echo ===================================
