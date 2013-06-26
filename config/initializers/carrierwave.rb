require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.permissions = 0666

  if Rails.env.production?
    config.storage = :fog
    config.enable_processing = true
    config.fog_credentials = {
        :provider => 'AWS',
        :aws_access_key_id => 'your aws access key',
        :aws_secret_access_key => 'aws secret key',
        :region => 'us-east-1'
    }

    config.fog_public = false
    config.fog_directory = 'file_cabinet'
    #config.fog_host = 'https://s3.amazonaws.com'
    #config.asset_host = 'http://JqueryDms.s3.amazonaws.com'
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
    config.fog_authenticated_url_expiration = 600
  else
    config.storage = :file
    config.enable_processing = false
  end
end
