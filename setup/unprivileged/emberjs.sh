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

cd /vagrant/$MYAPP

# Remove turbolinks from Gemfile:
# Replace lines containing '[Tt]urbolinks' with blank line,
# then remove comments and blank lines from Gemfile
sudo sed -i '/[Tt]urbolinks/ d' Gemfile

# Remove turbolinks from Layout
sudo sed -i "s/, 'data-turbolinks-track' => true//" app/views/layouts/application.html.erb

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
  config.ember.variant = :development\
' config/environments/test.rb

# Add to config/environments/development.rb
sudo sed -i'
/configure do/ a\
  config.ember.variant = :development\
' config/environments/development.rb

#Add to config/environments/production.rb
sudo sed -i'
/configure do/ a\
  config.ember.variant = :production\
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

mkdir app/views/home
sudo cat - > "app/views/home/index.html.erb" <<EOF
<!-- app/views/home/index.html.erb -->
EOF

sudo cat - > "app/assets/javascripts/templates/application.js.emblem" <<EOF
// app/assets/javascripts/templates/application.js.emblem
h1 Hello World
outlet
EOF

# This was not created by the Ember Rails generate command as expected
sudo cat - > "app/assets/javascripts/store.js.coffee" <<EOF
App.Store = DS.Store.extend()
App.ApplicationAdapter = DS.ActiveModelAdapter.extend()
EOF

echo ---
echo emberjs installation is complete!
echo ===================================
