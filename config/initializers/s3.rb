s3_config = YAML::load(File.open(File.join(Rails.root, 'config', 's3.yml')))[Rails.env]

S3_ACCESS_KEY_ID = ENV["S3_ACCESS_KEY_ID"] || s3_config['access_key_id']
S3_SECRET_ACCESS_KEY = ENV["S3_SECRET_ACCESS_KEY"] || s3_config['secret_access_key']
S3_BUCKET = ENV["S3_BUCKET"] || s3_config['bucket']

S3_ENABLED = !(S3_ACCESS_KEY_ID == "ACCESS_KEY_ID" || S3_SECRET_ACCESS_KEY == "SECRET_ACCESS_KEY" || S3_BUCKET == "BUCKET")
