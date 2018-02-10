feature_descriptions = [
  "cell length",
  "cell width",
  "capsule length",
  "capsule width",
]

feature_descriptions.each do |desc|
  Feature.create!(:desc => desc)
end

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
  Image.create!(:filename => filename)
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
