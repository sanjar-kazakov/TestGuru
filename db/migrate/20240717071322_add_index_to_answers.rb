class AddIndexToAnswers < ActiveRecord::Migration[6.1]
  def change
    unless index_exists?(:answers, :correct)
      add_index :answers, :correct
    end
  end
end
