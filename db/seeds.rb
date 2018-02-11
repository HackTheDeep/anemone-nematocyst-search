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




ol = Feature.where(:desc => "organelle length").first
ow = Feature.where(:desc => "organelle width").first
cl = Feature.where(:desc => "capsule length").first
cw = Feature.where(:desc => "capsule width").first

require 'csv'
data_path = '../anemone-nematocyst-database/image_database.csv'
CSV.foreach(data_path, headers: true) do |row|
  if row['path'].match(/Streamline/) # only load streamline process image dir
    i = Image.create!(
      :url => 'images/sample.jpg',
      :filename => row['path'],
      :taxa => row['taxa'],
      :specimen => row['specimen'],
      :tissue => row['tissue'],
    )

    Measurement.create!(
      :image => i,
      :feature => ol,
      :metric => row['length'],
    )

    Measurement.create!(
      :image => i,
      :feature => ow,
      :metric => row['width'],
    )

    Measurement.create!(
      :image => i,
      :feature => cl,
      :metric => row['length'],
    )

    Measurement.create!(
      :image => i,
      :feature => cw,
      :metric => row['width'],
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


