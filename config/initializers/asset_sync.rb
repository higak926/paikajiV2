AssetSync.configure do |config|
  config.fog_provider = 'AWS'
  config.fog_directory = ENV['AWS_BUCKET_NAME']
  config.aws_iam_roles = true
  config.fog_public = false
  config.fog_region = ENV['AWS_REGION']

  config.gzip_compression      = true
  config.manifest              = true

  config.add_local_file_paths do
    Dir.chdir(Rails.root.join('public')) do
      Dir[File.join(Webpacker.config.public_output_path, '/**/**')]
    end
  end
end
