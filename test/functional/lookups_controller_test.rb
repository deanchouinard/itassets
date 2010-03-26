require 'test_helper'

class LookupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lookups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lookup" do
    assert_difference('Lookup.count') do
      post :create, :lookup => { }
    end

    assert_redirected_to lookup_path(assigns(:lookup))
  end

  test "should show lookup" do
    get :show, :id => lookups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lookups(:one).to_param
    assert_response :success
  end

  test "should update lookup" do
    put :update, :id => lookups(:one).to_param, :lookup => { }
    assert_redirected_to lookup_path(assigns(:lookup))
  end

  test "should destroy lookup" do
    assert_difference('Lookup.count', -1) do
      delete :destroy, :id => lookups(:one).to_param
    end

    assert_redirected_to lookups_path
  end
end
