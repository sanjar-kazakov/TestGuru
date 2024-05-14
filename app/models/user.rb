require 'digest/sha1'

class User < ApplicationRecord

  has_many :user_answers
  has_many :tests, through: :user_answers
  has_many :author_tests, foreign_key: "author_id", class_name: "Test"

  before_validation {self.name = name.capitalize}
  before_validation { self.email = email.downcase }

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_secure_password

  def history_by_level(level)
    tests.where(level: level)
    .pluck(:title)
  end

  def user_answer(test)
    user_answers.order(id: :desc).find_by(test_id: test.id)
  end

end
