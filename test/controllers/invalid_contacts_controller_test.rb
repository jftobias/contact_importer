# frozen_string_literal: true

require "test_helper"

class InvalidContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invalid_contacts_index_url
    assert_response :success
  end
end
