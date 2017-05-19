$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
ENVIRONMENT = ENV["RACK_ENV"] || "development"
require "bundler/setup"
Bundler.require(:default, ENVIRONMENT)
