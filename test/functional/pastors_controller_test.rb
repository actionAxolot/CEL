require 'test_helper'

class PastorsControllerTest < ActionController::TestCase
  setup do
    @pastor = pastors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pastors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pastor" do
    assert_difference('Pastor.count') do
      post :create, pastor: { address_one: @pastor.address_one, address_two: @pastor.address_two, bio: @pastor.bio, email: @pastor.email, name: @pastor.name, phone: @pastor.phone }
    end

    assert_redirected_to pastor_path(assigns(:pastor))
  end

  test "should show pastor" do
    get :show, id: @pastor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pastor
    assert_response :success
  end

  test "should update pastor" do
    put :update, id: @pastor, pastor: { address_one: @pastor.address_one, address_two: @pastor.address_two, bio: @pastor.bio, email: @pastor.email, name: @pastor.name, phone: @pastor.phone }
    assert_redirected_to pastor_path(assigns(:pastor))
  end

  test "should destroy pastor" do
    assert_difference('Pastor.count', -1) do
      delete :destroy, id: @pastor
    end

    assert_redirected_to pastors_path
  end
end
