#!/bin/bash
#
# rbenv.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
starting "Install rbenv"

# Install rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

# Add rbenv paths to .bashrc
if ! grep '# Add rbenv paths' ~/.bashrc ; then
  cat - >> ~/.bashrc <<-EOF

	# Add rbenv paths to PATH
	export PATH="$HOME/.rbenv/bin:\$PATH"
	eval "\$(rbenv init -)"
EOF
fi 

# Since source ~/.bashrc fails for the next script...
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

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

completed "rbenv installation"
