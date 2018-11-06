class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :name
      t.string :email
      t.string :image

      t.timestamps null: false
    end
    add_index :users, :uid
  end
end
