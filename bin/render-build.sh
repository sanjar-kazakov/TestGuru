#!/usr/bin/env bash
# Exit on error
set -o errexit

# Install dependencies
bundle install
yarn install

# Precompile assets
bundle exec rake assets:precompile
bundle exec rake assets:clean

# Run database migrations
bundle exec rake db:migrate

# Clean the database
bundle exec rake db:drop db:create

# Seed the database with data from seeds.rb
bundle exec rake db:seed
