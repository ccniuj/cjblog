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

  def update_tags tag_ids
    self.article_tags.destroy_all
    tag_ids.each do |tag_id|
      self.article_tags.create tag_id: tag_id
    end
  end
end
