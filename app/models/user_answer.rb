class UserAnswer < ApplicationRecord

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  SUCCESS_PERCENTAGE = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def passage_percentage
      correct_questions / test.questions.count.to_f * 100
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def success?
    passage_percentage >= SUCCESS_PERCENTAGE
  end

  private

  def before_validation_set_question
    if persisted?
      next_question
    else
      first_question
    end
  end

  def first_question
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answers_count
    correct_answers.count
  end

  def correct_answer?(answer_ids)
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct(true)
  end

end
