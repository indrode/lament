class Article
  attr_reader :name, :number, :title, :tldr, :date, :tags, :haml, :hidden

  class << self
    def find(name)
      Article.new(Catalog::ARTICLES.fetch(name.to_sym))
    end

    def last
      Catalog::LIST.last
    end

    def fetch(number)
      Catalog::LIST[number]
    end

    def find_all
      Catalog::ARTICLES
    end
  end
  
  def initialize(attrs)
    @number = attrs[:number]
    @title  = attrs[:title]
    @tldr   = attrs[:tldr]
    @date   = format_date(attrs[:date])
    @tags   = attrs[:tags]
    @haml   = attrs[:haml]
    @hidden = attrs[:hidden]
  end

  def is_haml?
    haml
  end

  def hidden?
    hidden
  end

  def next
    self.class.fetch(number + 1)
  end

  def previous
    self.class.fetch(number - 1)
  end

  private

  def format_date(d)
    d.strftime("%m/%d/%Y") if d
  end
end