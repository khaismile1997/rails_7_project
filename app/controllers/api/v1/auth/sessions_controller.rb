class Api::V1::Auth::SessionsController < Devise::SessionsController
  before_action :set_current_auth_resource
  respond_to :json

  private

  def resource_name
    return :user if params[:user]
    :client
  end

  def resource_class
    return User if params[:user]
    Client
  end

  def respond_with(resource, _opts = {})
    raise ApiError::Unauthorized unless @current_auth_resource
    resource_hash = if resource.is_a?(User)
                      { user: current_user }
                    elsif resource.is_a?(Client)
                      { client: current_client }
                    end
    result = { message: 'You are logged in.' }.merge(resource_hash)
    render json: result , status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if @current_auth_resource

    log_out_failed
  end
  
  def log_out_success
    render json: { message: "You are logged out." }, status: :ok
  end

  def log_out_failed
    render json: { message: "Something went wrong." }, status: :unauthorized
  end

  def set_current_auth_resource
    @current_auth_resource = current_user || current_client
  end
end