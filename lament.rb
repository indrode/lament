require 'sinatra'
require 'redcarpet'
require 'haml'
require 'exifr'

ARTICLE_REGEX = /\/([a-z\_]+)\./

set :root, File.dirname(__FILE__)
set :environment, :production
set :haml, layout_engine: :haml, layout: :index
set :markdown, layout_engine: :haml, layout: :index

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
  @type = 'home'
  @sha = nil # WIP
  # latest = Dir.glob('articles/*.markdown').max_by {|f| File.mtime(f)}
  # latest = latest.scan(ARTICLE_REGEX).flatten.first
  latest = Article.last
  article = File.read("articles/#{latest}.markdown")
  @meta = Article.find(latest.to_sym)
  @prev = @meta.previous
  @next = @meta.next
  @permatitle = " - Lamenting Robot"

  markdown article
end

# displays the archives page
get '/archives' do
  @type = 'data'
  @meta = Article.new({
    haml: true,
    tldr: "This space contains a list of all archived data pages published to date."
  })
  @articles = Article.find_all

  haml :data_archive
end

# displays the contact page including contact form and social links
get '/contact' do
  @type = 'human'
  @meta = Article.new({
    haml: true,
    tldr: "Contact stuff is here."
  })
  haml :contact
end

# displays photo page
get '/wodom' do
  @type = 'wodom'
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
    @permatitle = " - #{@meta.title}"
    raise if @meta.hidden

    @prev = @meta.previous
    @next = @meta.next
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
  @meta = Article.new({title: 'Error 505', haml: true})
  haml :'500'
end