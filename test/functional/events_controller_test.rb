require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { address: @event.address, city: @event.city, contact_email: @event.contact_email, contact_name: @event.contact_name, contact_phone: @event.contact_phone, end_date: @event.end_date, location: @event.location, long_description: @event.long_description, max_amount_of_tickets: @event.max_amount_of_tickets, shopping_limit: @event.shopping_limit, short_description: @event.short_description, start_date: @event.start_date, zipcode: @event.zipcode }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: { address: @event.address, city: @event.city, contact_email: @event.contact_email, contact_name: @event.contact_name, contact_phone: @event.contact_phone, end_date: @event.end_date, location: @event.location, long_description: @event.long_description, max_amount_of_tickets: @event.max_amount_of_tickets, shopping_limit: @event.shopping_limit, short_description: @event.short_description, start_date: @event.start_date, zipcode: @event.zipcode }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
