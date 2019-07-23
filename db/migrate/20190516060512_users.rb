class Users < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :uid, :limit => 8
      t.string :email
      t.string :image
    end
  end
end
