require 'test_helper'

class SoftwareAllocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:software_allocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create software_allocation" do
    assert_difference('SoftwareAllocation.count') do
      post :create, :software_allocation => { }
    end

    assert_redirected_to software_allocation_path(assigns(:software_allocation))
  end

  test "should show software_allocation" do
    get :show, :id => software_allocations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => software_allocations(:one).to_param
    assert_response :success
  end

  test "should update software_allocation" do
    put :update, :id => software_allocations(:one).to_param, :software_allocation => { }
    assert_redirected_to software_allocation_path(assigns(:software_allocation))
  end

  test "should destroy software_allocation" do
    assert_difference('SoftwareAllocation.count', -1) do
      delete :destroy, :id => software_allocations(:one).to_param
    end

    assert_redirected_to software_allocations_path
  end
end
