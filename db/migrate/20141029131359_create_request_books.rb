class CreateRequestBooks < ActiveRecord::Migration
  def change
    create_table :request_books do |t|
      t.references :book, index: true
      t.belongs_to :user

      t.timestamps
    end
  end
end
