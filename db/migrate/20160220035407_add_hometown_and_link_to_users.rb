class AddHometownAndLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hometown, :string
    add_column :users, :link, :string
  end
end
