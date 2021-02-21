AssetSync.configure do |config|
  config.fog_provider = 'AWS'
  config.fog_directory = ENV['AWS_BUCKET_NAME']
  config.aws_iam_roles = true
  config.fog_public = false
  config.fog_region = ENV['AWS_REGION']
end
