class Api::Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

  clear_respond_to
  respond_to :json

  resource_description do
    formats ['json']
    resource_id 'Registration'
    short 'Endpoints for registering a user'
  end

  api :POST, '/api/users', 'Registers a user'
  param :user, Hash, desc: 'Event info', required: true do
    param :email, String, desc: 'Email'
    param :password, String, desc: 'Password'
    param :name, String, desc: 'Name'
  end
  def create
    resource = User.new(user_params)
    resource.save

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        respond_with resource
      else
        expire_data_after_sign_in!
        respond_with resource
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
