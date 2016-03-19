require 'test_helper'

class Api::UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'GET index' do
    user = FactoryGirl.create(:user)
    5.times { FactoryGirl.create(:user) }
    get :index, user_email: user.email, user_token: user.authentication_token, format: :json
    assert_response :success
    assert_equal 6, assigns(:users).count
  end
end
