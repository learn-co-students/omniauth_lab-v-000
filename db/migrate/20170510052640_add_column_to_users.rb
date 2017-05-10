class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :integer, limit: 8
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
  end
end
