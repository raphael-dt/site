require "test_helper"

class SignalementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signalements_new_url
    assert_response :success
  end

  test "should get create" do
    get signalements_create_url
    assert_response :success
  end
end
