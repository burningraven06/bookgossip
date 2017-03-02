json.extract! book, :id, :title, :references, :publication_date, :cover_page, :book_summary, :created_at, :updated_at
json.url book_url(book, format: :json)