json.extract! review, :id, :heading, :review, :references, :books, :owner, :status, :publication_date, :date, :created_at, :updated_at
json.url review_url(review, format: :json)