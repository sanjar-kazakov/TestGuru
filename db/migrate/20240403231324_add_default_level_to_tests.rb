class AddDefaultLevelToTests < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:tests, :level, from: 0, to: 1)
  end
end
