class ChangeTableName < ActiveRecord::Migration
  def self.up
    rename_table :users_tables, :users
  end

  def self.down
    rename_table :users, :users_tables
  end
end
