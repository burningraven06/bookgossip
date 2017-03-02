json.extract! group, :id, :admin, :name, :description, :member_count, :post_count, :created_at, :updated_at
json.url group_url(group, format: :json)