class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:init_page)
    else
      flash.now[:alert] = 'Ar you a Guru? Verify your Email and Password!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'You have been logged out.'
  end

end
