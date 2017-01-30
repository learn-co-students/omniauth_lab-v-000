class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :img
      t.string :fb_url
      t.string :location
      t.string :fb_id
      t.string :provider
      t.string :email
      t.integer :uid, limit: 8

      t.timestamps null: false
    end
  end
end
