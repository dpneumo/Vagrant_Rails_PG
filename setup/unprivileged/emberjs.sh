#!/bin/bash

# emberjs.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =       Installing emberjs
echo =            based on
echo = http://ember.vicramon.com/hello-world
echo ===================================

cd /vagrant/ember-crm

# Remove turbolinks from Gemfile:
# Replace lines containing '[Tt]urbolinks' with blank line,
# then remove comments and blank lines from Gemfile
sudo sed -i 's/[Tt]urbolinks//' Gemfile
sudo sed -i -e 's/#.*//' -e 's/[ ^I]*$//' -e '/^$/ d' Gemfile

# Remove turbolinks from Layout
# ???

# Append ember gems to Gemfile
sudo cat - >> "Gemfile" <<EOF
gem 'ember-rails'
gem 'ember-source', '~> 1.8.1'
gem 'emblem-rails'
EOF

bundle

rails g ember:bootstrap -n App --javascript-engine coffee

rails g ember:install --tag=v1.5.0 --ember
rails g ember:install --tag=v1.0.0-beta.7 --ember-data

#Add to config/environments/test.rb
sudo sed -i'
/configure do/ a\
config.ember.variant = :development
' config/environments/test.rb

# Add to config/environments/development.rb
sudo sed -i'
/configure do/ a\
config.ember.variant = :development
' config/environments/development.rb

#Add to config/environments/production.rb
sudo sed -i'
/configure do/ a\
config.ember.variant = :production
' config/environments/production.rb

# Delete app/assets/javascripts/application.js
sudo rm app/assets/javascripts/application.js

sudo cat - > "config/routes.rb" <<EOF
Rails.application.routes.draw do
  root to:  'home#index'
end
EOF

sudo cat - > "app/controllers/home_controller.rb" <<EOF
class HomeController < ApplicationController
end
EOF

sudo cat - > "app/views/home/index.html.erb" <<EOF
<!-- app/views/home/index.html.erb -->
EOF

sudo cat - > "app/assets/javascripts/templates/application.js.emblem" <<EOF
// app/assets/javascripts/templates/application.js.emblem
h1 Hello World
outlet
EOF

echo ---
echo emberjs installation is complete!
echo ===================================
