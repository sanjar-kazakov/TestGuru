class RemoveForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_reference :categories, :test, foreign_key: true
    remove_reference :user_answers, :user, foreign_key: true
    remove_reference :user_answers, :test, foreign_key: true
    remove_reference :user_answers, :answer, foreign_key: true
  end
end
