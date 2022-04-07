class UsersController < ApplicationController
	# before_action :authorize_user, only: [:log_out]
	def create
			@user = User.new(user_params)
			if @user.save
				session[:user_id] = @user.id
				flash[:success] = "Account Created, You are now logged in "
				redirect_to "/posts"
			else
			flash[:notice] = @user.errors.full_messages.to_sentence
			redirect_to '/sign_up'
		end
	end

	def create_session
		@current_user = User.find_by_email(params[:email])
		if @current_user && @current_user.authenticate(params[:password])
			session[:user_id] = @current_user.id
			flash[:success] = "Welcome,#{@current_user.name}"
			redirect_to '/posts'
		elsif !@current_user
			flash[:notice] = "Email: #{params[:email]} not found"
			redirect_to '/'
		else
			flash[:notice] = "Incorrect password"
			redirect_to '/'
		end
	end

	def login
	end

	def sign_up
	end

	def log_out
		reset_session
		flash[:success] = "Successfully logged out"
		redirect_to '/'
	end


	private 
	    def user_params
	        params.require(:user).permit(:name, :email,:password,:password_confirmation)
	    end
end
