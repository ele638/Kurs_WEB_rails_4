require 'test_helper'

class MyItemsControllerTest < ActionController::TestCase
  setup do
    @my_item = my_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_item" do
    assert_difference('MyItem.count') do
      post :create, my_item: { height: @my_item.height, incoming_date: @my_item.incoming_date, issue_date: @my_item.issue_date, length: @my_item.length, my_client_id: @my_item.my_client_id, my_rack_id: @my_item.my_rack_id, position: @my_item.position, weight: @my_item.weight, width: @my_item.width }
    end

    assert_redirected_to my_item_path(assigns(:my_item))
  end

  test "should show my_item" do
    get :show, id: @my_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_item
    assert_response :success
  end

  test "should update my_item" do
    patch :update, id: @my_item, my_item: { height: @my_item.height, incoming_date: @my_item.incoming_date, issue_date: @my_item.issue_date, length: @my_item.length, my_client_id: @my_item.my_client_id, my_rack_id: @my_item.my_rack_id, position: @my_item.position, weight: @my_item.weight, width: @my_item.width }
    assert_redirected_to my_item_path(assigns(:my_item))
  end

  test "should destroy my_item" do
    assert_difference('MyItem.count', -1) do
      delete :destroy, id: @my_item
    end

    assert_redirected_to my_items_path
  end
end
