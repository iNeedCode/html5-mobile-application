require 'test_helper'

class InternationalVolleyballsControllerTest < ActionController::TestCase
  setup do
    @international_volleyball = international_volleyballs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:international_volleyballs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create international_volleyball" do
    assert_difference('InternationalVolleyball.count') do
      post :create, international_volleyball: { duration: @international_volleyball.duration, endtime: @international_volleyball.endtime, group: @international_volleyball.group, place: @international_volleyball.place, result_a: @international_volleyball.result_a, result_b: @international_volleyball.result_b, round: @international_volleyball.round, startime: @international_volleyball.startime, team_a: @international_volleyball.team_a, team_b: @international_volleyball.team_b }
    end

    assert_redirected_to international_volleyball_path(assigns(:international_volleyball))
  end

  test "should show international_volleyball" do
    get :show, id: @international_volleyball
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @international_volleyball
    assert_response :success
  end

  test "should update international_volleyball" do
    put :update, id: @international_volleyball, international_volleyball: { duration: @international_volleyball.duration, endtime: @international_volleyball.endtime, group: @international_volleyball.group, place: @international_volleyball.place, result_a: @international_volleyball.result_a, result_b: @international_volleyball.result_b, round: @international_volleyball.round, startime: @international_volleyball.startime, team_a: @international_volleyball.team_a, team_b: @international_volleyball.team_b }
    assert_redirected_to international_volleyball_path(assigns(:international_volleyball))
  end

  test "should destroy international_volleyball" do
    assert_difference('InternationalVolleyball.count', -1) do
      delete :destroy, id: @international_volleyball
    end

    assert_redirected_to international_volleyballs_path
  end
end
