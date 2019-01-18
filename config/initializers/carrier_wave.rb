require 'carrierwave/orm/activerecord'
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['aws_access_key_id'],
      :aws_secret_access_key => ENV['aws_secret_access_key'],
      :region                => ENV['S3_REGION']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end
