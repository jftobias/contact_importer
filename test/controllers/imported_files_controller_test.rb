# frozen_string_literal: true

require "test_helper"

class ImportedFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get imported_files_index_url
    assert_response :success
  end
end
