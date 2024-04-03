class AddQuestionsQuestionTextNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:questions, :question_text, false)
  end
end
