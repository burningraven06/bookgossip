json.extract! author, :id, :name, :date_of_birth, :bio, :avatar, :created_at, :updated_at
json.url author_url(author, format: :json)