json.extract! topic, :id, :heading, :body, :user_id, :group_id, :default_avatar, :created_at, :updated_at
json.url topic_url(topic, format: :json)