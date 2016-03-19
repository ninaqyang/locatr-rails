class Api::Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  clear_respond_to
  respond_to :json

  resource_description do
    formats ['json']
    resource_id 'User'
    short 'Returns User Session information'
  end

  api :POST, '/api/users/sign_in', 'Signs in a user'
  param :user, Hash, desc: 'Event info', required: true do
    param :email, String, desc: 'Email'
    param :password, String, desc: 'Password'
  end
  def create
    self.resource = warden.authenticate!(params[:user])
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource
  end
end
