class Api::V1::Auth::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Signed up successfully.', user: current_user }, status: :ok
  end

  def register_failed
    raise ApiError::BadRequest, resource.errors.full_messages.join("\n")
  end
end