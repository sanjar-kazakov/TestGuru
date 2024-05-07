class AddColumnsUserAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :user_answers, :correct_questions, :integer, default: 0
    add_reference :user_answers, :current_question, foreign_key: { to_table: :questions }
  end
end
