class AddDefaultStatusToAnswers < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:answers, :status, false)
  end
end
