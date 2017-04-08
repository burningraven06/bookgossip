class Genre < ApplicationRecord
	validates :name, presence:true, uniqueness:true 
	belongs_to :user
	has_and_belongs_to_many :books
	
	has_attached_file :cover_page, 	styles: {extralarge:"512x512>", large: "256x256>", medium: "128x128>", thumb: "64x64>"}, 	url: "/uploads/genre/:id/:attachment/:style/:basename.:extension",	default_url: ':style/default_genre.png' 
	validates_attachment_content_type :cover_page, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]

	def self.search(query)
		where("LOWER(name) LIKE ?", "%#{query.downcase}%")
	end
end
