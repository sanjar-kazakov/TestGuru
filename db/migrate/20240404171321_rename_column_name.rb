class RenameColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column(:answers, :user_answer, :body)
    rename_column(:answers, :status, :correct)
    rename_column(:questions, :text, :body)
  end
end
