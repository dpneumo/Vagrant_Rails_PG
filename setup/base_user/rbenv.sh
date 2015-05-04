#!/bin/bash
#
# rbenv.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
starting "Install rbenv"

# Install rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

# Add rbenv paths to .profile
if ! grep '# Add rbenv paths' ~/.profile ; then
  cat - >> ~/.profile <<-EOF

	# Add rbenv paths to PATH if not yet included
	if ! [[ \$PATH =~ (^|:)"\~/.rbenv/bin"(:|$) ]]; then
	    export PATH=\~/.rbenv/bin:\$PATH
	fi

	if ! [[ \$PATH =~ (^|:)"\~/.rbenv/shims"(:|$) ]]; then
	    export PATH=\~/.rbenv/shims:\$PATH
	fi
EOF
fi && source ~/.profile

# Add rbenv init code to .profile
echo 'eval "$(rbenv init -)"' >> ~/.profile

# Init rbenv
source '/home/vagrant/.rbenv/libexec/../completions/rbenv.bash'
rbenv rehash

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
