class AddReferenceToTables < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_answers, :user, foreign_key: true
    add_reference :user_answers, :test, foreign_key: true
  end
end
