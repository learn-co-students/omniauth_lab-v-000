class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :name
    end
  end
end
