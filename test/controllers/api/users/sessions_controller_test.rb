require 'test_helper'

class Api::Users::SessionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
  end

  test 'POST create' do
    post :create, user: {
      email: @user.email,
      password: 'password'
    },
    format: :json
    assert_response :success
  end
end
