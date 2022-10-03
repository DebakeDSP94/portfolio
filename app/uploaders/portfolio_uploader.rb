class PortfolioUploader < CarrierWave::Uploader::Base
include CarrierWave::MiniMagick
  storage :aws

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [800, 800]

  version :thumb do
    process resize_to_fill: [250, 250]
  end

  #Add an allowlist of extensions which are allowed to be uploaded.
  #For images you might use something like this:
  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
