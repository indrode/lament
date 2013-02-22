class Article
  attr_reader :name, :number, :title, :tldr, :date, :tags, :haml, :hidden

  class << self
    def find(name)
      Article.new(Catalog::ARTICLES.fetch(name.to_sym))      
    end

    def find_by_number(n)
      hash = Catalog::ARTICLES.detect { |hash| hash[1][:number] == n }      
      Article.find(hash.first.to_s)
    end

    def last
      Catalog::LIST.last
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

  def find_next
    self.class.find_by_number(number + 1)
  end

  private

  def format_date(d)
    d.strftime("%m/%d/%Y") if d
  end
end