class AddQuestionsCorrectAnswerNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:questions, :correct_answer, false)
  end
end
