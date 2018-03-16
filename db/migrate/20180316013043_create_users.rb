class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :image
      t.string :uid

      t.timestamps null: false
    end
  end
end
