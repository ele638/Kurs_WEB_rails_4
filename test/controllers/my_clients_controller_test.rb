require 'test_helper'

class MyClientsControllerTest < ActionController::TestCase
  setup do
    @my_client = my_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_client" do
    assert_difference('MyClient.count') do
      post :create, my_client: { details: @my_client.details, name: @my_client.name }
    end

    assert_redirected_to my_client_path(assigns(:my_client))
  end

  test "should show my_client" do
    get :show, id: @my_client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_client
    assert_response :success
  end

  test "should update my_client" do
    patch :update, id: @my_client, my_client: { details: @my_client.details, name: @my_client.name }
    assert_redirected_to my_client_path(assigns(:my_client))
  end

  test "should destroy my_client" do
    assert_difference('MyClient.count', -1) do
      delete :destroy, id: @my_client
    end

    assert_redirected_to my_clients_path
  end
end
