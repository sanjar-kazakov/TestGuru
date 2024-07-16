class AddIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :answers, :correct
    add_index :categories, :title
    add_index :user_answers, :correct_questions
    add_index :users, :first_name
  end
end
