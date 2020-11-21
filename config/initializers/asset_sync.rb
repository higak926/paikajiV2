AssetSync.configure do |config|
  config.fog_provider = 'AWS'
  config.fog_directory = ENV['AWS_BUCKET_NAME']
  config.manifest = true
  config.fog_region = ENV['AWS_REGION']
end
