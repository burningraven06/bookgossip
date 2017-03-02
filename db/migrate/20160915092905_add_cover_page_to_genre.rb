class AddCoverPageToGenre < ActiveRecord::Migration[5.0]
  def change
    add_column :genres, :cover_page, :string
  end
end
