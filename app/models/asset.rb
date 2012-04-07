class Asset < ActiveRecord::Base
  belongs_to :post
  has_attached_file :asset, :styles => { :large => "640x480", :medium => "300x300>", :thumb => "100x100>" }
   has_attached_file :photo,
        :storage => :s3,
        :bucket => ENV['StarScream'],
        :s3_credentials => {
          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
        }
end
