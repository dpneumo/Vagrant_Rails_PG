#!/bin/bash

# projects_support.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
starting "Setup projects support"

# Cannot be set by environmental_variables.sh
script_dir="/vagrant/setup/base_user"

. "$script_dir/../environmental_variables.sh"

# ~/projects was built by Vagrantfile in synched project folder setup
sudo chown -R vagrant:vagrant ~/projects

mkdir -p $APP_BUILD_FLDR        # ~/srv
mkdir -p ~/scripts

# Add ~/scripts to PATH
if ! grep '# Add scripts' ~/.profile ; then
  cat - >> ~/.profile <<-EOF

	# Add scripts to PATH
	export PATH="$HOME/scripts:\$PATH"
EOF
fi && . ~/.profile

completed "project support setup"
