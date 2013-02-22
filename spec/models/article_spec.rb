require 'spec_helper'
require File.join(ROOT, 'models/catalog.rb')
require File.join(ROOT, 'models/article.rb')

describe Article do
  let(:meta)      { Article.find(:hipster_ipsum) }
  let(:next_meta) { Article.find_by_number(1) }

  it ".find returns article meta data" do
    meta.number.should == 0
    meta.title.should  == "Hipster Ipsum"
    meta.tldr.should   == "Because Lorem Ipsum is waaay too generic."
    meta.date.should   == "07/10/2011"
    meta.tags.should   == [1, 2, 3]
  end

  it ".find_by_number" do
    next_meta.number.should == 1
    next_meta.title.should  == "Squid Lomo Chambray High Life"
    next_meta.tldr.should   == "Everything you ever needed to know in life. Ever."
  end

  it "#is_haml? should return false by default" do
    meta.is_haml?.should be_false
  end

  it "#find_next should return the next article" do
    next_article = meta.find_next
    next_article.should_not be_nil
    next_article.should be_instance_of(Article)
    next_article.number.should == 1
    next_article.title.should == "Squid Lomo Chambray High Life"
  end

end