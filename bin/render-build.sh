#!/usr/bin/env bash
# exit on error
set -o errxit

bundle install
yarn install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake dm:migrate