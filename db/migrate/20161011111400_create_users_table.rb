class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :uid
    end
    add_index :users, :uid, :unique => true 
  end
end
