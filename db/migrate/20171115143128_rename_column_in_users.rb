class RenameColumnInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :iud, :uid
  end
end
