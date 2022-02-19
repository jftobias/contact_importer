# frozen_string_literal: true

# Contacts controller class
class ContactsController < ApplicationController
  def index
    @user = current_user
    @contacts = current_user.contacts
  end

  def create
    @contact = @user.contacts.new(contact_params)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address, :credit_card)
  end
end
