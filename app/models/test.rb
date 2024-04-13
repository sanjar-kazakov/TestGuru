class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :user_answers
  has_many :users, through: :user_answers

  def self.sort_by(category_name)
    Test.select(:title)
    .joins('JOIN categories ON tests.category_id = categories.id')
    .where('categories.title = :category_name', category_name: category_name)
    .order('tests.title DESC')
  end
end
