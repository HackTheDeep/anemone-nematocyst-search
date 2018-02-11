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








require 'csv'
data_path = '../anemone-nematocyst-database/image_database.csv'
CSV.foreach(data_path, headers: true) do |row|
  if row['path'].match(/Streamline/) # only load streamline process image dir
    Image.create!(
      :url => 'images/sample.jpg',
      :filename => row['path'],
      :taxa => row['taxa'],
      :specimen => row['specimen'],
      :tissue => row['tissue'],
    )
  end
end


# # should only be necessary once to generate asset.  then just commit them
# Image.all.each do |img|
#   file = "./rawimg/#{img.filename}"
#   if File.exist?(file)
#     puts "Converting file #{file}..."
#     output = Digest::SHA256.hexdigest(img.filename) + '.jpg'
#     system("convert '#{file}' -units PixelsPerInch -density 72 -quality 80 -resize 200 ./public/images/#{output}")
#   else
#     puts "Couldn't find file at #{file}"
#   end
# end

# puts "Finished converting files"


Image.all.each do |img|
  output = Digest::SHA256.hexdigest(img.filename) + '.jpg'
  img.url = "images/#{output}"
  img.save!
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

puts "Finished adding metrics"
