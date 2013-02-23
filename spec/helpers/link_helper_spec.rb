require 'spec_helper'
require File.join(ROOT, 'helpers/link_helper.rb')

describe "#left_nav_link" do
  let(:link_string1) { left_nav_link(nil) }
  let(:link_string2) { left_nav_link(:a_page) }
  
  it "should include link to data archives if nil" do
    link_string1.should include("/archives")
  end

  it "should display 'view all articles' link" do
    link_string1.should include("view all articles")
    link_string1.should_not include("next article")
  end

  it "should include link to the correct page" do
    link_string2.should include("/a_page")
  end

  it "should display 'next article' link" do
    link_string2.should include("next article")
    link_string2.should_not include("view all articles")
  end
end

describe "#right_nav_link" do
  let(:link_string) { right_nav_link(:a_page) }
  
  it "should include link to the correct page" do
    link_string.should include("/a_page")
  end

  it "should display 'view all articles' link" do
    link_string.should include("previous article")
  end

end