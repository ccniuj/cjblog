class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  obfuscate_id

  has_attached_file :cover, styles: { origin:"600x600>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  def self.group_by_created_at
  	self.all.order('created_at DESC').reduce({}) do |result, article|
  		date = article.created_at.strftime('%Y年%-m月')
  		result[date] ||= []
  		result[date].push(article)
  		result
  	end
  end
end
