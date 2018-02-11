feature_descriptions = [
  "organelle length",
  "organelle width",
  "capsule length",
  "capsule width",
]

feature_descriptions.each do |desc|
  Feature.create!(:desc => desc)
end

puts "Seeded features"










# files = Dir.glob("./rawdir/**/*")
# files.each do |file|
#   output = file.split('.').first + '.jpg'
#   puts system("convert #{file} -units PixelsPerInch -density 72 -quality 60 -resize 535 ./public/images/#{output}")
# end

# TODO: get images from public/images dir
images = [
  "image001.tiff",
  "image002.tiff",
  "image003.tiff",
  "image004.tiff",
  "image005.tiff",
  "image006.tiff",
  "image007.tiff",
  "image008.tiff",
  "image009.tiff",
]

images.each do |filename|
  Image.create!(:filename => filename, :url => 'images/sample.jpg')
end

features = Feature.all
Image.all.each do |image|
  features.each do |feature|
    metric = if feature.desc.match(/length/)
      rand(100) + 50
    else
      rand(20)
    end
    Measurement.create!(
      :image => image,
      :feature => feature,
      :metric => metric,
    )
  end
end
