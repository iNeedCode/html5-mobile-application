require 'test_helper'

class BasketballsControllerTest < ActionController::TestCase
  setup do
    @basketball = basketballs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basketballs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basketball" do
    assert_difference('Basketball.count') do
      post :create, basketball: { duration: @basketball.duration, endtime: @basketball.endtime, group: @basketball.group, place: @basketball.place, result_a: @basketball.result_a, result_b: @basketball.result_b, round: @basketball.round, startime: @basketball.startime, team_a: @basketball.team_a, team_b: @basketball.team_b }
    end

    assert_redirected_to basketball_path(assigns(:basketball))
  end

  test "should show basketball" do
    get :show, id: @basketball
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basketball
    assert_response :success
  end

  test "should update basketball" do
    put :update, id: @basketball, basketball: { duration: @basketball.duration, endtime: @basketball.endtime, group: @basketball.group, place: @basketball.place, result_a: @basketball.result_a, result_b: @basketball.result_b, round: @basketball.round, startime: @basketball.startime, team_a: @basketball.team_a, team_b: @basketball.team_b }
    assert_redirected_to basketball_path(assigns(:basketball))
  end

  test "should destroy basketball" do
    assert_difference('Basketball.count', -1) do
      delete :destroy, id: @basketball
    end

    assert_redirected_to basketballs_path
  end
end
