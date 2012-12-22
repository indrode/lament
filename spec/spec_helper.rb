require File.join(File.dirname(__FILE__), '..', 'lament.rb')
require 'sinatra'
require 'rack/test'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
ROOT = File.dirname(__FILE__), '..'

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.color_enabled = true
end
