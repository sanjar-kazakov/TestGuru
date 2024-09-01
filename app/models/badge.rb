class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :kept, -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.current)
  end
end
