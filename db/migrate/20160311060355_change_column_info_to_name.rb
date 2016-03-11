class ChangeColumnInfoToName < ActiveRecord::Migration
  def change
    rename_column :users, :info, :name
    
  end
end
