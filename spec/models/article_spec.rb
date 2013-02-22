require 'spec_helper'
require File.join(ROOT, 'models/catalog.rb')
require File.join(ROOT, 'models/article.rb')

describe Article do
  let(:meta)      { Article.find(:hipster_ipsum) }
  let(:meta2)     { Article.find(:squid_lomo_chambray_high_life) }
  let(:article)   { Article.fetch(1) }

  it ".find should return article meta data" do
    meta.number.should == 0
    meta.title.should  == "Hipster Ipsum"
    meta.tldr.should   == "Because Lorem Ipsum is waaay too generic."
    meta.date.should   == "07/10/2011"
    meta.tags.should   == [1, 2, 3]
  end

  it ".fetch returns a specific article by index number" do
    article.should == :squid_lomo_chambray_high_life
  end

  it ".fetch returns nil if no matching article was found" do
    Article.fetch(19999).should be_nil
  end

  it "#is_haml? should return false by default" do
    meta.is_haml?.should be_false
  end

  it "#next should return the next article" do
    next_article = meta.next
    next_article.should == :squid_lomo_chambray_high_life
  end

  it "#previous should return the previous article" do
    previous_article = meta2.previous
    previous_article.should == :hipster_ipsum
  end
  
  it "#previous should always return an article" do
    previous_article = meta.previous
    previous_article.should_not be_nil
    previous_article.should be_instance_of(Symbol)
  end

end