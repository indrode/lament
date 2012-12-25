require 'spec_helper'
require File.join(ROOT, 'models/catalog.rb')
require File.join(ROOT, 'models/article.rb')


describe Article do
  let(:meta) { Article.find(:lorem_ipsum) }

  it ".find returns article meta data" do
    meta.number.should == 0
    meta.title.should  == "Lorem Ipsum"
    meta.tldr.should   == "Lorem ipsum"
    meta.date.should   == "some_date"
    meta.tags.should   == [1, 2, 3]
  end

  it "#is_haml? should return false by default" do
    meta.is_haml?.should be_false
  end

end