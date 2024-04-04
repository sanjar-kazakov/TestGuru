class RenameOldColumnToNewColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column(:questions, :question_text, :text)
  end
end
