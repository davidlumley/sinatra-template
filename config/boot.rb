require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)
Dir.glob(File.expand_path('../../app/app**', __FILE__), &method(:require))
