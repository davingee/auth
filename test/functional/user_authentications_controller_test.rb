require 'test_helper'

class UserAuthenticationsControllerTest < ActionController::TestCase
  setup do
    @user_authentication = user_authentications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_authentications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_authentication" do
    assert_difference('UserAuthentication.count') do
      post :create, user_authentication: { oauth_expires_at: @user_authentication.oauth_expires_at, oauth_token: @user_authentication.oauth_token, provider: @user_authentication.provider, uid: @user_authentication.uid }
    end

    assert_redirected_to user_authentication_path(assigns(:user_authentication))
  end

  test "should show user_authentication" do
    get :show, id: @user_authentication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_authentication
    assert_response :success
  end

  test "should update user_authentication" do
    put :update, id: @user_authentication, user_authentication: { oauth_expires_at: @user_authentication.oauth_expires_at, oauth_token: @user_authentication.oauth_token, provider: @user_authentication.provider, uid: @user_authentication.uid }
    assert_redirected_to user_authentication_path(assigns(:user_authentication))
  end

  test "should destroy user_authentication" do
    assert_difference('UserAuthentication.count', -1) do
      delete :destroy, id: @user_authentication
    end

    assert_redirected_to user_authentications_path
  end
end
