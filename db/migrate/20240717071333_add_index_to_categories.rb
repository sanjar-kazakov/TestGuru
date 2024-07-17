class AddIndexToCategories < ActiveRecord::Migration[6.1]
  def change
    unless index_exists?(:categories, :title)
      add_index :categories, :title
    end
  end
end
