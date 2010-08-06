require 'test_helper'

class TapeMovesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tape_moves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tape_move" do
    assert_difference('TapeMove.count') do
      post :create, :tape_move => { }
    end

    assert_redirected_to tape_move_path(assigns(:tape_move))
  end

  test "should show tape_move" do
    get :show, :id => tape_moves(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tape_moves(:one).to_param
    assert_response :success
  end

  test "should update tape_move" do
    put :update, :id => tape_moves(:one).to_param, :tape_move => { }
    assert_redirected_to tape_move_path(assigns(:tape_move))
  end

  test "should destroy tape_move" do
    assert_difference('TapeMove.count', -1) do
      delete :destroy, :id => tape_moves(:one).to_param
    end

    assert_redirected_to tape_moves_path
  end
end
