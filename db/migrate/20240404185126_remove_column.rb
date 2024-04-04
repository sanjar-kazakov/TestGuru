class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :answer_options, :string
    remove_column :questions, :correct_answer, :string
  end
end
