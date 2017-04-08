class Publisher < ApplicationRecord
	has_many :books
	belongs_to :user
	validates :name, presence: true, length: {maximum: 100}
	validates :address, presence: true, length:{maximum: 200}
	validates :website, presence:true, uniqueness: true, length:{ maximum:100 }
	validates :twitter_username, uniqueness:true

	has_attached_file :cover_page, styles: {extralarge:"512x512>", large: "256x256>", medium: "128x128>", thumb: "64x64>"}, url: "/uploads/publisher/:id/:attachment/:style/:basename.:extension", default_url: ':style/default_publisher.png' 

	validates_attachment_content_type :cover_page, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]

	def self.search(query)
		where("LOWER(name) LIKE ?", "%#{query.downcase}%")
	end

end
