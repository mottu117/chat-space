CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: Settings.AWS_S3_PROVIDER,
    aws_access_key_id: Settings.AWS_S3_API_KEY,
    aws_secret_access_key: Settings.AWS_S3_API_SECRET,
    region: Settings.AWS_S3_REGION,
  }

  config.fog_directory = Settings.AWS_S3_FOG_DIRECTRY
  config.asset_host = Settings.AWS_S3_ASSET_HOST

  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ #ファイル名文字化け対応

end
