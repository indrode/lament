require 'sinatra'
require 'redcarpet'
require 'haml'

get '/hi' do
  "Hello World!"
end

set :haml, :layout_engine => :haml, :layout => :index
set :markdown, :layout_engine => :haml, :layout => :index

get '/' do
  haml :home
end

get '/:article' do
  markdown File.read("articles/" + params[:article] + ".markdown")
end
