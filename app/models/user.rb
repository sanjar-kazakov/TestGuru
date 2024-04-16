class User < ApplicationRecord
  has_many :user_answers
  has_many :tests, through: :user_answers
  has_many :author_tests, foreign_key: "author_id", class_name: "Test"

  def history_by_level(level)
    tests.where('level = :level', level: level)
    .pluck(:title)
  end
end
