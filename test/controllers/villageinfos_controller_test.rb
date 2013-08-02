require 'test_helper'

class VillageinfosControllerTest < ActionController::TestCase
  setup do
    @villageinfo = villageinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:villageinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create villageinfo" do
    assert_difference('Villageinfo.count') do
      post :create, villageinfo: { end_date: @villageinfo.end_date, funding_status: @villageinfo.funding_status, initial_cpi: @villageinfo.initial_cpi, local_contributions: @villageinfo.local_contributions, ngo_name: @villageinfo.ngo_name, start_date: @villageinfo.start_date, status: @villageinfo.status, total_funding_required: @villageinfo.total_funding_required, village_id: @villageinfo.village_id }
    end

    assert_redirected_to villageinfo_path(assigns(:villageinfo))
  end

  test "should show villageinfo" do
    get :show, id: @villageinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @villageinfo
    assert_response :success
  end

  test "should update villageinfo" do
    patch :update, id: @villageinfo, villageinfo: { end_date: @villageinfo.end_date, funding_status: @villageinfo.funding_status, initial_cpi: @villageinfo.initial_cpi, local_contributions: @villageinfo.local_contributions, ngo_name: @villageinfo.ngo_name, start_date: @villageinfo.start_date, status: @villageinfo.status, total_funding_required: @villageinfo.total_funding_required, village_id: @villageinfo.village_id }
    assert_redirected_to villageinfo_path(assigns(:villageinfo))
  end

  test "should destroy villageinfo" do
    assert_difference('Villageinfo.count', -1) do
      delete :destroy, id: @villageinfo
    end

    assert_redirected_to villageinfos_path
  end
end
