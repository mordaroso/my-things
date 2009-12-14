require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  test "should get index" do
    login
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    login
    get :new
    assert_response :success
  end

  test "should create person" do
    login
    assert_difference('Person.count') do
      post :create, :person => {:name => 'hans', :email => 'hans@franz.com' }
    end

    assert_redirected_to people_path
  end

  test "should get edit" do
    login
    get :edit, :id => people(:sandra).to_param
    assert_response :success
  end

  test "should update person" do
    login
    put :update, :id => people(:sandra).to_param, :person => { }
    assert_redirected_to people_path
  end

  test "should destroy person" do
    login
    assert_difference('Person.count', -1) do
      delete :destroy, :id => people(:sandra).to_param
    end

    assert_redirected_to people_path
  end
end
