class Users < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :provider
      t.text :uid
      t.text :info
      t.text :email
      t.text :name
    end
  end
end
