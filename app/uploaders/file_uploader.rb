class FileUploader < CarrierWave::Uploader::Base
  def cache_dir
    "#{Rails.root}/public/uploads/tmp"
  end

  def store_dir
    "#{Rails.root}/public/uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_white_list
    %w(gif jpg jpeg png pdf ppt doc xml txt xls)
  end

  def to_readable_name
    File.basename(original_filename.to_s, '.*').humanize
  end
end