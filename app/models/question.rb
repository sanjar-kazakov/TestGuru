class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true

  validate :number_of_answers, on: :create

  def number_of_answers
    unless (0..4).include?(answers.count)
      # тут указал диапазон от 0, так как если укажу 1..4, то не смогу создать вопрос не имея ответы.
      # либо придется создавать сначала ответы без привязки к вопросу, создать вопрос, а потом привязать ответы.
      # мне показалось нелогичным, поэтому сделал так
      errors.add(:answers, "should have between 1 and 4 answers")
    end
  end
end
