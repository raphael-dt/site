require "test_helper"

class Admin::SignalementsControllerTest < ActionDispatch::IntegrationTest
  test "should get resolve" do
    get admin_signalements_resolve_url
    assert_response :success
  end

  test "should get show" do
    get admin_signalements_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_signalements_index_url
    assert_response :success
  end
end
