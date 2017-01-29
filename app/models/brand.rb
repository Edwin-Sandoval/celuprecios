class Brand < ApplicationRecord
	has_attached_file :logo, styles: { normal: "200x200", mini: "75x75" }
  	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  	has_many :phones
  	has_many :articles
end
