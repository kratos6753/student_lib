class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :user, null:false
      t.string :isbn
      t.string :cover, default:'default-cover.png'
      t.string :title, null: false
      t.text :description, null: false
      t.string :author, null: false
      t.integer :pages, null:false
      t.string :genre, null:false
      t.boolean :request, null:false 

      t.timestamps
    end
    add_index :books, :user_id
  end
end
