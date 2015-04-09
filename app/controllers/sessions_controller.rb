class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:user][:email])

		if user && user.authenticate(params[:user][:password])
			# flash[:success]
			session[:user_id] = user.id
			redirect_to users_path
		else
			# flash.now[:danger]
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end




