#!/bin/bash

# projects_support.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
echo ===================================
echo =
echo =     Setting up Projects Support
echo =          $(timestamp)
echo ===================================

# Cannot be set by environmental_variables.sh
script_dir="/vagrant/setup/base_user"

. "$script_dir/../environmental_variables.sh"

# ~/projects was built by Vagrantfile
sudo chown -R vagrant:vagrant ~/projects

mkdir -p $APP_BUILD_FLDR        # ~/srv
mkdir -p ~/scripts

# Add ~/scripts to PATH
if ! grep '# Add scripts' ~/.profile ; then
  cat - >> ~/.profile <<EOF

# Add scripts to PATH if not yet included
if ! [[ \$PATH =~ (^|:)"\~/scripts"(:|$) ]]; then
  export PATH=\~/scripts:\$PATH
fi
EOF
fi
source ~/.profile

echo ---
echo Projects support has been setup!
echo ===================================
