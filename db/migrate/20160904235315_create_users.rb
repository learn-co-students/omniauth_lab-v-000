class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :uid

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :uid, unique: true
  end
end
