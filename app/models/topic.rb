class Topic < ApplicationRecord
	belongs_to :user
	belongs_to :group
	has_many :topic_replies
	
	validates :heading, presence: true, length:{maximum: 100}
	validates :body, presence: true
	validates :user_id, presence: true
	validates :group_id, presence: true

	has_attached_file :topic_icon, 	styles: {extralarge:"512x512>", large: "256x256>", medium: "128x128>", thumb: "64x64>"}, 	url: "/uploads/genre/:id/:attachment/:style/:basename.:extension",	default_url: ':style/default_topic.png' 
	validates_attachment_content_type :topic_icon, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]

end
