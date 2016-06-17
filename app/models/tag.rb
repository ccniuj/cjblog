class Tag < ActiveRecord::Base
  has_many :article_tags, dependent: :nullify
  has_many :articles, through: :article_tags
end