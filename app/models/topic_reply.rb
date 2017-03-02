class TopicReply < ApplicationRecord
	belongs_to :user
	belongs_to :topic
	
	validates :content, presence: true
	validates :user_id, presence: true
	validates :topic_id, presence: true
end
