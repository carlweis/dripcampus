class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, if: :json_request?
	before_action :authenticate_user!

	def json_request?
		request.format.json?
	end

  def after_sign_in_path_for(resource)
   request.env['omniauth.origin'] || stored_location_for(resource) || dashboard_path || root_path
  end
end
