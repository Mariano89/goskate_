class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation))
		if @user.valid?
			if @user.save
				# flash[:info]
				redirect_to login_path
			end
		else
			# flash.now
			render :new
		end
	end

end
