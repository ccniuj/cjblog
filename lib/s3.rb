require 'aws-sdk'

class S3
  class << self
    def upload folder_name, file, ext='.png'
      setup folder_name, ext
      p 'Uploading...'
      @obj.put body: file, content_type: (ext=='.svg' ? 'image/svg+xml' : '')
      @obj.acl.put({acl: 'public-read'})
      p "Uploading...done. Url: #{@obj.public_url}"
      @obj.public_url
    end

    private
    def setup folder_name , ext
      Aws.config.update({
        region: 'ap-southeast-1',
        credentials: Aws::Credentials.new(
          ENV['AWS_ACCESS_KEY_ID'],
          ENV['AWS_SECRET_ACCESS_KEY'])
      })
      bucket_name = ENV['S3_BUCKET_NAME']
      file_name = Time.now.to_i.to_s
      s3 = Aws::S3::Resource.new
      @obj = s3.bucket(bucket_name).object(folder_name + '/' + file_name + ext)
    end
  end
end
