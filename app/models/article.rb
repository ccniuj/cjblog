class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  obfuscate_id

  has_attached_file :cover, styles: { origin:"600x600>", medium: "300x300>", thumb: "100x100>" }, 
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  def self.fake_data
  	self.all.each do |a|
  		a.update(:cover => 'http://www.xn--qkqu0tspm9n5b.tw/wp-content/uploads/2015/07/%E5%85%AD%E5%8D%81%E7%9F%B3%E5%B1%B1.jpg')
  	end
  end
end
