#!/bin/bash

# nodejs-v0.12.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

starting " Install Node.js v0.12 (Debian/Ubuntu)"

# Based on:
# https://nodesource.com/blog/nodejs-v012-iojs-and-the-nodesource-linux-repositories
# https://docs.npmjs.com/getting-started/installing-node
# http://stackoverflow.com/questions/22152162/npm-cannot-install-dependencies-attempt-to-unlock-something-which-hasnt-been

# Note the new setup script name for Node.js v0.12
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

# Then install with:
sudo apt-get install -y nodejs

# Update npm
sudo npm install npm -g

# fixing-npm-permissions
# locks
sudo chown -R $USER ~/.npm/_locks

# npm config get prefix returns /usr rather than /usr/local for v0.12
# so placing global packages in ~/npm-global seems better choice
# npm-global will be owned by $USER this way
mkdir -p ~/npm-global
npm config set prefix '~/npm-global'

if ! grep '# Add npm-global/bin' ~/.profile ; then
  cat - >> ~/.profile <<-EOF

	# Add npm-global/bin to PATH if not yet included
	if ! [[ \$PATH =~ (^|:)"\~/npm-global/bin"(:|$) ]]; then
	    export PATH=\~/npm-global/bin:\$PATH
	fi
EOF
fi && source ~/.profile

# install global tools
npm install -g jshint
npm install -g bower

completed "nodejs installation"
