require 'test_helper'

class InterpolationsControllerTest < ActionController::TestCase
  setup do
    @interpolation = interpolations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interpolations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interpolation" do
    assert_difference('Interpolation.count') do
      post :create, interpolation: { name: @interpolation.name, private: @interpolation.private, user_id: @interpolation.user_id }
    end

    assert_redirected_to interpolation_path(assigns(:interpolation))
  end

  test "should show interpolation" do
    get :show, id: @interpolation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interpolation
    assert_response :success
  end

  test "should update interpolation" do
    put :update, id: @interpolation, interpolation: { name: @interpolation.name, private: @interpolation.private, user_id: @interpolation.user_id }
    assert_redirected_to interpolation_path(assigns(:interpolation))
  end

  test "should destroy interpolation" do
    assert_difference('Interpolation.count', -1) do
      delete :destroy, id: @interpolation
    end

    assert_redirected_to interpolations_path
  end
end
