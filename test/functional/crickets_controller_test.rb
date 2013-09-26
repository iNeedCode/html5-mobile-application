require 'test_helper'

class CricketsControllerTest < ActionController::TestCase
  setup do
    @cricket = crickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cricket" do
    assert_difference('Cricket.count') do
      post :create, cricket: { duration: @cricket.duration, endtime: @cricket.endtime, group: @cricket.group, place: @cricket.place, result_a: @cricket.result_a, result_b: @cricket.result_b, round: @cricket.round, startime: @cricket.startime, team_a: @cricket.team_a, team_b: @cricket.team_b }
    end

    assert_redirected_to cricket_path(assigns(:cricket))
  end

  test "should show cricket" do
    get :show, id: @cricket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cricket
    assert_response :success
  end

  test "should update cricket" do
    put :update, id: @cricket, cricket: { duration: @cricket.duration, endtime: @cricket.endtime, group: @cricket.group, place: @cricket.place, result_a: @cricket.result_a, result_b: @cricket.result_b, round: @cricket.round, startime: @cricket.startime, team_a: @cricket.team_a, team_b: @cricket.team_b }
    assert_redirected_to cricket_path(assigns(:cricket))
  end

  test "should destroy cricket" do
    assert_difference('Cricket.count', -1) do
      delete :destroy, id: @cricket
    end

    assert_redirected_to crickets_path
  end
end
