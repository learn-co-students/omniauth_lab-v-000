class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :age_range
      t.string :context

      t.timestamps null: false
    end
  end
end
