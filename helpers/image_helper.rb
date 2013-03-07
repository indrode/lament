def image_with_exif(file)
  path = "#{File.dirname(__FILE__)}/../public/photos/#{file}.jpg"
  exposure = EXIFR::JPEG.new(path).exposure_time.to_s.gsub(/\/1$/, '')
  f_number = EXIFR::JPEG.new(path).f_number.to_f
  iso_speed = EXIFR::JPEG.new(path).exif.iso_speed_ratings

  "<small>#{exposure}s f#{f_number} ISO#{iso_speed}</small><br /><img src='/photos/#{file}.jpg' class='wodom' width='710' alt='' /><br />"
end