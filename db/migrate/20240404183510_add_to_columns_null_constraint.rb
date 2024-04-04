class AddToColumnsNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:categories, :title, false)
    change_column_null(:users, :name, false)
    change_column_null(:users, :email, false)
    change_column_null(:users, :password, false)
    change_column_null(:questions, :question_text, false)
    change_column_null(:questions, :answer_options, false)
    change_column_null(:questions, :correct_answer, false)
  end
end
