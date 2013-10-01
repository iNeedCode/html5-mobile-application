require 'test_helper'

class VolleyballsControllerTest < ActionController::TestCase
  setup do
    @volleyball = volleyballs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volleyballs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volleyball" do
    assert_difference('Volleyball.count') do
      post :create, volleyball: { duration: @volleyball.duration, endtime: @volleyball.endtime, group: @volleyball.group, place: @volleyball.place, result_a: @volleyball.result_a, result_b: @volleyball.result_b, round: @volleyball.round, startime: @volleyball.startime, team_a: @volleyball.team_a, team_b: @volleyball.team_b }
    end

    assert_redirected_to volleyball_path(assigns(:volleyball))
  end

  test "should show volleyball" do
    get :show, id: @volleyball
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volleyball
    assert_response :success
  end

  test "should update volleyball" do
    put :update, id: @volleyball, volleyball: { duration: @volleyball.duration, endtime: @volleyball.endtime, group: @volleyball.group, place: @volleyball.place, result_a: @volleyball.result_a, result_b: @volleyball.result_b, round: @volleyball.round, startime: @volleyball.startime, team_a: @volleyball.team_a, team_b: @volleyball.team_b }
    assert_redirected_to volleyball_path(assigns(:volleyball))
  end

  test "should destroy volleyball" do
    assert_difference('Volleyball.count', -1) do
      delete :destroy, id: @volleyball
    end

    assert_redirected_to volleyballs_path
  end
end
