class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name, null: false, limit: 45
      t.text :description

      t.timestamps
    end
    add_index :genres, :name, unique: true
  end
end
