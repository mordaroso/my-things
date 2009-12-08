require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "get new" do
    get :new
    assert_response :success
  end

  test "login" do
    post :create, :password => 'test'
    assert_redirected_to root_url
    assert @controller.logged_in?
  end

  test "wrong password" do
    post :create, :password => 'not test'
    assert_response :success
    assert_template :new
    assert !@controller.logged_in?
  end

  test "logout" do
    test_login
    post :destroy
    assert_redirected_to root_url
    assert !@controller.logged_in?
  end
end
