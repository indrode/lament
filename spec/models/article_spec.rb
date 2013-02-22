require 'spec_helper'
require File.join(ROOT, 'models/catalog.rb')
require File.join(ROOT, 'models/article.rb')

describe Article do
  let(:meta)      { Article.find(:hipster_ipsum) }
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

  it "#find_next should return the next article" do
    next_article = meta.find_next
    next_article.should == :squid_lomo_chambray_high_life
  end

end