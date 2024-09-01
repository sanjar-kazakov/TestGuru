class PopulateSuccessForUserAnswers < ActiveRecord::Migration[6.1]
  def up
    UserAnswer.update_all(success: false)
  end

  def down
    UserAnswer.update_all(success: nil)
  end
end
