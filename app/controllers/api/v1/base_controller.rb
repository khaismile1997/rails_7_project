class Api::V1::BaseController < ApplicationController
  def authenticate_user_or_client!
    raise ApiError::Unauthorized unless current_user || current_client
    return authenticate_user! if current_user
    authenticate_client!
  end
end
