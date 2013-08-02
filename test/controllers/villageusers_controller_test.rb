require 'test_helper'

class VillageusersControllerTest < ActionController::TestCase
  setup do
    @villageuser = villageusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:villageusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create villageuser" do
    assert_difference('Villageuser.count') do
      post :create, villageuser: { end_date: @villageuser.end_date, role: @villageuser.role, start_date: @villageuser.start_date, status: @villageuser.status, user_id: @villageuser.user_id, village_id: @villageuser.village_id }
    end

    assert_redirected_to villageuser_path(assigns(:villageuser))
  end

  test "should show villageuser" do
    get :show, id: @villageuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @villageuser
    assert_response :success
  end

  test "should update villageuser" do
    patch :update, id: @villageuser, villageuser: { end_date: @villageuser.end_date, role: @villageuser.role, start_date: @villageuser.start_date, status: @villageuser.status, user_id: @villageuser.user_id, village_id: @villageuser.village_id }
    assert_redirected_to villageuser_path(assigns(:villageuser))
  end

  test "should destroy villageuser" do
    assert_difference('Villageuser.count', -1) do
      delete :destroy, id: @villageuser
    end

    assert_redirected_to villageusers_path
  end
end
