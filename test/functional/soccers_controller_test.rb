require 'test_helper'

class SoccersControllerTest < ActionController::TestCase
  setup do
    @soccer = soccers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soccers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soccer" do
    assert_difference('Soccer.count') do
      post :create, soccer: { duration: @soccer.duration, endtime: @soccer.endtime, group: @soccer.group, place: @soccer.place, round: @soccer.round, startime: @soccer.startime, team_a: @soccer.team_a, team_b: @soccer.team_b }
    end

    assert_redirected_to soccer_path(assigns(:soccer))
  end

  test "should show soccer" do
    get :show, id: @soccer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soccer
    assert_response :success
  end

  test "should update soccer" do
    put :update, id: @soccer, soccer: { duration: @soccer.duration, endtime: @soccer.endtime, group: @soccer.group, place: @soccer.place, round: @soccer.round, startime: @soccer.startime, team_a: @soccer.team_a, team_b: @soccer.team_b }
    assert_redirected_to soccer_path(assigns(:soccer))
  end

  test "should destroy soccer" do
    assert_difference('Soccer.count', -1) do
      delete :destroy, id: @soccer
    end

    assert_redirected_to soccers_path
  end
end
