class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.integer :uid, default: nil
		t.string :name
		t.string :email
		t.string :image, default: nil

      t.timestamps null: false
    end
  end
end
