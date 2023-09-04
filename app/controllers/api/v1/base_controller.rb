class Api::V1::BaseController < ApplicationController
  helper_method :authenticate_user_or_client!, :current_auth_resource, :logged_in?

  def authenticate_user_or_client!
    raise ApiError::Unauthorized unless current_user || current_client
    return authenticate_user! if current_user
    authenticate_client!
  end

  def current_auth_resource
    @current_auth_resource ||= current_user || current_client || get_resource_from_token
  end

  def logged_in?
    current_auth_resource.present?
  end

  private

  def get_resource_from_token
    jwt_payload = JWT.decode(request.headers["Authorization"].split(" ")[1],
                              Rails.application.credentials.devise[:jwt_secret_key]).first
    User.find(jwt_payload["sub"].to_s) || Client.find(jwt_payload["sub"].to_s)
  end
end
