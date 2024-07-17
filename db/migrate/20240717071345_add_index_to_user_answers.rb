class AddIndexToUserAnswers < ActiveRecord::Migration[6.1]
  def change
    add_index :user_answers, :correct_questions
  end
end
