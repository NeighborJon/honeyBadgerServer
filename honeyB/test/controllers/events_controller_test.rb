require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { category: @event.category, creator: @event.creator, description: @event.description, duration: @event.duration, minReq: @event.minReq, start: @event.start, xVal: @event.xVal, yVal: @event.yVal }
    end

    assert_response 201
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: { category: @event.category, creator: @event.creator, description: @event.description, duration: @event.duration, minReq: @event.minReq, start: @event.start, xVal: @event.xVal, yVal: @event.yVal }
    assert_response 204
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_response 204
  end
end
