class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :username
      t.string :name
      t.string :password_confirmation
      t.string :uid
      t.string :email

      t.timestamps null: false
    end
  end
end
