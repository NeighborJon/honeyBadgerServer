require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, account: { auth_token: @account.auth_token, password: @account.password }
    end

    assert_response 201
  end

  test "should show account" do
    get :show, id: @account
    assert_response :success
  end

  test "should update account" do
    put :update, id: @account, account: { auth_token: @account.auth_token, password: @account.password }
    assert_response 204
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account
    end

    assert_response 204
  end
end
