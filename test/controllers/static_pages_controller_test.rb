require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end

  test "should get cart_1" do
    get static_pages_cart_1_url
    assert_response :success
  end

  test "should get cart_2" do
    get static_pages_cart_2_url
    assert_response :success
  end

  test "should get cart_3" do
    get static_pages_cart_3_url
    assert_response :success
  end

  test "should get cart_4" do
    get static_pages_cart_4_url
    assert_response :success
  end

  test "should get cart_5" do
    get static_pages_cart_5_url
    assert_response :success
  end

end
