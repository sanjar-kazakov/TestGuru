class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :questions, dependent: :destroy
  has_many :user_answers
  has_many :users, through: :user_answers

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :difficult, -> { where(level: (5..Float::INFINITY)) }

  scope :kept, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }

  scope :sort_by_category_name, -> (category_name) {
    joins(:category)
    .where(categories: {title: category_name})
  }

  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }

  def self.sort_by(category_name)
    sort_by_category_name(category_name).order(title: :desc).pluck(:title)
  end

  def soft_delete
    update(deleted_at: Time.current)
  end

  def self.published_tests
    where(published: true)
  end

  def self.unpublished_tests
    where(published: false)
  end


  def publish_test
    update(published: !published)
  end

  def published?
    self.published
  end

end
