class AddIdColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
  end
end
