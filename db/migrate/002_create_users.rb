class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image
      t.string :uid

    end
  end
end
