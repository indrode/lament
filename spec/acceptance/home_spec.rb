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

  it "should have link to previous article" do
    visit '/squid_lomo_chambray_high_life'
    click_link "previous_article_link"
    page.should_not have_content('404')
    page.should have_content('Hipster Ipsum')
  end

  it "should have link to next article" do
    visit '/hipster_ipsum'
    click_link "next_article_link"
    page.should_not have_content('404')
    page.should have_content('Squid Lomo Chambray High Life')
  end
end

describe "Footer" do
  it "should display the current Ruby version and patchlevel" do
    visit '/'
    page.should have_content('Ruby 2.0.0-p247')
  end
end