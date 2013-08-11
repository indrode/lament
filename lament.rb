require 'sinatra'
require 'dalli'

configure { set :server, :puma }

require 'redcarpet'
require 'haml'
require 'exifr'
require 'json'

CURRENT_VERSION = "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
ARTICLE_REGEX = /\/([a-z\_]+)\./

set :root, File.dirname(__FILE__)
set :environment, :production
set :haml, layout_engine: :haml, layout: :index
set :markdown, layout_engine: :haml, layout: :index
set :config, JSON.parse(File.read("#{Dir.pwd}/config/config.json"))

set :cache, Dalli::Client.new
set :enable_cache, true
set :short_ttl, 400
set :long_ttl, 4600

# displays the home page with the latest article
get '/' do
  @type = 'home'
  @sha = nil # WIP
  # latest = Dir.glob('articles/*.markdown').max_by {|f| File.mtime(f)}
  # latest = latest.scan(ARTICLE_REGEX).flatten.first
  latest = Article.last
  article = get(latest)
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
  @articles = Article.find_all.keys.reverse

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
    article = get(params[:article])
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

def get(key, time_to_live=settings.long_ttl)
  if settings.cache.get(key) == nil
    log :cache, "writing key: #{key}"
    settings.cache.set(key, File.read("articles/#{key}.markdown"), ttl=time_to_live+rand(100))
  end
  return settings.cache.get(key)
end