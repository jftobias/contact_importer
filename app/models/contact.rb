# frozen_string_literal: true

require "csv"

# Contact class
class Contact < ApplicationRecord
  belongs_to :user

  NAME_VALIDATION = /\A[a-zA-Z -]+\z/.freeze
  EMAIL_VALIDATION = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  DATE_FORMAT = /\A\d{4}-\d{2}-\d{2}\z/.freeze

  validates :name, presence: true, format: { with: NAME_VALIDATION }
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_VALIDATION }
  validates :date_of_birth, presence: true, format: { with: DATE_FORMAT || "%F" }
  validates :phone, presence: true
  validates :address, presence: true
  validates :credit_card, presence: true
  validates :franchise, presence: true

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
