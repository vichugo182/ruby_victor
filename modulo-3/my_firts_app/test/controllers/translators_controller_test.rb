require 'test_helper'

class TranslatorsControllerTest < ActionController::TestCase
  test "should get translate" do
    get :translate
    assert_response :success
  end

  test "should get detect" do
    get :detect
    assert_response :success
  end

  test "should get lenguages" do
    get :lenguages
    assert_response :success
  end

end
