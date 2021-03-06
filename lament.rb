require 'sinatra'
require 'dalli'
require 'redcarpet'
require 'haml'
require 'exifr'
require 'json'

CURRENT_VERSION = "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
ARTICLE_REGEX = /\/([a-z\_]+)\./

set :root, File.dirname(__FILE__)
set :environment, ENV['RACK_ENV']
set :haml, layout_engine: :haml, layout: :index
set :markdown, layout_engine: :haml, layout: :index
set :config, JSON.parse(File.read("#{Dir.pwd}/config/config.json"))

set :cache, Dalli::Client.new
set :enable_cache, true
set :short_ttl, 300
set :long_ttl, 3600

# displays the home page with the latest article
get '/' do
  get_vars!
  @type = 'home'
  @sha = nil # WIP
  # latest = Dir.glob('articles/*.markdown').max_by {|f| File.mtime(f)}
  # latest = latest.scan(ARTICLE_REGEX).flatten.first
  latest = Article.last
  article = get(latest)
  @meta = Article.find(latest.to_sym)
  @prev = @meta.previous
  @next = @meta.next
  @permatitle = ' - Lamenting Robot'

  markdown article
end

# displays the archives page
get '/archives' do
  get_vars!
  @type = 'data'
  @meta = Article.new(
    haml: true,
    tldr: 'This space contains a list of all archived data pages published to date.'
  )
  @articles = Article.find_all.keys.reverse

  haml :data_archive
end

# displays the contact page including contact form and social links
get '/contact' do
  get_vars!
  @recent_scrobbles = Lastfm.new.recent_scrobbles
  @type = 'human'
  @meta = Article.new(
    haml: true,
    tldr: 'Contact stuff is here.'
  )
  haml :contact
end

# displays photo page
get '/wodom' do
  get_vars!
  @type = 'wodom'
  @meta = Article.new(
    haml: true,
    tldr: 'View current world domination progress updates here.'
  )
  haml :wodom
end

# displays stack info, and other general bits and pieces tbd
# WIP
get '/maintenance' do
  get_vars!
  @meta = Article.new(haml: true)
  haml :maintenance
end

# displays all markdown files in /articles
get '/:article/?' do
  get_vars!
  begin
    @meta = Article.find(params[:article])
    article = get(params[:article])
    @permatitle = " - #{@meta.title}"
    fail if @meta.hidden

    @prev = @meta.previous
    @next = @meta.next
    markdown article
  rescue
    log :not_found, params[:article]
    not_found
  end
end

not_found do
  get_vars!
  @meta = Article.new(title: 'Error 404', haml: true)
  haml :'404'
end

error do
  get_vars!
  @meta = Article.new(title: 'Error 505', haml: true)
  haml :'500'
end

def get_vars!
  counts = Article.count
  @article_count = counts[:articles]
  @photo_count = counts[:photos]
end

def log(type, message)
  logger.info "#{type.upcase} #{message}"
end

def get(key)
  ttl = settings.long_ttl + rand(100)
  if settings.cache.get(key).nil?
    log :cache, "writing key: #{key}"
    settings.cache.set(key, File.read("articles/#{key}.markdown"), ttl)
  end

  log :cache, "reading key: #{key}"
  settings.cache.get(key)
end
