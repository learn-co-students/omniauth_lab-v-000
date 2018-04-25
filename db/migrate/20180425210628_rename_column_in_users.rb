class RenameColumnInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :password_digest, :uid
  end
end
