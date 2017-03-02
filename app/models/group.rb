class Group < ApplicationRecord
	belongs_to :user
	has_many :memberships
	has_many :users, through: :memberships
	has_many :topics
	validates :name, presence: true, uniqueness: true

	has_attached_file :cover_page, styles: {extralarge:"512x512>", large: "256x256>", medium: "128x128>", thumb: "64x64>"}, url: "/uploads/group/:id/:attachment/:style/:basename.:extension",	default_url: ':style/default_group.png' 

	validates_attachment_content_type :cover_page, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]

	def self.search(query)
		where("name LIKE ?", "%#{query}%")
	end

end
