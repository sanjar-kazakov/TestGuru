class SessionsController < ApplicationController

  # skip_before_action :authenticate_user!

  # include SessionsHelper

  # def new
  # end

  # def create
  #   user = User.find_by!(email: params[:email])

  #   if user&.authenticate(params[:password])
  #     session[:user_id] = user.id
  #   else
  #     flash.now[:alert] = 'Are you a Guru? Verify your Email and Password!'
  #     render :new
  #   end
  # end

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to new_user_session_path, notice: 'You have been logged out.'
  # end

end
