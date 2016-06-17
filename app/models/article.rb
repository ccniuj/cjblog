class Article < ActiveRecord::Base
  has_many :article_tags
  has_many :tags, through: :article_tags
  validates :title, presence: true, length: {minimum: 2}
  validates :name, uniqueness: true

  def self.group_by_created_at
  	self.all.order('created_at DESC').reduce({}) do |result, article|
  		date = article.created_at.strftime('%Y年%-m月')
  		result[date] ||= []
  		result[date].push(article)
  		result
  	end
  end
end
