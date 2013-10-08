require 'test_helper'

class AtfalEventsControllerTest < ActionController::TestCase
  setup do
    @atfal_event = atfal_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atfal_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atfal_event" do
    assert_difference('AtfalEvent.count') do
      post :create, atfal_event: { endtime: @atfal_event.endtime, place: @atfal_event.place, startime: @atfal_event.startime, title: @atfal_event.title }
    end

    assert_redirected_to atfal_event_path(assigns(:atfal_event))
  end

  test "should show atfal_event" do
    get :show, id: @atfal_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atfal_event
    assert_response :success
  end

  test "should update atfal_event" do
    put :update, id: @atfal_event, atfal_event: { endtime: @atfal_event.endtime, place: @atfal_event.place, startime: @atfal_event.startime, title: @atfal_event.title }
    assert_redirected_to atfal_event_path(assigns(:atfal_event))
  end

  test "should destroy atfal_event" do
    assert_difference('AtfalEvent.count', -1) do
      delete :destroy, id: @atfal_event
    end

    assert_redirected_to atfal_events_path
  end
end
