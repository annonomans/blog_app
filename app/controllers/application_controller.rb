class ApplicationController < ActionController::Base
	before_action :authorize_user

	def authorize_user
		if session[:user_id].present?
			@current_user = User.find(session[:user_id])
			if !@current_user
				flash[:notice] = "Login required"
				redirect_to '/'
			else
				return true
			end
		else
			return false
		end
	end
end
