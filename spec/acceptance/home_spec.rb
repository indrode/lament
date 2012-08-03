require 'acceptance_helper'

describe "/" do
  it "should display 'Home Sweet Home'" do
    visit '/'
    page.should have_content('Home Sweet Home')
  end

  it "should not display 'abracadabra'" do
    visit '/'
    page.should have_no_content('abracadabra')
  end

  it "should display error page if article was not found" do
    visit '/some_missing_article'
    page.should have_content('Error 404')
  end

end

