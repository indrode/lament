def current_page_path
  URI.parse(current_url).path
end

describe "Website navigation" do
  before(:each) do
    visit '/'
  end

  it "should navigate to central unit" do
    click_link "Central Unit"
    page.should have_content('Central Unit')
    current_page_path.should == "/"
  end

  it "should navigate to data file archives" do
    click_link "Data File Archives"
    page.should have_content('Data File Archives')
    current_page_path.should == "/archives"
  end

  it "should navigate to world domination" do
    click_link "World Domination"
    page.should have_content('World Domination')
    current_page_path.should == "/wodom"
  end

  it "should navigate to human footprint" do
    click_link "Human Footprint"
    page.should have_content('Human Footprint')
    current_page_path.should == "/contact"
  end
end