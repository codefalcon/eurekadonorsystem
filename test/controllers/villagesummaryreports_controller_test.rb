require 'test_helper'

class VillagesummaryreportsControllerTest < ActionController::TestCase
  setup do
    @villagesummaryreport = villagesummaryreports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:villagesummaryreports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create villagesummaryreport" do
    assert_difference('Villagesummaryreport.count') do
      post :create, villagesummaryreport: { activities_html: @villagesummaryreport.activities_html, children_attended: @villagesummaryreport.children_attended, children_enrolled: @villagesummaryreport.children_enrolled, class_working_days: @villagesummaryreport.class_working_days, current_cpi: @villagesummaryreport.current_cpi, end_date: @villagesummaryreport.end_date, start_date: @villagesummaryreport.start_date, village_id: @villagesummaryreport.village_id }
    end

    assert_redirected_to villagesummaryreport_path(assigns(:villagesummaryreport))
  end

  test "should show villagesummaryreport" do
    get :show, id: @villagesummaryreport
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @villagesummaryreport
    assert_response :success
  end

  test "should update villagesummaryreport" do
    patch :update, id: @villagesummaryreport, villagesummaryreport: { activities_html: @villagesummaryreport.activities_html, children_attended: @villagesummaryreport.children_attended, children_enrolled: @villagesummaryreport.children_enrolled, class_working_days: @villagesummaryreport.class_working_days, current_cpi: @villagesummaryreport.current_cpi, end_date: @villagesummaryreport.end_date, start_date: @villagesummaryreport.start_date, village_id: @villagesummaryreport.village_id }
    assert_redirected_to villagesummaryreport_path(assigns(:villagesummaryreport))
  end

  test "should destroy villagesummaryreport" do
    assert_difference('Villagesummaryreport.count', -1) do
      delete :destroy, id: @villagesummaryreport
    end

    assert_redirected_to villagesummaryreports_path
  end
end
