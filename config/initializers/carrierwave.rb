require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.permissions = 0666

  if Rails.env.production?
    config.storage = :fog
    config.enable_processing = true
    config.fog_credentials = {
        :provider => 'AWS',
        :aws_access_key_id => 'AKIAJQ5CKNWKQBR7DPBQ',
        :aws_secret_access_key => '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',
        :region => 'us-east-1'
    }

    config.fog_public = false
    config.fog_directory = 'jqdms'
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
    config.fog_authenticated_url_expiration = 600
  else
    #config.fog_host = 'https://s3.amazonaws.com'
    config.storage = :file
    config.enable_processing = false
    config.asset_host = 'http://localhost:3002'
  end
end
