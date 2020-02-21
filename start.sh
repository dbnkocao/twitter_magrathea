#!/bin/bash
bundle check || bundle install

yarn install

bundle exec rails webpacker:install

bin/delayed_job start
 
bundle exec puma -C config/puma.rb
