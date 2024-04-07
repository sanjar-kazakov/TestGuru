class UserAnswer < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :answer
end
