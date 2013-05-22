require 'test_helper'

class AngelEventsControllerTest < ActionController::TestCase
  setup do
    @angel_event = angel_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:angel_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create angel_event" do
    assert_difference('AngelEvent.count') do
      post :create, angel_event: { code: @angel_event.code, phone: @angel_event.phone, status: @angel_event.status, user_id: @angel_event.user_id }
    end

    assert_redirected_to angel_event_path(assigns(:angel_event))
  end

  test "should show angel_event" do
    get :show, id: @angel_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @angel_event
    assert_response :success
  end

  test "should update angel_event" do
    put :update, id: @angel_event, angel_event: { code: @angel_event.code, phone: @angel_event.phone, status: @angel_event.status, user_id: @angel_event.user_id }
    assert_redirected_to angel_event_path(assigns(:angel_event))
  end

  test "should destroy angel_event" do
    assert_difference('AngelEvent.count', -1) do
      delete :destroy, id: @angel_event
    end

    assert_redirected_to angel_events_path
  end
end
