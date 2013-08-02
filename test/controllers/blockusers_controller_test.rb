require 'test_helper'

class BlockusersControllerTest < ActionController::TestCase
  setup do
    @blockuser = blockusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blockusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blockuser" do
    assert_difference('Blockuser.count') do
      post :create, blockuser: { block_id: @blockuser.block_id, end_date: @blockuser.end_date, role: @blockuser.role, start_date: @blockuser.start_date, status: @blockuser.status, user_id: @blockuser.user_id }
    end

    assert_redirected_to blockuser_path(assigns(:blockuser))
  end

  test "should show blockuser" do
    get :show, id: @blockuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blockuser
    assert_response :success
  end

  test "should update blockuser" do
    patch :update, id: @blockuser, blockuser: { block_id: @blockuser.block_id, end_date: @blockuser.end_date, role: @blockuser.role, start_date: @blockuser.start_date, status: @blockuser.status, user_id: @blockuser.user_id }
    assert_redirected_to blockuser_path(assigns(:blockuser))
  end

  test "should destroy blockuser" do
    assert_difference('Blockuser.count', -1) do
      delete :destroy, id: @blockuser
    end

    assert_redirected_to blockusers_path
  end
end
