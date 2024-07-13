class ContactForm < ApplicationRecord
  belongs_to :user

  VALID_PHONE_NUMBER = /\A\d{1,15}\z/

  validates :body, presence: true
  validates :phone_number,  format: {  with: VALID_PHONE_NUMBER }
end
