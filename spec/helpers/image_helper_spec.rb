require 'spec_helper'
require File.join(ROOT, 'helpers/image_helper.rb')

describe "#image_with_exif" do
  let(:file) { "some_path" }
  let(:exif_data) { mock("exif", iso_speed_ratings: 400, date_time: "2006-10-15T11:05:44-04:00") }
  let(:photo) { mock("photo", exposure_time: 2.0, f_number: 1.8, exif: exif_data) }

  it "#image_with_exif displays img tag and exif info" do
    EXIFR::JPEG.stub(:new).and_return photo

    image_with_exif(file).should == "<small>2.0s f1.8 ISO400 2006-10-15</small><br /><img src='/photos/some_path.jpg' class='wodom' width='710' alt='' /><br />"
  end
end