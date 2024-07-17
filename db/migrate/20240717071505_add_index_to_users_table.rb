class AddIndexToUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :first_name
  end
end
