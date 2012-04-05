class Post < ActiveRecord::Base  
    attr_accessible :title, :content, :assets_attributes
    has_many :assets
    accepts_nested_attributes_for :assets, :allow_destroy => true  
    has_attached_file :photo,
        :storage => :s3,
        :bucket => ENV['S3_BUCKET_NAME'],
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
        }  
end
