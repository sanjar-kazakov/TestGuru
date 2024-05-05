class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  # validate :number_of_answers

  scope :correct, -> (correct) { where(correct: correct) }

  # def number_of_answers
  #   if question.answers.count > 4
  #     errors.add(message: "should have between 1 and 4 answers")
  #   end
  # end
end
