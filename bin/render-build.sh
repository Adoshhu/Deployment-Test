#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install --deployment --without development test

RAILS_ENV=production bundle exec rails assets:precompile
bundle exec rails assets:clean

RAILS_ENV=production bundle exec rails db:migrate

bundle exec rails db:seed
