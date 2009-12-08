require 'test_helper'

class ThingsControllerTest < ActionController::TestCase
  # index
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:things)
  end

  # new
  test "should get new" do
    login
    get :new
    assert_response :success
  end

  test "should not get new require logged in" do
    get :new
    assert_redirected_to root_url
    assert_equal 'Authentication required', flash[:error]
  end

  # create
  test "should create thing" do
    login
    assert_difference('Thing.count') do
      post :create, :thing => {:name => 'test'}
    end

    assert_redirected_to thing_path(assigns(:thing))
  end

  test "should not create thing require logged in" do
    assert_no_difference('Thing.count') do
      post :create, :thing => {:name => 'test'}
    end

    assert_redirected_to root_url
    assert_equal 'Authentication required', flash[:error]
  end

  # show
  test "should show thing" do
    get :show, :id => things(:one).to_param
    assert_response :success
  end

  # edit
  test "should get edit" do
    login
    get :edit, :id => things(:one).to_param
    assert_response :success
  end

  test "should not get edit require logged in" do
    get :edit, :id => things(:one).to_param

    assert_redirected_to root_url
    assert_equal 'Authentication required', flash[:error]
  end

  # update
  test "should update thing" do
    login
    put :update, :id => things(:one).to_param, :thing => { }
    assert_redirected_to thing_path(assigns(:thing))
  end

  test "should not update thing require logged in" do
    put :update, :id => things(:one).to_param, :thing => { }
    assert_redirected_to root_url
    assert_equal 'Authentication required', flash[:error]
  end

  # destroy
  test "should destroy thing" do
    login
    assert_difference('Thing.count', -1) do
      delete :destroy, :id => things(:one).to_param
    end

    assert_redirected_to things_path
  end

  test "should not destroy thing require logged in" do
    assert_no_difference('Thing.count') do
      delete :destroy, :id => things(:one).to_param
    end

    assert_redirected_to root_url
    assert_equal 'Authentication required', flash[:error]
  end
end
