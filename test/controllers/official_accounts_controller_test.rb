require 'test_helper'

class OfficialAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @official_account = official_accounts(:one)
  end

  test "should get index" do
    get official_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_official_account_url
    assert_response :success
  end

  test "should create official_account" do
    assert_difference('OfficialAccount.count') do
      post official_accounts_url, params: { official_account: {  } }
    end

    assert_redirected_to official_account_url(OfficialAccount.last)
  end

  test "should show official_account" do
    get official_account_url(@official_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_official_account_url(@official_account)
    assert_response :success
  end

  test "should update official_account" do
    patch official_account_url(@official_account), params: { official_account: {  } }
    assert_redirected_to official_account_url(@official_account)
  end

  test "should destroy official_account" do
    assert_difference('OfficialAccount.count', -1) do
      delete official_account_url(@official_account)
    end

    assert_redirected_to official_accounts_url
  end
end
