# frozen_string_literal: true

# User class created by devise
class User < ApplicationRecord
  attr_writer :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :validate_username
  validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, multiline: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value
                                    OR lower(email) = :value",
                                    { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_username
    return error.add(:username, :invalid) if User.where(email: username).exists?
  end
end
