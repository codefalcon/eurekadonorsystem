require 'test_helper'

class DonorvillagesControllerTest < ActionController::TestCase
  setup do
    @donorvillage = donorvillages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donorvillages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donorvillage" do
    assert_difference('Donorvillage.count') do
      post :create, donorvillage: { amount_for_village: @donorvillage.amount_for_village, end_date: @donorvillage.end_date, start_date: @donorvillage.start_date, status: @donorvillage.status, user_id: @donorvillage.user_id, village_id: @donorvillage.village_id }
    end

    assert_redirected_to donorvillage_path(assigns(:donorvillage))
  end

  test "should show donorvillage" do
    get :show, id: @donorvillage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donorvillage
    assert_response :success
  end

  test "should update donorvillage" do
    patch :update, id: @donorvillage, donorvillage: { amount_for_village: @donorvillage.amount_for_village, end_date: @donorvillage.end_date, start_date: @donorvillage.start_date, status: @donorvillage.status, user_id: @donorvillage.user_id, village_id: @donorvillage.village_id }
    assert_redirected_to donorvillage_path(assigns(:donorvillage))
  end

  test "should destroy donorvillage" do
    assert_difference('Donorvillage.count', -1) do
      delete :destroy, id: @donorvillage
    end

    assert_redirected_to donorvillages_path
  end
end
