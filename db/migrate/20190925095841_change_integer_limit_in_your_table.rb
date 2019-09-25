class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :uid, :integer, limit: 30
  end
end
