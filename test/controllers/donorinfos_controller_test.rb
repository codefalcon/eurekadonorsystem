require 'test_helper'

class DonorinfosControllerTest < ActionController::TestCase
  setup do
    @donorinfo = donorinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donorinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donorinfo" do
    assert_difference('Donorinfo.count') do
      post :create, donorinfo: { amount_donated: @donorinfo.amount_donated, amount_used: @donorinfo.amount_used, end_date: @donorinfo.end_date, start_date: @donorinfo.start_date, status: @donorinfo.status, type: @donorinfo.type, user_id: @donorinfo.user_id }
    end

    assert_redirected_to donorinfo_path(assigns(:donorinfo))
  end

  test "should show donorinfo" do
    get :show, id: @donorinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donorinfo
    assert_response :success
  end

  test "should update donorinfo" do
    patch :update, id: @donorinfo, donorinfo: { amount_donated: @donorinfo.amount_donated, amount_used: @donorinfo.amount_used, end_date: @donorinfo.end_date, start_date: @donorinfo.start_date, status: @donorinfo.status, type: @donorinfo.type, user_id: @donorinfo.user_id }
    assert_redirected_to donorinfo_path(assigns(:donorinfo))
  end

  test "should destroy donorinfo" do
    assert_difference('Donorinfo.count', -1) do
      delete :destroy, id: @donorinfo
    end

    assert_redirected_to donorinfos_path
  end
end
