# frozen_string_literal: true

require "csv"
# Upload CSV service
class UploadCsv
  def initialize(user, file)
    @user = user
    @file = file
  end

  def upload
    CSV.foreach(@file.path, headers: true, header_converters: :symbol) do |row|
      hash = {
        name: row[:name],
        date_of_birth: row[:date_of_birth],
        phone: row[:phone],
        address: row[:address],
        email: row[:email],
        credit_card: row[:credit_card].to_s[-4..-1],
        franchise: CreditCardValidations::Detector.new(row[:credit_card]).brand,
        user_id: @user.id
      }
      contact = Contact.create hash
      hash.merge!({ message: contact.errors.full_messages })
      if contact.errors.any?
        InvalidContact.create hash
      end
    end
  end
end
