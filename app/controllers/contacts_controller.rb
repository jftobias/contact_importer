# frozen_string_literal: true

# Contacts controller class
class ContactsController < ApplicationController
  def index
    @user = current_user
    @contacts = @user.contacts.order(:sort).paginate(page: params[:page], per_page: 20)
  end

  def create
    @contact = @user.contacts.new(contact_params)
  end

  def upload
    @user = current_user
    UploadCsv.new(@user, params[:file]).upload

    redirect_to contacts_path, notice: "Contacts Added Successfully"
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address, :credit_card)
  end
end
