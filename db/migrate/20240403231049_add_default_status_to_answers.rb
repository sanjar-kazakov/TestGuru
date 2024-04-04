class AddDefaultStatusToAnswers < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:answers, :status, from: true, to: false)
  end
end
