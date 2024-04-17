class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct, -> (correct) { where(correct: correct) }
end
