class Book < ApplicationRecord
	validates :title, presence: true, length:{maximum: 100}
	validates :author_id, presence: true
	validates :publisher_id, presence: true
	validates :genres, presence:true
	validates :publication_date, presence:true
	validates :book_summary, presence: true, length:{maximum: 1000}
	validates :twitter_username, uniqueness: true
	belongs_to :author
	belongs_to :publisher
	belongs_to :user

	has_and_belongs_to_many :genres
	has_many :reviews

	has_attached_file :cover_page, 	styles: {extralarge:"512x512>", large: "256x256>", medium: "128x128> ", thumb: "64x64>"}, url: "/uploads/book/:id/:attachment/:style/:basename.:extension",	default_url: ':style/default_book.png' 

	validates_attachment_content_type :cover_page, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]

	def self.search(query)
		where("LOWER(title) LIKE ?", "%#{query.downcase}%")
	end

	def start_time
		publication_date
	end
	def classification
		"<i class='fa fa-book'></i>".html_safe
	end
	def description
		"Book '#{title}' was Published"
	end

end
