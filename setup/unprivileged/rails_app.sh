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

cd /vagrant

# Remove earlier version of $MY_RAILS_APP if it exists
if [ -d "$MY_RAILS_APP" ]; then sudo rm -Rf "$MY_RAILS_APP"; fi

# Create new Rails app
rails new "$MY_RAILS_APP" -d "$DB"
cd "$MY_RAILS_APP"

# Setup database.yml for Postgresql
sudo chmod 666 "$DBYML"

if [ ! -f "$ORIG_DBYML" ]; then sudo mv "$DBYML" "$ORIG_DBYML"; fi

sudo cat - > "$DBYML" <<EOF
default: &default
  adapter: $DB
  encoding: unicode
  host: localhost
  pool: 5
  username: $DBUSER
  password: $DBPASS

development:
  <<: *default
  database: ${MY_RAILS_APP}_development
  min_messages: warning

test:
  <<: *default
  database: ${MY_RAILS_APP}_test
  min_messages: warning

production:
  <<: *default
  database: ${MY_RAILS_APP}_production
  password: <%= ENV['MY_RAILS_APP_DATABASE_PASSWORD'] %>
EOF
sudo chmod 644 "$DBYML"

# Assure all required Gems are installed
bundle install

# Create DB (Once only)
rake db:create

# Start rails server
#rails server -b 0.0.0.0

echo ===================================
