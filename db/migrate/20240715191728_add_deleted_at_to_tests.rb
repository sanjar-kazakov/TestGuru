class AddDeletedAtToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :deleted_at, :datetime
    add_index :tests, :deleted_at
  end
end
