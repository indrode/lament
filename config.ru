require 'rubygems'
require 'bundler'

Bundler.require

require './lament'

run Sinatra::Application

directories = %w(models lib helpers)
directories.each do |directory|
  Dir["#{File.dirname(__FILE__)}/#{directory}/*.rb"].each do |file|
    require file
  end
end
