class CreateBooksGenres < ActiveRecord::Migration
  def change
    create_table :books_genres, id: false do |t|
      t.belongs_to :genre, null: false
      t.belongs_to :book, null: false
    end
    add_index :books_genres, :genre_id
    add_index :books_genres, [:book_id, :genre_id] , unique: true
  end
end
