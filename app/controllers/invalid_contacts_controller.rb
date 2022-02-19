# frozen_string_literal: true

# InvalidContactsController class
class InvalidContactsController < ApplicationController
  def index
    @user = current_user
    @invalid_contacts = @user.invalid_contacts.paginate(page: params[:page], per_page: 20)
  end

  def create
    @invalid_contact = @user.invalid_contacts.new(invalid_contact_params)
  end

  def upload
    UploadCsv.new(current_user, params[:file]).upload

    redirect_to invalid_contacts_path, notice: "Invalid Contacts Added Successfully"
  end

  private

  def invalid_contact_params
    params.require(:invalid_contact).permit(:name, :email, :phone, :address, :credit_card)
  end
end
