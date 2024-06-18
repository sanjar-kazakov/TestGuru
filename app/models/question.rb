class Question < ApplicationRecord

  has_many :gists
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true

end
