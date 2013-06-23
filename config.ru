#!/usr/bin/env rackup
require File.expand_path("../config/boot", __FILE__)

unless ENV['RACK_ENV'] == 'production'
  map '/assets' do
    require 'sprockets'
    environment = Sprockets::Environment.new
    environment.append_path 'app/assets/javascripts'
    environment.append_path 'app/assets/stylesheets'
    run environment
  end
end

map '/' do
  use Rack::LiveReload unless ENV['RACK_ENV'] == 'production'
  run App
end