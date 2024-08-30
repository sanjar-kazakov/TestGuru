class AddColumnToUserAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :user_answers, :success, :boolean, default: false
  end
end
