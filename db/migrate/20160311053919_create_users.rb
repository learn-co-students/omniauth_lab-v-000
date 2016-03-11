class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :info
      t.string :email

      t.timestamps null: false
    end
  end
end
