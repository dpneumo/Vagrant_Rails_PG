#!/bin/bash
#
# rails_app.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =       Begin New Rails App
echo =
echo ===================================

# Environment Vars
export PATH="$HOME/.rbenv/bin:${PATH}"
export PATH="$HOME/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash


# Application constants
MYAPP=ember-crm
DB=postgresql
DBYML=config/database.yml
ORIG_DBYML=config/database_orig.yml

# Create new Rails app
cd /vagrant
if ! [ -d "$MYAPP" ]
then
  rails new "$MYAPP" -d "$DB"
fi

cd "$MYAPP"

# Setup database.yml for Postgresql
sudo chmod 666 "$DBYML"
if [ ! -f "$ORIG_DBYML" ]
then
  sudo mv "$DBYML" "$ORIG_DBYML"
fi

sudo cat - > "$DBYML" <<EOF
default: &default
  adapter: postgresql
  encoding: unicode
  host: localhost
  pool: 5
  username: ember_crm
  password: Dragon123
development:
  <<: *default
  database: ember-crm_development
  min_messages: warning
test:
  <<: *default
  database: ember-crm_test
production:
  <<: *default
  database: ember_crm_production
  password: <%= ENV['EMBER-CRM_DATABASE_PASSWORD'] %>
EOF
sudo chmod 644 "$DBYML"

# Assure all required Gems are installed
bundle install

# Create DB (Once only)
rake db:create

# Start rails server
rails server -b 0.0.0.0

echo ===================================
