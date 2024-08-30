class AddNotNullConstraintToUserAnswers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :user_answers, :success, false
  end
end
