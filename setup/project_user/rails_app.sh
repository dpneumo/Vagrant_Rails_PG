#!/bin/bash
#
# rails_app.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
starting " Begin New Rails App"

cd $SYNCED_APPS_FLDR/$MY_APP

# Remove earlier version of the rails app if it exists
if [ -d rails ]; then sudo rm -Rf rails; fi

# Create new Rails app
rails new myrails -B -S -d "$DB" | tee -a /var/log/vagrant_setup.log
mv myrails rails
cd rails

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
bundle install | tee -a /var/log/vagrant_setup.log

# Create DB (Once only)
rake db:create | tee -a /var/log/vagrant_setup.log

# Start rails server
#rails server -b 0.0.0.0

completed "rails app setup"
