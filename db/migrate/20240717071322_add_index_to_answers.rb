class AddIndexToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_index :answers, :correct
  end
end
