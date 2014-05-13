class SessionsController < ApplicationCotroller
	def create
		user = User.from_omniauth(env['omniauth.auth'])
		session[:user_id] = user_id
		redirect_to root_url, notice: "Signed in"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Signed out"
	end
end