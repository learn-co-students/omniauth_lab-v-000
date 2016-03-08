class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :info
      t.string :email

      t.timestamps null: false
    end
  end
end
