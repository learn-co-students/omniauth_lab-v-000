class RenameIdToUid < ActiveRecord::Migration
  def change
    rename_column :users, :id, :uid
  end
end
