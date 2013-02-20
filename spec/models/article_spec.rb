require 'spec_helper'
require File.join(ROOT, 'models/catalog.rb')
require File.join(ROOT, 'models/article.rb')

describe Article do
  let(:meta) { Article.find(:hipster_ipsum) }

  it ".find returns article meta data" do
    meta.number.should == 0
    meta.title.should  == "Hipster Ipsum"
    meta.tldr.should   == "Because Lorem Ipsum is waaay too generic."
    meta.date.should   == "07/10/2011"
    meta.tags.should   == [1, 2, 3]
  end

  it "#is_haml? should return false by default" do
    meta.is_haml?.should be_false
  end

end