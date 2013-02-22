require 'acceptance_helper'

describe "Homepage" do
  it "should display 'Lamenting Robot'" do
    visit '/'
    page.should have_content('Lamenting Robot')
  end

  it "should not display 'abracadabra'" do
    visit '/'
    page.should have_no_content('abracadabra')
  end

  it "should display error page if article was not found" do
    visit '/some_missing_article'
    page.should have_content('Robot Error Code 404')
  end
end

describe "Article pages" do
  it "should display correct information" do
    visit '/hipster_ipsum'
    page.should have_content('Lamenting Robot')
    page.should_not have_content('404')
    page.should have_content('Hipster Ipsum')
  end

  it "should have link to next article" do
    visit '/hipster_ipsum'
    click_link "previous_article_link"
    page.should_not have_content('404')
    page.should have_content('Squid Lomo Chambray High Life')
  end
end

describe "Website navigation" do
  before(:each) do
    pending
    visit '/'
  end

  it "should navigate to central unit" do
    click_link "Central Unit"
    page.should have_content('Central Unit')
  end

  it "should navigate to data file archives" do
    click_link "Data File Archives"
    page.should have_content('Central Unit')
  end

  it "should navigate to world domination" do
    click_link "World Domination"
    page.should have_content('Central Unit')
  end

  it "should navigate to human footprint" do
    click_link "Human Footprint"
    page.should have_content('Central Unit')
  end
end
