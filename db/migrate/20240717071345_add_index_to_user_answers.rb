class AddIndexToUserAnswers < ActiveRecord::Migration[6.1]
def change
    unless index_exists?(:user_answers, :correct_questions)
      add_index :user_answers, :correct_questions
    end
  end
end
