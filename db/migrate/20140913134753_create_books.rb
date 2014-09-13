class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.integer :pages
      t.text :description
      t.belongs_to :user, null: false

      t.timestamps
    end
    add_index :books, :user_id
  end
end
