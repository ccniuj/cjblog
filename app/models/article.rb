class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  obfuscate_id

  has_attached_file :cover, styles: { origin:"600x600>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

end
