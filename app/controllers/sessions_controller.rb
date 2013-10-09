class SessionsController < ApplicationController

  def new
    @title = "Log In"
    @user = User.new
  end

  def create
    user = User.find_by_username(params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Login successful."
      redirect_to user
    else
      flash.now[:error] = "Your username and/or password are incorrect.  Please try again."
      render :new
    end

  end

  def destroy
    self.current_user = nil
    cookies.delete(:remember_token)
    redirect_to root_path
  end

end
