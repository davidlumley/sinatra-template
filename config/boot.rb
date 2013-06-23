ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, ENV['RACK_ENV'].to_sym)
Dir.glob(File.expand_path('../../app/app**', __FILE__), &method(:require))
