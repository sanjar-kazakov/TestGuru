class User < ApplicationRecord
  has_many :user_answers
  has_many :tests, through: :user_answers
  has_many :author_tests, foreign_key: "author_id", class_name: "Test"

  validates :name, :email, presence: true

  def history_by_level(level)
    tests.where(level: level)
    .pluck(:title)
  end

  def user_answer(test)
    user_answers.order(id: :desc).find_by(test_id: test.id)
  end

end
