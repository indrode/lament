def image_with_exif(title, file)
  # path = "#{File.dirname(__FILE__)}/../public/photos/#{file}.jpg"
  path = "/home/akira/lament/shared/photos/#{file}.jpg"
  exposure = EXIFR::JPEG.new(path).exposure_time.to_s.gsub(/\/1$/, '')
  f_number = EXIFR::JPEG.new(path).f_number.to_f
  iso_speed = EXIFR::JPEG.new(path).exif.iso_speed_ratings
  date_time = EXIFR::JPEG.new(path).exif.date_time.to_s

  date_time = date_time.match(/.*T/).to_s.chop
  "<strong>#{title}</strong> <small>#{exposure}s f#{f_number} ISO#{iso_speed} #{date_time}</small><br /><img src='/photos/#{file}.jpg' class='wodom' width='810' alt='' /><br />"
end
