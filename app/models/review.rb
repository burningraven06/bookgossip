class Review < ApplicationRecord
	belongs_to :book
	validates :heading, presence: true, length:{maximum:100}
	validates :review, presence: true
	validates :book_id, presence: true
	validates :status, presence: true
	belongs_to :user

	has_attached_file :cover_page, 	styles: {extralarge:"512x512>", large: "256x256>", medium: "128x128>", thumb: "64x64>"}, 	url: "/uploads/review/:id/:attachment/:style/:basename.:extension",	default_url: ':style/default_review.png' 
	validates_attachment_content_type :cover_page, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]

	def self.search(query)
		where("LOWER(heading) LIKE ?", "%#{query.downcase}%")
	end

	def start_time
		created_at
	end

	def title
		heading
	end
	def classification
		"<i class='fa fa-star'></i>".html_safe
	end
	def description
		"Review '#{heading}' was Created"
	end
end
