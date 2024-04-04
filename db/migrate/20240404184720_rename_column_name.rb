class RenameColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column(:questions, :question_text, :body)
    rename_column(:answers, :user_answer, :body)
    rename_column(:answers, :status, :correct)
  end
end
