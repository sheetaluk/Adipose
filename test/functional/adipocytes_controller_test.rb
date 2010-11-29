require 'test_helper'

class AdipocytesControllerTest < ActionController::TestCase
  setup do
    @adipocyte = adipocytes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adipocytes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adipocyte" do
    assert_difference('Adipocyte.count') do
      post :create, :adipocyte => @adipocyte.attributes
    end

    assert_redirected_to adipocyte_path(assigns(:adipocyte))
  end

  test "should show adipocyte" do
    get :show, :id => @adipocyte.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @adipocyte.to_param
    assert_response :success
  end

  test "should update adipocyte" do
    put :update, :id => @adipocyte.to_param, :adipocyte => @adipocyte.attributes
    assert_redirected_to adipocyte_path(assigns(:adipocyte))
  end

  test "should destroy adipocyte" do
    assert_difference('Adipocyte.count', -1) do
      delete :destroy, :id => @adipocyte.to_param
    end

    assert_redirected_to adipocytes_path
  end
end
