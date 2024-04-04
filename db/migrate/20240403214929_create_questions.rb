class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.string :answer_options
      t.string :correct_answer

      t.timestamps
    end
  end
end
