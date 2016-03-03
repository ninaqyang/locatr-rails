class Api::UsersController < ApplicationController
  respond_to :json

  resource_description do
    formats ['json']
    resource_id 'Users'
    short 'Returns User information'
  end

  api :GET, '/users', 'Gets a list of users'
  def index
    @users = User.all
    respond_with @users
  end
end
