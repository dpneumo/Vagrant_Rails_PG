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
adapter: :$DB
encoding: unicode
host: localhost
pool: 5
username: $DBUSER
password: $DBPASS
development:
<<: *default
database: $MYAPP_development
min_messages: warning
test:
<<: *default
database: $MYAPP_test
production:
<<: *default
database: $MYAPP_production
password: <%= ENV['MYAPP_DATABASE_PASSWORD'] %>
EOF
sudo chmod 644 "$DBYML"

# Assure all required Gems are installed
bundle install

# Create DB (Once only)
rake db:create

# Start rails server
#rails server -b 0.0.0.0

echo ===================================
