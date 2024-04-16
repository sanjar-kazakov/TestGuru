class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :user_answers
  has_many :users, through: :user_answers

  def self.sort_by(category_name)
    joins(:category)
    .where(categories: {title: category_name})
    .order(title: :desc)
    .pluck(:title)
  end
end
