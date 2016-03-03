require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test 'GET home' do
    get :index
    assert_response :success
  end
end
