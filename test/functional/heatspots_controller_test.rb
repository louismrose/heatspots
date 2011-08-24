require 'test_helper'

class HeatspotsControllerTest < ActionController::TestCase
  setup do
    @heatspot = heatspots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:heatspots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create heatspot" do
    assert_difference('Heatspot.count') do
      post :create, :heatspot => @heatspot.attributes
    end

    assert_redirected_to heatspot_path(assigns(:heatspot))
  end

  test "should show heatspot" do
    get :show, :id => @heatspot.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @heatspot.to_param
    assert_response :success
  end

  test "should update heatspot" do
    put :update, :id => @heatspot.to_param, :heatspot => @heatspot.attributes
    assert_redirected_to heatspot_path(assigns(:heatspot))
  end

  test "should destroy heatspot" do
    assert_difference('Heatspot.count', -1) do
      delete :destroy, :id => @heatspot.to_param
    end

    assert_redirected_to heatspots_path
  end
end
