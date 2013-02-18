require 'sinatra'
require 'redcarpet'
require 'haml'

ARTICLE_REGEX = /\/([a-z\_]+)\./

set :root, File.dirname(__FILE__)
set :environment, :production
set :haml, :layout_engine => :haml, :layout => :index
set :markdown, :layout_engine => :haml, :layout => :index
set :indrode, :layout_engine => :haml, :layout => :index2

# view helpers
helpers do
  def link_to_sha(sha)
    if sha
      %Q(&nbsp; &middot; Rev. <a href="https://github.com/indrode/betabot-lucy/commit/#{sha}" />#{sha}</a>)
    end
  end

  def email_link
    %Q(<a href="mailto:indro@lamentingrobot.com" />indro (at) lamentingrobot (dot) com</a>)
  end
end

# displays the home page with the latest article
get '/' do
  @sha = nil # WIP
  latest = Dir.glob('articles/*.markdown').max_by {|f| File.mtime(f)}
  latest = latest.scan(ARTICLE_REGEX).flatten.first
  article = File.read("articles/#{latest}.markdown")
  puts latest
  @meta = Article.find(latest.to_sym)

  markdown article
end

get '/indro' do
  @meta = Article.new({
    haml: true,
    tldr: "This is a test."
  })
  # haml :restricted
  haml :indro, :layout => :index2
end

# to be moved to indrode.com
get '/resume' do
  # haml :resume
  haml :restricted
end

# displays the archives page
get '/archives' do
  @meta = Article.new({
    haml: true,
    tldr: "This space contains a list of all archived data pages published to date."
  })
  @articles = Article.find_all

  haml :data_archive
end

# displays the contact page including contact form and social links
get '/contact' do
  @meta = Article.new({
    haml: true,
    tldr: "Contact stuff is here."
  })
  haml :contact
end

# displays photo page
get '/wodom' do
  @meta = Article.new({
    haml: true,
    tldr: "View current world domination progress updates here."
  })
  haml :wodom
end

# displays stack info, and other general bits and pieces tbd
# WIP
get '/maintenance' do
  @meta = Article.new({haml: true})
  haml :maintenance
end

# displays all markdown files in /articles
get '/:article/?' do
  begin
    article = File.read("articles/#{params[:article]}.markdown")
    @meta = Article.find(params[:article])
    markdown article
  rescue
    not_found
  end
end

not_found do
  @meta = Article.new({title: 'Error 404', haml: true})
  haml :'404'
end

error do
  haml :'500'
end