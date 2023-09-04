class ApplicationController < ActionController::API
  include ErrorRescuable
  include Pundit::Authorization
  include ActionController::Helpers
end
