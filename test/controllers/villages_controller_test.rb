require 'test_helper'

class VillagesControllerTest < ActionController::TestCase
  setup do
    @village = villages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:villages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create village" do
    assert_difference('Village.count') do
      post :create, village: { block_id: @village.block_id, name: @village.name, status: @village.status }
    end

    assert_redirected_to village_path(assigns(:village))
  end

  test "should show village" do
    get :show, id: @village
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @village
    assert_response :success
  end

  test "should update village" do
    patch :update, id: @village, village: { block_id: @village.block_id, name: @village.name, status: @village.status }
    assert_redirected_to village_path(assigns(:village))
  end

  test "should destroy village" do
    assert_difference('Village.count', -1) do
      delete :destroy, id: @village
    end

    assert_redirected_to villages_path
  end
end
