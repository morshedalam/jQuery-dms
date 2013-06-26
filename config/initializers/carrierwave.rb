require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.permissions = 0666

  if Rails.env.production?
    config.storage = :fog
    config.enable_processing = false
    config.fog_credentials = {
        :provider => 'AWS',
        :aws_access_key_id => '',
        :aws_secret_access_key => '',
        :region => 'us-east-1'
    }

    config.fog_public = false
    config.fog_directory = ''
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
    config.fog_authenticated_url_expiration = 600
  else
    config.storage = :file
    config.enable_processing = false
    config.asset_host = 'http://localhost:3000'
  end
end
