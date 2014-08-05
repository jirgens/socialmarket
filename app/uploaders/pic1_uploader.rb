class Pic1Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  include CarrierWave::MimeTypes
  process :set_content_type

  process :resize_to_fill => [300, 300]

  version :thumb do
    process :resize_to_limit => [150, 150]
  end
end
