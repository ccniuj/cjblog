class Portfolio < ActiveRecord::Base
  has_attached_file :cover, styles: { origin:"600x600>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
