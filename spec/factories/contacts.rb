# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.street_address }
    credit_card { Faker::Number.number(digits: 16) }
    franchise { CreditCardValidations::Detector.new(credit_card).brand }
    user_id { 1 }
  end
end
