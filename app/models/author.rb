class Author < ApplicationRecord
	has_many :books
	validates :name, presence: true, length: {maximum: 100}
	validates :date_of_birth, presence: true
	validates :bio, presence:true, length:{maximum: 1000}

	has_attached_file :avatar, styles: {extralarge:"512x512>", large: "256x256>", medium: "128x128>", thumb: "64x64>"}, url: "/uploads/author/:id/:attachment/:style/:basename.:extension",	default_url: ':style/default_author.png' 

	validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]

	def self.search(query)
		where("name LIKE ?", "%#{query}%")
	end

	def start_time
		date_of_birth
	end

	def classification
		"<i class='fa fa-birthday-cake'></i>".html_safe
	end
	
	def description
		"Author #{name}'s Birthday"
	end
end
