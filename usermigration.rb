class CreateUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.string :fullname, null: false
            t.string :nick,     null: false
            t.integer :room,    null: false
            t.string :hostel,   null: false
            t.integer :phonenumber,    null: false
            t.string :email,    null: false
            
            t.timestamps
        end
        add_index :books, :user_id
    end
end