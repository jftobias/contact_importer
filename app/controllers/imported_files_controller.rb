# frozen_string_literal: true

class ImportedFilesController < ApplicationController
  def index
    @user = current_user
    @imported_files = @user.imported_files
  end

  def create
    @imported_files = @user.imported_files.new(imported_file_params)
  end

  private

  def imported_file_params
    params.require(:imported_file).permit(:file, :name, :aasm_state)
  end
end
