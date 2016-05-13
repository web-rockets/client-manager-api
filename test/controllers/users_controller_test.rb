require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

end
