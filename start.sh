#!/bin/bash
bundle check || bundle install

yarn install

bundle exec rails webpacker:install
 
bundle exec puma -C config/puma.rb
