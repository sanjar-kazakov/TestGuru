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

# Clear and seed the database
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:reset db:seed
