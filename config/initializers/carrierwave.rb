cfg = Rails.application.config_for(:explore_app)
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => cfg["aws_access_key"],
    :aws_secret_access_key  => cfg["aws_secret_key"],
    :region                 => 'us-west-2'
  }
  config.fog_directory  = cfg["cache_bucket"]
  config.fog_public     = true
  # config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
end
