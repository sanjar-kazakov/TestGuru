class AddQuestionsAnswerOptionsNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:questions, :answer_options, false)
  end
end
