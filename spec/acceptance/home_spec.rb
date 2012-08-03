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

end

