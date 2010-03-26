require 'test_helper'

class ComputerAllocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:computer_allocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create computer_allocation" do
    assert_difference('ComputerAllocation.count') do
      post :create, :computer_allocation => { }
    end

    assert_redirected_to computer_allocation_path(assigns(:computer_allocation))
  end

  test "should show computer_allocation" do
    get :show, :id => computer_allocations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => computer_allocations(:one).to_param
    assert_response :success
  end

  test "should update computer_allocation" do
    put :update, :id => computer_allocations(:one).to_param, :computer_allocation => { }
    assert_redirected_to computer_allocation_path(assigns(:computer_allocation))
  end

  test "should destroy computer_allocation" do
    assert_difference('ComputerAllocation.count', -1) do
      delete :destroy, :id => computer_allocations(:one).to_param
    end

    assert_redirected_to computer_allocations_path
  end
end
