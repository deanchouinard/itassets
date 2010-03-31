require 'test_helper'

class TicketActionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticket_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket_action" do
    assert_difference('TicketAction.count') do
      post :create, :ticket_action => { }
    end

    assert_redirected_to ticket_action_path(assigns(:ticket_action))
  end

  test "should show ticket_action" do
    get :show, :id => ticket_actions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ticket_actions(:one).to_param
    assert_response :success
  end

  test "should update ticket_action" do
    put :update, :id => ticket_actions(:one).to_param, :ticket_action => { }
    assert_redirected_to ticket_action_path(assigns(:ticket_action))
  end

  test "should destroy ticket_action" do
    assert_difference('TicketAction.count', -1) do
      delete :destroy, :id => ticket_actions(:one).to_param
    end

    assert_redirected_to ticket_actions_path
  end
end
