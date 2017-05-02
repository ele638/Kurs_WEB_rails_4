require 'test_helper'

class MyRacksControllerTest < ActionController::TestCase
  setup do
    @my_rack = my_racks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_racks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_rack" do
    assert_difference('MyRack.count') do
      post :create, my_rack: { height: @my_rack.height, length: @my_rack.length, max_weight: @my_rack.max_weight, my_room_id: @my_rack.my_room_id, number: @my_rack.number, places: @my_rack.places, width: @my_rack.width }
    end

    assert_redirected_to my_rack_path(assigns(:my_rack))
  end

  test "should show my_rack" do
    get :show, id: @my_rack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_rack
    assert_response :success
  end

  test "should update my_rack" do
    patch :update, id: @my_rack, my_rack: { height: @my_rack.height, length: @my_rack.length, max_weight: @my_rack.max_weight, my_room_id: @my_rack.my_room_id, number: @my_rack.number, places: @my_rack.places, width: @my_rack.width }
    assert_redirected_to my_rack_path(assigns(:my_rack))
  end

  test "should destroy my_rack" do
    assert_difference('MyRack.count', -1) do
      delete :destroy, id: @my_rack
    end

    assert_redirected_to my_racks_path
  end
end
