class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  # validates :title, presence: true, length: {minimum: 5}
  # obfuscate_id

  def self.group_by_created_at
  	self.all.order('created_at DESC').reduce({}) do |result, article|
  		date = article.created_at.strftime('%Y年%-m月')
  		result[date] ||= []
  		result[date].push(article)
  		result
  	end
  end
end
