require './lament'
# require 'coderay'
# require 'rack/codehighlighter'

# use Rack::Codehighlighter, :coderay, :element => "pre", :pattern => /\A:::(\w+)\s*\n/
run Sinatra::Application

directories = %w(models lib helpers)

directories.each do |directory|
  Dir["#{File.dirname(__FILE__)}/#{directory}/*.rb"].each do |file|
    require file
  end
end