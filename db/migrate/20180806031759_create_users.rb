class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :password_digest
      t.string :email
      t.binary :image
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

    end
  end
end
