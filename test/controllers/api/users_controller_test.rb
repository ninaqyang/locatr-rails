require 'test_helper'

class Api::UsersControllerTest < ActionController::TestCase
  test 'GET index' do
    5.times { FactoryGirl.create(:user) }
    get :index, format: :json
    assert_response :success
    assert_equal 5, assigns(:users).count
  end
end
