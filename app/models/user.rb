class User < ApplicationRecord

  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :validatable,
        :trackable,
        :confirmable

  has_many :user_answers
  has_many :tests, through: :user_answers
  has_many :gists
  has_many :author_tests, foreign_key: "author_id", class_name: "Test"
  has_many :contact_forms
  has_many :author_badges, foreign_key: "author_id", class_name: "Badge"
  has_many :user_badges
  has_many :badges, through: :user_badges

  # VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_validation {self.first_name = first_name.capitalize}
  before_validation {self.last_name = last_name.capitalize}
  before_validation { self.email = email.downcase }

  validates :email, presence: true, uniqueness: true #, format: { with: VALID_EMAIL }

  def history_by_level(level)
    tests.where(level: level)
    .pluck(:title)
  end

  def user_answer(test)
    user_answers.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def admin_user
    current_user.admin?
  end

end
