class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end

  version :thumb do
    process :resize_to_limit => [290, 250]
  end
end