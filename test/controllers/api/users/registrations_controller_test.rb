require 'test_helper'

class Api::Users::RegistrationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test 'POST create' do
    post :create, user: {
      name: 'Chris Jeon',
      email: 'chris@intellum.com',
      password: 'password'
    }, format: :json
    assert_response :success
  end
end
