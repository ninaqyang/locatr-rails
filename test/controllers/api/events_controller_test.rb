require 'test_helper'

class Api::EventsControllerTest < ActionController::TestCase
  setup { @user = FactoryGirl.create(:user) }

  test 'GET index' do
    5.times { FactoryGirl.create(:event) }
    get :index, user_email: @user.email, user_token: @user.authentication_token, format: :json
    assert_response :success
    assert_equal 5, assigns(:events).count
  end

  test 'GET show' do
    event = FactoryGirl.create(:event)
    get :show, user_email: @user.email, user_token: @user.authentication_token, id: event.id, format: :json
    assert_response :success
    assert_equal assigns(:event), event
  end

  test 'DELETE destroy' do
    event = FactoryGirl.create(:event)
    delete :destroy, user_email: @user.email, user_token: @user.authentication_token, id: event.id, format: :json
    assert_response :success
    assert Event.where(id: event.id).blank?
  end

  test 'POST create' do
    post :create, event: {
      title: Faker::Lorem.word,
      address1: Faker::Address.street_name,
      address2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip,
      latitude:    Faker::Address.latitude.to_f,
      longitude:    Faker::Address.longitude.to_f,
      starts_on: DateTime.now,
      ends_on: DateTime.now + 3.hours
    },
    user_email: @user.email,
    user_token: @user.authentication_token,
    format: :json
    assert_response :success
    assert_equal 1, Event.count
  end

  test 'PUT update' do
    event = FactoryGirl.create(:event)
    put :update, id: event.id, event: {
      title: 'new title'
    },
    user_email: @user.email,
    user_token: @user.authentication_token,
    format: :json
    assert_response :success
    assert_equal 'new title', event.reload.title
  end
end
