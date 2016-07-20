class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :uid, limit: 8
      t.string :email
    end
  end
end
