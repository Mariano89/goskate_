class UsersController < ApplicationController

	before_action :authorize

	def index 
		# @users = current_user.users
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		user = User.find_by(email: params[:user][:email])
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation))
		
		if @user.valid? 
				@user.save
				flash[:info] = "Signed up successfully"
				redirect_to users_path
		else
			flash.now[:danger] = @user.errors.full_messages.to_sentence
			render :new
		end
	end

end
