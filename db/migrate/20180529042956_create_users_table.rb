class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users_tables do |t|
      t.string   "name"
      t.integer  "uid"
    end
  end
end
