require 'test_helper'

class MyRoomsControllerTest < ActionController::TestCase
  setup do
    @my_room = my_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_room" do
    assert_difference('MyRoom.count') do
      post :create, my_room: { name: @my_room.name, volume: @my_room.volume }
    end

    assert_redirected_to my_room_path(assigns(:my_room))
  end

  test "should show my_room" do
    get :show, id: @my_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_room
    assert_response :success
  end

  test "should update my_room" do
    patch :update, id: @my_room, my_room: { name: @my_room.name, volume: @my_room.volume }
    assert_redirected_to my_room_path(assigns(:my_room))
  end

  test "should destroy my_room" do
    assert_difference('MyRoom.count', -1) do
      delete :destroy, id: @my_room
    end

    assert_redirected_to my_rooms_path
  end
end
