class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation))
		
		if @user.valid?
			if @user.save
				flash[:info] = "Signed up successfully"
				redirect_to users_path
			end
		else
			flash.now[:danger] = @user.errors.full_messages.to_sentence
			render :new
		end
	end

end
