require 'spec_helper'
require 'capybara'
require 'capybara/dsl'

Dir[File.join(ROOT, "models/*.rb")].concat(Dir[File.join(ROOT, "helpers/*.rb")]).each {|file| require file }

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara::DSL
end