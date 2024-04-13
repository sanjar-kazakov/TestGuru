class User < ApplicationRecord
  has_many :user_answers
  has_many :tests, through: :user_answers
  has_many :tests, foreign_key: "author_id"

  def history_by_level(level)
    Test.joins('JOIN user_answers ON tests.id = user_answers.test_id')
      .where('user_answers.user_id = :id AND tests.level = :level', id: self.id, level: level)
      .pluck(:title)
  end
end
