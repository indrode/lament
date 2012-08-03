require 'sinatra'
require 'redcarpet'
require 'haml'

set :environment, :production
set :haml, :layout_engine => :haml, :layout => :index
set :markdown, :layout_engine => :haml, :layout => :index

get '/' do
  @message = "It is #{Time.now}."
  haml :home
end

get '/:article' do
  begin
    article = File.read("articles/#{params[:article]}.markdown")
    markdown article
  rescue
    not_found
  end
end

not_found do
  haml :'404'
end

error do
  haml :'500'
end