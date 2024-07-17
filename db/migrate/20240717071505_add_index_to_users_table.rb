class AddIndexToUsersTable < ActiveRecord::Migration[6.1]
  def change
    unless index_exists?(:users, :first_name)
      add_index :users, :first_name
    end
  end
end
