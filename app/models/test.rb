class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :user_answers
  has_many :users, through: :user_answers

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :difficult, -> { where(level: (5..Float::INFINITY)) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :sort_by_category_name, -> (category_name) {
    joins(:category)
    .where(categories: {title: category_name})
    .order(title: :desc)
    .pluck(:title)
  }

  # еще вариант нашел с includes. Я так понял, что с ним лучше, он снижает кол-во запросов к бд,
  # выполняя один запрос для загрузки всех необходимых данных за раз
  # scope :sort_by_category_name, -> (category_name) {
  #   includes(:category)
  #   .where(categories: {title: category_name})
  #   .order(title: :desc)
  #   .pluck(:title)
  # }
end
