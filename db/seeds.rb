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










files = Dir.glob('./rawimg/**/*.*')
files.each do |file|
  output = file.split('rawimg/').last.split('.')[-2] + '.jpg'
  puts system("convert #{file} -units PixelsPerInch -density 72 -quality 80 -resize 150 ./public/images/#{output}")
end

puts "Finished converting files"

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
