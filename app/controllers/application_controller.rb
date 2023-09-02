class ApplicationController < ActionController::API
  include ErrorRescuable
  include Pundit::Authorization
end
