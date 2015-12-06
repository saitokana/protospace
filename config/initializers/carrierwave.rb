CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws[:access_key_id],
    aws_secret_access_key: Settings.aws[:secret_access_key],
    region: Settings.aws[:region]
  }

  config.fog_directory = 's3kana-bucket'
  config.fog_public = true
  config.cache_dir = "#{Rails.root}/tmp/uploads"

end
