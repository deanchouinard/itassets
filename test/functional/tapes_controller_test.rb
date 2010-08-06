require 'test_helper'

class TapesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tapes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tape" do
    assert_difference('Tape.count') do
      post :create, :tape => { }
    end

    assert_redirected_to tape_path(assigns(:tape))
  end

  test "should show tape" do
    get :show, :id => tapes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tapes(:one).to_param
    assert_response :success
  end

  test "should update tape" do
    put :update, :id => tapes(:one).to_param, :tape => { }
    assert_redirected_to tape_path(assigns(:tape))
  end

  test "should destroy tape" do
    assert_difference('Tape.count', -1) do
      delete :destroy, :id => tapes(:one).to_param
    end

    assert_redirected_to tapes_path
  end
end
