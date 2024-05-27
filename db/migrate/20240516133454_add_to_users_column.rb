class AddToUsersColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string, default: '', null: false
    add_column :users, :type, :string, default: 'User', null: false
    add_index :users, :type
  end
end
