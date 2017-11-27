class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :image
      t.string :name

      t.timestamps null: false
      
    end
  end
end
